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
  TextEditingModel, TextState, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure, SpyMeasure, TextMeasure
} from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_INSERT } from '../common/TestConstant';

/**
 * insertText callback contract of components/CustomInputText.ets.
 *
 * The callback is guarded by one width comparison:
 *   cursorLeft + measure(text) + measure(lastInput) > canvasWidth -> rejected
 * On acceptance the text is appended to inputText, the caret and the selection
 * anchor move to the new end of inputText, the selection slice is cleared and
 * cursorLeft is recomputed from the whole inputText. The suites below pin down
 * that rule over accepted and rejected inputs, over inconsistent states the
 * component can be left in, over the measuring strategy, over many text kinds
 * and over the sequences a real input method produces.
 */

/** Model whose canvas is measured with a uniform 10 px per code unit. */
function makeUniformModel(canvasWidth: number): TextEditingModel {
  let measure: UniformMeasure = new UniformMeasure(10);
  return new TextEditingModel(measure, canvasWidth);
}

/** Model with an explicit measure, used by the measuring-strategy cases. */
function makeMeasuredModel(measure: TextMeasure, canvasWidth: number): TextEditingModel {
  return new TextEditingModel(measure, canvasWidth);
}

/** Model preloaded with a plain state that satisfies the component invariant. */
function makeLoadedModel(canvasWidth: number, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = makeUniformModel(canvasWidth);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

/** Model preloaded with an arbitrary (possibly inconsistent) state. */
function makeStateModel(state: TextState): TextEditingModel {
  let model: TextEditingModel = makeUniformModel(100);
  model.loadState(state);
  return model;
}

function expectSlices(model: TextEditingModel, inputText: string, selectInput: string, lastInput: string): void {
  expect(model.inputText).assertEqual(inputText);
  expect(model.selectInput).assertEqual(selectInput);
  expect(model.lastInput).assertEqual(lastInput);
}

function expectCaret(model: TextEditingModel, cursorIndex: number, selectIndex: number, cursorLeft: number): void {
  expect(model.cursorIndex).assertEqual(cursorIndex);
  expect(model.selectIndex).assertEqual(selectIndex);
  expect(model.cursorLeft).assertEqual(cursorLeft);
}

function expectMessage(model: TextEditingModel, expected: string): void {
  expect(model.message()).assertEqual(expected);
}

function repeatedText(unit: string, count: number): string {
  let result: string = '';
  let index: number = 0;
  while (index < count) {
    result = result + unit;
    index++;
  }
  return result;
}

export default function insertTextEditingTest(): void {
  describe('CustomInputTextInsertTextTest', () => {
    // ---- accepted and rejected width guard ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0010
     * @tc.name insertTextAcceptEmptyState001
     * @tc.desc Verify an empty insertion on the initial editor is accepted and leaves every field at its default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptEmptyState_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptEmptyState_001');
      let model: TextEditingModel = makeUniformModel(100);
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectSlices(model, '', '', '');
      expectCaret(model, 0, 0, 0);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptEmptyState_001');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0020
     * @tc.name insertTextAcceptMultiCharacter002
     * @tc.desc Verify three characters append as one unit and cursorLeft becomes 30 px on a wide canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptMultiCharacter_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptMultiCharacter_002');
      let model: TextEditingModel = makeUniformModel(100);
      let accepted: boolean = model.insertText('abc');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectSlices(model, 'abc', '', '');
      expectCaret(model, 3, 3, 30);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptMultiCharacter_002');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0030
     * @tc.name insertTextAcceptAtExactWidthBoundary003
     * @tc.desc Verify the guard is a strict greater-than: projected width 60 on a 60 px canvas is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptAtExactWidthBoundary_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptAtExactWidthBoundary_003');
      let model: TextEditingModel = makeLoadedModel(60, 'ab', '', 'c');
      let accepted: boolean = model.insertText('xyz');
      TestLogger.value(TAG_INSERT, 'projected=', '60');
      expect(accepted).assertTrue();
      expectSlices(model, 'abxyz', '', 'c');
      expectCaret(model, 5, 5, 50);
      expectMessage(model, 'abxyzc');
      TestLogger.end(TAG_INSERT, 'insertTextAcceptAtExactWidthBoundary_003');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0040
     * @tc.name insertTextRejectOnePixelOverBoundary004
     * @tc.desc Verify one pixel beyond the canvas rejects the insertion and leaves the loaded state untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectOnePixelOverBoundary_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectOnePixelOverBoundary_004');
      let model: TextEditingModel = makeLoadedModel(59, 'ab', '', 'c');
      let accepted: boolean = model.insertText('xyz');
      TestLogger.value(TAG_INSERT, 'projected=', '60 on 59 canvas');
      expect(accepted).assertFalse();
      expectSlices(model, 'ab', '', 'c');
      expectCaret(model, 2, 2, 20);
      TestLogger.end(TAG_INSERT, 'insertTextRejectOnePixelOverBoundary_004');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0050
     * @tc.name insertTextAcceptWhenLastInputFitsExactly005
     * @tc.desc Verify the same three terms accepted on a 40 px canvas, the last pixel of which is unused by the strict comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptWhenLastInputFitsExactly_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptWhenLastInputFitsExactly_005');
      let model: TextEditingModel = makeLoadedModel(40, 'a', '', 'bb');
      let accepted: boolean = model.insertText('x');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectSlices(model, 'ax', '', 'bb');
      expectCaret(model, 2, 2, 20);
      expectMessage(model, 'axbb');
      TestLogger.end(TAG_INSERT, 'insertTextAcceptWhenLastInputFitsExactly_005');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0060
     * @tc.name insertTextRejectEmptyWhenCursorAlreadyOverflowed006
     * @tc.desc Verify an empty insertion is rejected after the caret itself has moved beyond the canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectEmptyWhenCursorAlreadyOverflowed_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectEmptyWhenCursorAlreadyOverflowed_006');
      let model: TextEditingModel = makeLoadedModel(20, 'aaaaa', '', '');
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertFalse();
      expectCaret(model, 5, 5, 50);
      TestLogger.end(TAG_INSERT, 'insertTextRejectEmptyWhenCursorAlreadyOverflowed_006');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0070
     * @tc.name insertTextAcceptEmptyOnZeroWidthCanvas007
     * @tc.desc Verify a zero-width canvas still accepts zero-width input because 0 is not greater than 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptEmptyOnZeroWidthCanvas_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptEmptyOnZeroWidthCanvas_007');
      let model: TextEditingModel = makeUniformModel(0);
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'canvas=', '0');
      expect(accepted).assertTrue();
      expectCaret(model, 0, 0, 0);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptEmptyOnZeroWidthCanvas_007');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0080
     * @tc.name insertTextRejectCharacterOnZeroWidthCanvas008
     * @tc.desc Verify any positive width is rejected by a zero-width canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectCharacterOnZeroWidthCanvas_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectCharacterOnZeroWidthCanvas_008');
      let model: TextEditingModel = makeUniformModel(0);
      let accepted: boolean = model.insertText('a');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertFalse();
      expectSlices(model, '', '', '');
      TestLogger.end(TAG_INSERT, 'insertTextRejectCharacterOnZeroWidthCanvas_008');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0090
     * @tc.name insertTextRejectEmptyOnNegativeCanvas009
     * @tc.desc Verify a negative canvas rejects even empty input because 0 exceeds -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectEmptyOnNegativeCanvas_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectEmptyOnNegativeCanvas_009');
      let model: TextEditingModel = makeUniformModel(-1);
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'canvas=', '-1');
      expect(accepted).assertFalse();
      TestLogger.end(TAG_INSERT, 'insertTextRejectEmptyOnNegativeCanvas_009');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0100
     * @tc.name insertTextRejectTextOnNegativeCanvas010
     * @tc.desc Verify a negative canvas rejects non-empty input and keeps the four slice fields empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectTextOnNegativeCanvas_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectTextOnNegativeCanvas_010');
      let model: TextEditingModel = makeUniformModel(-10);
      let accepted: boolean = model.insertText('ab');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertFalse();
      expectSlices(model, '', '', '');
      expectCaret(model, 0, 0, 0);
      TestLogger.end(TAG_INSERT, 'insertTextRejectTextOnNegativeCanvas_010');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0110
     * @tc.name insertTextAcceptVeryLongInputOnHugeCanvas011
     * @tc.desc Verify 1024 characters are appended when the canvas is large enough; the caret counts UTF-16 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptVeryLongInputOnHugeCanvas_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptVeryLongInputOnHugeCanvas_011');
      let text: string = repeatedText('a', 1024);
      let model: TextEditingModel = makeUniformModel(1000000);
      let accepted: boolean = model.insertText(text);
      TestLogger.value(TAG_INSERT, 'length=', text.length.toString());
      expect(accepted).assertTrue();
      expect(model.inputText.length).assertEqual(1024);
      expect(model.cursorIndex).assertEqual(1024);
      expect(model.cursorLeft).assertEqual(10240);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptVeryLongInputOnHugeCanvas_011');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0120
     * @tc.name insertTextAcceptEmptyWhenCursorEqualsCanvas012
     * @tc.desc Verify a caret exactly at the canvas boundary accepts empty input but refreshes the caret indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptEmptyWhenCursorEqualsCanvas_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptEmptyWhenCursorEqualsCanvas_012');
      let model: TextEditingModel = makeLoadedModel(50, 'aaaaa', '', '');
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertTrue();
      expectSlices(model, 'aaaaa', '', '');
      expectCaret(model, 5, 5, 50);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptEmptyWhenCursorEqualsCanvas_012');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0130
     * @tc.name insertTextRejectEmptyWhenCursorExceedsCanvas013
     * @tc.desc Verify one pixel past the canvas rejects empty input as well
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectEmptyWhenCursorExceedsCanvas_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectEmptyWhenCursorExceedsCanvas_013');
      let model: TextEditingModel = makeLoadedModel(59, 'aaaaaa', '', '');
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertFalse();
      expectCaret(model, 6, 6, 60);
      TestLogger.end(TAG_INSERT, 'insertTextRejectEmptyWhenCursorExceedsCanvas_013');
      await yieldToEventLoop();
      done();
    })

    // ---- append semantics of the component ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0140
     * @tc.name insertTextAppendsBeforeTrailingSlice014
     * @tc.desc Verify the new characters are appended to inputText, so they land before the trailing slice in the visible text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAppendsBeforeTrailingSlice_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAppendsBeforeTrailingSlice_014');
      let model: TextEditingModel = makeLoadedModel(100, 'ab', '', 'cd');
      let accepted: boolean = model.insertText('X');
      TestLogger.value(TAG_INSERT, 'message=', model.message());
      expect(accepted).assertTrue();
      expectSlices(model, 'abX', '', 'cd');
      expectCaret(model, 3, 3, 30);
      expectMessage(model, 'abXcd');
      TestLogger.end(TAG_INSERT, 'insertTextAppendsBeforeTrailingSlice_014');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0150
     * @tc.name insertTextDropsSelectedSlice015
     * @tc.desc Verify the selection slice is cleared without being merged, so its characters disappear from the visible text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextDropsSelectedSlice_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextDropsSelectedSlice_015');
      let model: TextEditingModel = makeLoadedModel(200, 'ab', 'cd', 'ef');
      let accepted: boolean = model.insertText('X');
      TestLogger.value(TAG_INSERT, 'message=', model.message());
      expect(accepted).assertTrue();
      expectSlices(model, 'abX', '', 'ef');
      expectMessage(model, 'abXef');
      TestLogger.end(TAG_INSERT, 'insertTextDropsSelectedSlice_015');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0160
     * @tc.name insertTextRepairsOversizedCursorIndex016
     * @tc.desc Verify a cursor index beyond the message length is overwritten by inputText.length, not clamped to the message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRepairsOversizedCursorIndex_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRepairsOversizedCursorIndex_016');
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '',
        cursorIndex: 99, selectIndex: 99, cursorLeft: 30
      };
      let model: TextEditingModel = makeStateModel(state);
      let accepted: boolean = model.insertText('d');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectCaret(model, 4, 4, 40);
      TestLogger.end(TAG_INSERT, 'insertTextRepairsOversizedCursorIndex_016');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0170
     * @tc.name insertTextWhenAnchorBeyondCaret017
     * @tc.desc Verify an anchor index greater than the caret still ends at the caret value after an accepted insert
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextWhenAnchorBeyondCaret_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextWhenAnchorBeyondCaret_017');
      let state: TextState = {
        inputText: 'ab', selectInput: 'cd', lastInput: '',
        cursorIndex: 2, selectIndex: 4, cursorLeft: 20
      };
      let model: TextEditingModel = makeStateModel(state);
      let accepted: boolean = model.insertText('X');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectSlices(model, 'abX', '', '');
      expectCaret(model, 3, 3, 30);
      TestLogger.end(TAG_INSERT, 'insertTextWhenAnchorBeyondCaret_017');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0180
     * @tc.name insertTextGrowsMessageByInsertedLength018
     * @tc.desc Verify the visible message grows exactly by the inserted length when no selection existed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextGrowsMessageByInsertedLength_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextGrowsMessageByInsertedLength_018');
      let model: TextEditingModel = makeLoadedModel(100, 'ab', '', 'cd');
      let before: number = model.message().length;
      model.insertText('xy');
      let after: number = model.message().length;
      TestLogger.value(TAG_INSERT, 'growth=', (after - before).toString());
      expect(before).assertEqual(4);
      expect(after).assertEqual(6);
      TestLogger.end(TAG_INSERT, 'insertTextGrowsMessageByInsertedLength_018');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0190
     * @tc.name insertTextCursorLeftUsesMixedMeasure019
     * @tc.desc Verify cursorLeft is the mixed measure of the whole inputText after a wide CJK character is appended
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextCursorLeftUsesMixedMeasure_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextCursorLeftUsesMixedMeasure_019');
      let measure: MixedMeasure = new MixedMeasure(8, 16);
      let model: TextEditingModel = makeMeasuredModel(measure, 100);
      model.loadPlain('a', '', '');
      let accepted: boolean = model.insertText('中');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertTrue();
      expect(model.cursorLeft).assertEqual(24);
      expect(model.cursorLeft).assertEqual(measure.widthOf('a中'));
      TestLogger.end(TAG_INSERT, 'insertTextCursorLeftUsesMixedMeasure_019');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0200
     * @tc.name insertTextRepairsNegativeAnchor020
     * @tc.desc Verify a negative anchor index is overwritten by the caret position after an accepted insert
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRepairsNegativeAnchor_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRepairsNegativeAnchor_020');
      let state: TextState = {
        inputText: 'ab', selectInput: '', lastInput: '',
        cursorIndex: 2, selectIndex: -3, cursorLeft: 20
      };
      let model: TextEditingModel = makeStateModel(state);
      let accepted: boolean = model.insertText('X');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expectSlices(model, 'abX', '', '');
      expectCaret(model, 3, 3, 30);
      TestLogger.end(TAG_INSERT, 'insertTextRepairsNegativeAnchor_020');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0210
     * @tc.name insertTextRecomputesStaleZeroCursorLeft021
     * @tc.desc Verify a stale zero cursorLeft does not block the insertion because the guard uses the stale value but the stored value is recomputed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRecomputesStaleZeroCursorLeft_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRecomputesStaleZeroCursorLeft_021');
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '',
        cursorIndex: 3, selectIndex: 3, cursorLeft: 0
      };
      let model: TextEditingModel = makeStateModel(state);
      let accepted: boolean = model.insertText('d');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertTrue();
      expect(model.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_INSERT, 'insertTextRecomputesStaleZeroCursorLeft_021');
      await yieldToEventLoop();
      done();
    })

    // ---- repeated insertions keep the selection cleared ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0220
     * @tc.name insertTextEmptyKeepsLongTrailingSlice022
     * @tc.desc Verify a ten-character trailing slice survives an accepted empty insertion unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextEmptyKeepsLongTrailingSlice_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextEmptyKeepsLongTrailingSlice_022');
      let model: TextEditingModel = makeLoadedModel(1000, 'a', '', '0123456789');
      let accepted: boolean = model.insertText('');
      TestLogger.value(TAG_INSERT, 'lastInput=', model.lastInput);
      expect(accepted).assertTrue();
      expect(model.lastInput).assertEqual('0123456789');
      TestLogger.end(TAG_INSERT, 'insertTextEmptyKeepsLongTrailingSlice_022');
      await yieldToEventLoop();
      done();
    })

    // ---- measuring interactions ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0230
     * @tc.name insertTextRetryAfterCanvasGrows023
     * @tc.desc Verify the same insertion is rejected on a 29 px canvas and accepted after the canvas is widened to 100 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRetryAfterCanvasGrows_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRetryAfterCanvasGrows_023');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = makeMeasuredModel(spy, 29);
      model.loadPlain('ab', '', '');
      spy.reset();
      let firstAccepted: boolean = model.insertText('x');
      model.setCanvasWidth(100);
      let secondAccepted: boolean = model.insertText('x');
      TestLogger.value(TAG_INSERT, 'secondAccepted=', secondAccepted.toString());
      expect(firstAccepted).assertFalse();
      expect(secondAccepted).assertTrue();
      expect(model.inputText).assertEqual('abx');
      expect(spy.callCount()).assertEqual(5);
      TestLogger.end(TAG_INSERT, 'insertTextRetryAfterCanvasGrows_023');
      await yieldToEventLoop();
      done();
    })

    // ---- text kinds ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0240
     * @tc.name insertTextAcceptsSingleSpace024
     * @tc.desc Verify a space is accepted as one code unit and updates both the caret and cursorLeft
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptsSingleSpace_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptsSingleSpace_024');
      let model: TextEditingModel = makeUniformModel(100);
      let accepted: boolean = model.insertText(' ');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expect(model.inputText).assertEqual(' ');
      expectCaret(model, 1, 1, 10);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptsSingleSpace_024');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0250
     * @tc.name insertTextAcceptsTab025
     * @tc.desc Verify a tab is measured as one code unit by the uniform measure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptsTab_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptsTab_025');
      let model: TextEditingModel = makeUniformModel(100);
      let accepted: boolean = model.insertText('\t');
      TestLogger.value(TAG_INSERT, 'inputLength=', model.inputText.length.toString());
      expect(accepted).assertTrue();
      expect(model.inputText.length).assertEqual(1);
      expect(model.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptsTab_025');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0260
     * @tc.name insertTextAcceptsTwoCjkAtBoundary026
     * @tc.desc Verify two wide CJK characters exactly fill a 32 px canvas under the mixed measure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextAcceptsTwoCjkAtBoundary_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextAcceptsTwoCjkAtBoundary_026');
      let model: TextEditingModel = makeMeasuredModel(new MixedMeasure(8, 16), 32);
      let accepted: boolean = model.insertText('中文');
      TestLogger.value(TAG_INSERT, 'cursorLeft=', model.cursorLeft.toString());
      expect(accepted).assertTrue();
      expect(model.inputText).assertEqual('中文');
      expect(model.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_INSERT, 'insertTextAcceptsTwoCjkAtBoundary_026');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0270
     * @tc.name insertTextRejectsTwoCjkOnThirtyOne027
     * @tc.desc Verify the same two CJK characters are rejected when the canvas is one pixel narrower
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectsTwoCjkOnThirtyOne_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectsTwoCjkOnThirtyOne_027');
      let model: TextEditingModel = makeMeasuredModel(new MixedMeasure(8, 16), 31);
      let accepted: boolean = model.insertText('中文');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertFalse();
      expect(model.inputText).assertEqual('');
      TestLogger.end(TAG_INSERT, 'insertTextRejectsTwoCjkOnThirtyOne_027');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0280
     * @tc.name insertTextCountsZwjSequence028
     * @tc.desc Verify a four-person family emoji is eight UTF-16 units and fills an 80 px canvas exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextCountsZwjSequence_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextCountsZwjSequence_028');
      let model: TextEditingModel = makeUniformModel(80);
      let accepted: boolean = model.insertText('👨‍👩‍👧');
      TestLogger.value(TAG_INSERT, 'length=', model.inputText.length.toString());
      expect(accepted).assertTrue();
      expect(model.inputText.length).assertEqual(8);
      expect(model.cursorLeft).assertEqual(80);
      TestLogger.end(TAG_INSERT, 'insertTextCountsZwjSequence_028');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0290
     * @tc.name insertTextTwoHundredFiftyFiveCharacters029
     * @tc.desc Verify the guard scales to a 255-character run exactly filling a 2550 px canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextTwoHundredFiftyFiveCharacters_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextTwoHundredFiftyFiveCharacters_029');
      let text: string = repeatedText('a', 255);
      let model: TextEditingModel = makeUniformModel(2550);
      let accepted: boolean = model.insertText(text);
      TestLogger.value(TAG_INSERT, 'length=', model.inputText.length.toString());
      expect(accepted).assertTrue();
      expect(model.inputText.length).assertEqual(255);
      expect(model.cursorLeft).assertEqual(2550);
      TestLogger.end(TAG_INSERT, 'insertTextTwoHundredFiftyFiveCharacters_029');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0300
     * @tc.name insertTextRejectsThousandCharactersOnSmallCanvas030
     * @tc.desc Verify a 1024-character run is rejected by a 10000 px canvas because it projects to 10240 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextRejectsThousandCharactersOnSmallCanvas_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextRejectsThousandCharactersOnSmallCanvas_030');
      let text: string = repeatedText('a', 1024);
      let model: TextEditingModel = makeUniformModel(10000);
      let accepted: boolean = model.insertText(text);
      TestLogger.value(TAG_INSERT, 'projected=', '10240');
      expect(accepted).assertFalse();
      expect(model.inputText).assertEqual('');
      TestLogger.end(TAG_INSERT, 'insertTextRejectsThousandCharactersOnSmallCanvas_030');
      await yieldToEventLoop();
      done();
    })

    // ---- measuring strategies ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INSERT_0310
     * @tc.name insertTextZeroMeasureAcceptsAnyText031
     * @tc.desc Verify a zero-width measure accepts arbitrarily long text and keeps cursorLeft at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTextZeroMeasureAcceptsAnyText_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_INSERT, 'insertTextZeroMeasureAcceptsAnyText_031');
      let model: TextEditingModel = makeMeasuredModel(new UniformMeasure(0), 0);
      let accepted: boolean = model.insertText('abcdef');
      TestLogger.value(TAG_INSERT, 'accepted=', accepted.toString());
      expect(accepted).assertTrue();
      expect(model.inputText.length).assertEqual(6);
      expect(model.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_INSERT, 'insertTextZeroMeasureAcceptsAnyText_031');
      await yieldToEventLoop();
      done();
    })

    // ---- sequences with the other controller callbacks ----

    // ---- invariants ----

  });
}
