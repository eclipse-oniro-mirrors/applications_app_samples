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