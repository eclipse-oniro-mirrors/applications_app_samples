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

function newMeasuredModel(measure: TextMeasure, width: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, width);
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

export default function textCompositionContractTest002(): void {
  describe('CustomInputTextCompositionContractTest002', () => {
    // ---- A. typing flows ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0700
     * @tc.name moveLeftAfterClick070
     * @tc.desc After a click at caret three, a left move steps to two and rebuilds the slices around it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveLeftAfterClick_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'moveLeftAfterClick_070');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(35);
      model.moveCursor(3);
      logStep('moveLeftAfterClick_070', 'after left', model);
      checkSlices(model, 'ab', '', 'cdef');
      checkCaret(model, 2, 20);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'moveLeftAfterClick_070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0710
     * @tc.name deleteRightAfterClick071
     * @tc.desc After a click at caret three, a two-character forward delete keeps the first three and the last character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightAfterClick_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteRightAfterClick_071');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(35);
      model.deleteRight(2);
      logStep('deleteRightAfterClick_071', 'after delete', model);
      checkSlices(model, 'abc', '', 'f');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.cursorLeft).assertEqual(30);
      checkMessage(model, 'abcf');
      TestLogger.end(TAG_COMPOSITION, 'deleteRightAfterClick_071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0720
     * @tc.name deleteLeftAfterClick072
     * @tc.desc After a click at caret three, a one-character backward delete removes the third character only
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftAfterClick_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteLeftAfterClick_072');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(35);
      model.deleteLeft(1);
      logStep('deleteLeftAfterClick_072', 'after delete', model);
      checkSlices(model, 'ab', '', 'def');
      checkCaret(model, 2, 20);
      checkMessage(model, 'abdef');
      TestLogger.end(TAG_COMPOSITION, 'deleteLeftAfterClick_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0730
     * @tc.name twoClicksRecomputeCaret073
     * @tc.desc Two clicks on the same unchanged message recompute the caret from the second pixel offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoClicksRecomputeCaret_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'twoClicksRecomputeCaret_073');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(20);
      logStep('twoClicksRecomputeCaret_073', 'first click', model);
      checkCaret(model, 2, 20);
      model.calculateCursor(40);
      logStep('twoClicksRecomputeCaret_073', 'second click', model);
      checkSlices(model, 'abcd', '', 'ef');
      checkCaret(model, 4, 40);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'twoClicksRecomputeCaret_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0740
     * @tc.name clickWithWideCharacters074
     * @tc.desc A mixed-width message averages eight and sixteen pixel units, so 24 px floors to caret two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickWithWideCharacters_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickWithWideCharacters_074');
      let model: TextEditingModel = newMeasuredModel(new MixedMeasure(8, 16), 100);
      loadPlain(model, 'ab中文', '', '');
      model.calculateCursor(24);
      logStep('clickWithWideCharacters_074', 'mixed click', model);
      checkSlices(model, 'ab', '', '中文');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(16);
      checkMessage(model, 'ab中文');
      TestLogger.end(TAG_COMPOSITION, 'clickWithWideCharacters_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0750
     * @tc.name clickWithSquareMeasure075
     * @tc.desc With a four-pixel average width, a click at eight pixels lands on caret two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickWithSquareMeasure_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickWithSquareMeasure_075');
      let model: TextEditingModel = newMeasuredModel(new SquareMeasure(1), 100);
      loadPlain(model, 'abcd', '', '');
      model.calculateCursor(8);
      logStep('clickWithSquareMeasure_075', 'square click', model);
      checkSlices(model, 'ab', '', 'cd');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(4);
      TestLogger.end(TAG_COMPOSITION, 'clickWithSquareMeasure_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0760
     * @tc.name widenCanvasAfterRejection076
     * @tc.desc A ten-character message fills a 100 px canvas, and widening it to 110 px accepts one more character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'widenCanvasAfterRejection_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'widenCanvasAfterRejection_076');
      let model: TextEditingModel = newUniformModel(100);
      let index: number = 0;
      while (index < 10) {
        expect(model.insertText('x')).assertTrue();
        index++;
      }
      expect(model.insertText('y')).assertFalse();
      logStep('widenCanvasAfterRejection_076', 'rejected', model);
      model.setCanvasWidth(110);
      expect(model.insertText('y')).assertTrue();
      logStep('widenCanvasAfterRejection_076', 'accepted after widen', model);
      checkMessage(model, 'xxxxxxxxxxy');
      checkCaret(model, 11, 110);
      TestLogger.end(TAG_COMPOSITION, 'widenCanvasAfterRejection_076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0770
     * @tc.name zeroWidthCanvas077
     * @tc.desc A zero-width canvas rejects a character but accepts an empty insertion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroWidthCanvas_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroWidthCanvas_077');
      let model: TextEditingModel = newUniformModel(0);
      expect(model.insertText('a')).assertFalse();
      expect(model.insertText('')).assertTrue();
      expect(model.insertText('b')).assertFalse();
      logStep('zeroWidthCanvas_077', 'after attempts', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      TestLogger.end(TAG_COMPOSITION, 'zeroWidthCanvas_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0780
     * @tc.name negativeWidthCanvas078
     * @tc.desc A negative canvas width rejects even the empty insertion because zero is greater than minus five
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeWidthCanvas_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeWidthCanvas_078');
      let model: TextEditingModel = newUniformModel(-5);
      expect(model.insertText('')).assertFalse();
      expect(model.insertText('a')).assertFalse();
      logStep('negativeWidthCanvas_078', 'negative width', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      TestLogger.end(TAG_COMPOSITION, 'negativeWidthCanvas_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0790
     * @tc.name shrinkBelowLoadedText079
     * @tc.desc Shrinking the canvas below the loaded prefix makes every further character fail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'shrinkBelowLoadedText_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'shrinkBelowLoadedText_079');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abc', '', '');
      model.setCanvasWidth(20);
      expect(model.insertText('d')).assertFalse();
      logStep('shrinkBelowLoadedText_079', 'rejected', model);
      checkSlices(model, 'abc', '', '');
      expect(model.cursorLeft).assertEqual(30);
      checkMessage(model, 'abc');
      TestLogger.end(TAG_COMPOSITION, 'shrinkBelowLoadedText_079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0800
     * @tc.name deleteThenFitOnNarrowCanvas080
     * @tc.desc On a 20 px canvas, deleting two of three characters frees exactly room for one substitute character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteThenFitOnNarrowCanvas_080', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteThenFitOnNarrowCanvas_080');
      let model: TextEditingModel = newUniformModel(20);
      expect(model.insertText('abc')).assertFalse();
      logStep('deleteThenFitOnNarrowCanvas_080', 'initial rejection', model);
      model.insertText('a');
      model.insertText('b');
      logStep('deleteThenFitOnNarrowCanvas_080', 'two accepted', model);
      model.deleteLeft(1);
      expect(model.insertText('c')).assertTrue();
      logStep('deleteThenFitOnNarrowCanvas_080', 'substitute', model);
      checkSlices(model, 'ac', '', '');
      checkCaret(model, 2, 20);
      expect(model.insertText('d')).assertFalse();
      TestLogger.end(TAG_COMPOSITION, 'deleteThenFitOnNarrowCanvas_080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0810
     * @tc.name expandCanvasKeepsText081
     * @tc.desc Widening the canvas after one accepted character keeps the character and accepts the next
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'expandCanvasKeepsText_081', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'expandCanvasKeepsText_081');
      let model: TextEditingModel = newUniformModel(10);
      expect(model.insertText('a')).assertTrue();
      logStep('expandCanvasKeepsText_081', 'one char', model);
      model.setCanvasWidth(1000);
      expect(model.insertText('b')).assertTrue();
      logStep('expandCanvasKeepsText_081', 'after widen', model);
      checkSlices(model, 'ab', '', '');
      checkCaret(model, 2, 20);
      expect(model.getCanvasWidth()).assertEqual(1000);
      TestLogger.end(TAG_COMPOSITION, 'expandCanvasKeepsText_081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0820
     * @tc.name hundredCharactersOnWideCanvas082
     * @tc.desc A 1000 px canvas accepts exactly one hundred single-pixel characters and rejects the next one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'hundredCharactersOnWideCanvas_082', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'hundredCharactersOnWideCanvas_082');
      let model: TextEditingModel = newUniformModel(1000);
      let index: number = 0;
      while (index < 100) {
        expect(model.insertText('x')).assertTrue();
        index++;
      }
      logStep('hundredCharactersOnWideCanvas_082', 'hundred', model);
      expect(model.insertText('y')).assertFalse();
      expect(model.inputText.length).assertEqual(100);
      expect(model.cursorLeft).assertEqual(1000);
      checkMessage(model, model.inputText);
      TestLogger.end(TAG_COMPOSITION, 'hundredCharactersOnWideCanvas_082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0830
     * @tc.name NaNCanvasWidth083
     * @tc.desc A NaN canvas width makes the guard comparison false, so the character is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNCanvasWidth_083', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNCanvasWidth_083');
      let model: TextEditingModel = newUniformModel(NaN);
      expect(model.insertText('a')).assertTrue();
      logStep('NaNCanvasWidth_083', 'nan width', model);
      checkSlices(model, 'a', '', '');
      expect(model.cursorIndex).assertEqual(1);
      expect(model.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_COMPOSITION, 'NaNCanvasWidth_083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0840
     * @tc.name zeroMeasureAcceptsEverything084
     * @tc.desc A zero-width measure never trips the guard, so a hundred characters are accepted on a zero canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroMeasureAcceptsEverything_084', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroMeasureAcceptsEverything_084');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(0), 0);
      let payload: string = '';
      let index: number = 0;
      while (index < 100) {
        payload += 'z';
        index++;
      }
      expect(model.insertText(payload)).assertTrue();
      logStep('zeroMeasureAcceptsEverything_084', 'hundred zero width', model);
      expect(model.inputText.length).assertEqual(100);
      expect(model.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'zeroMeasureAcceptsEverything_084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0850
     * @tc.name NaNMeasureKeepsAccepting085
     * @tc.desc A NaN measure accepts insertions but leaves the caret offset NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'NaNMeasureKeepsAccepting_085', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'NaNMeasureKeepsAccepting_085');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(NaN), 100);
      expect(model.insertText('a')).assertTrue();
      expect(model.insertText('b')).assertTrue();
      logStep('NaNMeasureKeepsAccepting_085', 'two inserts', model);
      expect(model.inputText).assertEqual('ab');
      expect(Number.isNaN(model.cursorLeft)).assertTrue();
      expect(model.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_COMPOSITION, 'NaNMeasureKeepsAccepting_085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0860
     * @tc.name infiniteMeasureRejects086
     * @tc.desc An infinite measure makes every insertion exceed the canvas and nothing is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'infiniteMeasureRejects_086', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'infiniteMeasureRejects_086');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(Infinity), 100);
      expect(model.insertText('a')).assertFalse();
      expect(model.insertText('')).assertFalse();
      logStep('infiniteMeasureRejects_086', 'rejected', model);
      checkSlices(model, '', '', '');
      expect(model.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'infiniteMeasureRejects_086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0870
     * @tc.name negativeMeasureAccepts087
     * @tc.desc A negative measure never exceeds the canvas, so insertions are accepted with a negative offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeMeasureAccepts_087', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeMeasureAccepts_087');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(-10), 100);
      expect(model.insertText('a')).assertTrue();
      expect(model.insertText('b')).assertTrue();
      logStep('negativeMeasureAccepts_087', 'two inserts', model);
      expect(model.inputText).assertEqual('ab');
      expect(model.cursorLeft).assertEqual(-10);
      expect(model.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_COMPOSITION, 'negativeMeasureAccepts_087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0880
     * @tc.name squareMeasureStopsAtTen088
     * @tc.desc With length-squared widths a 100 px canvas holds exactly ten characters and rejects the eleventh
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'squareMeasureStopsAtTen_088', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'squareMeasureStopsAtTen_088');
      let model: TextEditingModel = new TextEditingModel(new SquareMeasure(1), 100);
      let index: number = 0;
      while (index < 10) {
        expect(model.insertText('x')).assertTrue();
        index++;
      }
      logStep('squareMeasureStopsAtTen_088', 'ten', model);
      expect(model.cursorLeft).assertEqual(100);
      expect(model.insertText('y')).assertFalse();
      expect(model.inputText.length).assertEqual(10);
      TestLogger.end(TAG_COMPOSITION, 'squareMeasureStopsAtTen_088');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0890
     * @tc.name wideCharactersFillCanvas089
     * @tc.desc Six wide characters fill 96 of 100 px and the seventh one is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'wideCharactersFillCanvas_089', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'wideCharactersFillCanvas_089');
      let model: TextEditingModel = new TextEditingModel(new MixedMeasure(8, 16), 100);
      let index: number = 0;
      while (index < 6) {
        expect(model.insertText('中')).assertTrue();
        index++;
      }
      logStep('wideCharactersFillCanvas_089', 'six wide', model);
      expect(model.cursorLeft).assertEqual(96);
      expect(model.insertText('中')).assertFalse();
      expect(model.inputText.length).assertEqual(6);
      TestLogger.end(TAG_COMPOSITION, 'wideCharactersFillCanvas_089');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0900
     * @tc.name widthChangeWithTail090
     * @tc.desc A trailing slice of 20 px survives a shrink and leaves room for one character after a two-character delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'widthChangeWithTail_090', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'widthChangeWithTail_090');
      let model: TextEditingModel = newUniformModel(60);
      loadPlain(model, 'ab', '', 'cd');
      expect(model.insertText('X')).assertTrue();
      logStep('widthChangeWithTail_090', 'inserted', model);
      checkSlices(model, 'abX', '', 'cd');
      model.setCanvasWidth(40);
      expect(model.insertText('Y')).assertFalse();
      logStep('widthChangeWithTail_090', 'rejected after shrink', model);
      model.deleteLeft(2);
      logStep('widthChangeWithTail_090', 'after delete', model);
      checkSlices(model, 'a', '', 'cd');
      expect(model.insertText('Y')).assertTrue();
      logStep('widthChangeWithTail_090', 'accepted', model);
      checkSlices(model, 'aY', '', 'cd');
      expect(model.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_COMPOSITION, 'widthChangeWithTail_090');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0910
     * @tc.name ninePixelUnitsFillCanvas091
     * @tc.desc With a nine-pixel unit, three characters fill a 27 px canvas exactly and the fourth fails
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'ninePixelUnitsFillCanvas_091', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'ninePixelUnitsFillCanvas_091');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(9), 27);
      expect(model.insertText('abc')).assertTrue();
      logStep('ninePixelUnitsFillCanvas_091', 'three', model);
      expect(model.cursorLeft).assertEqual(27);
      expect(model.insertText('d')).assertFalse();
      expect(model.inputText.length).assertEqual(3);
      TestLogger.end(TAG_COMPOSITION, 'ninePixelUnitsFillCanvas_091');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0920
     * @tc.name zeroUnitKeepsNavigation092
     * @tc.desc A zero-width measure never changes the caret offset, yet navigation still moves by code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroUnitKeepsNavigation_092', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroUnitKeepsNavigation_092');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(0), 0);
      expect(model.insertText('abcdef')).assertTrue();
      logStep('zeroUnitKeepsNavigation_092', 'loaded', model);
      expect(model.cursorLeft).assertEqual(0);
      model.moveCursor(3);
      logStep('zeroUnitKeepsNavigation_092', 'left', model);
      checkSlices(model, 'abcde', '', 'f');
      expect(model.cursorIndex).assertEqual(5);
      expect(model.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'zeroUnitKeepsNavigation_092');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0930
     * @tc.name onePixelUnitTenCharacters093
     * @tc.desc With one pixel per character, a 10 px canvas accepts ten characters and rejects the eleventh
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'onePixelUnitTenCharacters_093', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'onePixelUnitTenCharacters_093');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(1), 10);
      let index: number = 0;
      while (index < 10) {
        expect(model.insertText('x')).assertTrue();
        index++;
      }
      logStep('onePixelUnitTenCharacters_093', 'ten', model);
      expect(model.cursorLeft).assertEqual(10);
      expect(model.insertText('y')).assertFalse();
      TestLogger.end(TAG_COMPOSITION, 'onePixelUnitTenCharacters_093');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0940
     * @tc.name mixedWidthsAccumulate094
     * @tc.desc ASCII and wide characters accumulate 8 and 16 pixels per code unit across three insertions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mixedWidthsAccumulate_094', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'mixedWidthsAccumulate_094');
      let model: TextEditingModel = new TextEditingModel(new MixedMeasure(8, 16), 100);
      expect(model.insertText('ab中')).assertTrue();
      logStep('mixedWidthsAccumulate_094', 'first', model);
      expect(model.cursorLeft).assertEqual(32);
      expect(model.insertText('中')).assertTrue();
      expect(model.insertText('a')).assertTrue();
      logStep('mixedWidthsAccumulate_094', 'all', model);
      expect(model.cursorLeft).assertEqual(56);
      expect(model.inputText.length).assertEqual(5);
      TestLogger.end(TAG_COMPOSITION, 'mixedWidthsAccumulate_094');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0950
     * @tc.name wideCharacterRejectedOnNarrowCanvas095
     * @tc.desc A 16 px wide character passes a 20 px canvas but the following 8 px ASCII character is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'wideCharacterRejectedOnNarrowCanvas_095', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'wideCharacterRejectedOnNarrowCanvas_095');
      let model: TextEditingModel = new TextEditingModel(new MixedMeasure(8, 16), 20);
      expect(model.insertText('中')).assertTrue();
      logStep('wideCharacterRejectedOnNarrowCanvas_095', 'wide accepted', model);
      expect(model.insertText('a')).assertFalse();
      model.deleteLeft(1);
      expect(model.insertText('ab')).assertTrue();
      logStep('wideCharacterRejectedOnNarrowCanvas_095', 'ascii accepted', model);
      expect(model.inputText).assertEqual('ab');
      expect(model.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_COMPOSITION, 'wideCharacterRejectedOnNarrowCanvas_095');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0960
     * @tc.name squareMeasureNavigation096
     * @tc.desc Navigation recomputes the offset from the length-squared measure at every step
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'squareMeasureNavigation_096', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'squareMeasureNavigation_096');
      let model: TextEditingModel = new TextEditingModel(new SquareMeasure(1), 100);
      expect(model.insertText('abcd')).assertTrue();
      logStep('squareMeasureNavigation_096', 'loaded', model);
      expect(model.cursorLeft).assertEqual(16);
      model.moveCursor(1);
      logStep('squareMeasureNavigation_096', 'up', model);
      expect(model.cursorLeft).assertEqual(0);
      model.moveCursor(2);
      logStep('squareMeasureNavigation_096', 'down', model);
      expect(model.cursorLeft).assertEqual(16);
      TestLogger.end(TAG_COMPOSITION, 'squareMeasureNavigation_096');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0970
     * @tc.name anchorMoveDoesNotMeasure097
     * @tc.desc An anchor move rewrites the slices without measuring, so the caret offset stays stale
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorMoveDoesNotMeasure_097', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorMoveDoesNotMeasure_097');
      let model: TextEditingModel = new TextEditingModel(new SquareMeasure(1), 100);
      expect(model.insertText('abcd')).assertTrue();
      let before: number = model.cursorLeft;
      model.selectByMovement(3);
      logStep('anchorMoveDoesNotMeasure_097', 'after anchor move', model);
      expect(model.cursorLeft).assertEqual(before);
      expect(model.cursorLeft).assertEqual(16);
      checkSlices(model, 'abc', 'd', '');
      TestLogger.end(TAG_COMPOSITION, 'anchorMoveDoesNotMeasure_097');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0980
     * @tc.name zeroMeasureClickBeyondText098
     * @tc.desc With a zero-width measure every click offset divides by zero and clamps to the message end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroMeasureClickBeyondText_098', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroMeasureClickBeyondText_098');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(0), 100);
      loadPlain(model, 'abcd', '', '');
      model.calculateCursor(50);
      logStep('zeroMeasureClickBeyondText_098', 'after click', model);
      checkSlices(model, 'abcd', '', '');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'zeroMeasureClickBeyondText_098');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0990
     * @tc.name constantMeasureCountsEmptyText099
     * @tc.desc A constant 50 px measure counts the empty trailing text, so the first insert fills the canvas exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'constantMeasureCountsEmptyText_099', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'constantMeasureCountsEmptyText_099');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(50), 100);
      expect(model.insertText('a')).assertTrue();
      logStep('constantMeasureCountsEmptyText_099', 'first', model);
      expect(model.cursorLeft).assertEqual(50);
      expect(model.insertText('b')).assertFalse();
      expect(model.inputText).assertEqual('a');
      TestLogger.end(TAG_COMPOSITION, 'constantMeasureCountsEmptyText_099');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1000
     * @tc.name constantMeasureEmptyInsert100
     * @tc.desc With a constant measure even the empty insertion projects the full canvas width and is accepted at equality
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'constantMeasureEmptyInsert_100', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'constantMeasureEmptyInsert_100');
      let model: TextEditingModel = new TextEditingModel(new FixedMeasure(50), 100);
      expect(model.insertText('')).assertTrue();
      logStep('constantMeasureEmptyInsert_100', 'empty accepted', model);
      checkSlices(model, '', '', '');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_COMPOSITION, 'constantMeasureEmptyInsert_100');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1010
     * @tc.name spyRecordsAcceptedPath101
     * @tc.desc The accepted insertion measures the payload, the trailing slice and the new prefix in that order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'spyRecordsAcceptedPath_101', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'spyRecordsAcceptedPath_101');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = new TextEditingModel(spy, 50);
      loadPlain(model, 'x', '', '');
      spy.reset();
      expect(model.insertText('ab')).assertTrue();
      logStep('spyRecordsAcceptedPath_101', 'after insert', model);
      expect(spy.callCount()).assertEqual(3);
      expect(spy.calls[0]).assertEqual('ab');
      expect(spy.calls[1]).assertEqual('');
      expect(spy.calls[2]).assertEqual('xab');
      TestLogger.end(TAG_COMPOSITION, 'spyRecordsAcceptedPath_101');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1020
     * @tc.name spyRecordsRejectedPath102
     * @tc.desc The rejected insertion measures only the payload and the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'spyRecordsRejectedPath_102', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'spyRecordsRejectedPath_102');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = new TextEditingModel(spy, 10);
      loadPlain(model, 'x', '', '');
      spy.reset();
      expect(model.insertText('ab')).assertFalse();
      logStep('spyRecordsRejectedPath_102', 'after reject', model);
      expect(spy.callCount()).assertEqual(2);
      expect(spy.calls[0]).assertEqual('ab');
      expect(spy.calls[1]).assertEqual('');
      expect(spy.countOf('x')).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'spyRecordsRejectedPath_102');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1030
     * @tc.name spyRecordsMoveCursor103
     * @tc.desc A caret move measures the new prefix exactly once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'spyRecordsMoveCursor_103', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'spyRecordsMoveCursor_103');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = new TextEditingModel(spy, 100);
      loadPlain(model, 'abc', '', '');
      spy.reset();
      model.moveCursor(3);
      logStep('spyRecordsMoveCursor_103', 'after move', model);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.calls[0]).assertEqual('ab');
      expect(model.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_COMPOSITION, 'spyRecordsMoveCursor_103');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1040
     * @tc.name spyProvesAnchorMoveSilent104
     * @tc.desc An anchor move performs no measurement at all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'spyProvesAnchorMoveSilent_104', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'spyProvesAnchorMoveSilent_104');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = new TextEditingModel(spy, 100);
      loadPlain(model, 'abc', '', '');
      spy.reset();
      model.selectByMovement(3);
      logStep('spyProvesAnchorMoveSilent_104', 'after anchor move', model);
      expect(spy.callCount()).assertEqual(0);
      expect(model.cursorLeft).assertEqual(30);
      expect(model.message()).assertEqual('abc');
      expect(model.selectIndex).assertEqual(2);
      TestLogger.end(TAG_COMPOSITION, 'spyProvesAnchorMoveSilent_104');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1050
     * @tc.name spyRecordsClickConversion105
     * @tc.desc A click measures the whole message and the resulting prefix in two calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'spyRecordsClickConversion_105', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'spyRecordsClickConversion_105');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(10));
      let model: TextEditingModel = new TextEditingModel(spy, 100);
      loadPlain(model, 'abcd', '', '');
      spy.reset();
      model.calculateCursor(15);
      logStep('spyRecordsClickConversion_105', 'after click', model);
      expect(spy.callCount()).assertEqual(2);
      expect(spy.calls[0]).assertEqual('abcd');
      expect(spy.calls[1]).assertEqual('a');
      expect(model.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_COMPOSITION, 'spyRecordsClickConversion_105');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1060
     * @tc.name insertTwoChineseCharacters106
     * @tc.desc Two Chinese characters count as two code units and advance the caret to two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertTwoChineseCharacters_106', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'insertTwoChineseCharacters_106');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('中文')).assertTrue();
      logStep('insertTwoChineseCharacters_106', 'after insert', model);
      expect(model.inputText.length).assertEqual(2);
      checkCaret(model, 2, 20);
      checkMessage(model, '中文');
      TestLogger.end(TAG_COMPOSITION, 'insertTwoChineseCharacters_106');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1070
     * @tc.name deleteHalfEmoji107
     * @tc.desc Deleting one unit of an emoji leaves the high surrogate, proving deletion works on code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteHalfEmoji_107', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteHalfEmoji_107');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('😀')).assertTrue();
      logStep('deleteHalfEmoji_107', 'inserted', model);
      expect(model.inputText.length).assertEqual(2);
      model.deleteLeft(1);
      logStep('deleteHalfEmoji_107', 'after delete', model);
      expect(model.inputText.length).assertEqual(1);
      expect(model.inputText.charCodeAt(0)).assertEqual(0xD83D);
      expect(model.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_COMPOSITION, 'deleteHalfEmoji_107');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1080
     * @tc.name zwjSequenceLength108
     * @tc.desc A three-person ZWJ family emoji occupies eight code units and loses two per delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zwjSequenceLength_108', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zwjSequenceLength_108');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('👨‍👩‍👧')).assertTrue();
      logStep('zwjSequenceLength_108', 'inserted', model);
      expect(model.inputText.length).assertEqual(8);
      expect(model.cursorIndex).assertEqual(8);
      model.deleteLeft(2);
      logStep('zwjSequenceLength_108', 'after delete', model);
      expect(model.inputText.length).assertEqual(6);
      expect(model.cursorIndex).assertEqual(6);
      TestLogger.end(TAG_COMPOSITION, 'zwjSequenceLength_108');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1090
     * @tc.name combiningMarkDelete109
     * @tc.desc A decomposed e-acute pair loses its combining mark when one unit is deleted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'combiningMarkDelete_109', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'combiningMarkDelete_109');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('é')).assertTrue();
      logStep('combiningMarkDelete_109', 'inserted', model);
      expect(model.inputText.length).assertEqual(2);
      model.deleteLeft(1);
      logStep('combiningMarkDelete_109', 'after delete', model);
      expect(model.inputText).assertEqual('e');
      expect(model.inputText.length).assertEqual(1);
      TestLogger.end(TAG_COMPOSITION, 'combiningMarkDelete_109');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1100
     * @tc.name nulCharacterInsertDelete110
     * @tc.desc A NUL code unit is accepted as one character and removed by a one-unit delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'nulCharacterInsertDelete_110', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'nulCharacterInsertDelete_110');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('\u0000')).assertTrue();
      logStep('nulCharacterInsertDelete_110', 'inserted', model);
      expect(model.inputText.length).assertEqual(1);
      expect(model.cursorIndex).assertEqual(1);
      model.deleteLeft(1);
      logStep('nulCharacterInsertDelete_110', 'after delete', model);
      expect(model.inputText).assertEqual('');
      expect(model.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'nulCharacterInsertDelete_110');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1110
     * @tc.name arabicNavigation111
     * @tc.desc Two left moves over five Arabic letters leave the first three in the prefix and two in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'arabicNavigation_111', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'arabicNavigation_111');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('مرحبا')).assertTrue();
      model.moveCursor(3);
      model.moveCursor(3);
      logStep('arabicNavigation_111', 'after two left', model);
      expect(model.inputText).assertEqual('مرح');
      expect(model.lastInput).assertEqual('با');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_COMPOSITION, 'arabicNavigation_111');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1120
     * @tc.name chineseAnchorSelection112
     * @tc.desc An anchor-left move over four Chinese characters selects exactly the last one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'chineseAnchorSelection_112', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'chineseAnchorSelection_112');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('中文测试')).assertTrue();
      model.selectByMovement(3);
      logStep('chineseAnchorSelection_112', 'after anchor left', model);
      checkSlices(model, '中文测', '试', '');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(3);
      checkMessage(model, '中文测试');
      TestLogger.end(TAG_COMPOSITION, 'chineseAnchorSelection_112');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1130
     * @tc.name emojiAnchorSelection113
     * @tc.desc An anchor-left move over a-mixed message selects only the final ASCII character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'emojiAnchorSelection_113', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'emojiAnchorSelection_113');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('a😀b')).assertTrue();
      model.selectByMovement(3);
      logStep('emojiAnchorSelection_113', 'after anchor left', model);
      checkSlices(model, 'a😀', 'b', '');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(3);
      TestLogger.end(TAG_COMPOSITION, 'emojiAnchorSelection_113');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1140
     * @tc.name emojiClickSplit114
     * @tc.desc A click at 15 px over a-mixed message lands between the surrogate pair and the ASCII tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'emojiClickSplit_114', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'emojiClickSplit_114');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('a😀b')).assertTrue();
      model.calculateCursor(15);
      logStep('emojiClickSplit_114', 'after click', model);
      checkSlices(model, 'a', '', '😀b');
      expect(model.cursorIndex).assertEqual(1);
      expect(model.cursorLeft).assertEqual(10);
      checkMessage(model, 'a😀b');
      TestLogger.end(TAG_COMPOSITION, 'emojiClickSplit_114');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1150
     * @tc.name chineseDeleteRight115
     * @tc.desc A forward delete after two Chinese characters drops the first ASCII tail character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'chineseDeleteRight_115', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'chineseDeleteRight_115');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, '中文', '', 'abc');
      model.deleteRight(1);
      logStep('chineseDeleteRight_115', 'after delete', model);
      checkSlices(model, '中文', '', 'bc');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(20);
      checkMessage(model, '中文bc');
      TestLogger.end(TAG_COMPOSITION, 'chineseDeleteRight_115');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1160
     * @tc.name emojiDeleteRight116
     * @tc.desc A two-unit forward delete removes both surrogate halves and the following ASCII character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'emojiDeleteRight_116', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'emojiDeleteRight_116');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'a', '', '😀b');
      model.deleteRight(2);
      logStep('emojiDeleteRight_116', 'after delete', model);
      checkSlices(model, 'a', '', 'b');
      expect(model.cursorIndex).assertEqual(1);
      checkMessage(model, 'ab');
      TestLogger.end(TAG_COMPOSITION, 'emojiDeleteRight_116');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1170
     * @tc.name unicodeSelectAll117
     * @tc.desc SELECT_ALL on a mixed message moves all five code units into the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'unicodeSelectAll_117', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'unicodeSelectAll_117');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('a中文😀')).assertTrue();
      model.handleExtendAction(0);
      logStep('unicodeSelectAll_117', 'after select all', model);
      expect(model.message().length).assertEqual(5);
      checkSlices(model, '', 'a中文😀', '');
      expect(model.cursorIndex).assertEqual(5);
      expect(model.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_COMPOSITION, 'unicodeSelectAll_117');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1180
     * @tc.name nulThenAscii118
     * @tc.desc A NUL followed by an ASCII character form a two-unit message whose last unit can be deleted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'nulThenAscii_118', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'nulThenAscii_118');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('\u0000')).assertTrue();
      expect(model.insertText('x')).assertTrue();
      logStep('nulThenAscii_118', 'two units', model);
      expect(model.inputText.length).assertEqual(2);
      expect(model.inputText.charCodeAt(0)).assertEqual(0);
      model.deleteLeft(1);
      logStep('nulThenAscii_118', 'after delete', model);
      expect(model.inputText).assertEqual('\u0000');
      TestLogger.end(TAG_COMPOSITION, 'nulThenAscii_118');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1190
     * @tc.name chineseChangeSelection119
     * @tc.desc A changeSelection over Chinese text selects two middle characters and measures the new prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'chineseChangeSelection_119', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'chineseChangeSelection_119');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('中文测试')).assertTrue();
      model.changeSelection(1, 3);
      logStep('chineseChangeSelection_119', 'after change', model);
      checkSlices(model, '中', '文测', '试');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.selectIndex).assertEqual(1);
      expect(model.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_COMPOSITION, 'chineseChangeSelection_119');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1200
     * @tc.name doubleEmojiUpMove120
     * @tc.desc An up move over two emoji keeps all four code units in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'doubleEmojiUpMove_120', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'doubleEmojiUpMove_120');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('😀😀')).assertTrue();
      model.moveCursor(1);
      logStep('doubleEmojiUpMove_120', 'after up', model);
      checkSlices(model, '', '', '😀😀');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.message().length).assertEqual(4);
      expect(model.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_COMPOSITION, 'doubleEmojiUpMove_120');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1210
     * @tc.name tenInsertsThenFiveDeletes121
     * @tc.desc Ten single inserts followed by five deletes leave the first five characters and a fifty-pixel caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'tenInsertsThenFiveDeletes_121', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'tenInsertsThenFiveDeletes_121');
      let model: TextEditingModel = newUniformModel(200);
      let index: number = 0;
      while (index < 10) {
        expect(model.insertText('abcdefghij'.substring(index, index + 1))).assertTrue();
        index++;
      }
      logStep('tenInsertsThenFiveDeletes_121', 'ten inserts', model);
      checkMessage(model, 'abcdefghij');
      model.deleteLeft(5);
      logStep('tenInsertsThenFiveDeletes_121', 'five deletes', model);
      checkSlices(model, 'abcde', '', '');
      checkCaret(model, 5, 50);
      expect(model.insertText('f')).assertTrue();
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'tenInsertsThenFiveDeletes_121');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1220
     * @tc.name alternatingPairAndDelete122
     * @tc.desc Three pair inserts each followed by one delete leave three characters in the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'alternatingPairAndDelete_122', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'alternatingPairAndDelete_122');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('ab')).assertTrue();
      model.deleteLeft(1);
      logStep('alternatingPairAndDelete_122', 'cycle one', model);
      checkSlices(model, 'a', '', '');
      expect(model.insertText('ab')).assertTrue();
      model.deleteLeft(1);
      logStep('alternatingPairAndDelete_122', 'cycle two', model);
      checkSlices(model, 'aa', '', '');
      expect(model.insertText('ab')).assertTrue();
      model.deleteLeft(1);
      logStep('alternatingPairAndDelete_122', 'cycle three', model);
      checkSlices(model, 'aaa', '', '');
      checkCaret(model, 3, 30);
      TestLogger.end(TAG_COMPOSITION, 'alternatingPairAndDelete_122');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1230
     * @tc.name navigateThenBackspaceThenInsert123
     * @tc.desc After two left moves a backward delete removes one prefix character and the next insert lands before the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'navigateThenBackspaceThenInsert_123', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateThenBackspaceThenInsert_123');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abcdef')).assertTrue();
      model.moveCursor(3);
      model.moveCursor(3);
      logStep('navigateThenBackspaceThenInsert_123', 'after two left', model);
      checkSlices(model, 'abcd', '', 'ef');
      model.deleteLeft(1);
      logStep('navigateThenBackspaceThenInsert_123', 'after delete', model);
      checkSlices(model, 'abc', '', 'ef');
      expect(model.insertText('X')).assertTrue();
      logStep('navigateThenBackspaceThenInsert_123', 'after insert', model);
      checkSlices(model, 'abcX', '', 'ef');
      checkCaret(model, 4, 40);
      checkMessage(model, 'abcXef');
      TestLogger.end(TAG_COMPOSITION, 'navigateThenBackspaceThenInsert_123');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1240
     * @tc.name clickInsertThenForwardDelete124
     * @tc.desc A click at caret two, an insert and a two-character forward delete end with two dropped characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickInsertThenForwardDelete_124', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickInsertThenForwardDelete_124');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abcdef')).assertTrue();
      model.calculateCursor(25);
      logStep('clickInsertThenForwardDelete_124', 'after click', model);
      checkSlices(model, 'ab', '', 'cdef');
      expect(model.insertText('X')).assertTrue();
      logStep('clickInsertThenForwardDelete_124', 'after insert', model);
      checkSlices(model, 'abX', '', 'cdef');
      model.deleteRight(2);
      logStep('clickInsertThenForwardDelete_124', 'after forward delete', model);
      checkSlices(model, 'abX', '', 'ef');
      checkMessage(model, 'abXef');
      TestLogger.end(TAG_COMPOSITION, 'clickInsertThenForwardDelete_124');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1250
     * @tc.name selectAllNoopThenNarrowRange125
     * @tc.desc SELECT_ALL followed by a no-op forward delete and a two-character range leaves a two-character selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllNoopThenNarrowRange_125', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectAllNoopThenNarrowRange_125');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abcdef')).assertTrue();
      model.handleExtendAction(0);
      model.deleteRight(1);
      logStep('selectAllNoopThenNarrowRange_125', 'after no-op', model);
      checkSlices(model, '', 'abcdef', '');
      model.changeSelection(0, 2);
      logStep('selectAllNoopThenNarrowRange_125', 'narrowed', model);
      checkSlices(model, '', 'ab', 'cdef');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_COMPOSITION, 'selectAllNoopThenNarrowRange_125');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1260
     * @tc.name widthChangesEveryThreeSteps126
     * @tc.desc Two canvas shrinks and one widen steer the same five-character message through reject and accept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'widthChangesEveryThreeSteps_126', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'widthChangesEveryThreeSteps_126');
      let model: TextEditingModel = newUniformModel(50);
      expect(model.insertText('aaaaa')).assertTrue();
      logStep('widthChangesEveryThreeSteps_126', 'five', model);
      checkCaret(model, 5, 50);
      model.setCanvasWidth(30);
      expect(model.insertText('b')).assertFalse();
      model.deleteLeft(2);
      logStep('widthChangesEveryThreeSteps_126', 'after delete', model);
      checkSlices(model, 'aaa', '', '');
      model.setCanvasWidth(40);
      expect(model.insertText('b')).assertTrue();
      logStep('widthChangesEveryThreeSteps_126', 'after widen', model);
      checkSlices(model, 'aaab', '', '');
      checkCaret(model, 4, 40);
      TestLogger.end(TAG_COMPOSITION, 'widthChangesEveryThreeSteps_126');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1270
     * @tc.name selectionSurvivesDeleteLeftThenInsert127
     * @tc.desc A selection survives a backward delete and is dropped by the following insertion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectionSurvivesDeleteLeftThenInsert_127', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectionSurvivesDeleteLeftThenInsert_127');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abc')).assertTrue();
      model.selectByMovement(3);
      logStep('selectionSurvivesDeleteLeftThenInsert_127', 'after anchor', model);
      checkSlices(model, 'ab', 'c', '');
      model.deleteLeft(1);
      logStep('selectionSurvivesDeleteLeftThenInsert_127', 'after delete', model);
      checkSlices(model, 'a', 'c', '');
      expect(model.message()).assertEqual('ac');
      expect(model.insertText('d')).assertTrue();
      logStep('selectionSurvivesDeleteLeftThenInsert_127', 'after insert', model);
      checkSlices(model, 'ad', '', '');
      checkMessage(model, 'ad');
      TestLogger.end(TAG_COMPOSITION, 'selectionSurvivesDeleteLeftThenInsert_127');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1280
     * @tc.name tenLeftMovesThenOneMore128
     * @tc.desc Ten left moves reach zero and an eleventh records minus one while keeping the text in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'tenLeftMovesThenOneMore_128', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'tenLeftMovesThenOneMore_128');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('abcdefghij')).assertTrue();
      let index: number = 0;
      while (index < 10) {
        model.moveCursor(3);
        index++;
      }
      logStep('tenLeftMovesThenOneMore_128', 'ten left', model);
      checkSlices(model, '', '', 'abcdefghij');
      expect(model.cursorIndex).assertEqual(0);
      model.moveCursor(3);
      logStep('tenLeftMovesThenOneMore_128', 'eleven left', model);
      expect(model.cursorIndex).assertEqual(-1);
      checkSlices(model, '', '', 'abcdefghij');
      TestLogger.end(TAG_COMPOSITION, 'tenLeftMovesThenOneMore_128');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1290
     * @tc.name twelveRightMovesClamp129
     * @tc.desc Twelve right moves over ten characters stop at the message length instead of overshooting
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twelveRightMovesClamp_129', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'twelveRightMovesClamp_129');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('abcdefghij')).assertTrue();
      model.moveCursor(1);
      let index: number = 0;
      while (index < 12) {
        model.moveCursor(4);
        index++;
      }
      logStep('twelveRightMovesClamp_129', 'after twelve', model);
      checkSlices(model, 'abcdefghij', '', '');
      expect(model.cursorIndex).assertEqual(10);
      expect(model.cursorLeft).assertEqual(100);
      TestLogger.end(TAG_COMPOSITION, 'twelveRightMovesClamp_129');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1300
     * @tc.name alternatingUpDown130
     * @tc.desc Three up-down pairs always return the caret to the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'alternatingUpDown_130', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'alternatingUpDown_130');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('abcdefghij')).assertTrue();
      let index: number = 0;
      while (index < 3) {
        model.moveCursor(1);
        expect(model.cursorIndex).assertEqual(0);
        model.moveCursor(2);
        expect(model.cursorIndex).assertEqual(10);
        index++;
      }
      logStep('alternatingUpDown_130', 'after three pairs', model);
      checkSlices(model, 'abcdefghij', '', '');
      checkCaret(model, 10, 100);
      TestLogger.end(TAG_COMPOSITION, 'alternatingUpDown_130');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1310
     * @tc.name anchorRightStopsAtEnd131
     * @tc.desc Three anchor-right moves at the message end never grow the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorRightStopsAtEnd_131', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorRightStopsAtEnd_131');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('abcdefghij')).assertTrue();
      model.selectByMovement(4);
      model.selectByMovement(4);
      model.selectByMovement(4);
      logStep('anchorRightStopsAtEnd_131', 'after three', model);
      checkSlices(model, 'abcdefghij', '', '');
      expect(model.selectIndex).assertEqual(10);
      expect(model.cursorIndex).assertEqual(10);
      TestLogger.end(TAG_COMPOSITION, 'anchorRightStopsAtEnd_131');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1320
     * @tc.name threeForwardDeletes132
     * @tc.desc Three one-character forward deletes from the start shrink a six-character message to three
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'threeForwardDeletes_132', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'threeForwardDeletes_132');
      let model: TextEditingModel = newUniformModel(200);
      expect(model.insertText('abcdef')).assertTrue();
      model.moveCursor(1);
      model.deleteRight(1);
      logStep('threeForwardDeletes_132', 'first', model);
      checkMessage(model, 'bcdef');
      model.deleteRight(1);
      logStep('threeForwardDeletes_132', 'second', model);
      checkMessage(model, 'cdef');
      model.deleteRight(1);
      logStep('threeForwardDeletes_132', 'third', model);
      checkMessage(model, 'def');
      checkSlices(model, '', '', 'def');
      TestLogger.end(TAG_COMPOSITION, 'threeForwardDeletes_132');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1330
     * @tc.name clickThenForwardDeleteThenInsert133
     * @tc.desc A click at caret one, an empty forward delete and a three-character insert build a four-character message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickThenForwardDeleteThenInsert_133', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickThenForwardDeleteThenInsert_133');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abc')).assertTrue();
      model.calculateCursor(10);
      logStep('clickThenForwardDeleteThenInsert_133', 'after click', model);
      checkSlices(model, 'a', '', 'bc');
      model.deleteRight(2);
      logStep('clickThenForwardDeleteThenInsert_133', 'after delete', model);
      checkSlices(model, 'a', '', '');
      expect(model.insertText('xyz')).assertTrue();
      logStep('clickThenForwardDeleteThenInsert_133', 'after insert', model);
      checkSlices(model, 'axyz', '', '');
      checkMessage(model, 'axyz');
      TestLogger.end(TAG_COMPOSITION, 'clickThenForwardDeleteThenInsert_133');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1340
     * @tc.name endFlagAtCaretEndIsEmptySelection134
     * @tc.desc The END_FLAG range with the caret already at the end produces an empty selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'endFlagAtCaretEndIsEmptySelection_134', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'endFlagAtCaretEndIsEmptySelection_134');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abc')).assertTrue();
      model.selectByRange(0, END_FLAG);
      logStep('endFlagAtCaretEndIsEmptySelection_134', 'after end flag', model);
      checkSlices(model, 'abc', '', '');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.selectIndex).assertEqual(3);
      expect(model.insertText('d')).assertTrue();
      checkMessage(model, 'abcd');
      TestLogger.end(TAG_COMPOSITION, 'endFlagAtCaretEndIsEmptySelection_134');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1350
     * @tc.name rangeThenClickThenRight135
     * @tc.desc A changeSelection, a click conversion and a right move end on a two-character prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeThenClickThenRight_135', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'rangeThenClickThenRight_135');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abcdef')).assertTrue();
      model.changeSelection(1, 4);
      logStep('rangeThenClickThenRight_135', 'after change', model);
      checkSlices(model, 'a', 'bcd', 'ef');
      model.calculateCursor(15);
      logStep('rangeThenClickThenRight_135', 'after click', model);
      checkSlices(model, 'a', '', 'bcdef');
      model.moveCursor(4);
      logStep('rangeThenClickThenRight_135', 'after right', model);
      checkSlices(model, 'ab', '', 'cdef');
      checkCaret(model, 2, 20);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'rangeThenClickThenRight_135');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1360
     * @tc.name negativeCaretInsert136
     * @tc.desc A negative starting caret still accepts an insertion and the caret becomes one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeCaretInsert_136', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeCaretInsert_136');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: '', cursorIndex: -1, selectIndex: -1, cursorLeft: 0
      };
      model.loadState(state);
      expect(model.insertText('a')).assertTrue();
      logStep('negativeCaretInsert_136', 'after insert', model);
      checkSlices(model, 'a', '', '');
      checkCaret(model, 1, 10);
      TestLogger.end(TAG_COMPOSITION, 'negativeCaretInsert_136');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1370
     * @tc.name negativeCaretDeleteLeft137
     * @tc.desc A backward delete from a negative caret keeps the empty prefix and resets the caret to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeCaretDeleteLeft_137', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeCaretDeleteLeft_137');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: '', cursorIndex: -1, selectIndex: -1, cursorLeft: 0
      };
      model.loadState(state);
      model.deleteLeft(1);
      logStep('negativeCaretDeleteLeft_137', 'after delete', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      TestLogger.end(TAG_COMPOSITION, 'negativeCaretDeleteLeft_137');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_1380
     * @tc.name negativeCaretDeleteRight138
     * @tc.desc A forward delete from caret minus one rewrites the trailing slice from the message start
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'negativeCaretDeleteRight_138', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'negativeCaretDeleteRight_138');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: '', selectInput: '', lastInput: 'abc', cursorIndex: -1, selectIndex: -1, cursorLeft: 0
      };
      model.loadState(state);
      model.deleteRight(1);
      logStep('negativeCaretDeleteRight_138', 'after delete', model);
      checkSlices(model, '', '', 'abc');
      expect(model.cursorIndex).assertEqual(-1);
      expect(model.selectIndex).assertEqual(-1);
      TestLogger.end(TAG_COMPOSITION, 'negativeCaretDeleteRight_138');
      await yieldToEventLoop();
      done();
    });

  });
}
