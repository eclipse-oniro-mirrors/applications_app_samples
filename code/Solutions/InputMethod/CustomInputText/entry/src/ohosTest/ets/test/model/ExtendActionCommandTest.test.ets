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
  TextEditingModel, TextMeasure, TextState, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure,
  SpyMeasure
} from '../common/TextEditingModel';
import { PageStateModel } from '../common/PageStateModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_EXTEND_ACTION } from '../common/TestConstant';

/**
 * handleExtendAction() and changeSelection() of components/CustomInputText.ets,
 * plus the page-level command flag that arms changeSelection().
 *
 * handleExtendAction only reacts to SELECT_ALL (the value 0, including its -0
 * representation); every other action code is a no-op. changeSelection consumes
 * a start/end pair as given, normalises the order, clamps only the caret and
 * rebuilds the three slices, while the page button merely raises the
 * isChangeSelection flag that the component consumes once.
 */

const CANVAS_WIDTH: number = 320;
const UNIT_WIDTH: number = 10;
const WIDE_WIDTH: number = 20;
const SHORT_TEXT: string = 'abcdef';
const SHORT_LENGTH: number = 6;

function createPlain(inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(UNIT_WIDTH), CANVAS_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function createMeasured(inputText: string, selectInput: string, lastInput: string,
  measure: TextMeasure): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, CANVAS_WIDTH);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function createArbitrary(inputText: string, selectInput: string, lastInput: string,
  cursorIndex: number, selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(UNIT_WIDTH), CANVAS_WIDTH);
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

function stateText(state: TextState): string {
  return 'input=' + state.inputText + ';select=' + state.selectInput + ';last=' + state.lastInput +
    ';cursor=' + state.cursorIndex.toString() + ';anchor=' + state.selectIndex.toString() +
    ';left=' + state.cursorLeft.toString();
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_EXTEND_ACTION, caseName, stateText(state));
}

function expectStateEquals(actual: TextState, expected: TextState): void {
  expect(actual.inputText).assertEqual(expected.inputText);
  expect(actual.selectInput).assertEqual(expected.selectInput);
  expect(actual.lastInput).assertEqual(expected.lastInput);
  expect(actual.cursorIndex).assertEqual(expected.cursorIndex);
  expect(actual.selectIndex).assertEqual(expected.selectIndex);
  expect(actual.cursorLeft).assertEqual(expected.cursorLeft);
}

function nanValue(): number {
  return Number('not-a-number');
}

function negativeZero(): number {
  return 0 * -1;
}

export default function extendActionCommandTest(): void {
  describe('CustomInputTextExtendActionCommandTest', () => {

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0010
     * @tc.name selectAllOnEmptyEditor001
     * @tc.desc Selecting all on an empty editor keeps all three slices empty and the caret at index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllOnEmptyEditor_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllOnEmptyEditor_001');
      let model: TextEditingModel = createPlain('', '', '');
      TestLogger.value(TAG_EXTEND_ACTION, 'action', 'SELECT_ALL is the value 0');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllOnEmptyEditor_001', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllOnEmptyEditor_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0020
     * @tc.name selectAllOnChineseText002
     * @tc.desc Four Chinese characters measure as four wide code units, so the offset is 80 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllOnChineseText_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllOnChineseText_002');
      let model: TextEditingModel = createMeasured('', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.insertText('中文输入');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllOnChineseText_002', state);
      expect(state.selectInput).assertEqual('中文输入');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(80);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllOnChineseText_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0030
     * @tc.name selectAllOnEmojiPair003
     * @tc.desc An emoji is two UTF-16 code units, so the caret index is 2 while the selection holds one glyph
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllOnEmojiPair_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllOnEmojiPair_003');
      let model: TextEditingModel = createMeasured('', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.insertText('😀');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllOnEmojiPair_003', state);
      expect(state.selectInput).assertEqual('😀');
      expect(state.selectInput.length).assertEqual(2);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllOnEmojiPair_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0040
     * @tc.name selectAllOnTwoEmojiPairs004
     * @tc.desc Two emoji occupy four code units and the selection keeps both glyphs intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllOnTwoEmojiPairs_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllOnTwoEmojiPairs_004');
      let model: TextEditingModel = createMeasured('', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.insertText('😀😀');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllOnTwoEmojiPairs_004', state);
      expect(state.selectInput.length).assertEqual(4);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(80);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllOnTwoEmojiPairs_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0050
     * @tc.name selectAllOnZwjFamily005
     * @tc.desc A ZWJ family emoji is eight code units, so selecting all counts eight units and 160 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllOnZwjFamily_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllOnZwjFamily_005');
      let model: TextEditingModel = createMeasured('', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.insertText('👨‍👩‍👧');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllOnZwjFamily_005', state);
      expect(state.selectInput.length).assertEqual(8);
      expect(state.cursorIndex).assertEqual(8);
      expect(state.cursorLeft).assertEqual(160);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllOnZwjFamily_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0060
     * @tc.name selectAllMergesExistingSelection006
     * @tc.desc A pre-existing selection slice is merged with both neighbours before being selected again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllMergesExistingSelection_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllMergesExistingSelection_006');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllMergesExistingSelection_006', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcdef');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(6);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllMergesExistingSelection_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0070
     * @tc.name selectAllMovesCaretToEnd007
     * @tc.desc A caret that was at the start is moved to the end of the message by selecting all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllMovesCaretToEnd_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllMovesCaretToEnd_007');
      let model: TextEditingModel = createArbitrary('abc', '', '', 0, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllMovesCaretToEnd_007', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllMovesCaretToEnd_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0080
     * @tc.name selectAllIgnoresStaleCaret008
     * @tc.desc A stale caret index beyond the message is overwritten by the actual message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllIgnoresStaleCaret_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllIgnoresStaleCaret_008');
      let model: TextEditingModel = createArbitrary('abc', '', '', 99, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllIgnoresStaleCaret_008', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllIgnoresStaleCaret_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0090
     * @tc.name selectAllRepairsNegativeCaret009
     * @tc.desc A negative caret left by a left move at position zero is repaired to the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllRepairsNegativeCaret_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllRepairsNegativeCaret_009');
      let model: TextEditingModel = createArbitrary('abc', '', '', -5, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllRepairsNegativeCaret_009', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.selectInput).assertEqual('abc');
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllRepairsNegativeCaret_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0100
     * @tc.name selectAllRepairsNaNCarret010
     * @tc.desc A NaN caret produced by clicking an empty editor is overwritten by the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllRepairsNaNCarret_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllRepairsNaNCarret_010');
      let model: TextEditingModel = createArbitrary('abc', '', '', nanValue(), 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllRepairsNaNCarret_010', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(Number.isNaN(state.cursorIndex)).assertFalse();
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllRepairsNaNCarret_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0110
     * @tc.name selectAllPropagatesNaNOffset011
     * @tc.desc A measure that returns NaN yields a NaN caret offset because the width is copied verbatim
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllPropagatesNaNOffset_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllPropagatesNaNOffset_011');
      let model: TextEditingModel = createMeasured('abc', '', '', new FixedMeasure(NaN));
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllPropagatesNaNOffset_011', state);
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      expect(state.selectInput).assertEqual('abc');
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllPropagatesNaNOffset_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0120
     * @tc.name selectAllIgnoresCanvasWidth012
     * @tc.desc Selecting all is not subject to the width guard, even on a zero-width canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllIgnoresCanvasWidth_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllIgnoresCanvasWidth_012');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(UNIT_WIDTH), 0);
      model.loadPlain('abc', '', '');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllIgnoresCanvasWidth_012', state);
      expect(state.selectInput).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(30);
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllIgnoresCanvasWidth_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0130
     * @tc.name selectAllMeasuresWholeMessageOnce013
     * @tc.desc Exactly one measure call is made and its argument is the whole message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'selectAllMeasuresWholeMessageOnce_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'selectAllMeasuresWholeMessageOnce_013');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain('abc', '', '');
      spy.reset();
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllMeasuresWholeMessageOnce_013', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.calls[0]).assertEqual('abc');
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_EXTEND_ACTION, 'selectAllMeasuresWholeMessageOnce_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0140
     * @tc.name cutActionIsNoOp014
     * @tc.desc CUT (3) is not handled, so the plain message keeps its partition and every index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cutActionIsNoOp_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'cutActionIsNoOp_014');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(3);
      let state: TextState = model.snapshot();
      logState('cutActionIsNoOp_014', state);
      expectStateEquals(state, before);
      expect(model.message()).assertEqual(SHORT_TEXT);
      TestLogger.end(TAG_EXTEND_ACTION, 'cutActionIsNoOp_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0150
     * @tc.name copyActionIsNoOp015
     * @tc.desc COPY (4) leaves the selection and the caret untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'copyActionIsNoOp_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'copyActionIsNoOp_015');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      let before: TextState = model.snapshot();
      model.handleExtendAction(4);
      let state: TextState = model.snapshot();
      logState('copyActionIsNoOp_015', state);
      expectStateEquals(state, before);
      expect(state.selectInput).assertEqual('cd');
      TestLogger.end(TAG_EXTEND_ACTION, 'copyActionIsNoOp_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0160
     * @tc.name pasteActionIsNoOp016
     * @tc.desc PASTE (5) does not insert anything because the handler only knows SELECT_ALL
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pasteActionIsNoOp_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'pasteActionIsNoOp_016');
      let model: TextEditingModel = createPlain('abc', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(5);
      let state: TextState = model.snapshot();
      logState('pasteActionIsNoOp_016', state);
      expectStateEquals(state, before);
      expect(state.inputText).assertEqual('abc');
      TestLogger.end(TAG_EXTEND_ACTION, 'pasteActionIsNoOp_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0170
     * @tc.name negativeActionIsNoOp017
     * @tc.desc Minus one is not zero and therefore does not trigger select-all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeActionIsNoOp_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'negativeActionIsNoOp_017');
      let model: TextEditingModel = createPlain('abc', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(-1);
      let state: TextState = model.snapshot();
      logState('negativeActionIsNoOp_017', state);
      expectStateEquals(state, before);
      expect(state.inputText).assertEqual('abc');
      TestLogger.end(TAG_EXTEND_ACTION, 'negativeActionIsNoOp_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0180
     * @tc.name naNActionIsNoOp018
     * @tc.desc A NaN action fails the strict equality with zero and changes nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'naNActionIsNoOp_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'naNActionIsNoOp_018');
      let model: TextEditingModel = createPlain('abc', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(nanValue());
      let state: TextState = model.snapshot();
      logState('naNActionIsNoOp_018', state);
      expectStateEquals(state, before);
      TestLogger.end(TAG_EXTEND_ACTION, 'naNActionIsNoOp_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0190
     * @tc.name fractionalActionIsNoOp019
     * @tc.desc One and a half is not equal to zero, so the fractional action is ignored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'fractionalActionIsNoOp_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'fractionalActionIsNoOp_019');
      let model: TextEditingModel = createPlain('abc', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(1.5);
      let state: TextState = model.snapshot();
      logState('fractionalActionIsNoOp_019', state);
      expectStateEquals(state, before);
      TestLogger.end(TAG_EXTEND_ACTION, 'fractionalActionIsNoOp_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0200
     * @tc.name halfActionIsNoOp020
     * @tc.desc Zero point five is inside the numeric range but still not zero, so nothing is selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'halfActionIsNoOp_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'halfActionIsNoOp_020');
      let model: TextEditingModel = createPlain('abc', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(0.5);
      let state: TextState = model.snapshot();
      logState('halfActionIsNoOp_020', state);
      expectStateEquals(state, before);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_EXTEND_ACTION, 'halfActionIsNoOp_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0210
     * @tc.name negativeZeroActionSelectsAll021
     * @tc.desc Negative zero compares strictly equal to zero, so it runs the select-all branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'negativeZeroActionSelectsAll_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'negativeZeroActionSelectsAll_021');
      let model: TextEditingModel = createPlain('abc', '', '');
      model.handleExtendAction(negativeZero());
      let state: TextState = model.snapshot();
      logState('negativeZeroActionSelectsAll_021', state);
      expect(state.selectInput).assertEqual('abc');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_EXTEND_ACTION, 'negativeZeroActionSelectsAll_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0220
     * @tc.name noOpKeepsSelectionState022
     * @tc.desc An ignored action keeps a three-slice partition with a live selection byte for byte
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'noOpKeepsSelectionState_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpKeepsSelectionState_022');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      let before: TextState = model.snapshot();
      model.handleExtendAction(3);
      let state: TextState = model.snapshot();
      logState('noOpKeepsSelectionState_022', state);
      expectStateEquals(state, before);
      expect(state.selectInput).assertEqual('cd');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpKeepsSelectionState_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0230
     * @tc.name noOpNeverMeasures023
     * @tc.desc An ignored action calls the measure function zero times
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'noOpNeverMeasures_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpNeverMeasures_023');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(UNIT_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain('abc', '', '');
      spy.reset();
      model.handleExtendAction(3);
      let state: TextState = model.snapshot();
      logState('noOpNeverMeasures_023', state);
      expect(spy.callCount()).assertEqual(0);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpNeverMeasures_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0240
     * @tc.name noOpOnEmptyEditor024
     * @tc.desc An ignored action on an empty editor leaves every field at its default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'noOpOnEmptyEditor_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpOnEmptyEditor_024');
      let model: TextEditingModel = createPlain('', '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(5);
      let state: TextState = model.snapshot();
      logState('noOpOnEmptyEditor_024', state);
      expectStateEquals(state, before);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpOnEmptyEditor_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0250
     * @tc.name noOpOnLongText025
     * @tc.desc An ignored action on a 255-character message keeps the full text and its caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'noOpOnLongText_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpOnLongText_025');
      let text: string = buildRepeated('z', 255);
      let model: TextEditingModel = createPlain(text, '', '');
      let before: TextState = model.snapshot();
      model.handleExtendAction(4);
      let state: TextState = model.snapshot();
      logState('noOpOnLongText_025', state);
      expectStateEquals(state, before);
      expect(state.inputText.length).assertEqual(255);
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpOnLongText_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0260
     * @tc.name noOpDoesNotConsumePageCommand026
     * @tc.desc An ignored extend action leaves the page's pending changeSelection flag armed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'noOpDoesNotConsumePageCommand_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpDoesNotConsumePageCommand_026');
      let page: PageStateModel = new PageStateModel();
      page.clickChangeSelection();
      let model: TextEditingModel = createPlain('abc', '', '');
      model.handleExtendAction(3);
      let pending: boolean = page.consumeChangeSelection();
      expect(pending).assertTrue();
      expect(page.isChangeSelection).assertFalse();
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpDoesNotConsumePageCommand_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0270
     * @tc.name noOpKeepsComposedMessage027
     * @tc.desc An ignored action preserves the exact message string, including both neighbours
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'noOpKeepsComposedMessage_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpKeepsComposedMessage_027');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      let before: string = model.message();
      model.handleExtendAction(1);
      let state: TextState = model.snapshot();
      logState('noOpKeepsComposedMessage_027', state);
      expect(model.message()).assertEqual(before);
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpKeepsComposedMessage_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0280
     * @tc.name noOpKeepsSelectionText028
     * @tc.desc An ignored action keeps a two-character selection exactly where it was
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'noOpKeepsSelectionText_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'noOpKeepsSelectionText_028');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      model.handleExtendAction(2);
      let state: TextState = model.snapshot();
      logState('noOpKeepsSelectionText_028', state);
      expect(state.selectInput).assertEqual('cd');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(4);
      TestLogger.end(TAG_EXTEND_ACTION, 'noOpKeepsSelectionText_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0290
     * @tc.name endFlagRangeAfterSelectAllKeepsOffset029
     * @tc.desc The END_FLAG range after select-all leaves the cached 30 px offset unrecomputed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'endFlagRangeAfterSelectAllKeepsOffset_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'endFlagRangeAfterSelectAllKeepsOffset_029');
      let model: TextEditingModel = createPlain('abc', '', '');
      model.handleExtendAction(0);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('endFlagRangeAfterSelectAllKeepsOffset_029', state);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_EXTEND_ACTION, 'endFlagRangeAfterSelectAllKeepsOffset_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0300
     * @tc.name forwardRangeZeroToOne030
     * @tc.desc A range over the first character leaves it selected and the rest in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeZeroToOne_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeZeroToOne_030');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(0, 1);
      let state: TextState = model.snapshot();
      logState('forwardRangeZeroToOne_030', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeZeroToOne_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0310
     * @tc.name forwardRangeEmptySelection031
     * @tc.desc Equal non-zero bounds produce an empty selection and split the text at that point
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeEmptySelection_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeEmptySelection_031');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(2, 2);
      let state: TextState = model.snapshot();
      logState('forwardRangeEmptySelection_031', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('cdef');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeEmptySelection_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0320
     * @tc.name forwardRangeAtLength032
     * @tc.desc A range from the message length to itself leaves the whole text before an empty caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeAtLength_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeAtLength_032');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(SHORT_LENGTH, SHORT_LENGTH);
      let state: TextState = model.snapshot();
      logState('forwardRangeAtLength_032', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SHORT_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeAtLength_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0330
     * @tc.name forwardRangeZeroZero033
     * @tc.desc The zero range selects nothing and leaves the whole message in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeZeroZero_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeZeroZero_033');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(0, 0);
      let state: TextState = model.snapshot();
      logState('forwardRangeZeroZero_033', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual(SHORT_TEXT);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeZeroZero_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0340
     * @tc.name forwardRangeSingleCharacter034
     * @tc.desc A three-to-four range selects exactly one character and keeps both neighbours
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeSingleCharacter_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeSingleCharacter_034');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(3, 4);
      let state: TextState = model.snapshot();
      logState('forwardRangeSingleCharacter_034', state);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('d');
      expect(state.lastInput).assertEqual('ef');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeSingleCharacter_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0350
     * @tc.name forwardRangeEmojiMiddle035
     * @tc.desc A range over the emoji selects both of its surrogate units and leaves 'a' and 'b' outside
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'forwardRangeEmojiMiddle_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeEmojiMiddle_035');
      let model: TextEditingModel = createMeasured('a😀b', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.changeSelection(1, 3);
      let state: TextState = model.snapshot();
      logState('forwardRangeEmojiMiddle_035', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('😀');
      expect(state.lastInput).assertEqual('b');
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeEmojiMiddle_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0360
     * @tc.name forwardRangeEmojiToEnd036
     * @tc.desc A two-to-four range splits the surrogate pair: the high half stays with the leading letter and the low half joins the final letter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'forwardRangeEmojiToEnd_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeEmojiToEnd_036');
      let model: TextEditingModel = createMeasured('a😀b', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.changeSelection(2, 4);
      let state: TextState = model.snapshot();
      logState('forwardRangeEmojiToEnd_036', state);
      expect(state.inputText).assertEqual('a\uD83D');
      expect(state.selectInput).assertEqual('\uDE00b');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeEmojiToEnd_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0370
     * @tc.name forwardRangeSplitsSurrogatePair037
     * @tc.desc A zero-to-four range cuts the family emoji inside a surrogate pair, leaving a lone high surrogate selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'forwardRangeSplitsSurrogatePair_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeSplitsSurrogatePair_037');
      let text: string = '👨‍👩‍👧';
      let model: TextEditingModel = createMeasured(text, '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.changeSelection(0, 4);
      let state: TextState = model.snapshot();
      logState('forwardRangeSplitsSurrogatePair_037', state);
      expect(state.selectInput.length).assertEqual(4);
      expect(state.selectInput.charCodeAt(3)).assertEqual(0xD83D);
      expect(state.lastInput.length).assertEqual(4);
      expect(state.cursorLeft).assertEqual(80);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeSplitsSurrogatePair_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0380
     * @tc.name forwardRangeOnEmptyText038
     * @tc.desc The zero range on an empty editor leaves every slice empty and the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'forwardRangeOnEmptyText_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeOnEmptyText_038');
      let model: TextEditingModel = createPlain('', '', '');
      model.changeSelection(0, 0);
      let state: TextState = model.snapshot();
      logState('forwardRangeOnEmptyText_038', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeOnEmptyText_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0390
     * @tc.name forwardRangeWholeLongLine039
     * @tc.desc A zero-to-255 range selects the entire long line and reports a 2550 px offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'forwardRangeWholeLongLine_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'forwardRangeWholeLongLine_039');
      let text: string = buildRepeated('n', 255);
      let model: TextEditingModel = createPlain(text, '', '');
      model.changeSelection(0, 255);
      let state: TextState = model.snapshot();
      logState('forwardRangeWholeLongLine_039', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput.length).assertEqual(255);
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(2550);
      TestLogger.end(TAG_EXTEND_ACTION, 'forwardRangeWholeLongLine_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0400
     * @tc.name reversedRangeWholeText040
     * @tc.desc A six-to-zero range selects all six characters with the anchor at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'reversedRangeWholeText_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeWholeText_040');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(SHORT_LENGTH, 0);
      let state: TextState = model.snapshot();
      logState('reversedRangeWholeText_040', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual(SHORT_TEXT);
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(SHORT_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeWholeText_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0410
     * @tc.name reversedRangeOneToZero041
     * @tc.desc A one-to-zero range selects only the first character with the anchor at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'reversedRangeOneToZero_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeOneToZero_041');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(1, 0);
      let state: TextState = model.snapshot();
      logState('reversedRangeOneToZero_041', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeOneToZero_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0420
     * @tc.name reversedRangeEmoji042
     * @tc.desc A four-to-two range splits the surrogate pair: the high half stays with the leading letter and the low half joins the final letter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'reversedRangeEmoji_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeEmoji_042');
      let model: TextEditingModel = createMeasured('a😀b', '', '', new MixedMeasure(UNIT_WIDTH, WIDE_WIDTH));
      model.changeSelection(4, 2);
      let state: TextState = model.snapshot();
      logState('reversedRangeEmoji_042', state);
      expect(state.inputText).assertEqual('a\uD83D');
      expect(state.selectInput).assertEqual('\uDE00b');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeEmoji_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0430
     * @tc.name reversedRangeAdjacent043
     * @tc.desc A two-to-one range selects exactly the second character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'reversedRangeAdjacent_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeAdjacent_043');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(2, 1);
      let state: TextState = model.snapshot();
      logState('reversedRangeAdjacent_043', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('b');
      expect(state.lastInput).assertEqual('cdef');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeAdjacent_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0440
     * @tc.name equalBoundsAtEnd044
     * @tc.desc Equal bounds at the message length behave like a forward empty range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'equalBoundsAtEnd_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'equalBoundsAtEnd_044');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(SHORT_LENGTH, SHORT_LENGTH);
      let state: TextState = model.snapshot();
      logState('equalBoundsAtEnd_044', state);
      expect(state.inputText).assertEqual(SHORT_TEXT);
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(SHORT_LENGTH);
      TestLogger.end(TAG_EXTEND_ACTION, 'equalBoundsAtEnd_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0450
     * @tc.name reversedRangeClampsCaret045
     * @tc.desc A seven-to-three range clamps the caret to six while keeping the anchor at three
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'reversedRangeClampsCaret_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeClampsCaret_045');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(7, 3);
      let state: TextState = model.snapshot();
      logState('reversedRangeClampsCaret_045', state);
      expect(state.inputText).assertEqual('abc');
      expect(state.selectInput).assertEqual('def');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(3);
      expect(state.cursorIndex).assertEqual(SHORT_LENGTH);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeClampsCaret_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0460
     * @tc.name reversedRangeFarStartClampsCaret046
     * @tc.desc A hundred-to-two range clamps the caret to six and keeps the anchor at two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'reversedRangeFarStartClampsCaret_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeFarStartClampsCaret_046');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(100, 2);
      let state: TextState = model.snapshot();
      logState('reversedRangeFarStartClampsCaret_046', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cdef');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(SHORT_LENGTH);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeFarStartClampsCaret_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0470
     * @tc.name reversedRangeNegativeEnd047
     * @tc.desc A four-to-minus-one range leaves the negative anchor to substring and selects the first four
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'reversedRangeNegativeEnd_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeNegativeEnd_047');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(4, -1);
      let state: TextState = model.snapshot();
      logState('reversedRangeNegativeEnd_047', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abcd');
      expect(state.lastInput).assertEqual('ef');
      expect(state.selectIndex).assertEqual(-1);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeNegativeEnd_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0480
     * @tc.name reversedRangeWithLiveSelection048
     * @tc.desc A reversed range overwrites a live selection and re-partitions the composed message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'reversedRangeWithLiveSelection_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'reversedRangeWithLiveSelection_048');
      let model: TextEditingModel = createPlain('ab', 'cd', 'ef');
      model.changeSelection(5, 2);
      let state: TextState = model.snapshot();
      logState('reversedRangeWithLiveSelection_048', state);
      expect(state.inputText).assertEqual('ab');
      expect(state.selectInput).assertEqual('cde');
      expect(state.lastInput).assertEqual('f');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(5);
      TestLogger.end(TAG_EXTEND_ACTION, 'reversedRangeWithLiveSelection_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_EXTEND_ACTION_0490
     * @tc.name negativeEndReversedRange049
     * @tc.desc A one-to-minus-one range normalises to a negative anchor and keeps one selected character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'negativeEndReversedRange_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_EXTEND_ACTION, 'negativeEndReversedRange_049');
      let model: TextEditingModel = createPlain(SHORT_TEXT, '', '');
      model.changeSelection(1, -1);
      let state: TextState = model.snapshot();
      logState('negativeEndReversedRange_049', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('a');
      expect(state.lastInput).assertEqual('bcdef');
      expect(state.selectIndex).assertEqual(-1);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_EXTEND_ACTION, 'negativeEndReversedRange_049');
      await yieldToEventLoop();
      done();
    });

  });
}
