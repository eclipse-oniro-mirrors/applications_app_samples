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
  FixedMeasure,
  MixedMeasure,
  SpyMeasure,
  TextEditingModel,
  TextMeasure,
  TextState,
  UniformMeasure
} from '../common/TextEditingModel';
import { CASE_PREFIX, END_FLAG, TAG_DELETE_RIGHT } from '../common/TestConstant';
import { TestLogger } from '../common/TestLogger';

/**
 * deleteRight() callback of components/CustomInputText.ets.
 *
 * The callback only rewrites the forward slice: when the caret is inside the
 * composed message it records the caret as the new selection start, drops the
 * selection text, and rebuilds lastInput from the old composed message. The
 * inputText slice, the caret index and the caret pixel offset are never touched.
 * These suites drive the replica with the same message shapes the component can
 * produce, plus the out-of-range arguments that a hostile controller could send.
 */

const CANVAS_WIDTH: number = 320;
const CHAR_WIDTH: number = 10;

function createPlain(inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function createCustom(inputText: string, selectInput: string, lastInput: string, cursorIndex: number,
  selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH);
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

export default function deleteRightEditingTest(): void {
  describe('CustomInputTextDeleteRightTest', (): void => {
    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0010
     * @tc.name      deleteRightCursorAtZero_001
     * @tc.desc      Deleting one character with the caret at index 0 of a six-character message removes the first character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightCursorAtZero_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightCursorAtZero_001');
      let model: TextEditingModel = createPlain('', '', 'abcdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightCursorAtZero_001');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0020
     * @tc.name      deleteRightCursorAtOne_002
     * @tc.desc      Deleting two characters with the caret at index 1 removes indices 1 and 2 and keeps the prefix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightCursorAtOne_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightCursorAtOne_002');
      let model: TextEditingModel = createPlain('a', '', 'bcdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('def');
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightCursorAtOne_002');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0030
     * @tc.name      deleteRightCursorNearEnd_003
     * @tc.desc      Deleting the final character leaves an empty forward slice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightCursorNearEnd_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightCursorNearEnd_003');
      let model: TextEditingModel = createPlain('abcde', '', 'f');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightCursorNearEnd_003');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0040
     * @tc.name      deleteRightCursorAtEnd_004
     * @tc.desc      A forward delete at the caret equal to the message length is a no-op
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightCursorAtEnd_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightCursorAtEnd_004');
      let model: TextEditingModel = createPlain('abcdef', '', '');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(6);
      expect(state.inputText).assertEqual('abcdef');
      expect(state.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightCursorAtEnd_004');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0050
     * @tc.name      deleteRightCursorBeyondMessage_005
     * @tc.desc      A caret beyond the message length, such as the 10 of a 4-character message, leaves every field unchanged
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightCursorBeyondMessage_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightCursorBeyondMessage_005');
      let model: TextEditingModel = createCustom('ab', '', 'cd', 10, 10, 20);
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('cd');
      expect(state.selectIndex).assertEqual(10);
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(10);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightCursorBeyondMessage_005');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0060
     * @tc.name      deleteRightNegativeCursor_006
     * @tc.desc      A caret of -1 is below zero and still passes the length guard, so the forward slice restarts at index 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNegativeCursor_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNegativeCursor_006');
      let model: TextEditingModel = createCustom('', '', 'abcd', -1, -1, 0);
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('abcd');
      expect(state.selectIndex).assertEqual(-1);
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(-1);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNegativeCursor_006');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0070
     * @tc.name      deleteRightNegativeCursorTwo_007
     * @tc.desc      A caret of -1 shifted by two lands on index 1, so the first character survives
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNegativeCursorTwo_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNegativeCursorTwo_007');
      let model: TextEditingModel = createCustom('', '', 'abcd', -1, -1, 0);
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('bcd');
      expect(state.selectIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNegativeCursorTwo_007');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0080
     * @tc.name      deleteRightNaNCursor_008
     * @tc.desc      A NaN caret fails the length comparison, so the deletion is skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNaNCursor_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNaNCursor_008');
      let model: TextEditingModel = createCustom('', '', 'abcd', NaN, 0, 0);
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.lastInput).assertEqual('abcd');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNaNCursor_008');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0090
     * @tc.name      deleteRightEmptyMessage_009
     * @tc.desc      A zero-length message with the caret at 0 satisfies neither branch and stays empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightEmptyMessage_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightEmptyMessage_009');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(model.message()).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightEmptyMessage_009');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0100
     * @tc.name      deleteRightZeroLength_010
     * @tc.desc      A zero length request keeps the forward slice text but still rewrites the selection bookkeeping
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightZeroLength_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightZeroLength_010');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(0);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('cdef');
      expect(state.selectIndex).assertEqual(2);
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightZeroLength_010');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0110
     * @tc.name      deleteRightZeroLengthDropsSelection_011
     * @tc.desc      A zero length request still discards the selected slice, shrinking a six-character message to four
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightZeroLengthDropsSelection_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightZeroLengthDropsSelection_011');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(0);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectIndex).assertEqual(4);
      expect(state.selectInput).assertEqual('');
      expect(model.message()).assertEqual('abef');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightZeroLengthDropsSelection_011');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0120
     * @tc.name      deleteRightOneChar_012
     * @tc.desc      One character is removed from the forward slice of a caret that sits after a two-character prefix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightOneChar_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightOneChar_012');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('def');
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightOneChar_012');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0130
     * @tc.name      deleteRightTwoChars_013
     * @tc.desc      Two characters are removed when the request is two and four characters remain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightTwoChars_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightTwoChars_013');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightTwoChars_013');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0140
     * @tc.name      deleteRightAllRemaining_014
     * @tc.desc      A request equal to the remaining length empties the forward slice exactly
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightAllRemaining_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightAllRemaining_014');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(4);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.inputText).assertEqual('ab');
      expect(model.message()).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightAllRemaining_014');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0150
     * @tc.name      deleteRightRemainingPlusOne_015
     * @tc.desc      A request one longer than the remaining slice produces the same empty forward slice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightRemainingPlusOne_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightRemainingPlusOne_015');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(5);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightRemainingPlusOne_015');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0160
     * @tc.name      deleteRightHugeLength_016
     * @tc.desc      A request of one thousand characters is clamped by substring to the message end
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightHugeLength_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightHugeLength_016');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1000);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightHugeLength_016');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0170
     * @tc.name      deleteRightNegativeOne_017
     * @tc.desc      A length of -1 moves the forward slice one unit to the left, duplicating the last prefix character at the seam
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNegativeOne_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNegativeOne_017');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(-1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('bcdef');
      expect(model.message()).assertEqual('abbcdef');
      expect(model.message().length).assertEqual(7);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNegativeOne_017');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0180
     * @tc.name      deleteRightNegativeBeyondStart_018
     * @tc.desc      A negative length that would start before index 0 is clamped by substring to index 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNegativeBeyondStart_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNegativeBeyondStart_018');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(-5);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('abcdef');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNegativeBeyondStart_018');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0190
     * @tc.name      deleteRightHalfFraction_019
     * @tc.desc      A length of 0.5 truncates to 0, leaving the four-character suffix unchanged
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightHalfFraction_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightHalfFraction_019');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(0.5);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('cdef');
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightHalfFraction_019');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0200
     * @tc.name      deleteRightOneHalfFraction_020
     * @tc.desc      A length of 1.5 truncates to 1, removing exactly one character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightOneHalfFraction_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightOneHalfFraction_020');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1.5);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('def');
      expect(model.message()).assertEqual('abdef');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightOneHalfFraction_020');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0210
     * @tc.name      deleteRightOneNineFraction_021
     * @tc.desc      A length of 1.9 truncates to 1 as well, proving the truncation is toward zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightOneNineFraction_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightOneNineFraction_021');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1.9);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('def');
      expect(state.lastInput.length).assertEqual(3);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightOneNineFraction_021');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0220
     * @tc.name      deleteRightNaNLength_022
     * @tc.desc      A NaN length is converted to 0 by substring, so the whole message becomes the forward slice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNaNLength_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNaNLength_022');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(NaN);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('abcdef');
      expect(model.message()).assertEqual('ababcdef');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNaNLength_022');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0230
     * @tc.name      deleteRightInfinityLength_023
     * @tc.desc      An infinite length empties the forward slice after substring clamps the start to the message end
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightInfinityLength_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightInfinityLength_023');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(Infinity);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(model.message()).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightInfinityLength_023');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0240
     * @tc.name      deleteRightNegativeZeroLength_024
     * @tc.desc      A length of negative zero behaves like zero and keeps the four-character suffix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightNegativeZeroLength_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightNegativeZeroLength_024');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(-0);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('cdef');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightNegativeZeroLength_024');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0250
     * @tc.name      deleteRightZeroLengthAtStart_025
     * @tc.desc      A zero length request at index 0 keeps the full suffix and records the caret as selection start
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightZeroLengthAtStart_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightZeroLengthAtStart_025');
      let model: TextEditingModel = createPlain('', '', 'abcd');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(0);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('abcd');
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightZeroLengthAtStart_025');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0260
     * @tc.name      deleteRightSelectionMiddle_026
     * @tc.desc      With a two-character selection and a one-character request, the selected text disappears and the message shrinks by three
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightSelectionMiddle_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightSelectionMiddle_026');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('f');
      expect(state.selectIndex).assertEqual(4);
      expect(state.selectInput).assertEqual('');
      expect(model.message()).assertEqual('abf');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightSelectionMiddle_026');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0270
     * @tc.name      deleteRightSelectionAtHead_027
     * @tc.desc      A selection at the head followed by a two-character request leaves an empty message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightSelectionAtHead_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightSelectionAtHead_027');
      let model: TextEditingModel = createPlain('', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(model.message()).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightSelectionAtHead_027');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0280
     * @tc.name      deleteRightFullSelectionAtEnd_028
     * @tc.desc      A full selection with the caret already at the message end is left untouched because the guard fails
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightFullSelectionAtEnd_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightFullSelectionAtEnd_028');
      let model: TextEditingModel = createPlain('', 'abc', '');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(model.message()).assertEqual('abc');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightFullSelectionAtEnd_028');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0290
     * @tc.name      deleteRightSelectionDeleteTwo_029
     * @tc.desc      A six-character message with a two-character selection loses four characters when the request is two
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightSelectionDeleteTwo_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightSelectionDeleteTwo_029');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(4);
      expect(model.message()).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightSelectionDeleteTwo_029');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0300
     * @tc.name      deleteRightSelectionEmoji_030
     * @tc.desc      A two-code-unit emoji selection followed by a one-unit request removes the emoji and its neighbour
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightSelectionEmoji_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightSelectionEmoji_030');
      let model: TextEditingModel = createPlain('', '😀', 'x');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(model.message()).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightSelectionEmoji_030');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0310
     * @tc.name      deleteRightKeepsZeroCursorLeft_031
     * @tc.desc      A caret offset of 0 stays 0 after a delete that starts at index 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightKeepsZeroCursorLeft_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightKeepsZeroCursorLeft_031');
      let model: TextEditingModel = createPlain('', '', 'abcd');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.cursorLeft).assertEqual(0);
      expect(state.lastInput).assertEqual('bcd');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightKeepsZeroCursorLeft_031');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0320
     * @tc.name      deleteRightDoesNotMeasure_032
     * @tc.desc      A forward delete performs zero width measurements, unlike every other editing callback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightDoesNotMeasure_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightDoesNotMeasure_032');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(CHAR_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain('ab', '', 'cd');
      spy.reset();
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(spy.callCount()).assertEqual(0);
      expect(state.lastInput).assertEqual('d');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightDoesNotMeasure_032');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0330
     * @tc.name      deleteRightEmojiPair_033
     * @tc.desc      A two-unit request removes one complete surrogate pair, keeping the second emoji
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it(CASE_PREFIX + 'deleteRightEmojiPair_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightEmojiPair_033');
      let model: TextEditingModel = createPlain('', '', '😀😀');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('😀');
      expect(state.lastInput.length).assertEqual(2);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightEmojiPair_033');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0340
     * @tc.name      deleteRightEmojiSplit_034
     * @tc.desc      A one-unit request splits the surrogate pair, leaving a lone low surrogate of three units
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightEmojiSplit_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightEmojiSplit_034');
      let model: TextEditingModel = createPlain('', '', '😀😀');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.lastInput.length).assertEqual(3);
      expect(state.lastInput.charCodeAt(0)).assertEqual(0xDE00);
      expect(state.lastInput.charCodeAt(1)).assertEqual(0xD83D);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightEmojiSplit_034');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0350
     * @tc.name      deleteRightMixedScripts_035
     * @tc.desc      A mixed ASCII, hanzi and emoji run cut after three units leaves exactly the two-unit emoji
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightMixedScripts_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightMixedScripts_035');
      let model: TextEditingModel = createPlain('', '', 'a中b😀');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(3);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('😀');
      expect(state.lastInput.length).assertEqual(2);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightMixedScripts_035');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0360
     * @tc.name      deleteRightAfterRangeForward_036
     * @tc.desc      A plain forward range rewrites the prefix to empty, so deleting one unit leaves only the final character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightAfterRangeForward_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightAfterRangeForward_036');
      let model: TextEditingModel = createPlain('ab', '', 'cd');
      model.selectByRange(2, 4);
      TestLogger.value(TAG_DELETE_RIGHT, 'beforeDelete', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('d');
      expect(model.message()).assertEqual('d');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightAfterRangeForward_036');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0370
     * @tc.name      deleteRightAfterSelectAll_037
     * @tc.desc      A select-all leaves the caret at the message end, so a forward delete keeps the four-character selection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightAfterSelectAll_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightAfterSelectAll_037');
      let model: TextEditingModel = createPlain('ab', '', 'cd');
      model.handleExtendAction(0);
      TestLogger.value(TAG_DELETE_RIGHT, 'beforeDelete', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.selectInput).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightAfterSelectAll_037');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0380
     * @tc.name      deleteRightFiveDeletes_038
     * @tc.desc      Five two-unit requests consume a ten-digit suffix step by step down to the empty string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightFiveDeletes_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightFiveDeletes_038');
      let model: TextEditingModel = createPlain('ab', '', '0123456789');
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(2);
      expect(model.lastInput).assertEqual('23456789');
      model.deleteRight(2);
      expect(model.lastInput).assertEqual('456789');
      model.deleteRight(2);
      expect(model.lastInput).assertEqual('6789');
      model.deleteRight(2);
      expect(model.lastInput).assertEqual('89');
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual('');
      expect(model.message()).assertEqual('ab');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightFiveDeletes_038');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0390
     * @tc.name      deleteRightLastInputSuffix_039
     * @tc.desc      The rebuilt suffix is exactly the old message starting at caret plus requested length
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightLastInputSuffix_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightLastInputSuffix_039');
      let model: TextEditingModel = createPlain('ab', '', 'cdef');
      let oldMessage: string = model.message();
      let cursor: number = model.cursorIndex;
      let expected: string = oldMessage.substring(cursor + 2, oldMessage.length);
      TestLogger.value(TAG_DELETE_RIGHT, 'expected', expected);
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      expect(state.lastInput).assertEqual(expected);
      expect(state.lastInput).assertEqual('ef');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightLastInputSuffix_039');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number    SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_RIGHT_0400
     * @tc.name      deleteRightFractionalCursor_040
     * @tc.desc      A caret of 5.9 is kept as-is while substring truncates the start position 6.9 to 6, emptying the suffix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(CASE_PREFIX + 'deleteRightFractionalCursor_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_RIGHT, 'deleteRightFractionalCursor_040');
      let model: TextEditingModel = createCustom('abcde', '', 'f', 5.9, 5, 50);
      TestLogger.value(TAG_DELETE_RIGHT, 'input', JSON.stringify(model.snapshot()));
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      expect(state.cursorIndex).assertEqual(5.9);
      expect(state.selectIndex).assertEqual(5.9);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_DELETE_RIGHT, 'deleteRightFractionalCursor_040');
      await yieldToEventLoop();
      done();
    })
  })
}
