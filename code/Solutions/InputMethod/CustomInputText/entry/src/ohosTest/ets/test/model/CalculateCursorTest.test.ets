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
  TextEditingModel, TextState, TextMeasure, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure, SpyMeasure
} from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_CALCULATE_CURSOR } from '../common/TestConstant';

/**
 * Click-to-caret conversion of components/CustomInputText.ets.
 *
 * calculateCursor(x) divides the click offset by the *average* character width of
 * the whole composed message, floors the quotient and then clamps it in two
 * comparisons. The suite drives the replica with exact character boundaries,
 * half-character offsets, out-of-range clicks and pathological width functions.
 * An empty message is its own family: 0 / 0 yields NaN, both comparisons fail and
 * the component leaves inputText empty while selectIndex becomes NaN.
 */

const CANVAS_WIDTH: number = 320;
const UNIT_WIDTH: number = 10;
const SIX_CHARS: string = 'abcdef';
const SIX_LENGTH: number = 6;

function createLoaded(measure: TextMeasure, inputText: string, selectInput: string,
  lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, CANVAS_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function createCustom(measure: TextMeasure, inputText: string, selectInput: string, lastInput: string,
  cursorIndex: number, selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, CANVAS_WIDTH);
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

function buildRepeated(unit: string, count: number): string {
  let result: string = '';
  let index: number = 0;
  while (index < count) {
    result += unit;
    index++;
  }
  return result;
}

function describeState(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_CALCULATE_CURSOR, caseName + ' state', describeState(state));
}

export default function calculateCursorTest(): void {
  describe('CustomInputTextCalculateCursorTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0010
     * @tc.name calculateCursorAtZeroOnSixCharacters001
     * @tc.desc A click at x=0 resolves to caret 0 and moves the whole text to the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorAtZeroOnSixCharacters_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorAtZeroOnSixCharacters_001');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), SIX_CHARS, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorAtZeroOnSixCharacters_001', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorAtZeroOnSixCharacters_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0020
     * @tc.name calculateCursorAtFullWidth002
     * @tc.desc A click at exactly the total text width equals the text length and is not clamped
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorAtFullWidth_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorAtFullWidth_002');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), SIX_CHARS, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '60');
      model.calculateCursor(60);
      let state: TextState = model.snapshot();
      logState('calculateCursorAtFullWidth_002', state);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SIX_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorAtFullWidth_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0030
     * @tc.name calculateCursorOnePixelPastWidth003
     * @tc.desc A click one pixel past the text width still floors to the length and stays unclamped
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorOnePixelPastWidth_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorOnePixelPastWidth_003');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), SIX_CHARS, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '61');
      model.calculateCursor(61);
      let state: TextState = model.snapshot();
      logState('calculateCursorOnePixelPastWidth_003', state);
      expect(state.cursorIndex).assertEqual(SIX_LENGTH);
      expect(state.inputText).assertEqual(SIX_CHARS);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorOnePixelPastWidth_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0040
     * @tc.name calculateCursorNegativeZero004
     * @tc.desc A click at negative zero keeps the caret at zero without entering the negative clamp branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorNegativeZero_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeZero_004');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), SIX_CHARS, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '-0');
      model.calculateCursor(-0);
      let state: TextState = model.snapshot();
      logState('calculateCursorNegativeZero_004', state);
      expect(state.cursorIndex === 0).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeZero_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0050
     * @tc.name calculateCursorNegativeOnePixel005
     * @tc.desc A click one pixel left of the text clamps the caret to zero and empties the leading slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorNegativeOnePixel_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeOnePixel_005');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), SIX_CHARS, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '-1');
      model.calculateCursor(-1);
      let state: TextState = model.snapshot();
      logState('calculateCursorNegativeOnePixel_005', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SIX_CHARS);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeOnePixel_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0060
     * @tc.name calculateCursorNegativeOnEmpty006
     * @tc.desc A negative click on an empty message takes the NaN path, not the negative clamp branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorNegativeOnEmpty_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeOnEmpty_006');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), '', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '-5');
      model.calculateCursor(-5);
      let state: TextState = model.snapshot();
      logState('calculateCursorNegativeOnEmpty_006', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeOnEmpty_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0070
     * @tc.name calculateCursorEmptyAtZero007
     * @tc.desc Clicking an empty message divides zero by zero and leaves a NaN caret with empty slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorEmptyAtZero_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyAtZero_007');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), '', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorEmptyAtZero_007', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyAtZero_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0080
     * @tc.name calculateCursorEmptyFixedWidth008
     * @tc.desc With a constant width the empty message yields an infinite average, so the caret is zero rather than NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorEmptyFixedWidth_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyFixedWidth_008');
      let measure: FixedMeasure = new FixedMeasure(10);
      let model: TextEditingModel = createLoaded(measure, '', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorEmptyFixedWidth_008', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyFixedWidth_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0090
     * @tc.name calculateCursorEmptyFixedWidthFarClick009
     * @tc.desc A far click on an empty message with constant width still resolves to caret zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorEmptyFixedWidthFarClick_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyFixedWidthFarClick_009');
      let measure: FixedMeasure = new FixedMeasure(10);
      let model: TextEditingModel = createLoaded(measure, '', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '100');
      model.calculateCursor(100);
      let state: TextState = model.snapshot();
      logState('calculateCursorEmptyFixedWidthFarClick_009', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorEmptyFixedWidthFarClick_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0100
     * @tc.name calculateCursorSingleAtZero010
     * @tc.desc A click at the start of a one character message leaves the character after the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorSingleAtZero_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSingleAtZero_010');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), 'a', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorSingleAtZero_010', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('a');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSingleAtZero_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0110
     * @tc.name calculateCursorTwoJustBelowFull011
     * @tc.desc Nineteen pixels into a two character message stays on the first boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorTwoJustBelowFull_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorTwoJustBelowFull_011');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), 'ab', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '19');
      model.calculateCursor(19);
      let state: TextState = model.snapshot();
      logState('calculateCursorTwoJustBelowFull_011', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('b');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorTwoJustBelowFull_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0120
     * @tc.name calculateCursorTwoFiftyFiveHalf012
     * @tc.desc A 1280 px click splits the two hundred fifty five character message exactly in half
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorTwoFiftyFiveHalf_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorTwoFiftyFiveHalf_012');
      let text: string = buildRepeated('b', 255);
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), text, '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '1280');
      model.calculateCursor(1280);
      let state: TextState = model.snapshot();
      logState('calculateCursorTwoFiftyFiveHalf_012', state);
      expect(state.cursorIndex).assertEqual(128);
      expect(state.inputText.length).assertEqual(128);
      expect(state.lastInput.length).assertEqual(127);
      expect(state.cursorLeft).assertEqual(1280);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorTwoFiftyFiveHalf_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0130
     * @tc.name calculateCursorMixedAtFullWidth013
     * @tc.desc The thirty two pixel width of a mixed message resolves exactly to its length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorMixedAtFullWidth_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorMixedAtFullWidth_013');
      let measure: MixedMeasure = new MixedMeasure(8, 16);
      let model: TextEditingModel = createLoaded(measure, 'a中b', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '32');
      model.calculateCursor(32);
      let state: TextState = model.snapshot();
      logState('calculateCursorMixedAtFullWidth_013', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('a中b');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorMixedAtFullWidth_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0140
     * @tc.name calculateCursorMixedJustPastFull014
     * @tc.desc One pixel past the mixed message width still floors to its length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorMixedJustPastFull_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorMixedJustPastFull_014');
      let measure: MixedMeasure = new MixedMeasure(8, 16);
      let model: TextEditingModel = createLoaded(measure, 'a中b', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '33');
      model.calculateCursor(33);
      let state: TextState = model.snapshot();
      logState('calculateCursorMixedJustPastFull_014', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('a中b');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorMixedJustPastFull_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0150
     * @tc.name calculateCursorMixedAtZero015
     * @tc.desc A zero click on a mixed width message keeps all three characters trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorMixedAtZero_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorMixedAtZero_015');
      let measure: MixedMeasure = new MixedMeasure(8, 16);
      let model: TextEditingModel = createLoaded(measure, 'a中b', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorMixedAtZero_015', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('a中b');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorMixedAtZero_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0160
     * @tc.name calculateCursorSquareJustBelowBoundary016
     * @tc.desc A non-linear width function yields a forty pixel average for four characters, so 39 px floors to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorSquareJustBelowBoundary_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSquareJustBelowBoundary_016');
      let measure: SquareMeasure = new SquareMeasure(10);
      let model: TextEditingModel = createLoaded(measure, 'abcd', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '39');
      model.calculateCursor(39);
      let state: TextState = model.snapshot();
      logState('calculateCursorSquareJustBelowBoundary_016', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abcd');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSquareJustBelowBoundary_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0170
     * @tc.name calculateCursorSquareFirstBoundary017
     * @tc.desc A forty pixel click on a square measured message lands on the first boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorSquareFirstBoundary_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSquareFirstBoundary_017');
      let measure: SquareMeasure = new SquareMeasure(10);
      let model: TextEditingModel = createLoaded(measure, 'abcd', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '40');
      model.calculateCursor(40);
      let state: TextState = model.snapshot();
      logState('calculateCursorSquareFirstBoundary_017', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bcd');
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSquareFirstBoundary_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0180
     * @tc.name calculateCursorSquareJustBelowSecond018
     * @tc.desc Seventy nine pixels into a square measured message still floors to the first boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorSquareJustBelowSecond_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSquareJustBelowSecond_018');
      let measure: SquareMeasure = new SquareMeasure(10);
      let model: TextEditingModel = createLoaded(measure, 'abcd', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '79');
      model.calculateCursor(79);
      let state: TextState = model.snapshot();
      logState('calculateCursorSquareJustBelowSecond_018', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('bcd');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSquareJustBelowSecond_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0190
     * @tc.name calculateCursorSquareAtFullWidth019
     * @tc.desc The 160 px width of a square measured message resolves to its length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorSquareAtFullWidth_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSquareAtFullWidth_019');
      let measure: SquareMeasure = new SquareMeasure(10);
      let model: TextEditingModel = createLoaded(measure, 'abcd', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '160');
      model.calculateCursor(160);
      let state: TextState = model.snapshot();
      logState('calculateCursorSquareAtFullWidth_019', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(160);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSquareAtFullWidth_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0200
     * @tc.name calculateCursorSquarePastFull020
     * @tc.desc One pixel past the square measured width still floors to the length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorSquarePastFull_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorSquarePastFull_020');
      let measure: SquareMeasure = new SquareMeasure(10);
      let model: TextEditingModel = createLoaded(measure, 'abcd', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '161');
      model.calculateCursor(161);
      let state: TextState = model.snapshot();
      logState('calculateCursorSquarePastFull_020', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.inputText).assertEqual('abcd');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorSquarePastFull_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0210
     * @tc.name calculateCursorZeroWidthAtZero021
     * @tc.desc A zero width measure makes the average zero, so a zero click produces NaN instead of a split
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorZeroWidthAtZero_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorZeroWidthAtZero_021');
      let model: TextEditingModel = createLoaded(new UniformMeasure(0), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorZeroWidthAtZero_021', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorZeroWidthAtZero_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0220
     * @tc.name calculateCursorFixedZeroPositive022
     * @tc.desc A constant zero width also clamps a positive click to the text length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorFixedZeroPositive_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorFixedZeroPositive_022');
      let model: TextEditingModel = createLoaded(new FixedMeasure(0), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '5');
      model.calculateCursor(5);
      let state: TextState = model.snapshot();
      logState('calculateCursorFixedZeroPositive_022', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorFixedZeroPositive_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0230
     * @tc.name calculateCursorFixedZeroNegative023
     * @tc.desc A constant zero width turns a negative click into negative infinity and clamps the caret to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorFixedZeroNegative_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorFixedZeroNegative_023');
      let model: TextEditingModel = createLoaded(new FixedMeasure(0), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '-5');
      model.calculateCursor(-5);
      let state: TextState = model.snapshot();
      logState('calculateCursorFixedZeroNegative_023', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorFixedZeroNegative_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0240
     * @tc.name calculateCursorNaNWidth024
     * @tc.desc A NaN width propagates into the caret, keeps the text trailing and makes the offset NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorNaNWidth_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorNaNWidth_024');
      let model: TextEditingModel = createLoaded(new FixedMeasure(NaN), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '5');
      model.calculateCursor(5);
      let state: TextState = model.snapshot();
      logState('calculateCursorNaNWidth_024', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorNaNWidth_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0250
     * @tc.name calculateCursorInfiniteWidth025
     * @tc.desc An infinite width makes the average infinite, so any finite click floors to the start
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorInfiniteWidth_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorInfiniteWidth_025');
      let model: TextEditingModel = createLoaded(new FixedMeasure(Infinity), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '5');
      model.calculateCursor(5);
      let state: TextState = model.snapshot();
      logState('calculateCursorInfiniteWidth_025', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(Infinity);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorInfiniteWidth_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0260
     * @tc.name calculateCursorNegativeWidthAtZero026
     * @tc.desc A negative width with a zero click yields negative zero, which is not below zero, so the start branch is skipped
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorNegativeWidthAtZero_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeWidthAtZero_026');
      let model: TextEditingModel = createLoaded(new FixedMeasure(-10), 'abc', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '0');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('calculateCursorNegativeWidthAtZero_026', state);
      expect(state.cursorIndex === 0).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(-10);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorNegativeWidthAtZero_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0270
     * @tc.name calculateCursorChineseNearEnd027
     * @tc.desc Nineteen pixels into two Chinese characters still floors to the first code unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorChineseNearEnd_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorChineseNearEnd_027');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), '中文', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '19');
      model.calculateCursor(19);
      let state: TextState = model.snapshot();
      logState('calculateCursorChineseNearEnd_027', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('中');
      expect(state.lastInput).assertEqual('文');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorChineseNearEnd_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0280
     * @tc.name calculateCursorChineseAtFullWidth028
     * @tc.desc A click at the twenty pixel width of two Chinese characters puts the caret after both
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateCursorChineseAtFullWidth_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorChineseAtFullWidth_028');
      let model: TextEditingModel = createLoaded(new UniformMeasure(UNIT_WIDTH), '中文', '', '');
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '20');
      model.calculateCursor(20);
      let state: TextState = model.snapshot();
      logState('calculateCursorChineseAtFullWidth_028', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorChineseAtFullWidth_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CALCULATE_CURSOR_0290
     * @tc.name calculateCursorOverNaNCaret029
     * @tc.desc A stale NaN caret is overwritten by the click position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateCursorOverNaNCaret_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_CALCULATE_CURSOR, 'calculateCursorOverNaNCaret_029');
      let model: TextEditingModel = createCustom(new UniformMeasure(UNIT_WIDTH), 'abcdef', '', '', NaN, NaN, 0);
      TestLogger.value(TAG_CALCULATE_CURSOR, 'click x', '20');
      model.calculateCursor(20);
      let state: TextState = model.snapshot();
      logState('calculateCursorOverNaNCaret_029', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      expect(state.lastInput).assertEqual('cdef');
      TestLogger.end(TAG_CALCULATE_CURSOR, 'calculateCursorOverNaNCaret_029');
      await yieldToEventLoop();
      done();
    });

  });
}
