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

import { describe, expect, it } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/YieldHelper';
import {
  MixedMeasure, SpyMeasure, TextEditingModel, TextState, UniformMeasure
} from '../common/TextEditingModel';
import { CASE_PREFIX, TAG_UNICODE } from '../common/TestConstant';
import { TestLogger } from '../common/TestLogger';

/**
 * UTF-16 code-unit matrix for the CustomInputText editing callbacks.
 *
 * The component slices strings with substring(), whose indices count UTF-16 code
 * units rather than characters or grapheme clusters. Every fixture below is
 * expressed as a list of 16-bit units so that expectations such as "one unit
 * before the end of an emoji" are unambiguous and platform independent.
 */
const MODEL_WIDTH: number = 320;
const ASCII_WIDTH: number = 8;
const WIDE_WIDTH: number = 16;

function mixedAt(width: number, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH), width);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function mixState(width: number, inputText: string, selectInput: string, lastInput: string,
  cursorIndex: number, selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH), width);
  let state: TextState = {
    inputText: inputText,
    selectInput: selectInput,
    lastInput: lastInput,
    cursorIndex: cursorIndex,
    selectIndex: selectIndex,
    cursorLeft: cursorLeft
  };
  model.loadState(state);
  return model;
}

function uniAt(unit: number, width: number, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(unit), width);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_UNICODE, caseName,
    state.inputText + '|' + state.selectInput + '|' + state.lastInput +
    '|cursor=' + state.cursorIndex.toString() + '|anchor=' + state.selectIndex.toString() +
    '|left=' + state.cursorLeft.toString());
}

export default function textUnicodeEditingTest(): void {
  describe('CustomInputTextUnicodeEditingTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0010
     * @tc.name insertAsciiExactWidth001
     * @tc.desc insertText accepts the ascii fixture when the projected width equals the canvas width exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertAsciiExactWidth_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertAsciiExactWidth_001');
      let model: TextEditingModel = mixedAt(24, '', '', '');
      let accepted: boolean = model.insertText('abc');
      let state: TextState = model.snapshot();
      logState('insertAsciiExactWidth_001', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('abc');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.selectIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(24);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertAsciiExactWidth_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0020
     * @tc.name insertAsciiOnePixelShort002
     * @tc.desc insertText rejects the ascii fixture when the canvas is one pixel narrower than the projected width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertAsciiOnePixelShort_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertAsciiOnePixelShort_002');
      let model: TextEditingModel = mixedAt(23, '', '', '');
      let accepted: boolean = model.insertText('abc');
      let state: TextState = model.snapshot();
      logState('insertAsciiOnePixelShort_002', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'insertAsciiOnePixelShort_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0030
     * @tc.name insertAsciiUniformTen003
     * @tc.desc insertText accepts ascii under a uniform 10 px measure and records 3 UTF-16 code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertAsciiUniformTen_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertAsciiUniformTen_003');
      let model: TextEditingModel = uniAt(10, MODEL_WIDTH, '', '', '');
      let accepted: boolean = model.insertText('abc');
      let state: TextState = model.snapshot();
      logState('insertAsciiUniformTen_003', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('abc');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertAsciiUniformTen_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0040
     * @tc.name insertCjkExactWidth004
     * @tc.desc insertText accepts the cjk fixture when the projected width equals the canvas width exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertCjkExactWidth_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertCjkExactWidth_004');
      let model: TextEditingModel = mixedAt(32, '', '', '');
      let accepted: boolean = model.insertText('中文');
      let state: TextState = model.snapshot();
      logState('insertCjkExactWidth_004', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('中文');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(32);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertCjkExactWidth_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0050
     * @tc.name insertCjkOnePixelShort005
     * @tc.desc insertText rejects the cjk fixture when the canvas is one pixel narrower than the projected width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertCjkOnePixelShort_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertCjkOnePixelShort_005');
      let model: TextEditingModel = mixedAt(31, '', '', '');
      let accepted: boolean = model.insertText('中文');
      let state: TextState = model.snapshot();
      logState('insertCjkOnePixelShort_005', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'insertCjkOnePixelShort_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0060
     * @tc.name insertCjkUniformTen006
     * @tc.desc insertText accepts cjk under a uniform 10 px measure and records 2 UTF-16 code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertCjkUniformTen_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertCjkUniformTen_006');
      let model: TextEditingModel = uniAt(10, MODEL_WIDTH, '', '', '');
      let accepted: boolean = model.insertText('中文');
      let state: TextState = model.snapshot();
      logState('insertCjkUniformTen_006', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('中文');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(20);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertCjkUniformTen_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0070
     * @tc.name insertEmojiExactWidth007
     * @tc.desc insertText accepts the emoji fixture when the projected width equals the canvas width exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiExactWidth_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiExactWidth_007');
      let model: TextEditingModel = mixedAt(32, '', '', '');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiExactWidth_007', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(32);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertEmojiExactWidth_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0080
     * @tc.name insertEmojiOnePixelShort008
     * @tc.desc insertText rejects the emoji fixture when the canvas is one pixel narrower than the projected width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiOnePixelShort_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiOnePixelShort_008');
      let model: TextEditingModel = mixedAt(31, '', '', '');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiOnePixelShort_008', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'insertEmojiOnePixelShort_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0090
     * @tc.name insertEmojiUniformTen009
     * @tc.desc insertText accepts emoji under a uniform 10 px measure and records 2 UTF-16 code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiUniformTen_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiUniformTen_009');
      let model: TextEditingModel = uniAt(10, MODEL_WIDTH, '', '', '');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiUniformTen_009', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(20);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertEmojiUniformTen_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0100
     * @tc.name insertEmojiWithTrailingText010
     * @tc.desc insertText adds one pixel guard term for lastInput even when the emoji itself fits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiWithTrailingText_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiWithTrailingText_010');
      let model: TextEditingModel = uniAt(10, 40, '', '', 'xy');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiWithTrailingText_010', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.lastInput).assertEqual('xy');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_UNICODE, 'insertEmojiWithTrailingText_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0110
     * @tc.name insertEmojiRejectedByTrailingText011
     * @tc.desc insertText rejects an emoji whose projected width plus the two trailing characters exceeds the canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiRejectedByTrailingText_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiRejectedByTrailingText_011');
      let model: TextEditingModel = uniAt(10, 39, '', '', 'xy');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiRejectedByTrailingText_011', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('xy');
      TestLogger.end(TAG_UNICODE, 'insertEmojiRejectedByTrailingText_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0120
     * @tc.name insertEmojiDropsSelection012
     * @tc.desc insertText appends the emoji after inputText and drops the selected slice instead of overwriting it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmojiDropsSelection_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmojiDropsSelection_012');
      let model: TextEditingModel = mixedAt(320, 'a', 'b', '');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertEmojiDropsSelection_012', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('a' + '\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'insertEmojiDropsSelection_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0130
     * @tc.name insertEmptyStringKeepsIndices013
     * @tc.desc An empty insertText call is accepted and still normalises both indices to the end of inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmptyStringKeepsIndices_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmptyStringKeepsIndices_013');
      let model: TextEditingModel = mixedAt(320, 'ab', 'c', '');
      let accepted: boolean = model.insertText('');
      let state: TextState = model.snapshot();
      logState('insertEmptyStringKeepsIndices_013', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'insertEmptyStringKeepsIndices_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0140
     * @tc.name insertRejectedOnZeroCanvas014
     * @tc.desc An emoji is rejected on a zero-width canvas because its projected width is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertRejectedOnZeroCanvas_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertRejectedOnZeroCanvas_014');
      let model: TextEditingModel = uniAt(10, 0, '', '', '');
      let accepted: boolean = model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('insertRejectedOnZeroCanvas_014', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertRejectedOnZeroCanvas_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0150
     * @tc.name insertEmptyOnZeroCanvas015
     * @tc.desc An empty insert is accepted on a zero-width canvas because the strict comparison is not satisfied
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmptyOnZeroCanvas_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmptyOnZeroCanvas_015');
      let model: TextEditingModel = uniAt(10, 0, '', '', '');
      let accepted: boolean = model.insertText('');
      let state: TextState = model.snapshot();
      logState('insertEmptyOnZeroCanvas_015', state);
      expect(accepted).assertTrue();
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'insertEmptyOnZeroCanvas_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0160
     * @tc.name insertEmptyRejectedOnNegativeCanvas016
     * @tc.desc An empty insert is rejected on a negative canvas width because zero is greater than the width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertEmptyRejectedOnNegativeCanvas_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertEmptyRejectedOnNegativeCanvas_016');
      let model: TextEditingModel = uniAt(10, -1, '', '', '');
      let accepted: boolean = model.insertText('');
      let state: TextState = model.snapshot();
      logState('insertEmptyRejectedOnNegativeCanvas_016', state);
      expect(accepted).assertFalse();
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'insertEmptyRejectedOnNegativeCanvas_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0170
     * @tc.name insertRepeatUntilRejected017
     * @tc.desc Repeated single-character inserts fill a 30 px canvas twice and the fourth insert is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertRepeatUntilRejected_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertRepeatUntilRejected_017');
      let model: TextEditingModel = uniAt(10, 30, '', '', '');
      model.insertText('a');
      model.insertText('a');
      let accepted: boolean = model.insertText('a');
      let later: boolean = model.insertText('a');
      let state: TextState = model.snapshot();
      logState('insertRepeatUntilRejected_017', state);
      expect(accepted).assertTrue();
      expect(later).assertFalse();
      expect(state.inputText).assertEqual('aaa');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_UNICODE, 'insertRepeatUntilRejected_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0180
     * @tc.name insertLoneHighSurrogate018
     * @tc.desc A lone high surrogate is one code unit wide and leaves the caret at index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertLoneHighSurrogate_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertLoneHighSurrogate_018');
      let model: TextEditingModel = uniAt(10, 320, '', '', '');
      let accepted: boolean = model.insertText('\uD83D');
      let state: TextState = model.snapshot();
      logState('insertLoneHighSurrogate_018', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'insertLoneHighSurrogate_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0190
     * @tc.name insertLoneLowSurrogate019
     * @tc.desc A lone low surrogate is one code unit wide and is appended like any other unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertLoneLowSurrogate_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertLoneLowSurrogate_019');
      let model: TextEditingModel = uniAt(10, 320, '', '', '');
      let accepted: boolean = model.insertText('\uDE00');
      let state: TextState = model.snapshot();
      logState('insertLoneLowSurrogate_019', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'insertLoneLowSurrogate_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0200
     * @tc.name insertNulUnit020
     * @tc.desc A NUL code unit measures as ASCII and advances the caret by one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertNulUnit_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertNulUnit_020');
      let model: TextEditingModel = uniAt(10, 320, '', '', '');
      let accepted: boolean = model.insertText('\u0000');
      let state: TextState = model.snapshot();
      logState('insertNulUnit_020', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\u0000');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'insertNulUnit_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0210
     * @tc.name insertLineSeparatorUnit021
     * @tc.desc A U+2028 line separator is one unit in the wide class and shifts the caret to index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertLineSeparatorUnit_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'insertLineSeparatorUnit_021');
      let model: TextEditingModel = uniAt(10, 320, '', '', '');
      let accepted: boolean = model.insertText('\u2028');
      let state: TextState = model.snapshot();
      logState('insertLineSeparatorUnit_021', state);
      expect(accepted).assertTrue();
      expect(state.inputText).assertEqual('\u2028');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'insertLineSeparatorUnit_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0220
     * @tc.name deleteLeftOneAscii022
     * @tc.desc deleteLeft removes the final code unit of the ascii fixture and keeps the remaining 2 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftOneAscii_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftOneAscii_022');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftOneAscii_022', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_UNICODE, 'deleteLeftOneAscii_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0230
     * @tc.name deleteLeftAllAscii023
     * @tc.desc deleteLeft with the full ascii length clears inputText but resets both indices to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllAscii_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftAllAscii_023');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.deleteLeft(3);
      let state: TextState = model.snapshot();
      logState('deleteLeftAllAscii_023', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteLeftAllAscii_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0240
     * @tc.name deleteLeftOneCjk024
     * @tc.desc deleteLeft removes the final code unit of the cjk fixture and keeps the remaining 1 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftOneCjk_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftOneCjk_024');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftOneCjk_024', state);
      expect(state.inputText).assertEqual('中');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_UNICODE, 'deleteLeftOneCjk_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0250
     * @tc.name deleteLeftAllCjk025
     * @tc.desc deleteLeft with the full cjk length clears inputText but resets both indices to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllCjk_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftAllCjk_025');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftAllCjk_025', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteLeftAllCjk_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0260
     * @tc.name deleteLeftOneEmoji026
     * @tc.desc deleteLeft removes the final code unit of the emoji fixture and keeps the remaining 1 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftOneEmoji_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftOneEmoji_026');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftOneEmoji_026', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_UNICODE, 'deleteLeftOneEmoji_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0270
     * @tc.name deleteLeftAllEmoji027
     * @tc.desc deleteLeft with the full emoji length clears inputText but resets both indices to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllEmoji_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftAllEmoji_027');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftAllEmoji_027', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteLeftAllEmoji_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0280
     * @tc.name deleteLeftZeroLengthResetsIndices028
     * @tc.desc A zero-length delete keeps the emoji intact but still recomputes the caret and anchor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftZeroLengthResetsIndices_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftZeroLengthResetsIndices_028');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 5, 1, 99);
      model.deleteLeft(0);
      let state: TextState = model.snapshot();
      logState('deleteLeftZeroLengthResetsIndices_028', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'deleteLeftZeroLengthResetsIndices_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0290
     * @tc.name deleteLeftNegativeStaysIntact029
     * @tc.desc A negative delete length extends the substring end past the text and removes nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegativeStaysIntact_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftNegativeStaysIntact_029');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(-1);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegativeStaysIntact_029', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'deleteLeftNegativeStaysIntact_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0300
     * @tc.name deleteLeftPastLengthClears030
     * @tc.desc A delete length beyond the emoji length clears the composer because substring clamps the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftPastLengthClears_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftPastLengthClears_030');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(3);
      let state: TextState = model.snapshot();
      logState('deleteLeftPastLengthClears_030', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteLeftPastLengthClears_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0310
     * @tc.name deleteLeftFractionTruncates031
     * @tc.desc A delete length of 1.5 truncates the substring end to 0 and therefore removes the whole emoji
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftFractionTruncates_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftFractionTruncates_031');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(1.5);
      let state: TextState = model.snapshot();
      logState('deleteLeftFractionTruncates_031', state);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteLeftFractionTruncates_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0320
     * @tc.name deleteLeftNanClears032
     * @tc.desc A NaN delete length becomes zero as a substring end and clears the composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNanClears_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftNanClears_032');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(NaN);
      let state: TextState = model.snapshot();
      logState('deleteLeftNanClears_032', state);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteLeftNanClears_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0330
     * @tc.name deleteLeftInfinityClears033
     * @tc.desc An infinite delete length clamps to zero and clears the composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftInfinityClears_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftInfinityClears_033');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(Infinity);
      let state: TextState = model.snapshot();
      logState('deleteLeftInfinityClears_033', state);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteLeftInfinityClears_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0340
     * @tc.name deleteLeftNegativeInfinityStays034
     * @tc.desc A negative infinite delete length extends past the text and removes nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegativeInfinityStays_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftNegativeInfinityStays_034');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(-Infinity);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegativeInfinityStays_034', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'deleteLeftNegativeInfinityStays_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0350
     * @tc.name deleteLeftKeepsSelectionSlice035
     * @tc.desc deleteLeft truncates inputText only and leaves the selected and trailing slices untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftKeepsSelectionSlice_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftKeepsSelectionSlice_035');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', 'x', 'y');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftKeepsSelectionSlice_035', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.selectInput).assertEqual('x');
      expect(state.lastInput).assertEqual('y');
      TestLogger.end(TAG_UNICODE, 'deleteLeftKeepsSelectionSlice_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0360
     * @tc.name deleteLeftSpyMeasuresOnce036
     * @tc.desc deleteLeft measures exactly the new inputText once with a spy measure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftSpyMeasuresOnce_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftSpyMeasuresOnce_036');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftSpyMeasuresOnce_036', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'deleteLeftSpyMeasuresOnce_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0370
     * @tc.name deleteLeftBrokenPairStaysBroken037
     * @tc.desc Deleting one unit of an emoji leaves a lone high surrogate that is not repaired
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftBrokenPairStaysBroken_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftBrokenPairStaysBroken_037');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.deleteLeft(1);
      let remainder: string = model.inputText;
      let state: TextState = model.snapshot();
      logState('deleteLeftBrokenPairStaysBroken_037', state);
      expect(remainder).assertEqual('\uD83D');
      expect(remainder.length).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'deleteLeftBrokenPairStaysBroken_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0380
     * @tc.name deleteLeftTwiceOnTwoEmojis038
     * @tc.desc Two deletes on two emojis remove the second pair and leave the first pair intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftTwiceOnTwoEmojis_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteLeftTwiceOnTwoEmojis_038');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00\uD83D\uDE00', '', '');
      model.deleteLeft(1);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftTwiceOnTwoEmojis_038', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'deleteLeftTwiceOnTwoEmojis_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0390
     * @tc.name deleteRightOneAscii039
     * @tc.desc deleteRight from caret 0 removes the leading unit of the ascii fixture by rebuilding lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightOneAscii_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightOneAscii_039');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightOneAscii_039', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('bc');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightOneAscii_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0400
     * @tc.name deleteRightOneCjk040
     * @tc.desc deleteRight from caret 0 removes the leading unit of the cjk fixture by rebuilding lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightOneCjk_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightOneCjk_040');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightOneCjk_040', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('文');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightOneCjk_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0410
     * @tc.name deleteRightOneEmoji041
     * @tc.desc deleteRight from caret 0 removes the leading unit of the emoji fixture by rebuilding lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightOneEmoji_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightOneEmoji_041');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightOneEmoji_041', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightOneEmoji_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0420
     * @tc.name deleteRightAllAscii042
     * @tc.desc deleteRight with the full ascii length empties the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightAllAscii_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightAllAscii_042');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.deleteRight(3);
      let state: TextState = model.snapshot();
      logState('deleteRightAllAscii_042', state);
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightAllAscii_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0430
     * @tc.name deleteRightAllCjk043
     * @tc.desc deleteRight with the full cjk length empties the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightAllCjk_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightAllCjk_043');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      logState('deleteRightAllCjk_043', state);
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightAllCjk_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0440
     * @tc.name deleteRightAllEmoji044
     * @tc.desc deleteRight with the full emoji length empties the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightAllEmoji_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightAllEmoji_044');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      logState('deleteRightAllEmoji_044', state);
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightAllEmoji_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0450
     * @tc.name deleteRightFromMiddleOfPair045
     * @tc.desc A forward delete at caret 1 of an emoji removes the low surrogate and leaves no trailing text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightFromMiddleOfPair_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightFromMiddleOfPair_045');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 1, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightFromMiddleOfPair_045', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'deleteRightFromMiddleOfPair_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0460
     * @tc.name deleteRightZeroLengthKeepsTail046
     * @tc.desc A zero-length forward delete still clears the selection and rebuilds the same tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightZeroLengthKeepsTail_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightZeroLengthKeepsTail_046');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(0);
      let state: TextState = model.snapshot();
      logState('deleteRightZeroLengthKeepsTail_046', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightZeroLengthKeepsTail_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0470
     * @tc.name deleteRightAtEndIsNoop047
     * @tc.desc A forward delete with the caret at the end of the emoji leaves every field unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightAtEndIsNoop_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightAtEndIsNoop_047');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 2, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightAtEndIsNoop_047', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteRightAtEndIsNoop_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0480
     * @tc.name deleteRightNegativeCaretRestartsAtZero048
     * @tc.desc A caret of -1 shifted by two lands on unit one, so only the low surrogate survives
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightNegativeCaretRestartsAtZero_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightNegativeCaretRestartsAtZero_048');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', -1, -1, 0);
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      logState('deleteRightNegativeCaretRestartsAtZero_048', state);
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.selectIndex).assertEqual(-1);
      TestLogger.end(TAG_UNICODE, 'deleteRightNegativeCaretRestartsAtZero_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0490
     * @tc.name deleteRightNegativeLengthKeepsTail049
     * @tc.desc A negative delete length shifts the start below zero and the substring reproduces the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightNegativeLengthKeepsTail_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightNegativeLengthKeepsTail_049');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(-1);
      let state: TextState = model.snapshot();
      logState('deleteRightNegativeLengthKeepsTail_049', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'deleteRightNegativeLengthKeepsTail_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0500
     * @tc.name deleteRightNanLengthKeepsTail050
     * @tc.desc A NaN delete length becomes zero for substring and the full tail survives
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightNanLengthKeepsTail_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightNanLengthKeepsTail_050');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(NaN);
      let state: TextState = model.snapshot();
      logState('deleteRightNanLengthKeepsTail_050', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'deleteRightNanLengthKeepsTail_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0510
     * @tc.name deleteRightInfinityLengthEmpties051
     * @tc.desc An infinite delete length clamps to the message length and empties the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightInfinityLengthEmpties_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightInfinityLengthEmpties_051');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(Infinity);
      let state: TextState = model.snapshot();
      logState('deleteRightInfinityLengthEmpties_051', state);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteRightInfinityLengthEmpties_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0520
     * @tc.name deleteRightFractionLengthKeepsTail052
     * @tc.desc A fractional delete length of 0.5 truncates to zero and keeps the whole tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightFractionLengthKeepsTail_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightFractionLengthKeepsTail_052');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(0.5);
      let state: TextState = model.snapshot();
      logState('deleteRightFractionLengthKeepsTail_052', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'deleteRightFractionLengthKeepsTail_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0530
     * @tc.name deleteRightDropsSelectionText053
     * @tc.desc A forward delete inside a selected emoji discards the selection without re-inserting it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightDropsSelectionText_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightDropsSelectionText_053');
      let model: TextEditingModel = mixState(320, '', '\uD83D\uDE00', '', 1, 0, 0);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightDropsSelectionText_053', state);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'deleteRightDropsSelectionText_053');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0540
     * @tc.name deleteRightNeverMeasures054
     * @tc.desc deleteRight never recomputes cursorLeft and performs no measurement
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightNeverMeasures_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightNeverMeasures_054');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('', '', '\uD83D\uDE00');
      spy.reset();
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightNeverMeasures_054', state);
      expect(spy.callCount()).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightNeverMeasures_054');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0550
     * @tc.name deleteRightKeepsCaretAndPrefix055
     * @tc.desc deleteRight leaves cursorIndex and inputText untouched while re-anchoring selectIndex
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightKeepsCaretAndPrefix_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'deleteRightKeepsCaretAndPrefix_055');
      let model: TextEditingModel = mixState(320, '\uD83D', '', '\uD83D\uDE00', 3, 0, 8);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('deleteRightKeepsCaretAndPrefix_055', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'deleteRightKeepsCaretAndPrefix_055');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0560
     * @tc.name moveLeftFromEndAscii056
     * @tc.desc A left move from the end of the ascii fixture splits it one code unit before the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveLeftFromEndAscii_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveLeftFromEndAscii_056');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveLeftFromEndAscii_056', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('c');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'moveLeftFromEndAscii_056');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0570
     * @tc.name moveLeftFromEndCjk057
     * @tc.desc A left move from the end of the cjk fixture splits it one code unit before the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveLeftFromEndCjk_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveLeftFromEndCjk_057');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveLeftFromEndCjk_057', state);
      expect(state.inputText).assertEqual('中');
      expect(state.lastInput).assertEqual('文');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveLeftFromEndCjk_057');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0580
     * @tc.name moveLeftFromEndEmoji058
     * @tc.desc A left move from the end of the emoji fixture splits it one code unit before the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveLeftFromEndEmoji_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveLeftFromEndEmoji_058');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveLeftFromEndEmoji_058', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveLeftFromEndEmoji_058');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0590
     * @tc.name moveRightFromStartAscii059
     * @tc.desc A right move from index 0 of the ascii fixture moves the caret one code unit inside it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightFromStartAscii_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveRightFromStartAscii_059');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logState('moveRightFromStartAscii_059', state);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bc');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveRightFromStartAscii_059');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0600
     * @tc.name moveRightFromStartCjk060
     * @tc.desc A right move from index 0 of the cjk fixture moves the caret one code unit inside it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightFromStartCjk_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveRightFromStartCjk_060');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logState('moveRightFromStartCjk_060', state);
      expect(state.inputText).assertEqual('中');
      expect(state.lastInput).assertEqual('文');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveRightFromStartCjk_060');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0610
     * @tc.name moveRightFromStartEmoji061
     * @tc.desc A right move from index 0 of the emoji fixture moves the caret one code unit inside it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightFromStartEmoji_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveRightFromStartEmoji_061');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logState('moveRightFromStartEmoji_061', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveRightFromStartEmoji_061');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0620
     * @tc.name moveUpToStartCjk062
     * @tc.desc An up move from the cjk fixture folds the whole message into lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveUpToStartCjk_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveUpToStartCjk_062');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.moveCursor(1);
      let state: TextState = model.snapshot();
      logState('moveUpToStartCjk_062', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('中文');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'moveUpToStartCjk_062');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0630
     * @tc.name moveDownToEndCjk063
     * @tc.desc A down move from index 0 of the cjk fixture folds the whole message into inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveDownToEndCjk_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveDownToEndCjk_063');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.moveCursor(2);
      let state: TextState = model.snapshot();
      logState('moveDownToEndCjk_063', state);
      expect(state.inputText).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'moveDownToEndCjk_063');
      await yieldToEventLoop();
      done();
    });
  });
}
