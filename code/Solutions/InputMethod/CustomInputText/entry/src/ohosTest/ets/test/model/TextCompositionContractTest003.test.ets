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
import { CASE_PREFIX, END_FLAG, TAG_COMPOSITION } from '../common/TestConstant';

/**
 * End-to-end composition suites.
 *
 * Every case in this file is a multi-step editing session: the output of one
 * controller callback becomes the input of the next. The assertions are positioned
 * between the steps, so a regression that only shows up after two or three
 * callbacks (for example a selection that is silently dropped by insertText and
 * then observed by deleteRight) is caught at the step that introduced it.
 *
 * Invariants used throughout:
 *   - visible text: inputText + selectInput + lastInput
 *   - caret bookkeeping: cursorIndex points at the end of inputText +
 *     selectInput, except after the documented quirk branches
 *   - pixel offset: cursorLeft equals the measured width of inputText, except in
 *     the selectByRange END_FLAG branch and in deleteRight, which do not
 *     recompute it
 */

const CHAR_WIDTH: number = 10;

function newUniformModel(width: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(CHAR_WIDTH), width);
  return model;
}

function loadPlain(model: TextEditingModel, input: string, select: string, last: string): void {
  model.loadPlain(input, select, last);
}

function stateText(model: TextEditingModel): string {
  let state: TextState = model.snapshot();
  return JSON.stringify(state);
}

function logStep(caseName: string, stepName: string, model: TextEditingModel): void {
  TestLogger.infoPair(TAG_COMPOSITION, caseName + ' step ' + stepName, stateText(model));
}

function checkSlices(model: TextEditingModel, input: string, select: string, last: string): void {
  let state: TextState = model.snapshot();
  expect(state.inputText).assertEqual(input);
  expect(state.selectInput).assertEqual(select);
  expect(state.lastInput).assertEqual(last);
}

function checkMessage(model: TextEditingModel, expected: string): void {
  TestLogger.value(TAG_COMPOSITION, 'message', model.message());
  expect(model.message()).assertEqual(expected);
}

function checkCaret(model: TextEditingModel, index: number, left: number): void {
  let state: TextState = model.snapshot();
  expect(state.cursorIndex).assertEqual(index);
  expect(state.selectIndex).assertEqual(index);
  expect(state.cursorLeft).assertEqual(left);
}

export default function textCompositionContractTest003(): void {
  describe('CustomInputTextCompositionContractTest003', () => {
    // ---- A. typing flows ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1390
     * @tc.name negativeCaretRightMove139
     * @tc.desc A right move from caret minus one lands on zero and keeps the text in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeCaretRightMove_139', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeCaretRightMove_139');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: 'abc', cursorIndex: -1, selectIndex: -1, cursorLeft: 0
      };
      model.loadState(state);
      model.moveCursor(4);
      logStep('negativeCaretRightMove_139', 'after right', model);
      checkSlices(model, '', '', 'abc');
      checkCaret(model, 0, 0);
      TestLogger.end(TAG_COMPOSITION, 'negativeCaretRightMove_139');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1400
     * @tc.name oversizedCaretInsert140
     * @tc.desc A caret of one hundred over a three-character message is reset by an insertion to one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'oversizedCaretInsert_140', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'oversizedCaretInsert_140');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: 100, selectIndex: 100, cursorLeft: 30
      };
      model.loadState(state);
      expect(model.insertText('a')).assertTrue();
      logStep('oversizedCaretInsert_140', 'after insert', model);
      checkSlices(model, 'abca', '', '');
      checkCaret(model, 4, 40);
      TestLogger.end(TAG_COMPOSITION, 'oversizedCaretInsert_140');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1410
     * @tc.name oversizedCaretDeleteRight141
     * @tc.desc A caret beyond the message satisfies no forward-delete branch and nothing changes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'oversizedCaretDeleteRight_141', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'oversizedCaretDeleteRight_141');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: 100, selectIndex: 100, cursorLeft: 30
      };
      model.loadState(state);
      model.deleteRight(1);
      logStep('oversizedCaretDeleteRight_141', 'after delete', model);
      checkSlices(model, 'abc', '', '');
      expect(model.cursorIndex).assertEqual(100);
      expect(model.selectIndex).assertEqual(100);
      expect(model.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_COMPOSITION, 'oversizedCaretDeleteRight_141');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1420
     * @tc.name oversizedCaretLeftMove142
     * @tc.desc A left move from caret one hundred records ninety-nine and keeps the three characters in the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'oversizedCaretLeftMove_142', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'oversizedCaretLeftMove_142');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: 100, selectIndex: 100, cursorLeft: 30
      };
      model.loadState(state);
      model.moveCursor(3);
      logStep('oversizedCaretLeftMove_142', 'after left', model);
      checkSlices(model, 'abc', '', '');
      expect(model.cursorIndex).assertEqual(99);
      expect(model.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_COMPOSITION, 'oversizedCaretLeftMove_142');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1430
     * @tc.name NaNCaretInsert143
     * @tc.desc A NaN starting caret does not affect the width guard and the insertion resets the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNCaretInsert_143', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNCaretInsert_143');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: '', cursorIndex: NaN, selectIndex: NaN, cursorLeft: 0
      };
      model.loadState(state);
      expect(model.insertText('a')).assertTrue();
      logStep('NaNCaretInsert_143', 'after insert', model);
      checkSlices(model, 'a', '', '');
      checkCaret(model, 1, 10);
      TestLogger.end(TAG_COMPOSITION, 'NaNCaretInsert_143');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1440
     * @tc.name NaNCaretDeleteRight144
     * @tc.desc A NaN caret fails the forward-delete comparison and the state is unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNCaretDeleteRight_144', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNCaretDeleteRight_144');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: NaN, selectIndex: NaN, cursorLeft: 30
      };
      model.loadState(state);
      model.deleteRight(1);
      logStep('NaNCaretDeleteRight_144', 'after delete', model);
      checkSlices(model, 'abc', '', '');
      expect(Number.isNaN(model.cursorIndex)).assertTrue();
      expect(Number.isNaN(model.selectIndex)).assertTrue();
      TestLogger.end(TAG_COMPOSITION, 'NaNCaretDeleteRight_144');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1450
     * @tc.name NaNCaretDownMove145
     * @tc.desc A down move overwrites the NaN caret with the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNCaretDownMove_145', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNCaretDownMove_145');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: NaN, selectIndex: NaN, cursorLeft: 30
      };
      model.loadState(state);
      model.moveCursor(2);
      logStep('NaNCaretDownMove_145', 'after down', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      TestLogger.end(TAG_COMPOSITION, 'NaNCaretDownMove_145');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1460
     * @tc.name NaNAnchorLeftMove146
     * @tc.desc A NaN anchor fails both clamps and the whole message becomes the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNAnchorLeftMove_146', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNAnchorLeftMove_146');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: 3, selectIndex: NaN, cursorLeft: 30
      };
      model.loadState(state);
      model.selectByMovement(3);
      logStep('NaNAnchorLeftMove_146', 'after anchor left', model);
      checkSlices(model, '', 'abc', '');
      expect(Number.isNaN(model.selectIndex)).assertTrue();
      TestLogger.end(TAG_COMPOSITION, 'NaNAnchorLeftMove_146');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1470
     * @tc.name negativeAnchorRightMove147
     * @tc.desc A right move from anchor minus five records minus four and selects through substring clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeAnchorRightMove_147', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeAnchorRightMove_147');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abcdef', selectInput: '', lastInput: '', cursorIndex: 6, selectIndex: -5, cursorLeft: 60
      };
      model.loadState(state);
      model.selectByMovement(4);
      logStep('negativeAnchorRightMove_147', 'after anchor right', model);
      checkSlices(model, '', 'abcdef', '');
      expect(model.selectIndex).assertEqual(-4);
      expect(model.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_COMPOSITION, 'negativeAnchorRightMove_147');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1480
     * @tc.name staleCursorLeftRejects148
     * @tc.desc A stale caret offset of 999 px rejects an insertion even though the text itself is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'staleCursorLeftRejects_148', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'staleCursorLeftRejects_148');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: '', cursorIndex: 0, selectIndex: 0, cursorLeft: 999
      };
      model.loadState(state);
      expect(model.insertText('a')).assertFalse();
      logStep('staleCursorLeftRejects_148', 'after reject', model);
      checkSlices(model, '', '', '');
      expect(model.cursorLeft).assertEqual(999);
      TestLogger.end(TAG_COMPOSITION, 'staleCursorLeftRejects_148');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1490
     * @tc.name negativeCursorLeftAccepts149
     * @tc.desc A negative stale caret offset never exceeds the canvas and the insertion recomputes it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeCursorLeftAccepts_149', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeCursorLeftAccepts_149');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: '', cursorIndex: 0, selectIndex: 0, cursorLeft: -100
      };
      model.loadState(state);
      expect(model.insertText('a')).assertTrue();
      logStep('negativeCursorLeftAccepts_149', 'after insert', model);
      checkSlices(model, 'a', '', '');
      checkCaret(model, 1, 10);
      TestLogger.end(TAG_COMPOSITION, 'negativeCursorLeftAccepts_149');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1500
     * @tc.name appendIgnoresStaleCaret150
     * @tc.desc An insertion with a stale caret of zero still appends at the end of a loaded three-character prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appendIgnoresStaleCaret_150', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'appendIgnoresStaleCaret_150');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abc', selectInput: '', lastInput: '', cursorIndex: 0, selectIndex: 0, cursorLeft: 0
      };
      model.loadState(state);
      expect(model.insertText('X')).assertTrue();
      logStep('appendIgnoresStaleCaret_150', 'after insert', model);
      checkSlices(model, 'abcX', '', '');
      checkCaret(model, 4, 40);
      checkMessage(model, 'abcX');
      TestLogger.end(TAG_COMPOSITION, 'appendIgnoresStaleCaret_150');
      await yieldToEventLoop();
      done();
    });

  });
}
