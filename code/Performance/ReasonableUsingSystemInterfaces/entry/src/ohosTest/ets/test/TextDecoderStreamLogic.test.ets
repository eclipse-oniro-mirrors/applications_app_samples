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
import { util } from '@kit.ArkTS';
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
export default function TextDecoderStreamLogic(): void {
  describe('TextDecoderStreamLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => {
          resolve();
        }, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0001
     * @tc.desc CENT, split 1/2, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0001';
        InterfaceTestLog.begin(name, 'CENT, split 1/2, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x41, 0xE4, 0xB8, 0xAD, 0xC2]);
        const secondBytes: Uint8Array = new Uint8Array([0xA2, 0x30, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'A\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u00A20\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'A\u4E2D\u00A20\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xC2, 0xA2, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u00A2\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0002
     * @tc.desc E_ACUTE, split 1/2, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0002';
        InterfaceTestLog.begin(name, 'E_ACUTE, split 1/2, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x42, 0xE4, 0xB8, 0xAD, 0xC3]);
        const secondBytes: Uint8Array = new Uint8Array([0xA9, 0x31, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'B\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u00E91\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'B\u4E2D\u00E91\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xC3, 0xA9, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u00E9\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0003
     * @tc.desc OMEGA, split 1/2, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0003';
        InterfaceTestLog.begin(name, 'OMEGA, split 1/2, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x43, 0xE4, 0xB8, 0xAD, 0xCE]);
        const secondBytes: Uint8Array = new Uint8Array([0xA9, 0x32, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'C\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u03A92\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'C\u4E2D\u03A92\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xCE, 0xA9, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u03A9\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0004
     * @tc.desc CYRILLIC_ZHE, split 1/2, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0004';
        InterfaceTestLog.begin(name, 'CYRILLIC_ZHE, split 1/2, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x44, 0xE4, 0xB8, 0xAD, 0xD0]);
        const secondBytes: Uint8Array = new Uint8Array([0x96, 0x33, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'D\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u04163\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'D\u4E2D\u04163\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xD0, 0x96, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0416\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0005
     * @tc.desc SHARP_S, split 1/2, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0005';
        InterfaceTestLog.begin(name, 'SHARP_S, split 1/2, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x45, 0xE4, 0xB8, 0xAD, 0xC3]);
        const secondBytes: Uint8Array = new Uint8Array([0x9F, 0x34, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'E\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u00DF4\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'E\u4E2D\u00DF4\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xC3, 0x9F, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u00DF\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0006
     * @tc.desc O_STROKE, split 1/2, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0006';
        InterfaceTestLog.begin(name, 'O_STROKE, split 1/2, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x46, 0xE4, 0xB8, 0xAD, 0xC3]);
        const secondBytes: Uint8Array = new Uint8Array([0xB8, 0x35, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'F\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u00F85\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'F\u4E2D\u00F85\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xC3, 0xB8, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u00F8\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0007
     * @tc.desc POUND, split 1/2, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0007';
        InterfaceTestLog.begin(name, 'POUND, split 1/2, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x47, 0xE4, 0xB8, 0xAD, 0xC2]);
        const secondBytes: Uint8Array = new Uint8Array([0xA3, 0x36, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'G\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u00A36\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'G\u4E2D\u00A36\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xC2, 0xA3, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u00A3\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0008
     * @tc.desc COMBINING_ACUTE, split 1/2, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0008';
        InterfaceTestLog.begin(name, 'COMBINING_ACUTE, split 1/2, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x48, 0xE4, 0xB8, 0xAD, 0xCC]);
        const secondBytes: Uint8Array = new Uint8Array([0x81, 0x37, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'H\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u03017\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'H\u4E2D\u03017\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xCC, 0x81, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0301\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0009
     * @tc.desc HAN, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0009';
        InterfaceTestLog.begin(name, 'HAN, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x49, 0xE4, 0xB8, 0xAD, 0xE4]);
        const secondBytes: Uint8Array = new Uint8Array([0xB8, 0xAD, 0x38, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'I\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u4E2D8\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'I\u4E2D\u4E2D8\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0010
     * @tc.desc HAN, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0010';
        InterfaceTestLog.begin(name, 'HAN, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4A, 0xE4, 0xB8, 0xAD, 0xE4, 0xB8]);
        const secondBytes: Uint8Array = new Uint8Array([0xAD, 0x39, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'J\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u4E2D9\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'J\u4E2D\u4E2D9\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0011
     * @tc.desc EURO, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0011';
        InterfaceTestLog.begin(name, 'EURO, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4B, 0xE4, 0xB8, 0xAD, 0xE2]);
        const secondBytes: Uint8Array = new Uint8Array([0x82, 0xAC, 0x30, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'K\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u20AC0\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'K\u4E2D\u20AC0\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x82, 0xAC, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u20AC\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0012
     * @tc.desc EURO, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0012';
        InterfaceTestLog.begin(name, 'EURO, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4C, 0xE4, 0xB8, 0xAD, 0xE2, 0x82]);
        const secondBytes: Uint8Array = new Uint8Array([0xAC, 0x31, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'L\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u20AC1\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'L\u4E2D\u20AC1\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x82, 0xAC, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u20AC\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0013
     * @tc.desc ZERO_WIDTH_SPACE, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0013';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_SPACE, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4D, 0xE4, 0xB8, 0xAD, 0xE2]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x8B, 0x32, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'M\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u200B2\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'M\u4E2D\u200B2\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x80, 0x8B, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u200B\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0014
     * @tc.desc ZERO_WIDTH_SPACE, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0014';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_SPACE, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4E, 0xE4, 0xB8, 0xAD, 0xE2, 0x80]);
        const secondBytes: Uint8Array = new Uint8Array([0x8B, 0x33, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'N\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u200B3\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'N\u4E2D\u200B3\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x80, 0x8B, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u200B\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0015
     * @tc.desc ZERO_WIDTH_JOINER, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0015';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_JOINER, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x4F, 0xE4, 0xB8, 0xAD, 0xE2]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x8D, 0x34, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'O\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u200D4\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'O\u4E2D\u200D4\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x80, 0x8D, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u200D\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0016
     * @tc.desc ZERO_WIDTH_JOINER, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0016',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0016';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_JOINER, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x50, 0xE4, 0xB8, 0xAD, 0xE2, 0x80]);
        const secondBytes: Uint8Array = new Uint8Array([0x8D, 0x35, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'P\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u200D5\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'P\u4E2D\u200D5\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE2, 0x80, 0x8D, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u200D\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0017
     * @tc.desc DEVANAGARI_KA, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0017',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0017';
        InterfaceTestLog.begin(name, 'DEVANAGARI_KA, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x51, 0xE4, 0xB8, 0xAD, 0xE0]);
        const secondBytes: Uint8Array = new Uint8Array([0xA4, 0x95, 0x36, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'Q\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u09156\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'Q\u4E2D\u09156\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE0, 0xA4, 0x95, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0915\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0018
     * @tc.desc DEVANAGARI_KA, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0018',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0018';
        InterfaceTestLog.begin(name, 'DEVANAGARI_KA, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0xE0, 0xA4]);
        const secondBytes: Uint8Array = new Uint8Array([0x95, 0x37, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'R\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u09157\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'R\u4E2D\u09157\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE0, 0xA4, 0x95, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0915\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0019
     * @tc.desc HANGUL_HAN, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0019',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0019';
        InterfaceTestLog.begin(name, 'HANGUL_HAN, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x53, 0xE4, 0xB8, 0xAD, 0xED]);
        const secondBytes: Uint8Array = new Uint8Array([0x95, 0x9C, 0x38, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'S\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD55C8\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'S\u4E2D\uD55C8\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xED, 0x95, 0x9C, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD55C\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0020
     * @tc.desc HANGUL_HAN, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0020',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0020';
        InterfaceTestLog.begin(name, 'HANGUL_HAN, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x54, 0xE4, 0xB8, 0xAD, 0xED, 0x95]);
        const secondBytes: Uint8Array = new Uint8Array([0x9C, 0x39, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'T\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD55C9\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'T\u4E2D\uD55C9\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xED, 0x95, 0x9C, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD55C\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0021
     * @tc.desc MIN_THREE_BYTE, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0021',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0021';
        InterfaceTestLog.begin(name, 'MIN_THREE_BYTE, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x55, 0xE4, 0xB8, 0xAD, 0xE0]);
        const secondBytes: Uint8Array = new Uint8Array([0xA0, 0x80, 0x30, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'U\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u08000\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'U\u4E2D\u08000\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE0, 0xA0, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0800\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0022
     * @tc.desc MIN_THREE_BYTE, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0022',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0022';
        InterfaceTestLog.begin(name, 'MIN_THREE_BYTE, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x56, 0xE4, 0xB8, 0xAD, 0xE0, 0xA0]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x31, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'V\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\u08001\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'V\u4E2D\u08001\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE0, 0xA0, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u0800\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0023
     * @tc.desc MAX_BMP, split 1/3, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0023',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0023';
        InterfaceTestLog.begin(name, 'MAX_BMP, split 1/3, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x57, 0xE4, 0xB8, 0xAD, 0xEF]);
        const secondBytes: Uint8Array = new Uint8Array([0xBF, 0xBF, 0x32, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'W\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uFFFF2\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'W\u4E2D\uFFFF2\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xEF, 0xBF, 0xBF, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uFFFF\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0024
     * @tc.desc MAX_BMP, split 2/3, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0024',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0024';
        InterfaceTestLog.begin(name, 'MAX_BMP, split 2/3, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x58, 0xE4, 0xB8, 0xAD, 0xEF, 0xBF]);
        const secondBytes: Uint8Array = new Uint8Array([0xBF, 0x33, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'X\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uFFFF3\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'X\u4E2D\uFFFF3\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xEF, 0xBF, 0xBF, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uFFFF\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0025
     * @tc.desc GRIN, split 1/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0025',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0025';
        InterfaceTestLog.begin(name, 'GRIN, split 1/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x59, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x9F, 0x98, 0x80, 0x34, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'Y\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE004\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'Y\u4E2D\uD83D\uDE004\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x98, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0026
     * @tc.desc GRIN, split 2/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0026',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0026';
        InterfaceTestLog.begin(name, 'GRIN, split 2/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5A, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F]);
        const secondBytes: Uint8Array = new Uint8Array([0x98, 0x80, 0x35, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'Z\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE005\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'Z\u4E2D\uD83D\uDE005\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x98, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0027
     * @tc.desc GRIN, split 3/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0027',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0027';
        InterfaceTestLog.begin(name, 'GRIN, split 3/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5B, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F, 0x98]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x36, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = '[\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE006\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = '[\u4E2D\uD83D\uDE006\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x98, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0028
     * @tc.desc ROCKET, split 1/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0028',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0028';
        InterfaceTestLog.begin(name, 'ROCKET, split 1/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5C, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x9F, 0x9A, 0x80, 0x37, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = '\\\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE807\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = '\\\u4E2D\uD83D\uDE807\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x9A, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE80\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0029
     * @tc.desc ROCKET, split 2/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0029',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0029';
        InterfaceTestLog.begin(name, 'ROCKET, split 2/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5D, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F]);
        const secondBytes: Uint8Array = new Uint8Array([0x9A, 0x80, 0x38, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = ']\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE808\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = ']\u4E2D\uD83D\uDE808\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x9A, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE80\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0030
     * @tc.desc ROCKET, split 3/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0030',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0030';
        InterfaceTestLog.begin(name, 'ROCKET, split 3/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5E, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F, 0x9A]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x39, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = '^\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD83D\uDE809\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = '^\u4E2D\uD83D\uDE809\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x9A, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDE80\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0031
     * @tc.desc DESERET, split 1/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0031',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0031';
        InterfaceTestLog.begin(name, 'DESERET, split 1/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x5F, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x90, 0x90, 0x80, 0x30, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = '_\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD801\uDC000\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = '_\u4E2D\uD801\uDC000\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x90, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD801\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0032
     * @tc.desc DESERET, split 2/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0032',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0032';
        InterfaceTestLog.begin(name, 'DESERET, split 2/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x60, 0xE4, 0xB8, 0xAD, 0xF0, 0x90]);
        const secondBytes: Uint8Array = new Uint8Array([0x90, 0x80, 0x31, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = '`\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD801\uDC001\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = '`\u4E2D\uD801\uDC001\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x90, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD801\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0033
     * @tc.desc DESERET, split 3/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0033',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0033';
        InterfaceTestLog.begin(name, 'DESERET, split 3/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x61, 0xE4, 0xB8, 0xAD, 0xF0, 0x90, 0x90]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x32, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'a\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD801\uDC002\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'a\u4E2D\uD801\uDC002\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x90, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD801\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0034
     * @tc.desc MIN_SUPPLEMENTARY, split 1/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0034',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0034';
        InterfaceTestLog.begin(name, 'MIN_SUPPLEMENTARY, split 1/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x62, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x90, 0x80, 0x80, 0x33, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'b\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD800\uDC003\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'b\u4E2D\uD800\uDC003\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x80, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD800\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0035
     * @tc.desc MIN_SUPPLEMENTARY, split 2/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0035',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0035';
        InterfaceTestLog.begin(name, 'MIN_SUPPLEMENTARY, split 2/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x63, 0xE4, 0xB8, 0xAD, 0xF0, 0x90]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x80, 0x34, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'c\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD800\uDC004\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'c\u4E2D\uD800\uDC004\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x80, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD800\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0036
     * @tc.desc MIN_SUPPLEMENTARY, split 3/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0036',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0036';
        InterfaceTestLog.begin(name, 'MIN_SUPPLEMENTARY, split 3/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x64, 0xE4, 0xB8, 0xAD, 0xF0, 0x90, 0x80]);
        const secondBytes: Uint8Array = new Uint8Array([0x80, 0x35, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'd\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uD800\uDC005\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'd\u4E2D\uD800\uDC005\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x90, 0x80, 0x80, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD800\uDC00\u000A';
        const reuseOutput: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'same decoder next session', reuseExpected, reuseOutput);
        expect(reuseOutput).assertEqual(reuseExpected);
        InterfaceTestLog.value(name, 'reused input bytes immutable', reuseSnapshot, reuseBytes.join(','));
        expect(reuseBytes.join(',')).assertEqual(reuseSnapshot);
        const reuseFlush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'reused empty flush', '', reuseFlush);
        expect(reuseFlush).assertEqual('');
        const reuseAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'repeat decoder session', reuseExpected, reuseAgain);
        expect(reuseAgain).assertEqual(reuseExpected);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0037
     * @tc.desc MAX_SCALAR, split 1/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0037',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0037';
        InterfaceTestLog.begin(name, 'MAX_SCALAR, split 1/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x65, 0xE4, 0xB8, 0xAD, 0xF4]);
        const secondBytes: Uint8Array = new Uint8Array([0x8F, 0xBF, 0xBF, 0x36, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'e\u4E2D';
        const first: string = decoder.decodeToString(firstBytes, { stream: true });
        InterfaceTestLog.value(name, 'incomplete scalar withheld', firstExpected, first);
        expect(first).assertEqual(firstExpected);