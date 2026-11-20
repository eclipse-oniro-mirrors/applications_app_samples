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
import inputMethod from '@ohos.inputMethod';
import { TextEditingModel, TextMeasure, TextState, UniformMeasure, MixedMeasure, SpyMeasure } from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_SELECT_MOVEMENT } from '../common/TestConstant';

/**
 * selectByMovement() contract for the custom editor.
 *
 * The IME sends an anchor move (up / down / left / right) and the component
 * first moves selectIndex inside [0, message.length], then re-splits the same
 * message into inputText / selectInput / lastInput around the anchor and the
 * caret. The caret index and the pixel offset are never touched, and the width
 * function is never consulted. This suite drives those rules across anchor
 * positions, caret positions, both re-split branches, hostile direction codes,
 * Unicode code-unit boundaries and sequences that follow the other callbacks.
 */

const MODEL_WIDTH: number = 320;
const UNIT_WIDTH: number = 10;
const SIX_TEXT: string = 'abcdef';
const SIX_LENGTH: number = 6;

const CJK_TEXT: string = '中文';
const EMOJI_TEXT: string = '😀';
const EMOJI_HIGH: string = '\uD83D';
const EMOJI_LOW: string = '\uDE00';

const UP: number = inputMethod.Direction.CURSOR_UP;
const DOWN: number = inputMethod.Direction.CURSOR_DOWN;
const LEFT: number = inputMethod.Direction.CURSOR_LEFT;
const RIGHT: number = inputMethod.Direction.CURSOR_RIGHT;

function newPlain(inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(UNIT_WIDTH), MODEL_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function newCustom(inputText: string, selectInput: string, lastInput: string, cursorIndex: number,
  selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(UNIT_WIDTH), MODEL_WIDTH);
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

function stateText(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_SELECT_MOVEMENT, caseName + ' state', stateText(state));
}

export default function selectByMovementTest(): void {
  describe('CustomInputTextSelectByMovementTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0010
     * @tc.name selectMovementUpFromMiddleLayout001
     * @tc.desc An UP anchor move rewrites the layout as empty prefix, whole left slice and the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpFromMiddleLayout_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpFromMiddleLayout_001');
      let model: TextEditingModel = newPlain('abc', '', 'def');
      TestLogger.value(TAG_SELECT_MOVEMENT, 'before', stateText(model.snapshot()));
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpFromMiddleLayout_001', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpFromMiddleLayout_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0020
     * @tc.name selectMovementUpWithSelectionPresent002
     * @tc.desc An UP anchor move folds an existing selection back into the message before moving the anchor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpWithSelectionPresent_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpWithSelectionPresent_002');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      TestLogger.value(TAG_SELECT_MOVEMENT, 'before', stateText(model.snapshot()));
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpWithSelectionPresent_002', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(4);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpWithSelectionPresent_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0030
     * @tc.name selectMovementUpOnEmptyComposer003
     * @tc.desc An UP anchor move on an empty composer keeps all three slices empty and the anchor at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpOnEmptyComposer_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpOnEmptyComposer_003');
      let model: TextEditingModel = newPlain('', '', '');
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpOnEmptyComposer_003', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpOnEmptyComposer_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0040
     * @tc.name selectMovementUpWhenCaretAtEnd004
     * @tc.desc An UP anchor move with the caret already at the end selects the whole text into selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpWhenCaretAtEnd_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpWhenCaretAtEnd_004');
      let model: TextEditingModel = newPlain('abcdef', '', '');
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpWhenCaretAtEnd_004', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SIX_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SIX_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpWhenCaretAtEnd_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0050
     * @tc.name selectMovementUpOverLeftSelection005
     * @tc.desc An UP anchor move from an anchor right of the caret swaps the two outer slices into one prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpOverLeftSelection_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpOverLeftSelection_005');
      let model: TextEditingModel = newCustom('ab', 'cd', 'ef', 2, 4, 20);
      TestLogger.value(TAG_SELECT_MOVEMENT, 'before', stateText(model.snapshot()));
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpOverLeftSelection_005', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('ab');
      expect(state.lastInput).assertEqual('cdef');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpOverLeftSelection_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0060
     * @tc.name selectMovementUpWithCaretAfterAllText006
     * @tc.desc An UP anchor move keeps a mid-text caret and selects exactly the five leading units of six
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpWithCaretAfterAllText_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpWithCaretAfterAllText_006');
      let model: TextEditingModel = newCustom('abc', '', 'def', 5, 1, 30);
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpWithCaretAfterAllText_006', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcde');
      expect(state.lastInput).assertEqual('f');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpWithCaretAfterAllText_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0070
     * @tc.name selectMovementUpFromNegativeAnchor007
     * @tc.desc An UP anchor move repairs a negative anchor to zero and selects the three leading units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpFromNegativeAnchor_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpFromNegativeAnchor_007');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, -2, 0);
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpFromNegativeAnchor_007', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpFromNegativeAnchor_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0080
     * @tc.name selectMovementUpFromNaNAndRightOfCaret008
     * @tc.desc An UP anchor move with the caret beyond the text still selects only the text under the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpFromNaNAndRightOfCaret_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpFromNaNAndRightOfCaret_008');
      let model: TextEditingModel = newCustom('abc', '', 'def', 10, 3, 30);
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpFromNaNAndRightOfCaret_008', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SIX_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(10);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpFromNaNAndRightOfCaret_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0090
     * @tc.name selectMovementDownFromMiddleLayout009
     * @tc.desc A DOWN anchor move pushes the text after the caret into selectInput and empties the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownFromMiddleLayout_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownFromMiddleLayout_009');
      let model: TextEditingModel = newPlain('abc', '', 'def');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownFromMiddleLayout_009', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('def');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownFromMiddleLayout_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0100
     * @tc.name selectMovementDownWithSelectionPresent010
     * @tc.desc A DOWN anchor move on a selected composer keeps the caret and selects the whole composed text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownWithSelectionPresent_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownWithSelectionPresent_010');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownWithSelectionPresent_010', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('abcd');
      expect(state.selectInput).assertEqual('ef');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(4);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownWithSelectionPresent_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0110
     * @tc.name selectMovementDownOnEmptyComposer011
     * @tc.desc A DOWN anchor move on an empty composer leaves the anchor and all slices at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownOnEmptyComposer_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownOnEmptyComposer_011');
      let model: TextEditingModel = newPlain('', '', '');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownOnEmptyComposer_011', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownOnEmptyComposer_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0120
     * @tc.name selectMovementDownWithCaretAtEnd012
     * @tc.desc A DOWN anchor move with the caret already at the end selects nothing and keeps the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownWithCaretAtEnd_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretAtEnd_012');
      let model: TextEditingModel = newPlain('abcdef', '', '');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownWithCaretAtEnd_012', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual(SIX_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SIX_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretAtEnd_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0130
     * @tc.name selectMovementDownWithCaretAtStart013
     * @tc.desc A DOWN anchor move with the caret at the start selects the whole text and leaves an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownWithCaretAtStart_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretAtStart_013');
      let model: TextEditingModel = newPlain('', '', 'abcdef');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownWithCaretAtStart_013', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SIX_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretAtStart_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0140
     * @tc.name selectMovementDownOnTwoUnitComposer014
     * @tc.desc A DOWN anchor move on a two-unit composer puts the single trailing unit into selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownOnTwoUnitComposer_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownOnTwoUnitComposer_014');
      let model: TextEditingModel = newPlain('a', 'b', 'c');
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownOnTwoUnitComposer_014', state);
      expect(state.selectIndex).assertEqual(3);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('c');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownOnTwoUnitComposer_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0150
     * @tc.name selectMovementDownWithCaretLeftOfAnchor015
     * @tc.desc A DOWN anchor move with the caret left of the old anchor selects the four units before the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownWithCaretLeftOfAnchor_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretLeftOfAnchor_015');
      let model: TextEditingModel = newCustom('ab', 'cd', 'ef', 2, 4, 20);
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownWithCaretLeftOfAnchor_015', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cdef');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretLeftOfAnchor_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0160
     * @tc.name selectMovementDownRepairsNegativeAnchor016
     * @tc.desc A DOWN anchor move ignores a negative anchor and moves it to the text length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownRepairsNegativeAnchor_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownRepairsNegativeAnchor_016');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, -2, 0);
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownRepairsNegativeAnchor_016', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('def');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownRepairsNegativeAnchor_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0170
     * @tc.name selectMovementDownWithCaretPastText017
     * @tc.desc A DOWN anchor move with the caret past the text keeps all text in the prefix and empties the rest
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownWithCaretPastText_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretPastText_017');
      let model: TextEditingModel = newCustom('abc', '', 'def', 10, 3, 30);
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownWithCaretPastText_017', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual(SIX_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(10);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownWithCaretPastText_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0180
     * @tc.name selectMovementDownFromAnchorPastEnd018
     * @tc.desc A DOWN anchor move from an anchor past the text end keeps the three leading units selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementDownFromAnchorPastEnd_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDownFromAnchorPastEnd_018');
      let model: TextEditingModel = newCustom('abc', '', 'def', 3, 10, 30);
      model.selectByMovement(DOWN);
      let state: TextState = model.snapshot();
      logState('selectMovementDownFromAnchorPastEnd_018', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('def');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDownFromAnchorPastEnd_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0190
     * @tc.name selectMovementLeftOnEmptyComposer019
     * @tc.desc A LEFT move cannot decrement an anchor at zero and keeps the empty layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftOnEmptyComposer_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnEmptyComposer_019');
      let model: TextEditingModel = newPlain('', '', '');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftOnEmptyComposer_019', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnEmptyComposer_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0200
     * @tc.name selectMovementRightOnEmptyComposer020
     * @tc.desc A RIGHT move cannot increment an anchor at the empty text length and keeps all slices empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightOnEmptyComposer_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightOnEmptyComposer_020');
      let model: TextEditingModel = newPlain('', '', '');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightOnEmptyComposer_020', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightOnEmptyComposer_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0210
     * @tc.name selectMovementLeftOnSingleUnit021
     * @tc.desc A LEFT move on one character puts the whole text into the selection slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftOnSingleUnit_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnSingleUnit_021');
      let model: TextEditingModel = newPlain('a', '', '');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftOnSingleUnit_021', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnSingleUnit_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0220
     * @tc.name selectMovementRightOnSingleUnit022
     * @tc.desc A RIGHT move at the text length is a no-op that keeps the single character in the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightOnSingleUnit_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightOnSingleUnit_022');
      let model: TextEditingModel = newPlain('a', '', '');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightOnSingleUnit_022', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightOnSingleUnit_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0230
     * @tc.name selectMovementDirectionZero023
     * @tc.desc A direction code of zero does not move the anchor but still re-splits the existing selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementDirectionZero_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDirectionZero_023');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      model.selectByMovement(0);
      let state: TextState = model.snapshot();
      logState('selectMovementDirectionZero_023', state);
      expect(state.selectIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(4);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDirectionZero_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0240
     * @tc.name selectMovementNegativeDirection024
     * @tc.desc A negative direction code keeps an anchor right of the caret and rewrites the slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementNegativeDirection_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementNegativeDirection_024');
      let model: TextEditingModel = newCustom('ab', 'cd', 'ef', 2, 4, 20);
      model.selectByMovement(-1);
      let state: TextState = model.snapshot();
      logState('selectMovementNegativeDirection_024', state);
      expect(state.selectIndex).assertEqual(4);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementNegativeDirection_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0250
     * @tc.name selectMovementUnknownDirectionFive025
     * @tc.desc A direction code of five is ignored and the anchor one unit before the caret selects four units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementUnknownDirectionFive_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUnknownDirectionFive_025');
      let model: TextEditingModel = newCustom('abc', '', 'def', 5, 1, 30);
      model.selectByMovement(5);
      let state: TextState = model.snapshot();
      logState('selectMovementUnknownDirectionFive_025', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('bcde');
      expect(state.lastInput).assertEqual('f');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUnknownDirectionFive_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0260
     * @tc.name selectMovementDirectionHundred026
     * @tc.desc A large direction code leaves the anchor at the end and selects nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementDirectionHundred_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDirectionHundred_026');
      let model: TextEditingModel = newPlain('abcdef', '', '');
      model.selectByMovement(100);
      let state: TextState = model.snapshot();
      logState('selectMovementDirectionHundred_026', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual(SIX_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDirectionHundred_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0270
     * @tc.name selectMovementDirectionMinusHundred027
     * @tc.desc A large negative direction code leaves an anchor at zero and the whole text in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementDirectionMinusHundred_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementDirectionMinusHundred_027');
      let model: TextEditingModel = newPlain('', '', 'abcdef');
      model.selectByMovement(-100);
      let state: TextState = model.snapshot();
      logState('selectMovementDirectionMinusHundred_027', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_TEXT);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementDirectionMinusHundred_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0280
     * @tc.name selectMovementFractionNearLeft028
     * @tc.desc A direction of 3.5 is not LEFT and leaves the four-unit anchor with one unit selected to the right
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementFractionNearLeft_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementFractionNearLeft_028');
      let model: TextEditingModel = newCustom('abc', '', 'def', 3, 4, 30);
      model.selectByMovement(3.5);
      let state: TextState = model.snapshot();
      logState('selectMovementFractionNearLeft_028', state);
      expect(state.selectIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('d');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementFractionNearLeft_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0290
     * @tc.name selectMovementUpTwiceEqualsUpOnce029
     * @tc.desc A second UP move leaves the anchor at zero and reproduces the first layout exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementUpTwiceEqualsUpOnce_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementUpTwiceEqualsUpOnce_029');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      model.selectByMovement(UP);
      model.selectByMovement(UP);
      let state: TextState = model.snapshot();
      logState('selectMovementUpTwiceEqualsUpOnce_029', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementUpTwiceEqualsUpOnce_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0300
     * @tc.name selectMovementLeftWithSelectionPresent030
     * @tc.desc A LEFT move on a selected composer folds the selection and selects the second unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftWithSelectionPresent_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftWithSelectionPresent_030');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftWithSelectionPresent_030', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('bcd');
      expect(state.lastInput).assertEqual('ef');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftWithSelectionPresent_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0310
     * @tc.name selectMovementLeftAtEndLayout031
     * @tc.desc A LEFT move with the caret at the text end selects the final unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftAtEndLayout_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftAtEndLayout_031');
      let model: TextEditingModel = newPlain('abcdef', '', '');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftAtEndLayout_031', state);
      expect(state.selectIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.selectInput).assertEqual('f');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftAtEndLayout_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0320
     * @tc.name selectMovementLeftAtStartKeepsTrailingSlice032
     * @tc.desc A LEFT move with the anchor at zero cannot decrement and keeps the whole text trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftAtStartKeepsTrailingSlice_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftAtStartKeepsTrailingSlice_032');
      let model: TextEditingModel = newPlain('', '', 'abcdef');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftAtStartKeepsTrailingSlice_032', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_TEXT);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftAtStartKeepsTrailingSlice_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0330
     * @tc.name selectMovementLeftWhenAnchorBeforeCaret033
     * @tc.desc A LEFT move from anchor one with the caret at five selects the five leading units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftWhenAnchorBeforeCaret_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftWhenAnchorBeforeCaret_033');
      let model: TextEditingModel = newCustom('abc', '', 'def', 5, 1, 30);
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftWhenAnchorBeforeCaret_033', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcde');
      expect(state.lastInput).assertEqual('f');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftWhenAnchorBeforeCaret_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0340
     * @tc.name selectMovementLeftKeepsNegativeAnchor034
     * @tc.desc A LEFT move cannot decrement a negative anchor, which still behaves like index zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementLeftKeepsNegativeAnchor_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftKeepsNegativeAnchor_034');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, -2, 0);
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftKeepsNegativeAnchor_034', state);
      expect(state.selectIndex).assertEqual(-2);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftKeepsNegativeAnchor_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0350
     * @tc.name selectMovementLeftKeepsNaNAndSlice035
     * @tc.desc A LEFT move cannot decrement a NaN anchor and the re-split still yields the three-unit prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementLeftKeepsNaNAndSlice_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftKeepsNaNAndSlice_035');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, NaN, 0);
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftKeepsNaNAndSlice_035', state);
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftKeepsNaNAndSlice_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0360
     * @tc.name selectMovementLeftWithCaretPastText036
     * @tc.desc A LEFT move with the caret past the text selects four units under a clamped caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementLeftWithCaretPastText_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftWithCaretPastText_036');
      let model: TextEditingModel = newCustom('abc', '', 'def', 10, 3, 30);
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftWithCaretPastText_036', state);
      expect(state.selectIndex).assertEqual(2);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cdef');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(10);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftWithCaretPastText_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0370
     * @tc.name selectMovementLeftLandsOnCaret037
     * @tc.desc A LEFT move that lands exactly on the caret leaves an empty selection slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftLandsOnCaret_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftLandsOnCaret_037');
      let model: TextEditingModel = newCustom('ab', 'cd', 'ef', 3, 4, 20);
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftLandsOnCaret_037', state);
      expect(state.selectIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('def');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftLandsOnCaret_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0380
     * @tc.name selectMovementRightWithSelectionPresent038
     * @tc.desc A RIGHT move on a selected composer folds the selection into the prefix and selects one unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightWithSelectionPresent_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightWithSelectionPresent_038');
      let model: TextEditingModel = newPlain('ab', 'cd', 'ef');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightWithSelectionPresent_038', state);
      expect(state.selectIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('d');
      expect(state.lastInput).assertEqual('ef');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightWithSelectionPresent_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0390
     * @tc.name selectMovementRightClampsNegativeAnchor039
     * @tc.desc A RIGHT move raises a negative anchor to zero and leaves every slice of the empty message empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementRightClampsNegativeAnchor_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightClampsNegativeAnchor_039');
      let model: TextEditingModel = newCustom('', '', '', -1, -1, 0);
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightClampsNegativeAnchor_039', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(-1);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightClampsNegativeAnchor_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0400
     * @tc.name selectMovementRightAtEndIsNoOp040
     * @tc.desc A RIGHT move at the text length is a no-op that keeps the six-unit prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightAtEndIsNoOp_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightAtEndIsNoOp_040');
      let model: TextEditingModel = newPlain('abcdef', '', '');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightAtEndIsNoOp_040', state);
      expect(state.selectIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual(SIX_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightAtEndIsNoOp_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0410
     * @tc.name selectMovementRightFromStart041
     * @tc.desc A RIGHT move from zero with the caret at zero selects the first unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightFromStart_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightFromStart_041');
      let model: TextEditingModel = newPlain('', '', 'abcdef');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightFromStart_041', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightFromStart_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0420
     * @tc.name selectMovementRightLandsOnCaretNearEnd042
     * @tc.desc A RIGHT move from four to five lands on the caret and empties the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightLandsOnCaretNearEnd_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightLandsOnCaretNearEnd_042');
      let model: TextEditingModel = newCustom('abc', '', 'def', 5, 4, 30);
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightLandsOnCaretNearEnd_042', state);
      expect(state.selectIndex).assertEqual(5);
      expect(state.inputText).assertEqual('abcde');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('f');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightLandsOnCaretNearEnd_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0430
     * @tc.name selectMovementRightFromNegativeAnchor043
     * @tc.desc A RIGHT move turns anchor minus two into minus one, which still behaves like index zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementRightFromNegativeAnchor_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightFromNegativeAnchor_043');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, -2, 0);
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightFromNegativeAnchor_043', state);
      expect(state.selectIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightFromNegativeAnchor_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0440
     * @tc.name selectMovementRightKeepsNaNAnchor044
     * @tc.desc A RIGHT move cannot increment a NaN anchor and the re-split keeps the three-unit prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementRightKeepsNaNAnchor_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightKeepsNaNAnchor_044');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, NaN, 0);
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightKeepsNaNAnchor_044', state);
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightKeepsNaNAnchor_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0450
     * @tc.name selectMovementRightWithCaretPastText045
     * @tc.desc A RIGHT move with the caret past the text selects the two trailing units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementRightWithCaretPastText_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightWithCaretPastText_045');
      let model: TextEditingModel = newCustom('abc', '', 'def', 10, 3, 30);
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightWithCaretPastText_045', state);
      expect(state.selectIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.selectInput).assertEqual('ef');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightWithCaretPastText_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0460
     * @tc.name selectMovementLeftOnCJKText046
     * @tc.desc A LEFT move on CJK text splits the two wide characters at the code-unit boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftOnCJKText_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnCJKText_046');
      let model: TextEditingModel = newPlain(CJK_TEXT, '', 'ab');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftOnCJKText_046', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('中');
      expect(state.selectInput).assertEqual('文');
      expect(state.lastInput).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftOnCJKText_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0470
     * @tc.name selectMovementRightOnCJKText047
     * @tc.desc A RIGHT move on CJK text selects the ASCII unit after the two wide characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightOnCJKText_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightOnCJKText_047');
      let model: TextEditingModel = newPlain(CJK_TEXT, '', 'ab');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightOnCJKText_047', state);
      expect(state.selectIndex).assertEqual(3);
      expect(state.inputText).assertEqual(CJK_TEXT);
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('b');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightOnCJKText_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0480
     * @tc.name selectMovementLeftSplitsEmojiSurrogates048
     * @tc.desc A LEFT move one unit inside an emoji leaves a lone high surrogate in the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementLeftSplitsEmojiSurrogates_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementLeftSplitsEmojiSurrogates_048');
      let model: TextEditingModel = newPlain(EMOJI_TEXT, '', 'ab');
      model.selectByMovement(LEFT);
      let state: TextState = model.snapshot();
      logState('selectMovementLeftSplitsEmojiSurrogates_048', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual(EMOJI_HIGH);
      expect(state.selectInput).assertEqual(EMOJI_LOW);
      expect(state.lastInput).assertEqual('ab');
      expect(state.inputText.length).assertEqual(1);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementLeftSplitsEmojiSurrogates_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0490
     * @tc.name selectMovementRightAfterEmoji049
     * @tc.desc A RIGHT move after a two-unit emoji selects the first ASCII unit of the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementRightAfterEmoji_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementRightAfterEmoji_049');
      let model: TextEditingModel = newPlain(EMOJI_TEXT, '', 'ab');
      model.selectByMovement(RIGHT);
      let state: TextState = model.snapshot();
      logState('selectMovementRightAfterEmoji_049', state);
      expect(state.selectIndex).assertEqual(3);
      expect(state.inputText).assertEqual(EMOJI_TEXT);
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('b');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementRightAfterEmoji_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0500
     * @tc.name selectMovementTwoUpsEqualOneUp050
     * @tc.desc Two UP moves produce exactly the same snapshot as one UP move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementTwoUpsEqualOneUp_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementTwoUpsEqualOneUp_050');
      let once: TextEditingModel = newPlain('ab', 'cd', 'ef');
      once.selectByMovement(UP);
      let twice: TextEditingModel = newPlain('ab', 'cd', 'ef');
      twice.selectByMovement(UP);
      twice.selectByMovement(UP);
      let expected: string = JSON.stringify(once.snapshot());
      let actual: string = JSON.stringify(twice.snapshot());
      logState('selectMovementTwoUpsEqualOneUp_050', twice.snapshot());
      expect(actual).assertEqual(expected);
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementTwoUpsEqualOneUp_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_MOVEMENT_0510
     * @tc.name selectMovementNaNDirectionKeepsNaNAnchor051
     * @tc.desc An invalid direction preserves a NaN anchor and still rebuilds the slices around the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectMovementNaNDirectionKeepsNaNAnchor_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_MOVEMENT, 'selectMovementNaNDirectionKeepsNaNAnchor_051');
      let model: TextEditingModel = newCustom('', '', 'abcdef', 3, NaN, 0);
      model.selectByMovement(-100);
      let state: TextState = model.snapshot();
      logState('selectMovementNaNDirectionKeepsNaNAnchor_051', state);
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_SELECT_MOVEMENT, 'selectMovementNaNDirectionKeepsNaNAnchor_051');
      await yieldToEventLoop();
      done();
    });

  });
}
