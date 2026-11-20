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

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_UNICODE, caseName,
    state.inputText + '|' + state.selectInput + '|' + state.lastInput +
    '|cursor=' + state.cursorIndex.toString() + '|anchor=' + state.selectIndex.toString() +
    '|left=' + state.cursorLeft.toString());
}

export default function textUnicodeEditingTestExtra(): void {
  describe('CustomInputTextUnicodeEditingExtraTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0640
     * @tc.name moveUpToStartEmoji064
     * @tc.desc An up move from the emoji fixture folds the whole message into lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveUpToStartEmoji_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveUpToStartEmoji_064');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.moveCursor(1);
      let state: TextState = model.snapshot();
      logState('moveUpToStartEmoji_064', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'moveUpToStartEmoji_064');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0650
     * @tc.name moveDownToEndEmoji065
     * @tc.desc A down move from index 0 of the emoji fixture folds the whole message into inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveDownToEndEmoji_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveDownToEndEmoji_065');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.moveCursor(2);
      let state: TextState = model.snapshot();
      logState('moveDownToEndEmoji_065', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'moveDownToEndEmoji_065');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0660
     * @tc.name moveLeftAtZeroGoesNegative066
     * @tc.desc A left move at index 0 produces cursorIndex -1 while substring still keeps the whole message in lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveLeftAtZeroGoesNegative_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveLeftAtZeroGoesNegative_066');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveLeftAtZeroGoesNegative_066', state);
      expect(state.cursorIndex).assertEqual(-1);
      expect(state.selectIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'moveLeftAtZeroGoesNegative_066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0670
     * @tc.name moveFoldsSelectionSlice067
     * @tc.desc A left move folds the selected emoji back into the message before splitting
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveFoldsSelectionSlice_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveFoldsSelectionSlice_067');
      let model: TextEditingModel = mixState(320, 'a', '\uD83D\uDE00', '', 3, 1, 8);
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveFoldsSelectionSlice_067', state);
      expect(state.selectInput).assertEqual('');
      expect(state.inputText).assertEqual('a' + '\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'moveFoldsSelectionSlice_067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0680
     * @tc.name moveInvalidDirectionZeroResplits068
     * @tc.desc Direction 0 matches no branch and the message is merely re-split at the current caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveInvalidDirectionZeroResplits_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveInvalidDirectionZeroResplits_068');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 1, 0, 16);
      model.moveCursor(0);
      let state: TextState = model.snapshot();
      logState('moveInvalidDirectionZeroResplits_068', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveInvalidDirectionZeroResplits_068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0690
     * @tc.name moveInvalidDirectionFiveResplits069
     * @tc.desc Direction 5 matches no branch and the message is re-split at the current caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveInvalidDirectionFiveResplits_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveInvalidDirectionFiveResplits_069');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 1, 0, 16);
      model.moveCursor(5);
      let state: TextState = model.snapshot();
      logState('moveInvalidDirectionFiveResplits_069', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveInvalidDirectionFiveResplits_069');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0700
     * @tc.name moveInvalidDirectionNaNResplits070
     * @tc.desc A NaN direction matches no branch and the message is re-split at the current caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveInvalidDirectionNaNResplits_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveInvalidDirectionNaNResplits_070');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 1, 0, 16);
      model.moveCursor(NaN);
      let state: TextState = model.snapshot();
      logState('moveInvalidDirectionNaNResplits_070', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveInvalidDirectionNaNResplits_070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0710
     * @tc.name moveSpyMeasuresOnce071
     * @tc.desc moveCursor measures the new inputText exactly once after folding the message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveSpyMeasuresOnce_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveSpyMeasuresOnce_071');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('moveSpyMeasuresOnce_071', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'moveSpyMeasuresOnce_071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0720
     * @tc.name moveDownClampsStaleCaret072
     * @tc.desc A down move ignores a stale caret beyond the message and lands on the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveDownClampsStaleCaret_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveDownClampsStaleCaret_072');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 9, 0, 99);
      model.moveCursor(2);
      let state: TextState = model.snapshot();
      logState('moveDownClampsStaleCaret_072', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'moveDownClampsStaleCaret_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0730
     * @tc.name moveRightFromNegativeCaret073
     * @tc.desc A right move from a negative caret increments it to zero and keeps the whole message in lastInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightFromNegativeCaret_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'moveRightFromNegativeCaret_073');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', -1, -1, 0);
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logState('moveRightFromNegativeCaret_073', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'moveRightFromNegativeCaret_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0740
     * @tc.name selectRightAscii074
     * @tc.desc Moving the anchor right from 0 selects the rest of the ascii fixture while the caret stays at the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRightAscii_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectRightAscii_074');
      let model: TextEditingModel = mixState(320, 'abc', '', '', 3, 0, 24);
      model.selectByMovement(4);
      let state: TextState = model.snapshot();
      logState('selectRightAscii_074', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('bc');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(1);
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'selectRightAscii_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0750
     * @tc.name selectRightCjk075
     * @tc.desc Moving the anchor right from 0 selects the rest of the cjk fixture while the caret stays at the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRightCjk_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectRightCjk_075');
      let model: TextEditingModel = mixState(320, '中文', '', '', 2, 0, 32);
      model.selectByMovement(4);
      let state: TextState = model.snapshot();
      logState('selectRightCjk_075', state);
      expect(state.inputText).assertEqual('中');
      expect(state.selectInput).assertEqual('文');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(1);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'selectRightCjk_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0760
     * @tc.name selectRightEmoji076
     * @tc.desc Moving the anchor right from 0 selects the rest of the emoji fixture while the caret stays at the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRightEmoji_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectRightEmoji_076');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 0, 32);
      model.selectByMovement(4);
      let state: TextState = model.snapshot();
      logState('selectRightEmoji_076', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.selectInput).assertEqual('\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(1);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'selectRightEmoji_076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0770
     * @tc.name selectDownAscii077
     * @tc.desc Moving the anchor down to the end of the ascii fixture yields a whole-message selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectDownAscii_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectDownAscii_077');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.selectByMovement(2);
      let state: TextState = model.snapshot();
      logState('selectDownAscii_077', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(3);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'selectDownAscii_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0780
     * @tc.name selectDownCjk078
     * @tc.desc Moving the anchor down to the end of the cjk fixture yields a whole-message selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectDownCjk_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectDownCjk_078');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.selectByMovement(2);
      let state: TextState = model.snapshot();
      logState('selectDownCjk_078', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'selectDownCjk_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0790
     * @tc.name selectDownEmoji079
     * @tc.desc Moving the anchor down to the end of the emoji fixture yields a whole-message selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectDownEmoji_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectDownEmoji_079');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.selectByMovement(2);
      let state: TextState = model.snapshot();
      logState('selectDownEmoji_079', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'selectDownEmoji_079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0800
     * @tc.name selectRightClampedAtEnd080
     * @tc.desc Moving the anchor right while it already sits at the message length leaves an empty selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectRightClampedAtEnd_080', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectRightClampedAtEnd_080');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 2, 32);
      model.selectByMovement(4);
      let state: TextState = model.snapshot();
      logState('selectRightClampedAtEnd_080', state);
      expect(state.selectInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'selectRightClampedAtEnd_080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0810
     * @tc.name selectLeftClampedAtZero081
     * @tc.desc Moving the anchor left at zero does not go negative and still leaves the emoji selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectLeftClampedAtZero_081', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectLeftClampedAtZero_081');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 0, 32);
      model.selectByMovement(3);
      let state: TextState = model.snapshot();
      logState('selectLeftClampedAtZero_081', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'selectLeftClampedAtZero_081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0820
     * @tc.name selectUpFromEndSelectsAll082
     * @tc.desc Moving the anchor up from the end selects the emoji and leaves an empty trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectUpFromEndSelectsAll_082', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectUpFromEndSelectsAll_082');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 2, 32);
      model.selectByMovement(1);
      let state: TextState = model.snapshot();
      logState('selectUpFromEndSelectsAll_082', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'selectUpFromEndSelectsAll_082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0830
     * @tc.name selectDownWithCaretAtEnd083
     * @tc.desc Moving the anchor down to the caret position produces an empty selection and a full prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectDownWithCaretAtEnd_083', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectDownWithCaretAtEnd_083');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 0, 32);
      model.selectByMovement(2);
      let state: TextState = model.snapshot();
      logState('selectDownWithCaretAtEnd_083', state);
      expect(state.selectIndex).assertEqual(2);
      expect(state.selectInput).assertEqual('');
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'selectDownWithCaretAtEnd_083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0840
     * @tc.name selectInvalidDirectionResplits084
     * @tc.desc Direction 9 leaves the anchor untouched but still rebuilds the three slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectInvalidDirectionResplits_084', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectInvalidDirectionResplits_084');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 1, 32);
      model.selectByMovement(9);
      let state: TextState = model.snapshot();
      logState('selectInvalidDirectionResplits_084', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.selectInput).assertEqual('\uDE00');
      TestLogger.end(TAG_UNICODE, 'selectInvalidDirectionResplits_084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0850
     * @tc.name selectNanDirectionResplits085
     * @tc.desc A NaN direction leaves the anchor untouched and rebuilds the slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectNanDirectionResplits_085', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectNanDirectionResplits_085');
      let model: TextEditingModel = mixState(320, '\uD83D\uDE00', '', '', 2, 1, 32);
      model.selectByMovement(NaN);
      let state: TextState = model.snapshot();
      logState('selectNanDirectionResplits_085', state);
      expect(state.selectIndex).assertEqual(1);
      expect(state.selectInput).assertEqual('\uDE00');
      TestLogger.end(TAG_UNICODE, 'selectNanDirectionResplits_085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0860
     * @tc.name selectMovementNeverMeasures086
     * @tc.desc selectByMovement never recomputes cursorLeft
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectMovementNeverMeasures_086', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectMovementNeverMeasures_086');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadState({ inputText: '\uD83D\uDE00', selectInput: '', lastInput: '', cursorIndex: 2, selectIndex: 0, cursorLeft: 32 });
      model.selectByMovement(4);
      let state: TextState = model.snapshot();
      logState('selectMovementNeverMeasures_086', state);
      expect(spy.callCount()).assertEqual(0);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'selectMovementNeverMeasures_086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0870
     * @tc.name rangeResetAscii087
     * @tc.desc The (0, 0) range moves the whole ascii fixture into lastInput and parks the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetAscii_087', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeResetAscii_087');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('rangeResetAscii_087', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'rangeResetAscii_087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0880
     * @tc.name rangeEndFlagAscii088
     * @tc.desc END_FLAG selects the whole ascii fixture when the caret is at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagAscii_088', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagAscii_088');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagAscii_088', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagAscii_088');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0890
     * @tc.name rangeForwardAscii089
     * @tc.desc A plain forward range with the caret at the end keeps the ascii fixture selected as a prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeForwardAscii_089', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeForwardAscii_089');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.selectByRange(0, 1);
      let state: TextState = model.snapshot();
      logState('rangeForwardAscii_089', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'rangeForwardAscii_089');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0900
     * @tc.name rangeResetCjk090
     * @tc.desc The (0, 0) range moves the whole cjk fixture into lastInput and parks the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetCjk_090', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeResetCjk_090');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('rangeResetCjk_090', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('中文');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'rangeResetCjk_090');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0910
     * @tc.name rangeEndFlagCjk091
     * @tc.desc END_FLAG selects the whole cjk fixture when the caret is at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagCjk_091', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagCjk_091');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagCjk_091', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagCjk_091');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0920
     * @tc.name rangeForwardCjk092
     * @tc.desc A plain forward range with the caret at the end keeps the cjk fixture selected as a prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeForwardCjk_092', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeForwardCjk_092');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.selectByRange(0, 1);
      let state: TextState = model.snapshot();
      logState('rangeForwardCjk_092', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中文');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'rangeForwardCjk_092');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0930
     * @tc.name rangeResetEmoji093
     * @tc.desc The (0, 0) range moves the whole emoji fixture into lastInput and parks the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetEmoji_093', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeResetEmoji_093');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('rangeResetEmoji_093', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'rangeResetEmoji_093');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0940
     * @tc.name rangeEndFlagEmoji094
     * @tc.desc END_FLAG selects the whole emoji fixture when the caret is at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagEmoji_094', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagEmoji_094');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagEmoji_094', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagEmoji_094');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0950
     * @tc.name rangeForwardEmoji095
     * @tc.desc A plain forward range with the caret at the end keeps the emoji fixture selected as a prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeForwardEmoji_095', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeForwardEmoji_095');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.selectByRange(0, 1);
      let state: TextState = model.snapshot();
      logState('rangeForwardEmoji_095', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'rangeForwardEmoji_095');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0960
     * @tc.name rangeDefaultParksCaretAtEnd096
     * @tc.desc A non-forward, non-zero range moves the emoji into inputText and parks the caret at the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeDefaultParksCaretAtEnd_096', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeDefaultParksCaretAtEnd_096');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.selectByRange(2, 2);
      let state: TextState = model.snapshot();
      logState('rangeDefaultParksCaretAtEnd_096', state);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'rangeDefaultParksCaretAtEnd_096');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0970
     * @tc.name rangeDefaultKeepsExistingSelection097
     * @tc.desc The default branch rewrites inputText and lastInput but leaves a pre-existing selection slice unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeDefaultKeepsExistingSelection_097', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeDefaultKeepsExistingSelection_097');
      let model: TextEditingModel = mixState(320, '', 'x', '\uD83D\uDE00', 0, 0, 0);
      model.selectByRange(5, 5);
      let state: TextState = model.snapshot();
      logState('rangeDefaultKeepsExistingSelection_097', state);
      expect(state.selectInput).assertEqual('x');
      expect(state.inputText).assertEqual('x' + '\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'rangeDefaultKeepsExistingSelection_097');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0980
     * @tc.name rangeForwardSplitsAtCaretOne098
     * @tc.desc A forward range with the caret at one unit keeps the first unit selected and the rest trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeForwardSplitsAtCaretOne_098', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeForwardSplitsAtCaretOne_098');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 1, 0, 16);
      model.selectByRange(0, 1);
      let state: TextState = model.snapshot();
      logState('rangeForwardSplitsAtCaretOne_098', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      TestLogger.end(TAG_UNICODE, 'rangeForwardSplitsAtCaretOne_098');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_0990
     * @tc.name rangeEndFlagSplitsAtCaretOne099
     * @tc.desc END_FLAG with the caret inside the emoji selects only the right half
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagSplitsAtCaretOne_099', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagSplitsAtCaretOne_099');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 1, 0, 16);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagSplitsAtCaretOne_099', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.selectInput).assertEqual('\uDE00');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagSplitsAtCaretOne_099');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1000
     * @tc.name rangeEndFlagNeverMeasures100
     * @tc.desc The END_FLAG branch does not recompute cursorLeft
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagNeverMeasures_100', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagNeverMeasures_100');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadState({ inputText: '', selectInput: '', lastInput: '\uD83D\uDE00', cursorIndex: 0, selectIndex: 0, cursorLeft: 77 });
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagNeverMeasures_100', state);
      expect(spy.callCount()).assertEqual(0);
      expect(state.cursorLeft).assertEqual(77);
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagNeverMeasures_100');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1010
     * @tc.name rangeResetMeasuresEmpty101
     * @tc.desc The (0, 0) branch measures the empty prefix once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetMeasuresEmpty_101', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeResetMeasuresEmpty_101');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('rangeResetMeasuresEmpty_101', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'rangeResetMeasuresEmpty_101');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1020
     * @tc.name rangeDefaultMeasuresMessage102
     * @tc.desc The default branch measures the whole message once for the new caret offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeDefaultMeasuresMessage_102', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeDefaultMeasuresMessage_102');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('', '', '\uD83D\uDE00');
      spy.reset();
      model.selectByRange(2, 2);
      let state: TextState = model.snapshot();
      logState('rangeDefaultMeasuresMessage_102', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D\uDE00')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'rangeDefaultMeasuresMessage_102');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1030
     * @tc.name rangeResetOnEmpty103
     * @tc.desc The (0, 0) branch on an empty composer leaves all fields empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetOnEmpty_103', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeResetOnEmpty_103');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logState('rangeResetOnEmpty_103', state);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'rangeResetOnEmpty_103');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1040
     * @tc.name rangeEndFlagOnEmpty104
     * @tc.desc END_FLAG on an empty composer selects nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeEndFlagOnEmpty_104', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeEndFlagOnEmpty_104');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('rangeEndFlagOnEmpty_104', state);
      expect(state.selectInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'rangeEndFlagOnEmpty_104');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1050
     * @tc.name rangeForwardOnEmpty105
     * @tc.desc A forward range on an empty composer leaves every slice empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeForwardOnEmpty_105', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeForwardOnEmpty_105');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.selectByRange(0, 1);
      let state: TextState = model.snapshot();
      logState('rangeForwardOnEmpty_105', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'rangeForwardOnEmpty_105');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1060
     * @tc.name rangeDefaultOnEmpty106
     * @tc.desc The default branch on an empty composer parks the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeDefaultOnEmpty_106', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'rangeDefaultOnEmpty_106');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.selectByRange(1, 1);
      let state: TextState = model.snapshot();
      logState('rangeDefaultOnEmpty_106', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'rangeDefaultOnEmpty_106');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1070
     * @tc.name changeFullAscii107
     * @tc.desc A 0..3 range selects the whole ascii fixture in selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFullAscii_107', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFullAscii_107');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.changeSelection(0, 3);
      let state: TextState = model.snapshot();
      logState('changeFullAscii_107', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(24);
      TestLogger.end(TAG_UNICODE, 'changeFullAscii_107');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1080
     * @tc.name changeReversedAscii108
     * @tc.desc A reversed 3..0 range selects the same ascii text with normalised indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeReversedAscii_108', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeReversedAscii_108');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.changeSelection(3, 0);
      let state: TextState = model.snapshot();
      logState('changeReversedAscii_108', state);
      expect(state.selectInput).assertEqual('abc');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'changeReversedAscii_108');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1090
     * @tc.name changeFullCjk109
     * @tc.desc A 0..2 range selects the whole cjk fixture in selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFullCjk_109', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFullCjk_109');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.changeSelection(0, 2);
      let state: TextState = model.snapshot();
      logState('changeFullCjk_109', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'changeFullCjk_109');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1100
     * @tc.name changeReversedCjk110
     * @tc.desc A reversed 2..0 range selects the same cjk text with normalised indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeReversedCjk_110', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeReversedCjk_110');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.changeSelection(2, 0);
      let state: TextState = model.snapshot();
      logState('changeReversedCjk_110', state);
      expect(state.selectInput).assertEqual('中文');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'changeReversedCjk_110');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1110
     * @tc.name changeFullEmoji111
     * @tc.desc A 0..2 range selects the whole emoji fixture in selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFullEmoji_111', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFullEmoji_111');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(0, 2);
      let state: TextState = model.snapshot();
      logState('changeFullEmoji_111', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'changeFullEmoji_111');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1120
     * @tc.name changeReversedEmoji112
     * @tc.desc A reversed 2..0 range selects the same emoji text with normalised indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeReversedEmoji_112', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeReversedEmoji_112');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(2, 0);
      let state: TextState = model.snapshot();
      logState('changeReversedEmoji_112', state);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'changeReversedEmoji_112');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1130
     * @tc.name changeFirstUnitCjk113
     * @tc.desc A 0..1 range on the cjk fixture selects exactly one leading code unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFirstUnitCjk_113', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFirstUnitCjk_113');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.changeSelection(0, 1);
      let state: TextState = model.snapshot();
      logState('changeFirstUnitCjk_113', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中');
      expect(state.lastInput).assertEqual('文');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'changeFirstUnitCjk_113');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1140
     * @tc.name changeFirstUnitEmoji114
     * @tc.desc A 0..1 range on the emoji fixture selects exactly one leading code unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFirstUnitEmoji_114', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFirstUnitEmoji_114');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(0, 1);
      let state: TextState = model.snapshot();
      logState('changeFirstUnitEmoji_114', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'changeFirstUnitEmoji_114');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1150
     * @tc.name changeBeyondLengthClampsCaret115
     * @tc.desc An end beyond the emoji length is clamped to two while the anchor stays at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeBeyondLengthClampsCaret_115', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeBeyondLengthClampsCaret_115');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(0, 9);
      let state: TextState = model.snapshot();
      logState('changeBeyondLengthClampsCaret_115', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'changeBeyondLengthClampsCaret_115');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1160
     * @tc.name changeNegativeStartKeepsAnchor116
     * @tc.desc A negative start is stored as-is and substring folds it to zero when slicing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeNegativeStartKeepsAnchor_116', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeNegativeStartKeepsAnchor_116');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(-1, 2);
      let state: TextState = model.snapshot();
      logState('changeNegativeStartKeepsAnchor_116', state);
      expect(state.selectIndex).assertEqual(-1);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'changeNegativeStartKeepsAnchor_116');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1170
     * @tc.name changeNanKeepsIndices117
     * @tc.desc NaN bounds satisfy neither ordering comparison, so both indices keep their previous values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeNanKeepsIndices_117', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeNanKeepsIndices_117');
      let model: TextEditingModel = mixState(320, 'a', '', '', 0, 0, 0);
      model.changeSelection(NaN, NaN);
      let state: TextState = model.snapshot();
      logState('changeNanKeepsIndices_117', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('a');
      TestLogger.end(TAG_UNICODE, 'changeNanKeepsIndices_117');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1180
     * @tc.name changeFractionTruncatesSlices118
     * @tc.desc Fractional bounds are truncated by substring while the stored indices keep the fractions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeFractionTruncatesSlices_118', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeFractionTruncatesSlices_118');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(0, 1.5);
      let state: TextState = model.snapshot();
      logState('changeFractionTruncatesSlices_118', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorIndex).assertEqual(1.5);
      expect(state.selectInput).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_UNICODE, 'changeFractionTruncatesSlices_118');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1190
     * @tc.name changeResplitsExistingSelection119
     * @tc.desc A changeSelection command recomposes an already selected emoji into the same slice layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeResplitsExistingSelection_119', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeResplitsExistingSelection_119');
      let model: TextEditingModel = mixState(320, 'a', '\uD83D\uDE00', '', 3, 1, 8);
      model.changeSelection(1, 3);
      let state: TextState = model.snapshot();
      logState('changeResplitsExistingSelection_119', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_UNICODE, 'changeResplitsExistingSelection_119');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1200
     * @tc.name changeCursorLeftUsesBothSlices120
     * @tc.desc The caret offset after a range command measures inputText concatenated with selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeCursorLeftUsesBothSlices_120', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'changeCursorLeftUsesBothSlices_120');
      let model: TextEditingModel = mixedAt(320, 'a\uD83D\uDE00', '', '');
      model.changeSelection(1, 3);
      let state: TextState = model.snapshot();
      logState('changeCursorLeftUsesBothSlices_120', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_UNICODE, 'changeCursorLeftUsesBothSlices_120');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1210
     * @tc.name selectAllAscii121
     * @tc.desc SELECT_ALL moves the whole ascii fixture into selectInput and leaves an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllAscii_121', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllAscii_121');
      let model: TextEditingModel = mixState(320, '', '', 'abc', 0, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllAscii_121', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(24);
      TestLogger.end(TAG_UNICODE, 'selectAllAscii_121');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1220
     * @tc.name selectAllCjk122
     * @tc.desc SELECT_ALL moves the whole cjk fixture into selectInput and leaves an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllCjk_122', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllCjk_122');
      let model: TextEditingModel = mixState(320, '', '', '中文', 0, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllCjk_122', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'selectAllCjk_122');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1230
     * @tc.name selectAllEmoji123
     * @tc.desc SELECT_ALL moves the whole emoji fixture into selectInput and leaves an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllEmoji_123', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllEmoji_123');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllEmoji_123', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'selectAllEmoji_123');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1240
     * @tc.name selectAllWithSelectionAscii124
     * @tc.desc SELECT_ALL merges an existing selection with the ascii prefix into one selected slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllWithSelectionAscii_124', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllWithSelectionAscii_124');
      let model: TextEditingModel = mixState(320, 'a', 'abc', '', 4, 1, 8);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllWithSelectionAscii_124', state);
      expect(state.selectInput).assertEqual('a' + 'abc');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(4);
      TestLogger.end(TAG_UNICODE, 'selectAllWithSelectionAscii_124');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1250
     * @tc.name selectAllWithSelectionCjk125
     * @tc.desc SELECT_ALL merges an existing selection with the cjk prefix into one selected slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllWithSelectionCjk_125', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllWithSelectionCjk_125');
      let model: TextEditingModel = mixState(320, 'a', '中文', '', 3, 1, 8);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllWithSelectionCjk_125', state);
      expect(state.selectInput).assertEqual('a' + '中文');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'selectAllWithSelectionCjk_125');
      await yieldToEventLoop();
      done();
    });
  });
}
