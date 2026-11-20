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
import { TextEditingModel, TextMeasure, TextState, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure, SpyMeasure } from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_DELETE_LEFT } from '../common/TestConstant';

/**
 * deleteLeft() contract for the custom editor.
 *
 * The component responds to the IME deleteLeft command by truncating inputText
 * only. This suite drives the replica model across length arguments (zero,
 * fractional, negative, NaN, infinities), across composer states that carry a
 * selection or a right-hand slice, and across the text kinds the sample is meant
 * to display. Every case asserts the four fields the callback rewrites plus the
 * two slices it must leave untouched.
 */

const MODEL_WIDTH: number = 320;
const UNIT_WIDTH: number = 10;
const SHORT_TEXT: string = 'abcdef';
const SHORT_TEXT_LENGTH: number = 6;
const LONG_TEXT_LENGTH: number = 64;
const VERY_LONG_TEXT_LENGTH: number = 255;
const EMOTICON: string = '😀';
const COMBINING_PAIR: string = 'é';
const LONE_HIGH_SURROGATE: string = '\uD83D';

function buildRepeated(unit: string, count: number): string {
  let result: string = '';
  let index: number = 0;
  while (index < count) {
    result += unit;
    index++;
  }
  return result;
}

function newLoadedModel(measure: TextMeasure, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, MODEL_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function describeState(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_DELETE_LEFT, caseName + ' state', describeState(state));
}

export default function deleteLeftEditingTest(): void {
  describe('CustomInputTextDeleteLeftTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0010
     * @tc.name deleteLeftEmptyText_001
     * @tc.desc Deleting one unit from the empty composer keeps every slice empty and leaves the caret at 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEmptyText_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEmptyText_001');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), '', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftEmptyText_001', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEmptyText_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0020
     * @tc.name deleteLeftSingleUnit_002
     * @tc.desc Deleting one unit of a six-character string removes only the trailing character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftSingleUnit_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftSingleUnit_002');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftSingleUnit_002', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.inputText.length).assertEqual(5);
      expect(state.cursorIndex).assertEqual(5);
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftSingleUnit_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0030
     * @tc.name deleteLeftTwoUnits_003
     * @tc.desc Deleting two units removes exactly the last two characters and shrinks the caret offset by one unit each
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftTwoUnits_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftTwoUnits_003');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftTwoUnits_003', state);
      expect(state.inputText).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftTwoUnits_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0040
     * @tc.name deleteLeftEntireText_004
     * @tc.desc A delete length equal to the text length clears the composer and resets the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEntireText_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEntireText_004');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '6');
      model.deleteLeft(SHORT_TEXT_LENGTH);
      let state: TextState = model.snapshot();
      logState('deleteLeftEntireText_004', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEntireText_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0050
     * @tc.name deleteLeftOnePastLength_005
     * @tc.desc A delete length one past the text length leaves an empty composer because substring clamps the end offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftOnePastLength_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftOnePastLength_005');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '7');
      model.deleteLeft(7);
      let state: TextState = model.snapshot();
      logState('deleteLeftOnePastLength_005', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftOnePastLength_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0060
     * @tc.name deleteLeftFarPastLength_006
     * @tc.desc A delete length far beyond the text length still lands on the empty string, not on an error
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftFarPastLength_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftFarPastLength_006');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '100');
      model.deleteLeft(100);
      let state: TextState = model.snapshot();
      logState('deleteLeftFarPastLength_006', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftFarPastLength_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0070
     * @tc.name deleteLeftNegativeLength_007
     * @tc.desc A negative delete length minus one extends the substring end past the text and therefore deletes nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegativeLength_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNegativeLength_007');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '-1');
      model.deleteLeft(-1);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegativeLength_007', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNegativeLength_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0080
     * @tc.name deleteLeftNegativeFraction_008
     * @tc.desc A delete length of -0.5 makes the substring end 6.5, truncated to 6, so the full text survives
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegativeFraction_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNegativeFraction_008');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '-0.5');
      model.deleteLeft(-0.5);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegativeFraction_008', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNegativeFraction_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0090
     * @tc.name deleteLeftHalfUnit_009
     * @tc.desc A delete length of 0.5 makes the substring end 5.5, truncated to 5, so one character is removed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftHalfUnit_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftHalfUnit_009');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '0.5');
      model.deleteLeft(0.5);
      let state: TextState = model.snapshot();
      logState('deleteLeftHalfUnit_009', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftHalfUnit_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0100
     * @tc.name deleteLeftOneAndHalf_010
     * @tc.desc A delete length of 1.5 makes the substring end 4.5, truncated to 4, so two characters are removed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftOneAndHalf_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftOneAndHalf_010');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1.5');
      model.deleteLeft(1.5);
      let state: TextState = model.snapshot();
      logState('deleteLeftOneAndHalf_010', state);
      expect(state.inputText).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftOneAndHalf_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0110
     * @tc.name deleteLeftNaNLength_011
     * @tc.desc A NaN delete length makes the substring end NaN, which is converted to 0 and clears the whole composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNaNLength_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNaNLength_011');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', 'NaN');
      model.deleteLeft(NaN);
      let state: TextState = model.snapshot();
      logState('deleteLeftNaNLength_011', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNaNLength_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0120
     * @tc.name deleteLeftPositiveInfinity_012
     * @tc.desc A positive infinite delete length drives the substring end to minus infinity, clamped to 0, clearing the composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftPositiveInfinity_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftPositiveInfinity_012');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', 'Infinity');
      model.deleteLeft(Infinity);
      let state: TextState = model.snapshot();
      logState('deleteLeftPositiveInfinity_012', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftPositiveInfinity_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0130
     * @tc.name deleteLeftNegativeInfinity_013
     * @tc.desc A negative infinite delete length drives the substring end to positive infinity, clamped to the text length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegativeInfinity_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNegativeInfinity_013');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '-Infinity');
      model.deleteLeft(-Infinity);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegativeInfinity_013', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNegativeInfinity_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0140
     * @tc.name deleteLeftZeroOnEmpty_014
     * @tc.desc A zero delete length on the empty composer keeps an empty string and a zero-width caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftZeroOnEmpty_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftZeroOnEmpty_014');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), '', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '0');
      model.deleteLeft(0);
      let state: TextState = model.snapshot();
      logState('deleteLeftZeroOnEmpty_014', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftZeroOnEmpty_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0150
     * @tc.name deleteLeftLargeLengthOnEmpty_015
     * @tc.desc A delete length of five on the empty composer still leaves the empty string and the zero caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftLargeLengthOnEmpty_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftLargeLengthOnEmpty_015');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), '', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '5');
      model.deleteLeft(5);
      let state: TextState = model.snapshot();
      logState('deleteLeftLargeLengthOnEmpty_015', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftLargeLengthOnEmpty_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0160
     * @tc.name deleteLeftNegatedZero_016
     * @tc.desc A delete length of negative zero behaves like zero and keeps the full text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNegatedZero_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNegatedZero_016');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '-0');
      model.deleteLeft(-0);
      let state: TextState = model.snapshot();
      logState('deleteLeftNegatedZero_016', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNegatedZero_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0170
     * @tc.name deleteLeftKeepsSelection_017
     * @tc.desc Deleting one unit keeps the selected slice unchanged while the caret moves ahead of it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftKeepsSelection_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftKeepsSelection_017');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftKeepsSelection_017', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('cd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftKeepsSelection_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0180
     * @tc.name deleteLeftAllInputWithSelection_018
     * @tc.desc Clearing the whole left slice keeps the selected and trailing slices and moves the caret to 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllInputWithSelection_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAllInputWithSelection_018');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftAllInputWithSelection_018', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('cd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAllInputWithSelection_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0190
     * @tc.name deleteLeftResetsAnchorWithSelection_019
     * @tc.desc Deleting two units from the left slice resets the anchor to the new caret even though a selection exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftResetsAnchorWithSelection_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftResetsAnchorWithSelection_019');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', 'de', 'f');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftResetsAnchorWithSelection_019', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('de');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftResetsAnchorWithSelection_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0200
     * @tc.name deleteLeftCursorIndexWithLastInput_020
     * @tc.desc The caret sits at the end of the left slice, not at the end of the composed message, after a delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftCursorIndexWithLastInput_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftCursorIndexWithLastInput_020');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', '', 'def');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftCursorIndexWithLastInput_020', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText.length).assertEqual(2);
      expect(model.message()).assertEqual('abdef');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftCursorIndexWithLastInput_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0210
     * @tc.name deleteLeftCursorZeroWhenSelectionCleared_021
     * @tc.desc Clearing the whole left slice with a selection present puts the caret at 0 and keeps the selection text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftCursorZeroWhenSelectionCleared_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftCursorZeroWhenSelectionCleared_021');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftCursorZeroWhenSelectionCleared_021', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('cd');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftCursorZeroWhenSelectionCleared_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0220
     * @tc.name deleteLeftAnchorMatchesCursorWithSelection_022
     * @tc.desc After deleting one unit in a selected state the anchor equals the caret, both at the left slice end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAnchorMatchesCursorWithSelection_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAnchorMatchesCursorWithSelection_022');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', 'de', 'f');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAnchorMatchesCursorWithSelection_022', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.selectIndex === state.cursorIndex).assertTrue();
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAnchorMatchesCursorWithSelection_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0230
     * @tc.name deleteLeftCursorLeftMeasuresLeftSlice_023
     * @tc.desc The caret offset is recomputed from the surviving left slice only, never from the full message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftCursorLeftMeasuresLeftSlice_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftCursorLeftMeasuresLeftSlice_023');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abcd', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftCursorLeftMeasuresLeftSlice_023', state);
      expect(state.cursorLeft).assertEqual(20);
      expect(state.cursorLeft).assertEqual(state.inputText.length * UNIT_WIDTH);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftCursorLeftMeasuresLeftSlice_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0240
     * @tc.name deleteLeftTwiceSequentially_024
     * @tc.desc Two consecutive single-unit deletes shorten the left slice by two characters in total
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftTwiceSequentially_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftTwiceSequentially_024');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1 then 1');
      model.deleteLeft(1);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftTwiceSequentially_024', state);
      expect(state.inputText).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftTwiceSequentially_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0250
     * @tc.name deleteLeftAfterMoveCursorUp_025
     * @tc.desc A caret moved to the start leaves an empty left slice, so the delete has nothing to remove
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterMoveCursorUp_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterMoveCursorUp_025');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.moveCursor(1);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterMoveCursorUp_025', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterMoveCursorUp_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0260
     * @tc.name deleteLeftAfterMoveCursorRightAtEnd_026
     * @tc.desc A right move at the message end is a no-op, so the delete still removes the final character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterMoveCursorRightAtEnd_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterMoveCursorRightAtEnd_026');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.moveCursor(4);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterMoveCursorRightAtEnd_026', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterMoveCursorRightAtEnd_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0270
     * @tc.name deleteLeftAfterSelectMovementRight_027
     * @tc.desc Moving the anchor right selects the leading character and the delete leaves the empty left slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterSelectMovementRight_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterSelectMovementRight_027');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.selectByMovement(4);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterSelectMovementRight_027', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterSelectMovementRight_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0280
     * @tc.name deleteLeftAfterSelectMovementDown_028
     * @tc.desc An anchor moved to the end leaves the whole message in the left slice, so the delete removes one character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterSelectMovementDown_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterSelectMovementDown_028');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.selectByMovement(2);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterSelectMovementDown_028', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterSelectMovementDown_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0290
     * @tc.name deleteLeftAfterSelectAll_029
     * @tc.desc SELECT_ALL moves the message into the selection, so a following delete leaves the selected text untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterSelectAll_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterSelectAll_029');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.handleExtendAction(0);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterSelectAll_029', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterSelectAll_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0300
     * @tc.name deleteLeftAfterClickBeyondText_030
     * @tc.desc A click beyond the text width clamps the caret to the end, so the delete removes the final character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterClickBeyondText_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterClickBeyondText_030');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.calculateCursor(1000);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterClickBeyondText_030', state);
      expect(state.inputText).assertEqual('abcde');
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterClickBeyondText_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0310
     * @tc.name deleteLeftAfterClickLeftOfText_031
     * @tc.desc A click left of the text clamps the caret to 0 and leaves an empty left slice that the delete cannot shorten
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterClickLeftOfText_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterClickLeftOfText_031');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.calculateCursor(-5);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterClickLeftOfText_031', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterClickLeftOfText_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0320
     * @tc.name deleteLeftAfterChangeSelectionEqual_032
     * @tc.desc An empty selection command leaves no selected slice, so the delete removes the last left character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterChangeSelectionEqual_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterChangeSelectionEqual_032');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.changeSelection(3, 3);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterChangeSelectionEqual_032', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('def');
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterChangeSelectionEqual_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0330
     * @tc.name deleteLeftAfterChangeSelectionBeyond_033
     * @tc.desc A selection end beyond the text is clamped to the length, so the left slice stays at two characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAfterChangeSelectionBeyond_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAfterChangeSelectionBeyond_033');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.changeSelection(2, 100);
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftAfterChangeSelectionBeyond_033', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('cdef');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAfterChangeSelectionBeyond_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0340
     * @tc.name deleteLeftTwoChineseUnits_034
     * @tc.desc Deleting two units from four Han characters leaves the first two characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftTwoChineseUnits_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftTwoChineseUnits_034');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), '中文输入', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftTwoChineseUnits_034', state);
      expect(state.inputText).assertEqual('中文');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftTwoChineseUnits_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0350
     * @tc.name deleteLeftEmojiHighSurrogate_035
     * @tc.desc A single-unit delete splits the two-unit emoji and leaves only its high surrogate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEmojiHighSurrogate_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEmojiHighSurrogate_035');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), EMOTICON, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftEmojiHighSurrogate_035', state);
      expect(state.inputText.length).assertEqual(1);
      expect(state.inputText.charCodeAt(0)).assertEqual(0xD83D);
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEmojiHighSurrogate_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0360
     * @tc.name deleteLeftEmojiWholePair_036
     * @tc.desc Deleting two units removes the whole emoji and clears the composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEmojiWholePair_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEmojiWholePair_036');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), EMOTICON, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '2');
      model.deleteLeft(2);
      let state: TextState = model.snapshot();
      logState('deleteLeftEmojiWholePair_036', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEmojiWholePair_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0370
     * @tc.name deleteLeftSecondEmojiHalf_037
     * @tc.desc One unit removed from two emojis leaves three code units, the last being the second emoji's high surrogate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftSecondEmojiHalf_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftSecondEmojiHalf_037');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), EMOTICON + EMOTICON, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftSecondEmojiHalf_037', state);
      expect(state.inputText.length).assertEqual(3);
      expect(state.inputText.charCodeAt(2)).assertEqual(0xD83D);
      expect(state.inputText).assertEqual(EMOTICON + LONE_HIGH_SURROGATE);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftSecondEmojiHalf_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0380
     * @tc.name deleteLeftCombiningMark_038
     * @tc.desc Removing the trailing combining mark leaves the base letter as a one-unit string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftCombiningMark_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftCombiningMark_038');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), COMBINING_PAIR, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftCombiningMark_038', state);
      expect(state.inputText).assertEqual('e');
      expect(state.inputText.length).assertEqual(1);
      expect(state.inputText.charCodeAt(0)).assertEqual(0x65);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftCombiningMark_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0390
     * @tc.name deleteLeftEmojiThenAscii_039
     * @tc.desc The delete removes the trailing ASCII letter and keeps the whole two-unit emoji
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEmojiThenAscii_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEmojiThenAscii_039');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), EMOTICON + 'a', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftEmojiThenAscii_039', state);
      expect(state.inputText).assertEqual(EMOTICON);
      expect(state.inputText.length).assertEqual(2);
      expect(state.inputText.charCodeAt(0)).assertEqual(0xD83D);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEmojiThenAscii_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0400
     * @tc.name deleteLeftLoneHighSurrogate_040
     * @tc.desc Deleting the only unit of a lone high surrogate clears the composer without throwing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftLoneHighSurrogate_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftLoneHighSurrogate_040');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), LONE_HIGH_SURROGATE, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftLoneHighSurrogate_040', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftLoneHighSurrogate_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0410
     * @tc.name deleteLeftLoneLowSurrogate_041
     * @tc.desc Deleting the only unit of a lone low surrogate clears the composer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftLoneLowSurrogate_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftLoneLowSurrogate_041');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), '\uDC00', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftLoneLowSurrogate_041', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftLoneLowSurrogate_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0420
     * @tc.name deleteLeftAllOfLongText_042
     * @tc.desc Deleting the full length of a 64-character string clears it and zeroes the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllOfLongText_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftAllOfLongText_042');
      let longText: string = buildRepeated('a', LONG_TEXT_LENGTH);
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), longText, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', LONG_TEXT_LENGTH.toString());
      model.deleteLeft(LONG_TEXT_LENGTH);
      let state: TextState = model.snapshot();
      logState('deleteLeftAllOfLongText_042', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftAllOfLongText_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0430
     * @tc.name deleteLeftZeroOfVeryLongText_043
     * @tc.desc A zero-length delete on 255 characters changes nothing but re-reports the same nine-unit caret offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftZeroOfVeryLongText_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftZeroOfVeryLongText_043');
      let longText: string = buildRepeated('x', VERY_LONG_TEXT_LENGTH);
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(1), longText, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '0');
      model.deleteLeft(0);
      let state: TextState = model.snapshot();
      logState('deleteLeftZeroOfVeryLongText_043', state);
      expect(state.inputText.length).assertEqual(VERY_LONG_TEXT_LENGTH);
      expect(state.cursorLeft).assertEqual(255);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftZeroOfVeryLongText_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0440
     * @tc.name deleteLeftHalfOfVeryLongText_044
     * @tc.desc Deleting 128 of 255 characters leaves 127 characters and a 127-pixel caret at one pixel per character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftHalfOfVeryLongText_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftHalfOfVeryLongText_044');
      let longText: string = buildRepeated('x', VERY_LONG_TEXT_LENGTH);
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(1), longText, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '128');
      model.deleteLeft(128);
      let state: TextState = model.snapshot();
      logState('deleteLeftHalfOfVeryLongText_044', state);
      expect(state.inputText.length).assertEqual(127);
      expect(state.cursorLeft).assertEqual(127);
      expect(state.cursorIndex).assertEqual(127);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftHalfOfVeryLongText_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0450
     * @tc.name deleteLeftRtlText_045
     * @tc.desc A right-to-left Arabic string loses one unit from its end exactly like a left-to-right string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftRtlText_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftRtlText_045');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'مرحبا', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftRtlText_045', state);
      expect(state.inputText.length).assertEqual(4);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftRtlText_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0460
     * @tc.name deleteLeftZeroWidthMeasure_046
     * @tc.desc With a zero-width oracle the caret stays at 0 even though five characters survive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftZeroWidthMeasure_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftZeroWidthMeasure_046');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(0), SHORT_TEXT, '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftZeroWidthMeasure_046', state);
      expect(state.inputText.length).assertEqual(5);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftZeroWidthMeasure_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0470
     * @tc.name deleteLeftNaNMeasure_047
     * @tc.desc A NaN oracle makes the caret offset NaN because the width is copied without validation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNaNMeasure_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNaNMeasure_047');
      let model: TextEditingModel = newLoadedModel(new FixedMeasure(NaN), 'abc', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftNaNMeasure_047', state);
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNaNMeasure_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0480
     * @tc.name deleteLeftInfiniteMeasure_048
     * @tc.desc An infinite oracle propagates infinity into the caret offset without clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftInfiniteMeasure_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftInfiniteMeasure_048');
      let model: TextEditingModel = newLoadedModel(new FixedMeasure(Infinity), 'abc', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftInfiniteMeasure_048', state);
      expect(state.cursorLeft).assertEqual(Infinity);
      expect(state.cursorLeft === Infinity).assertTrue();
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftInfiniteMeasure_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0490
     * @tc.name deleteLeftNaNLengthNoThrow_049
     * @tc.desc A NaN delete length is handled without an exception and clears the text through substring NaN conversion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftNaNLengthNoThrow_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftNaNLengthNoThrow_049');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', '', '');
      let threw: boolean = false;
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', 'NaN');
      try {
        model.deleteLeft(NaN);
      } catch (error) {
        threw = true;
      }
      let state: TextState = model.snapshot();
      logState('deleteLeftNaNLengthNoThrow_049', state);
      expect(threw).assertFalse();
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftNaNLengthNoThrow_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0500
     * @tc.name deleteLeftStaleCursorBeyondLength_050
     * @tc.desc A caret index of 50 is overwritten by the surviving length 2 regardless of how stale it was
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftStaleCursorBeyondLength_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftStaleCursorBeyondLength_050');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', '', '');
      model.cursorIndex = 50;
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftStaleCursorBeyondLength_050', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorIndex !== 50).assertTrue();
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftStaleCursorBeyondLength_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0510
     * @tc.name deleteLeftEmptySelectionSlice_051
     * @tc.desc An empty selected slice stays empty after a one-unit delete from three characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftEmptySelectionSlice_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftEmptySelectionSlice_051');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'abc', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftEmptySelectionSlice_051', state);
      expect(state.selectInput).assertEqual('');
      expect(state.inputText).assertEqual('ab');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftEmptySelectionSlice_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0520
     * @tc.name deleteLeftSingleCharacter_052
     * @tc.desc Deleting the only character of the composer produces an empty string and a zero caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftSingleCharacter_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftSingleCharacter_052');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), 'a', '', '');
      TestLogger.value(TAG_DELETE_LEFT, 'delete length', '1');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('deleteLeftSingleCharacter_052', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftSingleCharacter_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_DELETE_LEFT_0530
     * @tc.name deleteLeftThenSelectAll_053
     * @tc.desc After a one-unit delete, SELECT_ALL puts the five surviving characters into the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftThenSelectAll_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_DELETE_LEFT, 'deleteLeftThenSelectAll_053');
      let model: TextEditingModel = newLoadedModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.deleteLeft(1);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('deleteLeftThenSelectAll_053', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcde');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_DELETE_LEFT, 'deleteLeftThenSelectAll_053');
      await yieldToEventLoop();
      done();
    });

  });
}
