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
  TextEditingModel, TextMeasure, TextState, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure, SpyMeasure
} from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, END_FLAG, TAG_SELECT_RANGE } from '../common/TestConstant';

/**
 * selectByRange() contract for the custom editor.
 *
 * The component receives a Range from the input method and dispatches it into
 * exactly four branches: the (0, 0) reset, a forward range whose end equals
 * END_FLAG, any other forward range, and the default branch that collapses the
 * selection to the end. Only the (0, 0) and default branches recompute
 * cursorLeft; the two forward branches keep the previous caret offset, and the
 * ordinary forward branch additionally ignores both start and end. This suite
 * drives the replica across every boundary of that dispatch, across composer
 * states that carry a selection or a right-hand slice, and across the text kinds
 * the sample is meant to display.
 */

const MODEL_WIDTH: number = 320;
const UNIT_WIDTH: number = 10;
const SHORT_TEXT: string = 'abcdef';
const SHORT_LENGTH: number = 6;
const CHINESE_TEXT: string = '中文输入';
const EMOJI_TEXT: string = '😀a';
const ZWJ_TEXT: string = '👨‍👩‍👧';
const COMBINING_TEXT: string = 'é';

function repeated(unit: string, count: number): string {
  let result: string = '';
  let index: number = 0;
  while (index < count) {
    result += unit;
    index++;
  }
  return result;
}

function freshModel(measure: TextMeasure): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, MODEL_WIDTH);
  return model;
}

function plainModel(measure: TextMeasure, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, MODEL_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function customModel(measure: TextMeasure, inputText: string, selectInput: string, lastInput: string,
  cursorIndex: number, selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, MODEL_WIDTH);
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

function describeState(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_SELECT_RANGE, caseName + ' state', describeState(state));
}

function logRange(caseName: string, start: number, end: number): void {
  TestLogger.value(TAG_SELECT_RANGE, caseName + ' range', start.toString() + ',' + end.toString());
}

export default function selectByRangeTest(): void {
  describe('CustomInputTextSelectByRangeTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0010
     * @tc.name selectRangeZeroZeroEmpty001
     * @tc.desc The (0, 0) reset leaves an empty composer empty and puts the caret at the origin
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroEmpty_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroEmpty_001');
      let measure: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = freshModel(measure);
      logRange('selectRangeZeroZeroEmpty_001', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroEmpty_001', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      expect(measure.callCount()).assertEqual(1);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroEmpty_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0020
     * @tc.name selectRangeZeroZeroWholeText002
     * @tc.desc The (0, 0) reset moves the entire six-character message into lastInput and selects nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroWholeText_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroWholeText_002');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      logRange('selectRangeZeroZeroWholeText_002', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroWholeText_002', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.lastInput.length).assertEqual(SHORT_LENGTH);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroWholeText_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0030
     * @tc.name selectRangeZeroZeroMergesSelection003
     * @tc.desc The (0, 0) reset folds a live selection back into lastInput instead of dropping it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroMergesSelection_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroMergesSelection_003');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      logRange('selectRangeZeroZeroMergesSelection_003', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroMergesSelection_003', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('abcdef');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.inputText + state.selectInput + state.lastInput).assertEqual('abcdef');
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroMergesSelection_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0040
     * @tc.name selectRangeZeroZeroTrailingOnly004
     * @tc.desc A composer that only has a trailing slice keeps that slice intact after the (0, 0) reset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroTrailingOnly_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroTrailingOnly_004');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'ab', '', 'cd');
      logRange('selectRangeZeroZeroTrailingOnly_004', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroTrailingOnly_004', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.lastInput.startsWith('ab')).assertTrue();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroTrailingOnly_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0050
     * @tc.name selectRangeZeroZeroRepeated005
     * @tc.desc Repeating the (0, 0) reset is idempotent and measures the empty prefix once per call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroRepeated_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroRepeated_005');
      let measure: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = plainModel(measure, SHORT_TEXT, '', '');
      measure.reset();
      logRange('selectRangeZeroZeroRepeated_005', 0, 0);
      model.selectByRange(0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroRepeated_005', state);
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(measure.callCount()).assertEqual(2);
      expect(measure.countOf('')).assertEqual(2);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroRepeated_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0060
     * @tc.name selectRangeZeroZeroMeasuresEmptyPrefix006
     * @tc.desc The (0, 0) reset measures exactly the empty input prefix and never the old selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroMeasuresEmptyPrefix_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroMeasuresEmptyPrefix_006');
      let measure: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = plainModel(measure, 'ab', 'cd', 'ef');
      measure.reset();
      logRange('selectRangeZeroZeroMeasuresEmptyPrefix_006', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroMeasuresEmptyPrefix_006', state);
      expect(measure.callCount()).assertEqual(1);
      expect(measure.calls[0]).assertEqual('');
      expect(measure.countOf('cd')).assertEqual(0);
      expect(measure.countOf('ab')).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroMeasuresEmptyPrefix_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0070
     * @tc.name selectRangeZeroZeroStaleCaretZero007
     * @tc.desc A stale caret of 0 over a non-empty message still moves the whole message into lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroStaleCaretZero_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleCaretZero_007');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), 'ab', '', 'cd', 0, 0, 0);
      logRange('selectRangeZeroZeroStaleCaretZero_007', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroStaleCaretZero_007', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abcd');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleCaretZero_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0080
     * @tc.name selectRangeZeroZeroCaretBeyondLength008
     * @tc.desc A caret far beyond the message is clamped to zero by the reset branch before slicing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroCaretBeyondLength_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroCaretBeyondLength_008');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', 10, 0, 60);
      logRange('selectRangeZeroZeroCaretBeyondLength_008', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroCaretBeyondLength_008', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroCaretBeyondLength_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0090
     * @tc.name selectRangeZeroZeroEmojiText009
     * @tc.desc The (0, 0) reset preserves a message that mixes a surrogate pair with an ASCII letter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroEmojiText_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroEmojiText_009');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), EMOJI_TEXT, '', '');
      logRange('selectRangeZeroZeroEmojiText_009', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroEmojiText_009', state);
      expect(state.lastInput).assertEqual(EMOJI_TEXT);
      expect(state.lastInput.length).assertEqual(3);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroEmojiText_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0100
     * @tc.name selectRangeZeroZeroZwjSequence010
     * @tc.desc The family emoji sequence keeps all eight UTF-16 code units after the reset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroZwjSequence_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroZwjSequence_010');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), ZWJ_TEXT, '', '');
      logRange('selectRangeZeroZeroZwjSequence_010', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroZwjSequence_010', state);
      expect(state.lastInput).assertEqual(ZWJ_TEXT);
      expect(state.lastInput.length).assertEqual(8);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroZwjSequence_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0110
     * @tc.name selectRangeZeroZeroCombiningPair011
     * @tc.desc A combining pair counts as two code units and survives the reset unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroCombiningPair_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroCombiningPair_011');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), COMBINING_TEXT, '', '');
      logRange('selectRangeZeroZeroCombiningPair_011', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroCombiningPair_011', state);
      expect(state.lastInput).assertEqual(COMBINING_TEXT);
      expect(state.lastInput.length).assertEqual(2);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroCombiningPair_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0120
     * @tc.name selectRangeZeroZeroStaleLeftReset012
     * @tc.desc A stale caret offset of 60 px is reset to zero because the empty input prefix measures zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroStaleLeftReset_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleLeftReset_012');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', 6, 0, 60);
      logRange('selectRangeZeroZeroStaleLeftReset_012', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroStaleLeftReset_012', state);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.cursorLeft === 60).assertFalse();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleLeftReset_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0130
     * @tc.name selectRangeZeroZeroStaleAnchorReset013
     * @tc.desc A stale anchor of 5 is overwritten with zero by the (0, 0) reset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroStaleAnchorReset_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleAnchorReset_013');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', 6, 5, 60);
      logRange('selectRangeZeroZeroStaleAnchorReset_013', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroStaleAnchorReset_013', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectIndex === state.cursorIndex).assertTrue();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleAnchorReset_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0140
     * @tc.name selectRangeZeroZeroMixedMeasure014
     * @tc.desc Under a mixed width table the empty prefix still measures zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroMixedMeasure_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroMixedMeasure_014');
      let model: TextEditingModel = plainModel(new MixedMeasure(8, 16), CHINESE_TEXT, '', '');
      logRange('selectRangeZeroZeroMixedMeasure_014', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroMixedMeasure_014', state);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.lastInput).assertEqual(CHINESE_TEXT);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroMixedMeasure_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0150
     * @tc.name selectRangeZeroZeroFixedMeasure015
     * @tc.desc A constant measure reports 7 px for the empty prefix because the caret offset uses measure directly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroFixedMeasure_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroFixedMeasure_015');
      let model: TextEditingModel = plainModel(new FixedMeasure(7), SHORT_TEXT, '', '');
      logRange('selectRangeZeroZeroFixedMeasure_015', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroFixedMeasure_015', state);
      expect(state.cursorLeft).assertEqual(7);
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroFixedMeasure_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0160
     * @tc.name selectRangeZeroZeroStaleNaNCaretLeft016
     * @tc.desc A stale NaN caret offset is overwritten with the fresh zero-width measurement
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroStaleNaNCaretLeft_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleNaNCaretLeft_016');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', 6, 0, NaN);
      logRange('selectRangeZeroZeroStaleNaNCaretLeft_016', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroStaleNaNCaretLeft_016', state);
      expect(Number.isNaN(state.cursorLeft)).assertFalse();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroStaleNaNCaretLeft_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0170
     * @tc.name selectRangeZeroZeroVeryLongText017
     * @tc.desc A 255-character message is moved into lastInput without being shortened
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroVeryLongText_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroVeryLongText_017');
      let text: string = repeated('b', 255);
      let model: TextEditingModel = plainModel(new UniformMeasure(1), text, '', '');
      logRange('selectRangeZeroZeroVeryLongText_017', 0, 0);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroVeryLongText_017', state);
      expect(state.lastInput.length).assertEqual(255);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput.endsWith('b')).assertTrue();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroVeryLongText_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0180
     * @tc.name selectRangeZeroZeroThenEndFlag018
     * @tc.desc A reset followed by an end-flag range selects the whole message from a zero caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeZeroZeroThenEndFlag_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeZeroZeroThenEndFlag_018');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, 'xy', '');
      model.selectByRange(0, 0);
      logRange('selectRangeZeroZeroThenEndFlag_018', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeZeroZeroThenEndFlag_018', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcdefxy');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(8);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeZeroZeroThenEndFlag_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0190
     * @tc.name selectRangeEndFlagFromTail019
     * @tc.desc An end flag at the tail leaves the message in inputText and clears both other slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeEndFlagFromTail_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagFromTail_019');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      logRange('selectRangeEndFlagFromTail_019', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagFromTail_019', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagFromTail_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0200
     * @tc.name selectRangeEndFlagFromHead020
     * @tc.desc An end flag with the caret at the head moves the whole message into selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeEndFlagFromHead_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagFromHead_020');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), '', '', SHORT_TEXT);
      logRange('selectRangeEndFlagFromHead_020', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagFromHead_020', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagFromHead_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0210
     * @tc.name selectRangeEndFlagCaretBeyondText021
     * @tc.desc A caret of 7 is clamped by substring so the whole message stays in inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeEndFlagCaretBeyondText_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagCaretBeyondText_021');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', 7, 0, 60);
      logRange('selectRangeEndFlagCaretBeyondText_021', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagCaretBeyondText_021', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorIndex).assertEqual(7);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagCaretBeyondText_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0220
     * @tc.name selectRangeEndFlagNegativeCaret022
     * @tc.desc A negative caret of -2 clamps to zero, so the whole message lands in selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeEndFlagNegativeCaret_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagNegativeCaret_022');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', -2, 0, 60);
      logRange('selectRangeEndFlagNegativeCaret_022', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagNegativeCaret_022', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SHORT_TEXT);
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorIndex).assertEqual(-2);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagNegativeCaret_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0230
     * @tc.name selectRangeEndFlagNaNCaret023
     * @tc.desc A NaN caret clamps to zero for both substring calls and the caret index stays NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeEndFlagNaNCaret_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagNaNCaret_023');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '', NaN, 0, 60);
      logRange('selectRangeEndFlagNaNCaret_023', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagNaNCaret_023', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SHORT_TEXT);
      expect(state.selectIndex).assertEqual(6);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagNaNCaret_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0240
     * @tc.name selectRangeEndFlagZwjSplit024
     * @tc.desc A caret of 4 splits the eight-code-unit family emoji sequence into two equal halves
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeEndFlagZwjSplit_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagZwjSplit_024');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), ZWJ_TEXT, '', '', 4, 0, 40);
      logRange('selectRangeEndFlagZwjSplit_024', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagZwjSplit_024', state);
      expect(state.inputText.length).assertEqual(4);
      expect(state.selectInput.length).assertEqual(4);
      expect(state.selectIndex).assertEqual(8);
      expect(state.inputText + state.selectInput).assertEqual(ZWJ_TEXT);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagZwjSplit_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0250
     * @tc.name selectRangeEndFlagCombiningSplit025
     * @tc.desc A caret of 1 separates the base letter from its combining mark
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeEndFlagCombiningSplit_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeEndFlagCombiningSplit_025');
      let model: TextEditingModel = customModel(new UniformMeasure(UNIT_WIDTH), COMBINING_TEXT, '', '', 1, 0, 10);
      logRange('selectRangeEndFlagCombiningSplit_025', 0, END_FLAG);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logState('selectRangeEndFlagCombiningSplit_025', state);
      expect(state.inputText).assertEqual('e');
      expect(state.selectInput.length).assertEqual(1);
      expect(state.selectIndex).assertEqual(2);
      expect(state.inputText + state.selectInput).assertEqual(COMBINING_TEXT);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeEndFlagCombiningSplit_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0260
     * @tc.name selectRangeForwardFromHead026
     * @tc.desc An ordinary forward range with the caret at zero selects nothing and keeps the whole tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeForwardFromHead_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeForwardFromHead_026');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), '', '', SHORT_TEXT);
      logRange('selectRangeForwardFromHead_026', 2, 4);
      model.selectByRange(2, 4);
      let state: TextState = model.snapshot();
      logState('selectRangeForwardFromHead_026', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeForwardFromHead_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0270
     * @tc.name selectRangeForwardAboveSentinel027
     * @tc.desc A start of 999 with an end of 1001 is an ordinary forward range and selects the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeForwardAboveSentinel_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeForwardAboveSentinel_027');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'abc', '', 'def');
      logRange('selectRangeForwardAboveSentinel_027', 999, 1001);
      model.selectByRange(999, 1001);
      let state: TextState = model.snapshot();
      logState('selectRangeForwardAboveSentinel_027', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('def');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeForwardAboveSentinel_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0280
     * @tc.name selectRangeNaNNStart028
     * @tc.desc A NaN start fails the forward comparison and falls into the default branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeNaNNStart_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeNaNNStart_028');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      logRange('selectRangeNaNNStart_028', NaN, 5);
      model.selectByRange(NaN, 5);
      let state: TextState = model.snapshot();
      logState('selectRangeNaNNStart_028', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(6);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeNaNNStart_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0290
     * @tc.name selectRangeForwardWithSelection029
     * @tc.desc An ordinary forward range merges a live selection into selectInput and keeps the tail separate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeForwardWithSelection_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeForwardWithSelection_029');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      logRange('selectRangeForwardWithSelection_029', 1, 3);
      model.selectByRange(1, 3);
      let state: TextState = model.snapshot();
      logState('selectRangeForwardWithSelection_029', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeForwardWithSelection_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0300
     * @tc.name selectRangeForwardKeepsCaret030
     * @tc.desc The ordinary forward branch never rewrites cursorIndex, even when the range is reversed later
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeForwardKeepsCaret_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeForwardKeepsCaret_030');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'abcd', '', 'ef');
      model.selectByRange(1, 3);
      let state: TextState = model.snapshot();
      logState('selectRangeForwardKeepsCaret_030', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.selectInput).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorIndex === 6).assertFalse();
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeForwardKeepsCaret_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0310
     * @tc.name selectRangeForwardNoMeasure031
     * @tc.desc The ordinary forward branch skips measurement and leaves the spy with zero calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeForwardNoMeasure_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeForwardNoMeasure_031');
      let measure: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = plainModel(measure, 'abc', '', 'def');
      measure.reset();
      model.selectByRange(1, 3);
      let state: TextState = model.snapshot();
      logState('selectRangeForwardNoMeasure_031', state);
      expect(measure.callCount()).assertEqual(0);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeForwardNoMeasure_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0320
     * @tc.name selectRangeDefaultReversed032
     * @tc.desc A reversed range selects nothing, moves the caret to the end and keeps the whole message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRangeDefaultReversed_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultReversed_032');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      logRange('selectRangeDefaultReversed_032', 3, 1);
      model.selectByRange(3, 1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultReversed_032', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultReversed_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0330
     * @tc.name selectRangeDefaultEqualTwo033
     * @tc.desc An equal non-zero pair (2, 2) takes the default branch and leaves the message intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultEqualTwo_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultEqualTwo_033');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      let before: string = model.message();
      model.selectByRange(2, 2);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultEqualTwo_033', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(model.message()).assertEqual(before);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultEqualTwo_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0340
     * @tc.name selectRangeDefaultNegativeEqual034
     * @tc.desc The pair (-1, -1) is equal but not zero and therefore takes the default branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultNegativeEqual_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultNegativeEqual_034');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.selectByRange(-1, -1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultNegativeEqual_034', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(6);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultNegativeEqual_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0350
     * @tc.name selectRangeDefaultZeroMinusOne035
     * @tc.desc A start of 0 above an end of -1 is reversed and collapses to the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultZeroMinusOne_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultZeroMinusOne_035');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.selectByRange(0, -1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultZeroMinusOne_035', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultZeroMinusOne_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0360
     * @tc.name selectRangeDefaultNaNStart036
     * @tc.desc A NaN start makes the forward comparison false, so the default branch runs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultNaNStart_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultNaNStart_036');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), SHORT_TEXT, '', '');
      model.selectByRange(NaN, 5);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultNaNStart_036', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultNaNStart_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0370
     * @tc.name selectRangeDefaultEmpty037
     * @tc.desc A reversed range on an empty composer leaves every field at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultEmpty_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultEmpty_037');
      let model: TextEditingModel = freshModel(new UniformMeasure(UNIT_WIDTH));
      model.selectByRange(3, 1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultEmpty_037', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultEmpty_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0380
     * @tc.name selectRangeDefaultMergesSelection038
     * @tc.desc The default branch folds a live selection back into inputText and recomputes the caret offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultMergesSelection_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultMergesSelection_038');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), 'ab', 'cd', 'ef');
      model.selectByRange(3, 1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultMergesSelection_038', state);
      expect(state.inputText).assertEqual('abcdef');
      expect(state.selectInput).assertEqual('cd');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultMergesSelection_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SELECT_RANGE_0390
     * @tc.name selectRangeDefaultEmoji039
     * @tc.desc The default branch keeps a surrogate pair and its trailing letter together
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectRangeDefaultEmoji_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_SELECT_RANGE, 'selectRangeDefaultEmoji_039');
      let model: TextEditingModel = plainModel(new UniformMeasure(UNIT_WIDTH), EMOJI_TEXT, '', '');
      model.selectByRange(3, 1);
      let state: TextState = model.snapshot();
      logState('selectRangeDefaultEmoji_039', state);
      expect(state.inputText).assertEqual(EMOJI_TEXT);
      expect(state.inputText.length).assertEqual(3);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_SELECT_RANGE, 'selectRangeDefaultEmoji_039');
      await yieldToEventLoop();
      done();
    });

  });
}
