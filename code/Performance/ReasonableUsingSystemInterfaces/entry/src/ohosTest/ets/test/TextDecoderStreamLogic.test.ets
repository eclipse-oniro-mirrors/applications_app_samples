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
        const middleEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty streaming chunk preserves pending', '', middleEmpty);
        expect(middleEmpty).assertEqual('');
        const otherDecoder: util.TextDecoder = util.TextDecoder.create();
        const otherText: string = otherDecoder.decodeToString(new Uint8Array([0x58, 0xC2, 0xA2]));
        InterfaceTestLog.value(name, 'different decoder cannot see pending', 'X\u00A2', otherText);
        expect(otherText).assertEqual('X\u00A2');
        const secondExpected: string = '\uDBFF\uDFFF6\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'e\u4E2D\uDBFF\uDFFF6\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF4, 0x8F, 0xBF, 0xBF, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uDBFF\uDFFF\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0038
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0038
     * @tc.desc MAX_SCALAR, split 2/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0038',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0038';
        InterfaceTestLog.begin(name, 'MAX_SCALAR, split 2/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x66, 0xE4, 0xB8, 0xAD, 0xF4, 0x8F]);
        const secondBytes: Uint8Array = new Uint8Array([0xBF, 0xBF, 0x37, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'f\u4E2D';
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
        const secondExpected: string = '\uDBFF\uDFFF7\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'f\u4E2D\uDBFF\uDFFF7\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF4, 0x8F, 0xBF, 0xBF, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uDBFF\uDFFF\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0039
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0039
     * @tc.desc MAX_SCALAR, split 3/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0039',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0039';
        InterfaceTestLog.begin(name, 'MAX_SCALAR, split 3/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x67, 0xE4, 0xB8, 0xAD, 0xF4, 0x8F, 0xBF]);
        const secondBytes: Uint8Array = new Uint8Array([0xBF, 0x38, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'g\u4E2D';
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
        const secondExpected: string = '\uDBFF\uDFFF8\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'g\u4E2D\uDBFF\uDFFF8\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF4, 0x8F, 0xBF, 0xBF, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uDBFF\uDFFF\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0040
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0040
     * @tc.desc LAPTOP, split 1/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0040',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0040';
        InterfaceTestLog.begin(name, 'LAPTOP, split 1/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x68, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x9F, 0x92, 0xBB, 0x39, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'h\u4E2D';
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
        const secondExpected: string = '\uD83D\uDCBB9\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'h\u4E2D\uD83D\uDCBB9\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x92, 0xBB, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDCBB\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0041
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0041
     * @tc.desc LAPTOP, split 2/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0041',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0041';
        InterfaceTestLog.begin(name, 'LAPTOP, split 2/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x69, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F]);
        const secondBytes: Uint8Array = new Uint8Array([0x92, 0xBB, 0x30, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'i\u4E2D';
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
        const secondExpected: string = '\uD83D\uDCBB0\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'i\u4E2D\uD83D\uDCBB0\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x92, 0xBB, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDCBB\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0042
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0042
     * @tc.desc LAPTOP, split 3/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0042',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0042';
        InterfaceTestLog.begin(name, 'LAPTOP, split 3/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6A, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F, 0x92]);
        const secondBytes: Uint8Array = new Uint8Array([0xBB, 0x31, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'j\u4E2D';
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
        const secondExpected: string = '\uD83D\uDCBB1\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'j\u4E2D\uD83D\uDCBB1\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x92, 0xBB, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83D\uDCBB\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0043
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0043
     * @tc.desc MUSICAL_G_CLEF, split 1/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0043',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0043';
        InterfaceTestLog.begin(name, 'MUSICAL_G_CLEF, split 1/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6B, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x9D, 0x84, 0x9E, 0x32, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'k\u4E2D';
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
        const secondExpected: string = '\uD834\uDD1E2\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'k\u4E2D\uD834\uDD1E2\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9D, 0x84, 0x9E, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD834\uDD1E\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0044
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0044
     * @tc.desc MUSICAL_G_CLEF, split 2/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0044',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0044';
        InterfaceTestLog.begin(name, 'MUSICAL_G_CLEF, split 2/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6C, 0xE4, 0xB8, 0xAD, 0xF0, 0x9D]);
        const secondBytes: Uint8Array = new Uint8Array([0x84, 0x9E, 0x33, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'l\u4E2D';
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
        const secondExpected: string = '\uD834\uDD1E3\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'l\u4E2D\uD834\uDD1E3\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9D, 0x84, 0x9E, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD834\uDD1E\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0045
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0045
     * @tc.desc MUSICAL_G_CLEF, split 3/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0045',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0045';
        InterfaceTestLog.begin(name, 'MUSICAL_G_CLEF, split 3/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6D, 0xE4, 0xB8, 0xAD, 0xF0, 0x9D, 0x84]);
        const secondBytes: Uint8Array = new Uint8Array([0x9E, 0x34, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'm\u4E2D';
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
        const secondExpected: string = '\uD834\uDD1E4\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'm\u4E2D\uD834\uDD1E4\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9D, 0x84, 0x9E, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD834\uDD1E\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0046
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0046
     * @tc.desc REGIONAL_C, split 1/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0046',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0046';
        InterfaceTestLog.begin(name, 'REGIONAL_C, split 1/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6E, 0xE4, 0xB8, 0xAD, 0xF0]);
        const secondBytes: Uint8Array = new Uint8Array([0x9F, 0x87, 0xA8, 0x35, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'n\u4E2D';
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
        const secondExpected: string = '\uD83C\uDDE85\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: false });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'n\u4E2D\uD83C\uDDE85\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x87, 0xA8, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83C\uDDE8\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0047
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0047
     * @tc.desc REGIONAL_C, split 2/4, fatal true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0047',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0047';
        InterfaceTestLog.begin(name, 'REGIONAL_C, split 2/4, fatal true');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === true);
        expect(decoder.fatal === true).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x6F, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F]);
        const secondBytes: Uint8Array = new Uint8Array([0x87, 0xA8, 0x36, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'o\u4E2D';
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
        const secondExpected: string = '\uD83C\uDDE86\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'o\u4E2D\uD83C\uDDE86\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x87, 0xA8, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83C\uDDE8\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0048
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0048
     * @tc.desc REGIONAL_C, split 3/4, fatal false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0048',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0048';
        InterfaceTestLog.begin(name, 'REGIONAL_C, split 3/4, fatal false');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'fatal option retained', decoder.fatal === false);
        expect(decoder.fatal === false).assertTrue();
        const firstBytes: Uint8Array = new Uint8Array([0x70, 0xE4, 0xB8, 0xAD, 0xF0, 0x9F, 0x87]);
        const secondBytes: Uint8Array = new Uint8Array([0xA8, 0x37, 0x00]);
        const firstSnapshot: string = firstBytes.join(',');
        const secondSnapshot: string = secondBytes.join(',');
        const initialEmpty: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'empty stream starts empty', '', initialEmpty);
        expect(initialEmpty).assertEqual('');
        const firstExpected: string = 'p\u4E2D';
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
        const secondExpected: string = '\uD83C\uDDE87\u0000';
        const second: string = decoder.decodeToString(secondBytes, { stream: true });
        InterfaceTestLog.value(name, 'scalar completed without splitting', secondExpected, second);
        expect(second).assertEqual(secondExpected);
        InterfaceTestLog.number(name, 'second scalar count', 3, countScalars(second));
        expect(countScalars(second)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        InterfaceTestLog.value(name, 'complete stream empty flush', '', flush);
        expect(flush).assertEqual('');
        const joined: string = first + middleEmpty + second + flush;
        const joinedExpected: string = 'p\u4E2D\uD83C\uDDE87\u0000';
        InterfaceTestLog.value(name, 'complete stream fixed oracle', joinedExpected, joined);
        expect(joined).assertEqual(joinedExpected);
        InterfaceTestLog.flag(name, 'valid input no replacement', joined.indexOf('\uFFFD') < 0);
        expect(joined.indexOf('\uFFFD') < 0).assertTrue();
        InterfaceTestLog.value(name, 'first chunk bytes unchanged', firstSnapshot, firstBytes.join(','));
        expect(firstBytes.join(',')).assertEqual(firstSnapshot);
        InterfaceTestLog.value(name, 'second chunk bytes unchanged', secondSnapshot, secondBytes.join(','));
        expect(secondBytes.join(',')).assertEqual(secondSnapshot);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xF0, 0x9F, 0x87, 0xA8, 0x0A]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\uD83C\uDDE8\u000A';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0049
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0049
     * @tc.desc HAN, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0049',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0049';
        InterfaceTestLog.begin(name, 'HAN, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([97]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'a', lead);
        expect(lead).assertEqual('a');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE4]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 228, byte0[0]);
        expect(byte0[0]).assertEqual(228);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0xB8]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 184, byte1[0]);
        expect(byte1[0]).assertEqual(184);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0xAD]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u4E2D', chunk2);
        expect(chunk2).assertEqual('\u4E2D');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 173, byte2[0]);
        expect(byte2[0]).assertEqual(173);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'a\u4E2D\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u4E2D\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0050
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0050
     * @tc.desc EURO, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0050',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0050';
        InterfaceTestLog.begin(name, 'EURO, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([98]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'b', lead);
        expect(lead).assertEqual('b');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE2]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 226, byte0[0]);
        expect(byte0[0]).assertEqual(226);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x82]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 130, byte1[0]);
        expect(byte1[0]).assertEqual(130);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0xAC]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u20AC', chunk2);
        expect(chunk2).assertEqual('\u20AC');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 172, byte2[0]);
        expect(byte2[0]).assertEqual(172);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'b\u20AC\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE2, 0x82, 0xAC, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u20AC\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0051
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0051
     * @tc.desc ZERO_WIDTH_SPACE, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0051',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0051';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_SPACE, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([99]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'c', lead);
        expect(lead).assertEqual('c');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE2]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 226, byte0[0]);
        expect(byte0[0]).assertEqual(226);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x80]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 128, byte1[0]);
        expect(byte1[0]).assertEqual(128);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x8B]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u200B', chunk2);
        expect(chunk2).assertEqual('\u200B');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 139, byte2[0]);
        expect(byte2[0]).assertEqual(139);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'c\u200B\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE2, 0x80, 0x8B, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u200B\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0052
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0052
     * @tc.desc ZERO_WIDTH_JOINER, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0052',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0052';
        InterfaceTestLog.begin(name, 'ZERO_WIDTH_JOINER, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([100]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'd', lead);
        expect(lead).assertEqual('d');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE2]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 226, byte0[0]);
        expect(byte0[0]).assertEqual(226);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x80]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 128, byte1[0]);
        expect(byte1[0]).assertEqual(128);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x8D]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u200D', chunk2);
        expect(chunk2).assertEqual('\u200D');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 141, byte2[0]);
        expect(byte2[0]).assertEqual(141);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'd\u200D\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE2, 0x80, 0x8D, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u200D\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0053
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0053
     * @tc.desc DEVANAGARI_KA, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0053',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0053';
        InterfaceTestLog.begin(name, 'DEVANAGARI_KA, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([101]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'e', lead);
        expect(lead).assertEqual('e');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 224, byte0[0]);
        expect(byte0[0]).assertEqual(224);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0xA4]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 164, byte1[0]);
        expect(byte1[0]).assertEqual(164);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x95]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u0915', chunk2);
        expect(chunk2).assertEqual('\u0915');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 149, byte2[0]);
        expect(byte2[0]).assertEqual(149);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'e\u0915\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE0, 0xA4, 0x95, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u0915\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0054
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0054
     * @tc.desc HANGUL_HAN, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0054',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0054';
        InterfaceTestLog.begin(name, 'HANGUL_HAN, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([102]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'f', lead);
        expect(lead).assertEqual('f');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xED]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 237, byte0[0]);
        expect(byte0[0]).assertEqual(237);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x95]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 149, byte1[0]);
        expect(byte1[0]).assertEqual(149);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x9C]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\uD55C', chunk2);
        expect(chunk2).assertEqual('\uD55C');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 156, byte2[0]);
        expect(byte2[0]).assertEqual(156);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'f\uD55C\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xED, 0x95, 0x9C, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD55C\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0055
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0055
     * @tc.desc MIN_THREE_BYTE, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0055',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0055';
        InterfaceTestLog.begin(name, 'MIN_THREE_BYTE, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([103]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'g', lead);
        expect(lead).assertEqual('g');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xE0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 224, byte0[0]);
        expect(byte0[0]).assertEqual(224);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0xA0]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 160, byte1[0]);
        expect(byte1[0]).assertEqual(160);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x80]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\u0800', chunk2);
        expect(chunk2).assertEqual('\u0800');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 128, byte2[0]);
        expect(byte2[0]).assertEqual(128);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'g\u0800\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xE0, 0xA0, 0x80, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\u0800\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0056
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0056
     * @tc.desc MAX_BMP, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0056',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0056';
        InterfaceTestLog.begin(name, 'MAX_BMP, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([104]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'h', lead);
        expect(lead).assertEqual('h');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xEF]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 239, byte0[0]);
        expect(byte0[0]).assertEqual(239);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0xBF]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 191, byte1[0]);
        expect(byte1[0]).assertEqual(191);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0xBF]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '\uFFFF', chunk2);
        expect(chunk2).assertEqual('\uFFFF');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 191, byte2[0]);
        expect(byte2[0]).assertEqual(191);
        joined += chunk2;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'h\uFFFF\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xEF, 0xBF, 0xBF, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uFFFF\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0057
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0057
     * @tc.desc GRIN, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0057',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0057';
        InterfaceTestLog.begin(name, 'GRIN, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([105]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'i', lead);
        expect(lead).assertEqual('i');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x9F]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 159, byte1[0]);
        expect(byte1[0]).assertEqual(159);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x98]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 152, byte2[0]);
        expect(byte2[0]).assertEqual(152);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0x80]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD83D\uDE00', chunk3);
        expect(chunk3).assertEqual('\uD83D\uDE00');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 128, byte3[0]);
        expect(byte3[0]).assertEqual(128);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'i\uD83D\uDE00\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x98, 0x80, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD83D\uDE00\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0058
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0058
     * @tc.desc ROCKET, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0058',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0058';
        InterfaceTestLog.begin(name, 'ROCKET, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([106]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'j', lead);
        expect(lead).assertEqual('j');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x9F]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 159, byte1[0]);
        expect(byte1[0]).assertEqual(159);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x9A]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 154, byte2[0]);
        expect(byte2[0]).assertEqual(154);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0x80]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD83D\uDE80', chunk3);
        expect(chunk3).assertEqual('\uD83D\uDE80');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 128, byte3[0]);
        expect(byte3[0]).assertEqual(128);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'j\uD83D\uDE80\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x9A, 0x80, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD83D\uDE80\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0059
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0059
     * @tc.desc DESERET, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0059',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0059';
        InterfaceTestLog.begin(name, 'DESERET, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([107]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'k', lead);
        expect(lead).assertEqual('k');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x90]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 144, byte1[0]);
        expect(byte1[0]).assertEqual(144);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x90]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 144, byte2[0]);
        expect(byte2[0]).assertEqual(144);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0x80]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD801\uDC00', chunk3);
        expect(chunk3).assertEqual('\uD801\uDC00');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 128, byte3[0]);
        expect(byte3[0]).assertEqual(128);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'k\uD801\uDC00\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x90, 0x90, 0x80, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD801\uDC00\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0060
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0060
     * @tc.desc MIN_SUPPLEMENTARY, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0060',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0060';
        InterfaceTestLog.begin(name, 'MIN_SUPPLEMENTARY, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([108]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'l', lead);
        expect(lead).assertEqual('l');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x90]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 144, byte1[0]);
        expect(byte1[0]).assertEqual(144);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x80]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 128, byte2[0]);
        expect(byte2[0]).assertEqual(128);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0x80]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD800\uDC00', chunk3);
        expect(chunk3).assertEqual('\uD800\uDC00');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 128, byte3[0]);
        expect(byte3[0]).assertEqual(128);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'l\uD800\uDC00\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x90, 0x80, 0x80, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD800\uDC00\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0061
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0061
     * @tc.desc MAX_SCALAR, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0061',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0061';
        InterfaceTestLog.begin(name, 'MAX_SCALAR, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([109]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'm', lead);
        expect(lead).assertEqual('m');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF4]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 244, byte0[0]);
        expect(byte0[0]).assertEqual(244);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x8F]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 143, byte1[0]);
        expect(byte1[0]).assertEqual(143);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0xBF]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 191, byte2[0]);
        expect(byte2[0]).assertEqual(191);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0xBF]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uDBFF\uDFFF', chunk3);
        expect(chunk3).assertEqual('\uDBFF\uDFFF');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 191, byte3[0]);
        expect(byte3[0]).assertEqual(191);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'm\uDBFF\uDFFF\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF4, 0x8F, 0xBF, 0xBF, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uDBFF\uDFFF\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0062
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0062
     * @tc.desc LAPTOP, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0062',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0062';
        InterfaceTestLog.begin(name, 'LAPTOP, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([110]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'n', lead);
        expect(lead).assertEqual('n');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x9F]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 159, byte1[0]);
        expect(byte1[0]).assertEqual(159);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x92]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 146, byte2[0]);
        expect(byte2[0]).assertEqual(146);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0xBB]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD83D\uDCBB', chunk3);
        expect(chunk3).assertEqual('\uD83D\uDCBB');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 187, byte3[0]);
        expect(byte3[0]).assertEqual(187);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'n\uD83D\uDCBB\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x92, 0xBB, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD83D\uDCBB\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0063
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0063
     * @tc.desc MUSICAL_G_CLEF, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0063',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0063';
        InterfaceTestLog.begin(name, 'MUSICAL_G_CLEF, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([111]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'o', lead);
        expect(lead).assertEqual('o');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x9D]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 157, byte1[0]);
        expect(byte1[0]).assertEqual(157);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x84]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 132, byte2[0]);
        expect(byte2[0]).assertEqual(132);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0x9E]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD834\uDD1E', chunk3);
        expect(chunk3).assertEqual('\uD834\uDD1E');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 158, byte3[0]);
        expect(byte3[0]).assertEqual(158);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'o\uD834\uDD1E\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x9D, 0x84, 0x9E, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD834\uDD1E\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0064
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0064
     * @tc.desc REGIONAL_C, every byte is a chunk, strict UTF8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0064',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0064';
        InterfaceTestLog.begin(name, 'REGIONAL_C, every byte is a chunk, strict UTF8');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'strict decoder option', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const leadBytes: Uint8Array = new Uint8Array([112]);
        const lead: string = decoder.decodeToString(leadBytes, { stream: true });
        InterfaceTestLog.value(name, 'ASCII before fragmented scalar', 'p', lead);
        expect(lead).assertEqual('p');
        let joined: string = lead;
        const byte0: Uint8Array = new Uint8Array([0xF0]);
        const chunk0: string = decoder.decodeToString(byte0, { stream: true });
        InterfaceTestLog.value(name, 'byte 1 fixed output', '', chunk0);
        expect(chunk0).assertEqual('');
        InterfaceTestLog.number(name, 'byte 1 not mutated', 240, byte0[0]);
        expect(byte0[0]).assertEqual(240);
        joined += chunk0;
        const gap0: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 1 retains bytes', '', gap0);
        expect(gap0).assertEqual('');
        const byte1: Uint8Array = new Uint8Array([0x9F]);
        const chunk1: string = decoder.decodeToString(byte1, { stream: true });
        InterfaceTestLog.value(name, 'byte 2 fixed output', '', chunk1);
        expect(chunk1).assertEqual('');
        InterfaceTestLog.number(name, 'byte 2 not mutated', 159, byte1[0]);
        expect(byte1[0]).assertEqual(159);
        joined += chunk1;
        const gap1: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 2 retains bytes', '', gap1);
        expect(gap1).assertEqual('');
        const byte2: Uint8Array = new Uint8Array([0x87]);
        const chunk2: string = decoder.decodeToString(byte2, { stream: true });
        InterfaceTestLog.value(name, 'byte 3 fixed output', '', chunk2);
        expect(chunk2).assertEqual('');
        InterfaceTestLog.number(name, 'byte 3 not mutated', 135, byte2[0]);
        expect(byte2[0]).assertEqual(135);
        joined += chunk2;
        const gap2: string = decoder.decodeToString(new Uint8Array(0), { stream: true });
        InterfaceTestLog.value(name, 'gap 3 retains bytes', '', gap2);
        expect(gap2).assertEqual('');
        const byte3: Uint8Array = new Uint8Array([0xA8]);
        const chunk3: string = decoder.decodeToString(byte3, { stream: true });
        InterfaceTestLog.value(name, 'byte 4 fixed output', '\uD83C\uDDE8', chunk3);
        expect(chunk3).assertEqual('\uD83C\uDDE8');
        InterfaceTestLog.number(name, 'byte 4 not mutated', 168, byte3[0]);
        expect(byte3[0]).assertEqual(168);
        joined += chunk3;
        const tail: string = decoder.decodeToString(new Uint8Array([0x09]), { stream: false });
        InterfaceTestLog.value(name, 'final ASCII tail', '\u0009', tail);
        expect(tail).assertEqual('\u0009');
        joined += tail;
        const expected: string = 'p\uD83C\uDDE8\u0009';
        InterfaceTestLog.value(name, 'all byte chunks fixed oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'joined UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'joined scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        const flush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty final flush', '', flush);
        expect(flush).assertEqual('');
        const reuseBytes: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x87, 0xA8, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = '\uD83C\uDDE8\u0000';
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0065
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0065
     * @tc.desc default replacement, isolated continuation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0065',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0065';
        InterfaceTestLog.begin(name, 'default replacement, isolated continuation');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x41, 0x80]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'A\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'A\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 2, joined.length);
        expect(joined.length).assertEqual(body.length + flush.length);
        InterfaceTestLog.number(name, 'replacement scalar count', 2, countScalars(joined));
        expect(countScalars(joined)).assertEqual(countScalars(body) + countScalars(flush));
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 2, bytes.length);
        expect(bytes.length).assertEqual(2);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0066
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0066
     * @tc.desc default replacement, forbidden FF
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0066',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0066';
        InterfaceTestLog.begin(name, 'default replacement, forbidden FF');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x42, 0xFF]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'B\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'B\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 2, joined.length);
        expect(joined.length).assertEqual(body.length + flush.length);
        InterfaceTestLog.number(name, 'replacement scalar count', 2, countScalars(joined));
        expect(countScalars(joined)).assertEqual(countScalars(body) + countScalars(flush));
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 2, bytes.length);
        expect(bytes.length).assertEqual(2);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0067
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0067
     * @tc.desc default replacement, overlong two byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0067',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0067';
        InterfaceTestLog.begin(name, 'default replacement, overlong two byte');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x43, 0xC0, 0xAF]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'C\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'C\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 2, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(2);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0068
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0068
     * @tc.desc default replacement, overlong three byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0068',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0068';
        InterfaceTestLog.begin(name, 'default replacement, overlong three byte');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x44, 0xE0, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'D\uFFFD\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'D\uFFFD\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'replacement scalar count', 4, countScalars(joined));
        expect(countScalars(joined)).assertEqual(4);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 3, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(3);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0069
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0069
     * @tc.desc default replacement, encoded surrogate
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0069',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0069';
        InterfaceTestLog.begin(name, 'default replacement, encoded surrogate');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x45, 0xED, 0xA0, 0x80]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'E\uFFFD\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'E\uFFFD\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'replacement scalar count', 4, countScalars(joined));
        expect(countScalars(joined)).assertEqual(4);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 3, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(3);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0070
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0070
     * @tc.desc default replacement, above maximum
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0070',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0070';
        InterfaceTestLog.begin(name, 'default replacement, above maximum');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x46, 0xF4, 0x90, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'F\uFFFD\uFFFD\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'F\uFFFD\uFFFD\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 5, joined.length);
        expect(joined.length).assertEqual(5);
        InterfaceTestLog.number(name, 'replacement scalar count', 5, countScalars(joined));
        expect(countScalars(joined)).assertEqual(5);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 4, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(4);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 5, bytes.length);
        expect(bytes.length).assertEqual(5);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0071
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0071
     * @tc.desc default replacement, forbidden F5
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0071',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0071';
        InterfaceTestLog.begin(name, 'default replacement, forbidden F5');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x47, 0xF5, 0x80, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'G\uFFFD\uFFFD\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'G\uFFFD\uFFFD\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 5, joined.length);
        expect(joined.length).assertEqual(5);
        InterfaceTestLog.number(name, 'replacement scalar count', 5, countScalars(joined));
        expect(countScalars(joined)).assertEqual(5);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 4, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(4);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 5, bytes.length);
        expect(bytes.length).assertEqual(5);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0075
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0075
     * @tc.desc default replacement, ASCII interrupts two byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0075',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0075';
        InterfaceTestLog.begin(name, 'default replacement, ASCII interrupts two byte');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x4B, 0xC2, 0x41]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'K\uFFFDA';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'K\uFFFDA';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0076
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0076
     * @tc.desc default replacement, ASCII interrupts three byte start
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0076',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0076';
        InterfaceTestLog.begin(name, 'default replacement, ASCII interrupts three byte start');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x4C, 0xE4, 0x41]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'L\uFFFDA';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'L\uFFFDA';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0077
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0077
     * @tc.desc default replacement, ASCII interrupts three byte tail
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0077',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0077';
        InterfaceTestLog.begin(name, 'default replacement, ASCII interrupts three byte tail');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x4D, 0xE4, 0xB8, 0x41]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'M\uFFFDA';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'M\uFFFDA';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0078
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0078
     * @tc.desc default replacement, ASCII interrupts four byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0078',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0078';
        InterfaceTestLog.begin(name, 'default replacement, ASCII interrupts four byte');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x4E, 0xF0, 0x9F, 0x41]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'N\uFFFDA';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'N\uFFFDA';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 1, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1 >= 0).assertTrue();
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0079
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0079
     * @tc.desc default replacement, two continuations
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0079',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0079';
        InterfaceTestLog.begin(name, 'default replacement, two continuations');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x4F, 0x80, 0xBF]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'O\uFFFD\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'O\uFFFD\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 3, joined.length);
        expect(joined.length).assertEqual(3);
        InterfaceTestLog.number(name, 'replacement scalar count', 3, countScalars(joined));
        expect(countScalars(joined)).assertEqual(3);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 2, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(2);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0080
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0080
     * @tc.desc default replacement, ASCII between invalid parts
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0080',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0080';
        InterfaceTestLog.begin(name, 'default replacement, ASCII between invalid parts');
        const decoder: util.TextDecoder = util.TextDecoder.create();
        InterfaceTestLog.flag(name, 'default is nonfatal', !decoder.fatal);
        expect(!decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x50, 0xE2, 0x28, 0xA1]);
        const snapshot: string = bytes.join(',');
        const expected: string = 'P\uFFFD(\uFFFD';
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty stream flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        const body: string = decoder.decodeToString(bytes, { stream: false });
        const bodyExpected: string = 'P\uFFFD(\uFFFD';
        InterfaceTestLog.value(name, 'malformed or pending body', bodyExpected, body);
        expect(body).assertEqual(bodyExpected);
        const flush: string = decoder.decodeToString(new Uint8Array(0), { stream: false });
        const flushExpected: string = '';
        InterfaceTestLog.value(name, 'pending maximal subpart on flush', flushExpected, flush);
        expect(flush).assertEqual(flushExpected);
        const joined: string = body + flush;
        InterfaceTestLog.value(name, 'complete replacement oracle', expected, joined);
        expect(joined).assertEqual(expected);
        InterfaceTestLog.number(name, 'full replacement UTF16 length', 4, joined.length);
        expect(joined.length).assertEqual(4);
        InterfaceTestLog.number(name, 'replacement scalar count', 4, countScalars(joined));
        expect(countScalars(joined)).assertEqual(4);
        InterfaceTestLog.number(name, 'exact replacement multiplicity', 2, joined.split('\uFFFD').length - 1);
        expect(joined.split('\uFFFD').length - 1).assertEqual(2);
        InterfaceTestLog.value(name, 'malformed byte source unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'malformed source byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
        const reuseBytes: Uint8Array = new Uint8Array([0x52, 0xE4, 0xB8, 0xAD, 0x00]);
        const reuseSnapshot: string = reuseBytes.join(',');
        const reuseExpected: string = 'R\u4E2D\u0000';
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
        const again: string = decoder.decodeToString(bytes);
        InterfaceTestLog.value(name, 'same malformed bytes new session', expected, again);
        expect(again).assertEqual(expected);
        const other: util.TextDecoder = util.TextDecoder.create();
        const independent: string = other.decodeToString(bytes);
        InterfaceTestLog.value(name, 'new decoder same fixed oracle', expected, independent);
        expect(independent).assertEqual(expected);
        InterfaceTestLog.value(name, 'bytes immutable after repeats', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0081
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0081
     * @tc.desc fatal true throws and same-instance recovery, isolated continuation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0081',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0081';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, isolated continuation');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x61, 0x80]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 2, bytes.length);
        expect(bytes.length).assertEqual(2);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0082
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0082
     * @tc.desc fatal true throws and same-instance recovery, forbidden FF
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0082',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0082';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, forbidden FF');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x62, 0xFF]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 2, bytes.length);
        expect(bytes.length).assertEqual(2);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0083
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0083
     * @tc.desc fatal true throws and same-instance recovery, overlong two byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0083',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0083';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, overlong two byte');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x63, 0xC0, 0xAF]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0084
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0084
     * @tc.desc fatal true throws and same-instance recovery, overlong three byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0084',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0084';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, overlong three byte');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x64, 0xE0, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0085
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0085
     * @tc.desc fatal true throws and same-instance recovery, encoded surrogate
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0085',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0085';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, encoded surrogate');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x65, 0xED, 0xA0, 0x80]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0086
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0086
     * @tc.desc fatal true throws and same-instance recovery, above maximum
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0086',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0086';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, above maximum');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x66, 0xF4, 0x90, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 5, bytes.length);
        expect(bytes.length).assertEqual(5);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0087
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0087
     * @tc.desc fatal true throws and same-instance recovery, forbidden F5
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0087',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0087';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, forbidden F5');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x67, 0xF5, 0x80, 0x80, 0x80]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 5, bytes.length);
        expect(bytes.length).assertEqual(5);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0091
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0091
     * @tc.desc fatal true throws and same-instance recovery, ASCII interrupts two byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0091',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0091';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, ASCII interrupts two byte');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x6B, 0xC2, 0x41]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0092
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0092
     * @tc.desc fatal true throws and same-instance recovery, ASCII interrupts three byte start
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0092',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0092';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, ASCII interrupts three byte start');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x6C, 0xE4, 0x41]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0093
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0093
     * @tc.desc fatal true throws and same-instance recovery, ASCII interrupts three byte tail
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0093',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0093';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, ASCII interrupts three byte tail');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x6D, 0xE4, 0xB8, 0x41]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0094
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0094
     * @tc.desc fatal true throws and same-instance recovery, ASCII interrupts four byte
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0094',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0094';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, ASCII interrupts four byte');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x6E, 0xF0, 0x9F, 0x41]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0095
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0095
     * @tc.desc fatal true throws and same-instance recovery, two continuations
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0095',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0095';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, two continuations');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x6F, 0x80, 0xBF]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 3, bytes.length);
        expect(bytes.length).assertEqual(3);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0096
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0096
     * @tc.desc fatal true throws and same-instance recovery, ASCII between invalid parts
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0096',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_DECODERSTREAM_0096';
        InterfaceTestLog.begin(name, 'fatal true throws and same-instance recovery, ASCII between invalid parts');
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        InterfaceTestLog.flag(name, 'fatal is true', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        const bytes: Uint8Array = new Uint8Array([0x70, 0xE2, 0x28, 0xA1]);
        const snapshot: string = bytes.join(',');
        const initialFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'strict empty flush', '', initialFlush);
        expect(initialFlush).assertEqual('');
        let threw: boolean = false;
        try {
          decoder.decodeToString(bytes, { stream: false });
        } catch {
          threw = true;
        }
        InterfaceTestLog.flag(name, 'invalid UTF8 raises an exception', threw);
        InterfaceTestLog.flag(name, 'invalid UTF8 throws', threw);
        InterfaceTestLog.value(name, 'strict error leaves bytes unchanged', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.number(name, 'strict input byte count', 4, bytes.length);
        expect(bytes.length).assertEqual(4);
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
        const fresh: util.TextDecoder = util.TextDecoder.create('utf-8', { fatal: true });
        const freshResult: string = fresh.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'fresh strict decoder independent', reuseExpected, freshResult);
        expect(freshResult).assertEqual(reuseExpected);
        let repeatThrew: boolean = false;
        try {
          decoder.decodeToString(bytes);
        } catch {
          repeatThrew = true;
        }
        InterfaceTestLog.flag(name, 'repeat malformed input still throws', repeatThrew);
        InterfaceTestLog.flag(name, 'repeat malformed input throws', repeatThrew);
        const recoveredAgain: string = decoder.decodeToString(reuseBytes);
        InterfaceTestLog.value(name, 'second recovery has exact content', reuseExpected, recoveredAgain);
        expect(recoveredAgain).assertEqual(reuseExpected);
        InterfaceTestLog.number(name, 'second recovery length', 4, recoveredAgain.length);
        expect(recoveredAgain.length).assertEqual(4);
        const endFlush: string = decoder.decodeToString(new Uint8Array(0));
        InterfaceTestLog.value(name, 'empty flush after second recovery', '', endFlush);
        expect(endFlush).assertEqual('');
        InterfaceTestLog.value(name, 'strict input final immutable', snapshot, bytes.join(','));
        expect(bytes.join(',')).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'strict mode retained after errors', decoder.fatal);
        expect(decoder.fatal).assertTrue();
        InterfaceTestLog.end(name);
      });
  });
}
