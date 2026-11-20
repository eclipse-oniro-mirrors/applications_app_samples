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
  SquareMeasure,
  TextEditingModel,
  TextMeasure,
  TextState,
  UniformMeasure
} from '../common/TextEditingModel';
import { CASE_PREFIX, TAG_MOVE_CURSOR } from '../common/TestConstant';
import { TestLogger } from '../common/TestLogger';

/**
 * moveCursor() callback of components/CustomInputText.ets.
 *
 * The callback first folds the selected slice back into the composed message,
 * then rewrites inputText and lastInput around the caret. UP and DOWN jump to the
 * ends, LEFT and RIGHT step by one UTF-16 unit. LEFT is not clamped: at position
 * 0 it walks to -1, and the substring calls then treat the negative index as 0,
 * so the whole message moves into lastInput while cursorIndex stays negative.
 *
 * Each case below drives the replica with one message shape and one direction
 * and asserts the four rewritten fields plus the caret pixel offset. Direction
 * values are passed as the numeric values of inputMethod.Direction: 1 = up,
 * 2 = down, 3 = left, 4 = right.
 */

const CANVAS_WIDTH: number = 320;
const CHAR_WIDTH: number = 10;
const DIRECTION_UP: number = 1;
const DIRECTION_DOWN: number = 2;
const DIRECTION_LEFT: number = 3;
const DIRECTION_RIGHT: number = 4;
const SIX_CHARS: string = 'abcdef';
const SIX_CHARS_LENGTH: number = 6;
const CJK_TEXT: string = '中文编辑';
const EMOJI_TEXT: string = '😀';
const ARABIC_TEXT: string = 'مرحبا';

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

function createMeasured(inputText: string, selectInput: string, lastInput: string,
  measure: TextMeasure): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, CANVAS_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function stateText(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_MOVE_CURSOR, caseName + ' state', stateText(state));
}

export default function moveCursorEditingTest(): void {
  describe('CustomInputTextMoveCursorTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0010
     * @tc.name moveCursorUpFromEmpty_001
     * @tc.desc Moving up in an empty message keeps index 0, all slices empty and the caret offset at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorUpFromEmpty_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpFromEmpty_001');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpFromEmpty_001', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      expect(model.message()).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpFromEmpty_001');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0020
     * @tc.name moveCursorUpFromStartText_002
     * @tc.desc Moving up with the caret at index 0 keeps the whole message in the trailing slice and leaves the offset at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorUpFromStartText_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpFromStartText_002');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpFromStartText_002', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpFromStartText_002');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0030
     * @tc.name moveCursorUpClearsSelection_003
     * @tc.desc Moving up folds the selected middle slice into the message and resets the anchor to 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorUpClearsSelection_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpClearsSelection_003');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpClearsSelection_003', state);
      expect(state.selectInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      expect(state.lastInput).assertEqual('abcdef');
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpClearsSelection_003');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0040
     * @tc.name moveCursorUpFromEndTwice_004
     * @tc.desc Two consecutive up moves from the end are idempotent: the second one leaves every field at the first result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorUpFromEndTwice_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpFromEndTwice_004');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let first: TextState = model.snapshot();
      model.moveCursor(DIRECTION_UP);
      let second: TextState = model.snapshot();
      logState('moveCursorUpFromEndTwice_004', second);
      expect(second.inputText).assertEqual(first.inputText);
      expect(second.lastInput).assertEqual(first.lastInput);
      expect(second.cursorIndex).assertEqual(0);
      expect(second.cursorIndex).assertEqual(first.cursorIndex);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpFromEndTwice_004');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0050
     * @tc.name moveCursorUpResetsStaleCursorIndex_005
     * @tc.desc A stale caret index of 9 on a two-character message is reset to 0 by an up move and the offset is recomputed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorUpResetsStaleCursorIndex_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpResetsStaleCursorIndex_005');
      let model: TextEditingModel = createCustom('ab', '', '', 9, 2, 20);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpResetsStaleCursorIndex_005', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.lastInput).assertEqual('ab');
      expect(state.cursorLeft).assertEqual(0);
      expect(state.cursorLeft !== 20).assertTrue();
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpResetsStaleCursorIndex_005');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0060
     * @tc.name moveCursorDownFromEmpty_006
     * @tc.desc Moving down in an empty message keeps index 0 and produces three empty slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorDownFromEmpty_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownFromEmpty_006');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownFromEmpty_006', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownFromEmpty_006');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0070
     * @tc.name moveCursorDownFromZero_007
     * @tc.desc Moving down from index 0 moves the entire six-character message into inputText and parks the caret at 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorDownFromZero_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownFromZero_007');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownFromZero_007', state);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SIX_CHARS_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownFromZero_007');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0080
     * @tc.name moveCursorDownFromEndTwice_008
     * @tc.desc Moving down twice from the end stays at the end and never produces a trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDownFromEndTwice_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownFromEndTwice_008');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownFromEndTwice_008', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.lastInput).assertEqual('');
      expect(state.inputText).assertEqual(SIX_CHARS);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownFromEndTwice_008');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0090
     * @tc.name moveCursorDownClampsStaleIndex_009
     * @tc.desc A stale caret index of 9 is clamped to the message length of 2 by a down move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDownClampsStaleIndex_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownClampsStaleIndex_009');
      let model: TextEditingModel = createCustom('ab', '', '', 9, 2, 20);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownClampsStaleIndex_009', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownClampsStaleIndex_009');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0100
     * @tc.name moveCursorLeftOnEmpty_010
     * @tc.desc A left move in an empty message walks the caret to -1 while both slices stay empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorLeftOnEmpty_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftOnEmpty_010');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftOnEmpty_010', state);
      expect(state.cursorIndex).assertEqual(-1);
      expect(state.selectIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftOnEmpty_010');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0110
     * @tc.name moveCursorLeftAtZero_011
     * @tc.desc A left move at index 0 goes negative and substring then keeps the whole message in lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorLeftAtZero_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftAtZero_011');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftAtZero_011', state);
      expect(state.cursorIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.inputText.length + state.lastInput.length).assertEqual(SIX_CHARS_LENGTH);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftAtZero_011');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0120
     * @tc.name moveCursorLeftAtOne_012
     * @tc.desc A left move at index 1 removes the boundary character from the prefix and prepends it to the suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftAtOne_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftAtOne_012');
      let model: TextEditingModel = createPlain('a', '', 'bcdef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftAtOne_012', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftAtOne_012');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0130
     * @tc.name moveCursorLeftFromMiddle_013
     * @tc.desc A left move from index 3 shortens the prefix to two characters and the offset to 20 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftFromMiddle_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftFromMiddle_013');
      let model: TextEditingModel = createPlain('abc', '', 'def');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftFromMiddle_013', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('cdef');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftFromMiddle_013');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0140
     * @tc.name moveCursorLeftFromEnd_014
     * @tc.desc A left move from the end splits one character from the six-character message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftFromEnd_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftFromEnd_014');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftFromEnd_014', state);
      expect(state.cursorIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.lastInput).assertEqual('f');
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftFromEnd_014');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0150
     * @tc.name moveCursorRightOnEmpty_015
     * @tc.desc A right move in an empty message cannot advance and stays at index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightOnEmpty_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightOnEmpty_015');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightOnEmpty_015', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightOnEmpty_015');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0160
     * @tc.name moveCursorRightFromZero_016
     * @tc.desc A right move from index 0 pulls the first character into inputText and leaves five characters behind
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightFromZero_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightFromZero_016');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightFromZero_016', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightFromZero_016');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0170
     * @tc.name moveCursorRightFromOne_017
     * @tc.desc A right move from index 1 grows the prefix to two characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightFromOne_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightFromOne_017');
      let model: TextEditingModel = createPlain('a', '', 'bcdef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightFromOne_017', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('cdef');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightFromOne_017');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0180
     * @tc.name moveCursorRightAtEnd_018
     * @tc.desc A right move at the end is a no-op because the caret is not smaller than the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightAtEnd_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightAtEnd_018');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightAtEnd_018', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightAtEnd_018');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0190
     * @tc.name moveCursorRightFromStaleIndex_019
     * @tc.desc A caret beyond the message length is not advanced and the message is still split at the stale index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorRightFromStaleIndex_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightFromStaleIndex_019');
      let model: TextEditingModel = createCustom('ab', '', '', 9, 2, 20);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightFromStaleIndex_019', state);
      expect(state.cursorIndex).assertEqual(9);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(9);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightFromStaleIndex_019');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0200
     * @tc.name moveCursorDirectionZeroKeepsCaret_020
     * @tc.desc A direction of 0 matches no branch, so only the selection fold and the slice rewrite happen
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDirectionZeroKeepsCaret_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDirectionZeroKeepsCaret_020');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorDirectionZeroKeepsCaret_020', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectInput).assertEqual('');
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDirectionZeroKeepsCaret_020');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0210
     * @tc.name moveCursorDirectionFiveKeepsCaret_021
     * @tc.desc A direction of 5 is outside the enum and behaves like the no-match path at index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDirectionFiveKeepsCaret_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDirectionFiveKeepsCaret_021');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(5);
      let state: TextState = model.snapshot();
      logState('moveCursorDirectionFiveKeepsCaret_021', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDirectionFiveKeepsCaret_021');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0220
     * @tc.name moveCursorNegativeDirectionKeepsCaret_022
     * @tc.desc A direction of -1 matches no branch and leaves the caret at the end of the message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNegativeDirectionKeepsCaret_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNegativeDirectionKeepsCaret_022');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(-1);
      let state: TextState = model.snapshot();
      logState('moveCursorNegativeDirectionKeepsCaret_022', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNegativeDirectionKeepsCaret_022');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0230
     * @tc.name moveCursorLargeDirectionKeepsCaret_023
     * @tc.desc A direction of 99 selects no branch and only re-splits the folded message at index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorLargeDirectionKeepsCaret_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLargeDirectionKeepsCaret_023');
      let model: TextEditingModel = createPlain('abc', '', 'def');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(99);
      let state: TextState = model.snapshot();
      logState('moveCursorLargeDirectionKeepsCaret_023', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLargeDirectionKeepsCaret_023');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0240
     * @tc.name moveCursorNaNDirectionKeepsCaret_024
     * @tc.desc A NaN direction matches no comparison, so the caret keeps its value and the slices are rebuilt
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNaNDirectionKeepsCaret_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNaNDirectionKeepsCaret_024');
      let model: TextEditingModel = createPlain('a', '', 'bcdef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(NaN);
      let state: TextState = model.snapshot();
      logState('moveCursorNaNDirectionKeepsCaret_024', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.selectIndex).assertEqual(1);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNaNDirectionKeepsCaret_024');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0250
     * @tc.name moveCursorFractionDirectionKeepsCaret_025
     * @tc.desc A direction of 1.5 is not equal to the integer 1 and keeps the caret at the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorFractionDirectionKeepsCaret_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorFractionDirectionKeepsCaret_025');
      let model: TextEditingModel = createPlain(SIX_CHARS, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(1.5);
      let state: TextState = model.snapshot();
      logState('moveCursorFractionDirectionKeepsCaret_025', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorFractionDirectionKeepsCaret_025');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0260
     * @tc.name moveCursorInfinityDirectionKeepsCaret_026
     * @tc.desc An infinite direction selects no branch and the caret stays at index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInfinityDirectionKeepsCaret_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInfinityDirectionKeepsCaret_026');
      let model: TextEditingModel = createPlain('', '', SIX_CHARS);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(Infinity);
      let state: TextState = model.snapshot();
      logState('moveCursorInfinityDirectionKeepsCaret_026', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInfinityDirectionKeepsCaret_026');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0270
     * @tc.name moveCursorNegativeInfinityDirectionKeepsCaret_027
     * @tc.desc A direction of -Infinity selects no branch and the middle split is rebuilt unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNegativeInfinityDirectionKeepsCaret_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNegativeInfinityDirectionKeepsCaret_027');
      let model: TextEditingModel = createPlain('abc', '', 'def');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(-Infinity);
      let state: TextState = model.snapshot();
      logState('moveCursorNegativeInfinityDirectionKeepsCaret_027', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNegativeInfinityDirectionKeepsCaret_027');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0280
     * @tc.name moveCursorNegativeZeroDirection_028
     * @tc.desc A direction of -0 is not 1..4, so the caret keeps its middle position and only the selection is folded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNegativeZeroDirection_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNegativeZeroDirection_028');
      let model: TextEditingModel = createPlain('ab', 'cd', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(-0);
      let state: TextState = model.snapshot();
      logState('moveCursorNegativeZeroDirection_028', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNegativeZeroDirection_028');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0290
     * @tc.name moveCursorFourPointNineDirection_029
     * @tc.desc A direction of 4.9 is not exactly 4 and therefore does not advance the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorFourPointNineDirection_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorFourPointNineDirection_029');
      let model: TextEditingModel = createPlain('abc', '', 'def');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(4.9);
      let state: TextState = model.snapshot();
      logState('moveCursorFourPointNineDirection_029', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorFourPointNineDirection_029');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0300
     * @tc.name moveCursorThreePointZeroZeroZeroOne_030
     * @tc.desc A direction just above 3 fails the equality test with 3 and the caret does not step left
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorThreePointZeroZeroZeroOne_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorThreePointZeroZeroZeroOne_030');
      let model: TextEditingModel = createPlain('abc', '', 'def');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(3.0001);
      let state: TextState = model.snapshot();
      logState('moveCursorThreePointZeroZeroZeroOne_030', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorThreePointZeroZeroZeroOne_030');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0310
     * @tc.name moveCursorRightFromMinusTwo_031
     * @tc.desc A right move from -2 advances to -1 because the negative caret is still below the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorRightFromMinusTwo_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightFromMinusTwo_031');
      let model: TextEditingModel = createCustom('', '', 'abc', -2, -2, 0);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightFromMinusTwo_031', state);
      expect(state.cursorIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightFromMinusTwo_031');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0320
     * @tc.name moveCursorLeftFromNegativeWithPrefix_032
     * @tc.desc A negative caret under a two-character prefix moves left and discards the prefix from the visible split
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorLeftFromNegativeWithPrefix_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftFromNegativeWithPrefix_032');
      let model: TextEditingModel = createCustom('ab', '', '', -1, -1, 20);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftFromNegativeWithPrefix_032', state);
      expect(state.cursorIndex).assertEqual(-2);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('ab');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftFromNegativeWithPrefix_032');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0330
     * @tc.name moveCursorUpFoldsSelectionOnLeft_033
     * @tc.desc An up move folds a middle selection so the message is preserved and selectInput becomes empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorUpFoldsSelectionOnLeft_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpFoldsSelectionOnLeft_033');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpFoldsSelectionOnLeft_033', state);
      expect(state.selectInput).assertEqual('');
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abcdef');
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpFoldsSelectionOnLeft_033');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0340
     * @tc.name moveCursorDownFoldsSelection_034
     * @tc.desc A down move after a selected middle slice keeps all six characters and parks them in inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorDownFoldsSelection_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownFoldsSelection_034');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownFoldsSelection_034', state);
      expect(state.inputText).assertEqual('abcdef');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.inputText.length).assertEqual(SIX_CHARS_LENGTH);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownFoldsSelection_034');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0350
     * @tc.name moveCursorLeftFoldsSelection_035
     * @tc.desc A left move folds the selection and stops one character before the former caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftFoldsSelection_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftFoldsSelection_035');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftFoldsSelection_035', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftFoldsSelection_035');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0360
     * @tc.name moveCursorRightFoldsSelection_036
     * @tc.desc A right move folds the selection and stops one character after the former caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightFoldsSelection_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightFoldsSelection_036');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightFoldsSelection_036', state);
      expect(state.cursorIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.lastInput).assertEqual('f');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightFoldsSelection_036');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0370
     * @tc.name moveCursorLeftFoldsWholeMessageSelection_037
     * @tc.desc A left move with the whole message selected folds it and steps from the end to index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftFoldsWholeMessageSelection_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftFoldsWholeMessageSelection_037');
      let model: TextEditingModel = createPlain('', 'abcdef', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftFoldsWholeMessageSelection_037', state);
      expect(state.cursorIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.lastInput).assertEqual('f');
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftFoldsWholeMessageSelection_037');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0380
     * @tc.name moveCursorLeftWithEmptySelection_038
     * @tc.desc A left move with an empty selected slice behaves like a plain step and keeps the suffix intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftWithEmptySelection_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftWithEmptySelection_038');
      let model: TextEditingModel = createPlain('ab', '', 'cd');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftWithEmptySelection_038', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bcd');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftWithEmptySelection_038');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0390
     * @tc.name moveCursorInvalidDirectionStillFoldsSelection_039
     * @tc.desc An out-of-range direction still clears selectInput and re-splits at the unchanged caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInvalidDirectionStillFoldsSelection_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionStillFoldsSelection_039');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(7);
      let state: TextState = model.snapshot();
      logState('moveCursorInvalidDirectionStillFoldsSelection_039', state);
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(4);
      expect(model.message()).assertEqual('abcdef');
      expect(state.inputText).assertEqual('abcd');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionStillFoldsSelection_039');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0400
     * @tc.name moveCursorDownWithNegativeAnchor_040
     * @tc.desc A down move with a negative anchor folds the message and resets both indices to the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDownWithNegativeAnchor_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownWithNegativeAnchor_040');
      let model: TextEditingModel = createCustom('ab', '', 'cd', 2, -3, 20);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownWithNegativeAnchor_040', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.selectIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownWithNegativeAnchor_040');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0410
     * @tc.name moveCursorDownOnEmptyWithStaleCaret_041
     * @tc.desc A down move on an empty message clamps a stale caret of 5 to the message length 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorDownOnEmptyWithStaleCaret_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownOnEmptyWithStaleCaret_041');
      let model: TextEditingModel = createCustom('', '', '', 5, 5, 0);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownOnEmptyWithStaleCaret_041', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownOnEmptyWithStaleCaret_041');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0420
     * @tc.name moveCursorRightOnEmptyWithInfinityCaret_042
     * @tc.desc An infinite caret is not smaller than the zero message length, so a right move keeps it infinite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorRightOnEmptyWithInfinityCaret_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightOnEmptyWithInfinityCaret_042');
      let model: TextEditingModel = createCustom('', '', '', Infinity, 0, 0);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightOnEmptyWithInfinityCaret_042', state);
      expect(state.cursorIndex).assertEqual(Infinity);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightOnEmptyWithInfinityCaret_042');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0430
     * @tc.name moveCursorDownCjkTrailingText_043
     * @tc.desc A down move on trailing CJK text moves all four code units into inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorDownCjkTrailingText_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownCjkTrailingText_043');
      let model: TextEditingModel = createPlain('', '', CJK_TEXT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownCjkTrailingText_043', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual(CJK_TEXT);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownCjkTrailingText_043');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0440
     * @tc.name moveCursorRightCjkTrailingText_044
     * @tc.desc A right move splits the first CJK character from a four-character message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightCjkTrailingText_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightCjkTrailingText_044');
      let model: TextEditingModel = createPlain('', '', CJK_TEXT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightCjkTrailingText_044', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('中');
      expect(state.lastInput).assertEqual('文编辑');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightCjkTrailingText_044');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0450
     * @tc.name moveCursorLeftCjkFromEnd_045
     * @tc.desc A left move from the CJK end keeps three code units in the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftCjkFromEnd_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftCjkFromEnd_045');
      let model: TextEditingModel = createPlain(CJK_TEXT, '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftCjkFromEnd_045', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('中文编');
      expect(state.lastInput).assertEqual('辑');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftCjkFromEnd_045');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0460
     * @tc.name moveCursorDownEmojiCountsTwoUnits_046
     * @tc.desc A down move over one emoji reaches index 2 because the surrogate pair occupies two UTF-16 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorDownEmojiCountsTwoUnits_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorDownEmojiCountsTwoUnits_046');
      let model: TextEditingModel = createPlain('', '', EMOJI_TEXT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorDownEmojiCountsTwoUnits_046', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual(EMOJI_TEXT);
      expect(state.inputText.length).assertEqual(2);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorDownEmojiCountsTwoUnits_046');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0470
     * @tc.name moveCursorRightSplitsSurrogatePair_047
     * @tc.desc A right move by one unit lands inside the surrogate pair and leaves one unit on each side
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorRightSplitsSurrogatePair_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightSplitsSurrogatePair_047');
      let model: TextEditingModel = createPlain('', '', EMOJI_TEXT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightSplitsSurrogatePair_047', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText.length).assertEqual(1);
      expect(state.lastInput.length).assertEqual(1);
      expect(state.inputText.charCodeAt(0)).assertEqual(0xD83D);
      expect(state.lastInput.charCodeAt(0)).assertEqual(0xDE00);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightSplitsSurrogatePair_047');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0480
     * @tc.name moveCursorRightArabicText_048
     * @tc.desc A right move splits the first Arabic letter from the five-letter message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorRightArabicText_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorRightArabicText_048');
      let model: TextEditingModel = createPlain('', '', ARABIC_TEXT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorRightArabicText_048', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('م');
      expect(state.lastInput.length).assertEqual(4);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorRightArabicText_048');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0490
     * @tc.name moveCursorLeftMixedScripts_049
     * @tc.desc A left move over mixed ASCII and CJK steps exactly one code unit back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorLeftMixedScripts_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorLeftMixedScripts_049');
      let model: TextEditingModel = createPlain('ab中', '', '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorLeftMixedScripts_049', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('中');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorLeftMixedScripts_049');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0500
     * @tc.name moveCursorUpOnMixedScript_050
     * @tc.desc An up move on mixed ASCII, emoji and CJK moves the whole six-unit message to lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorUpOnMixedScript_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorUpOnMixedScript_050');
      let model: TextEditingModel = createPlain('ab中', EMOJI_TEXT, '');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorUpOnMixedScript_050', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('ab中' + EMOJI_TEXT);
      expect(state.lastInput.length).assertEqual(5);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorUpOnMixedScript_050');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0510
     * @tc.name moveCursorInvalidDirectionMeasuresOnce_051
     * @tc.desc The no-match path still measures the unchanged prefix exactly once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInvalidDirectionMeasuresOnce_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionMeasuresOnce_051');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(CHAR_WIDTH));
      let model: TextEditingModel = createMeasured('ab', 'cd', 'ef', spy);
      spy.reset();
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorInvalidDirectionMeasuresOnce_051', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.calls[0]).assertEqual('abcd');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionMeasuresOnce_051');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0520
     * @tc.name moveCursorNaNMeasurePropagates_052
     * @tc.desc A NaN measure propagates into the caret offset while the slices stay correct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNaNMeasurePropagates_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNaNMeasurePropagates_052');
      let model: TextEditingModel = createMeasured('abcdef', '', '', new FixedMeasure(NaN));
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_LEFT);
      let state: TextState = model.snapshot();
      logState('moveCursorNaNMeasurePropagates_052', state);
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      expect(state.inputText).assertEqual('abcde');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNaNMeasurePropagates_052');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0530
     * @tc.name moveCursorInfiniteMeasurePropagates_053
     * @tc.desc A constant infinite measure becomes the caret offset after an up move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInfiniteMeasurePropagates_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInfiniteMeasurePropagates_053');
      let model: TextEditingModel = createMeasured('abcdef', '', '', new FixedMeasure(Infinity));
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorInfiniteMeasurePropagates_053', state);
      expect(state.cursorLeft).assertEqual(Infinity);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInfiniteMeasurePropagates_053');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0540
     * @tc.name moveCursorAfterMovementRightDown_054
     * @tc.desc A down move after an anchor step folds the selection and reaches the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorAfterMovementRightDown_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorAfterMovementRightDown_054');
      let model: TextEditingModel = createPlain('abcd', '', '');
      model.selectByMovement(DIRECTION_RIGHT);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorAfterMovementRightDown_054', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('');
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorAfterMovementRightDown_054');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0550
     * @tc.name moveCursorAfterSelectAllUp_055
     * @tc.desc An up move after SELECT_ALL folds the selection and sends the message to lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveCursorAfterSelectAllUp_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorAfterSelectAllUp_055');
      let model: TextEditingModel = createPlain('abcd', '', '');
      model.handleExtendAction(0);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_UP);
      let state: TextState = model.snapshot();
      logState('moveCursorAfterSelectAllUp_055', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abcd');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorAfterSelectAllUp_055');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0560
     * @tc.name moveCursorAfterReversedSelectionRight_056
     * @tc.desc A right move after a reversed selection folds it and reaches the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorAfterReversedSelectionRight_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorAfterReversedSelectionRight_056');
      let model: TextEditingModel = createPlain('abcd', '', '');
      model.changeSelection(3, 1);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_RIGHT);
      let state: TextState = model.snapshot();
      logState('moveCursorAfterReversedSelectionRight_056', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorAfterReversedSelectionRight_056');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0570
     * @tc.name moveCursorFractionalCaretNoMatch_057
     * @tc.desc A fractional caret of 1.5 survives a no-match direction and substring truncates it to 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorFractionalCaretNoMatch_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorFractionalCaretNoMatch_057');
      let model: TextEditingModel = createCustom('abc', '', '', 1.5, 0, 10);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorFractionalCaretNoMatch_057', state);
      expect(state.cursorIndex).assertEqual(1.5);
      expect(state.selectIndex).assertEqual(1.5);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bc');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorFractionalCaretNoMatch_057');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0580
     * @tc.name moveCursorNaNCaretNoMatch_058
     * @tc.desc A NaN caret survives the no-match path while substring treats both bounds as the start
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNaNCaretNoMatch_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNaNCaretNoMatch_058');
      let model: TextEditingModel = createCustom('abc', '', '', NaN, 0, 10);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorNaNCaretNoMatch_058', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNaNCaretNoMatch_058');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0590
     * @tc.name moveCursorNaNCaretDown_059
     * @tc.desc A down move overwrites a NaN caret with the message length 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNaNCaretDown_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNaNCaretDown_059');
      let model: TextEditingModel = createCustom('abc', '', '', NaN, 0, 10);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorNaNCaretDown_059', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNaNCaretDown_059');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0600
     * @tc.name moveCursorInfinityCaretNoMatch_060
     * @tc.desc An infinite caret is kept by the no-match path and substring clamps the end to the text length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInfinityCaretNoMatch_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInfinityCaretNoMatch_060');
      let model: TextEditingModel = createCustom('abc', '', '', Infinity, 0, 30);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorInfinityCaretNoMatch_060', state);
      expect(state.cursorIndex).assertEqual(Infinity);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInfinityCaretNoMatch_060');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0610
     * @tc.name moveCursorInfinityCaretDown_061
     * @tc.desc A down move overwrites an infinite caret with the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInfinityCaretDown_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInfinityCaretDown_061');
      let model: TextEditingModel = createCustom('abc', '', '', Infinity, 0, 30);
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(DIRECTION_DOWN);
      let state: TextState = model.snapshot();
      logState('moveCursorInfinityCaretDown_061', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInfinityCaretDown_061');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0620
     * @tc.name moveCursorInvalidDirectionWithSelection_062
     * @tc.desc An out-of-range direction keeps the caret at the former selection end and folds the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorInvalidDirectionWithSelection_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionWithSelection_062');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(-7);
      let state: TextState = model.snapshot();
      logState('moveCursorInvalidDirectionWithSelection_062', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorInvalidDirectionWithSelection_062');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MOVE_CURSOR_0630
     * @tc.name moveCursorNoMatchWithEmptySelection_063
     * @tc.desc A no-match direction with an empty selection re-splits the two non-empty slices without moving the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveCursorNoMatchWithEmptySelection_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_MOVE_CURSOR, 'moveCursorNoMatchWithEmptySelection_063');
      let model: TextEditingModel = createPlain('ab', '', 'cd');
      TestLogger.value(TAG_MOVE_CURSOR, 'input', stateText(model.snapshot()));
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveCursorNoMatchWithEmptySelection_063', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.lastInput).assertEqual('cd');
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_MOVE_CURSOR, 'moveCursorNoMatchWithEmptySelection_063');
      await yieldToEventLoop();
      done();
    })

  });
}
