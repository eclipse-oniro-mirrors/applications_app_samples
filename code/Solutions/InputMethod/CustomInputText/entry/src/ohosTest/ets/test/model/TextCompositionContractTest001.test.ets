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

function checkConcat(model: TextEditingModel): void {
  let concat: string = model.inputText + model.selectInput + model.lastInput;
  expect(model.message()).assertEqual(concat);
}

function checkLeftMatchesInput(model: TextEditingModel): void {
  let expected: number = model.getMeasure().widthOf(model.inputText);
  expect(model.cursorLeft).assertEqual(expected);
}

export default function textCompositionContractTest001(): void {
  describe('CustomInputTextCompositionContractTest001', () => {
    // ---- A. typing flows ----

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0010
     * @tc.name typingThreeCharacters001
     * @tc.desc Three accepted single characters accumulate in order and move the caret one code unit each time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'typingThreeCharacters_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'typingThreeCharacters_001');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('a')).assertTrue();
      logStep('typingThreeCharacters_001', 'a', model);
      checkSlices(model, 'a', '', '');
      checkCaret(model, 1, 10);
      expect(model.insertText('b')).assertTrue();
      logStep('typingThreeCharacters_001', 'b', model);
      checkSlices(model, 'ab', '', '');
      checkCaret(model, 2, 20);
      expect(model.insertText('c')).assertTrue();
      logStep('typingThreeCharacters_001', 'c', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abc');
      checkConcat(model);
      TestLogger.end(TAG_COMPOSITION, 'typingThreeCharacters_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0020
     * @tc.name typingStopsAtWidthLimit002
     * @tc.desc A three-character string fills a 30 px canvas exactly and the fourth character is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'typingStopsAtWidthLimit_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'typingStopsAtWidthLimit_002');
      let model: TextEditingModel = newUniformModel(30);
      expect(model.insertText('a')).assertTrue();
      expect(model.insertText('b')).assertTrue();
      expect(model.insertText('c')).assertTrue();
      logStep('typingStopsAtWidthLimit_002', 'filled', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      expect(model.insertText('d')).assertFalse();
      logStep('typingStopsAtWidthLimit_002', 'rejected', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abc');
      TestLogger.end(TAG_COMPOSITION, 'typingStopsAtWidthLimit_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0030
     * @tc.name deleteFreesWidthForRetype003
     * @tc.desc Rejecting a second pair of characters, deleting one character and retyping the pair fits again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteFreesWidthForRetype_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteFreesWidthForRetype_003');
      let model: TextEditingModel = newUniformModel(30);
      expect(model.insertText('ab')).assertTrue();
      logStep('deleteFreesWidthForRetype_003', 'ab', model);
      checkSlices(model, 'ab', '', '');
      expect(model.insertText('cd')).assertFalse();
      logStep('deleteFreesWidthForRetype_003', 'cd rejected', model);
      checkCaret(model, 2, 20);
      model.deleteLeft(1);
      logStep('deleteFreesWidthForRetype_003', 'after delete', model);
      checkSlices(model, 'a', '', '');
      checkCaret(model, 1, 10);
      expect(model.insertText('cd')).assertTrue();
      logStep('deleteFreesWidthForRetype_003', 'retype', model);
      checkSlices(model, 'acd', '', '');
      checkCaret(model, 3, 30);
      checkMessage(model, 'acd');
      TestLogger.end(TAG_COMPOSITION, 'deleteFreesWidthForRetype_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0040
     * @tc.name clearThenRetryAfterRejection004
     * @tc.desc After a rejection at 20 px, deleting both characters empties the editor and one new character is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'clearThenRetryAfterRejection_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clearThenRetryAfterRejection_004');
      let model: TextEditingModel = newUniformModel(20);
      expect(model.insertText('ab')).assertTrue();
      expect(model.insertText('c')).assertFalse();
      logStep('clearThenRetryAfterRejection_004', 'rejected', model);
      model.deleteLeft(2);
      logStep('clearThenRetryAfterRejection_004', 'cleared', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      expect(model.insertText('c')).assertTrue();
      logStep('clearThenRetryAfterRejection_004', 'retry', model);
      checkSlices(model, 'c', '', '');
      checkCaret(model, 1, 10);
      TestLogger.end(TAG_COMPOSITION, 'clearThenRetryAfterRejection_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0050
     * @tc.name tenCharacterTypingFlow005
     * @tc.desc Ten characters fill a 100 px canvas and every further character is rejected without touching the caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'tenCharacterTypingFlow_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'tenCharacterTypingFlow_005');
      let model: TextEditingModel = newUniformModel(100);
      let index: number = 0;
      while (index < 10) {
        expect(model.insertText('x')).assertTrue();
        index++;
      }
      logStep('tenCharacterTypingFlow_005', 'ten', model);
      checkMessage(model, 'xxxxxxxxxx');
      checkCaret(model, 10, 100);
      expect(model.insertText('y')).assertFalse();
      logStep('tenCharacterTypingFlow_005', 'eleven rejected', model);
      checkSlices(model, 'xxxxxxxxxx', '', '');
      checkCaret(model, 10, 100);
      TestLogger.end(TAG_COMPOSITION, 'tenCharacterTypingFlow_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0060
     * @tc.name fivePairInserts006
     * @tc.desc Five two-character inserts build a ten-character string and only the sixth pair is refused
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'fivePairInserts_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'fivePairInserts_006');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('ab')).assertTrue();
      expect(model.insertText('cd')).assertTrue();
      expect(model.insertText('ef')).assertTrue();
      logStep('fivePairInserts_006', 'three pairs', model);
      checkMessage(model, 'abcdef');
      checkCaret(model, 6, 60);
      expect(model.insertText('gh')).assertTrue();
      expect(model.insertText('ij')).assertTrue();
      expect(model.insertText('kl')).assertFalse();
      logStep('fivePairInserts_006', 'five pairs', model);
      checkMessage(model, 'abcdefghij');
      checkCaret(model, 10, 100);
      checkLeftMatchesInput(model);
      TestLogger.end(TAG_COMPOSITION, 'fivePairInserts_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0070
     * @tc.name repeatedEmptyInsert007
     * @tc.desc Repeated empty insertions are accepted and keep the caret and the message unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'repeatedEmptyInsert_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'repeatedEmptyInsert_007');
      let model: TextEditingModel = newUniformModel(0);
      expect(model.insertText('')).assertTrue();
      expect(model.insertText('')).assertTrue();
      expect(model.insertText('')).assertTrue();
      logStep('repeatedEmptyInsert_007', 'three empties', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      checkMessage(model, '');
      TestLogger.end(TAG_COMPOSITION, 'repeatedEmptyInsert_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0080
     * @tc.name insertDropsSelectionText008
     * @tc.desc Inserting over a loaded selection appends to inputText and silently discards the selected characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertDropsSelectionText_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'insertDropsSelectionText_008');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      expect(model.insertText('X')).assertTrue();
      logStep('insertDropsSelectionText_008', 'after insert', model);
      checkSlices(model, 'abX', '', 'ef');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abXef');
      expect(model.message().indexOf('cd')).assertEqual(-1);
      TestLogger.end(TAG_COMPOSITION, 'insertDropsSelectionText_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0090
     * @tc.name shrinkCanvasThenReject009
     * @tc.desc Shrinking the canvas from 100 px to 30 px makes the next character fit exactly and the one after it fail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'shrinkCanvasThenReject_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'shrinkCanvasThenReject_009');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('ab')).assertTrue();
      model.setCanvasWidth(30);
      expect(model.insertText('c')).assertTrue();
      logStep('shrinkCanvasThenReject_009', 'exact fit', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      expect(model.insertText('d')).assertFalse();
      logStep('shrinkCanvasThenReject_009', 'over', model);
      checkSlices(model, 'abc', '', '');
      TestLogger.end(TAG_COMPOSITION, 'shrinkCanvasThenReject_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0100
     * @tc.name zeroLengthDeleteResetsIndices010
     * @tc.desc A zero-length delete keeps the text but rewrites the caret to the end of inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroLengthDeleteResetsIndices_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroLengthDeleteResetsIndices_010');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abc', 'de', 'f');
      let before: TextState = model.snapshot();
      model.deleteLeft(0);
      logStep('zeroLengthDeleteResetsIndices_010', 'after zero delete', model);
      checkSlices(model, 'abc', 'de', 'f');
      checkCaret(model, 3, 30);
      expect(before.cursorIndex).assertEqual(5);
      expect(model.cursorIndex !== before.cursorIndex).assertTrue();
      TestLogger.end(TAG_COMPOSITION, 'zeroLengthDeleteResetsIndices_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0110
     * @tc.name deleteHalfThenRetype011
     * @tc.desc Deleting the second half of six typed characters and retyping keeps the first three in front
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteHalfThenRetype_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteHalfThenRetype_011');
      let model: TextEditingModel = newUniformModel(100);
      expect(model.insertText('abc')).assertTrue();
      expect(model.insertText('def')).assertTrue();
      model.deleteLeft(3);
      logStep('deleteHalfThenRetype_011', 'after delete', model);
      checkSlices(model, 'abc', '', '');
      checkCaret(model, 3, 30);
      expect(model.insertText('ghi')).assertTrue();
      logStep('deleteHalfThenRetype_011', 'after retype', model);
      checkSlices(model, 'abcghi', '', '');
      checkCaret(model, 6, 60);
      checkMessage(model, 'abcghi');
      TestLogger.end(TAG_COMPOSITION, 'deleteHalfThenRetype_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0120
     * @tc.name fiftyCharactersOnWideCanvas012
     * @tc.desc A 1000 px canvas accepts a fifty-character insert in one callback and records its full length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'fiftyCharactersOnWideCanvas_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'fiftyCharactersOnWideCanvas_012');
      let model: TextEditingModel = newUniformModel(1000);
      let payload: string = '';
      let index: number = 0;
      while (index < 50) {
        payload += 'q';
        index++;
      }
      expect(model.insertText(payload)).assertTrue();
      logStep('fiftyCharactersOnWideCanvas_012', 'fifty', model);
      checkSlices(model, payload, '', '');
      checkCaret(model, 50, 500);
      checkMessage(model, payload);
      TestLogger.end(TAG_COMPOSITION, 'fiftyCharactersOnWideCanvas_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0130
     * @tc.name singleCharacterOnNarrowCanvas013
     * @tc.desc A 5 px canvas rejects a 10 px character and a delete leaves the editor empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'singleCharacterOnNarrowCanvas_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'singleCharacterOnNarrowCanvas_013');
      let model: TextEditingModel = newUniformModel(5);
      expect(model.insertText('a')).assertFalse();
      logStep('singleCharacterOnNarrowCanvas_013', 'rejected', model);
      checkSlices(model, '', '', '');
      checkCaret(model, 0, 0);
      model.deleteLeft(1);
      logStep('singleCharacterOnNarrowCanvas_013', 'after delete', model);
      checkSlices(model, '', '', '');
      checkMessage(model, '');
      TestLogger.end(TAG_COMPOSITION, 'singleCharacterOnNarrowCanvas_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0140
     * @tc.name insertKeepsTrailingSlice014
     * @tc.desc A loaded trailing slice participates in the width guard and survives an accepted insertion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertKeepsTrailingSlice_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'insertKeepsTrailingSlice_014');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', '', 'cde');
      expect(model.insertText('X')).assertTrue();
      logStep('insertKeepsTrailingSlice_014', 'after insert', model);
      checkSlices(model, 'abX', '', 'cde');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abXcde');
      checkLeftMatchesInput(model);
      TestLogger.end(TAG_COMPOSITION, 'insertKeepsTrailingSlice_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0150
     * @tc.name exactFitWithTrailingSlice015
     * @tc.desc A trailing slice of 30 px leaves exactly 20 px, so two single characters pass and the third fails
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'exactFitWithTrailingSlice_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'exactFitWithTrailingSlice_015');
      let model: TextEditingModel = newUniformModel(60);
      loadPlain(model, 'a', '', 'bcd');
      expect(model.insertText('X')).assertTrue();
      logStep('exactFitWithTrailingSlice_015', 'first', model);
      checkSlices(model, 'aX', '', 'bcd');
      checkCaret(model, 2, 20);
      expect(model.insertText('Y')).assertTrue();
      logStep('exactFitWithTrailingSlice_015', 'second', model);
      checkSlices(model, 'aXY', '', 'bcd');
      checkCaret(model, 3, 30);
      expect(model.insertText('Z')).assertFalse();
      logStep('exactFitWithTrailingSlice_015', 'third rejected', model);
      checkSlices(model, 'aXY', '', 'bcd');
      checkMessage(model, 'aXYbcd');
      TestLogger.end(TAG_COMPOSITION, 'exactFitWithTrailingSlice_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0160
     * @tc.name navigateUpToStart016
     * @tc.desc Moving up from the end puts every character into the trailing slice and the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'navigateUpToStart_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateUpToStart_016');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.moveCursor(1);
      logStep('navigateUpToStart_016', 'up', model);
      checkSlices(model, '', '', 'abcdef');
      checkCaret(model, 0, 0);
      checkMessage(model, 'abcdef');
      checkConcat(model);
      TestLogger.end(TAG_COMPOSITION, 'navigateUpToStart_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0170
     * @tc.name navigateDownToEnd017
     * @tc.desc Moving down after moving up restores the full prefix and an empty trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'navigateDownToEnd_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateDownToEnd_017');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.moveCursor(1);
      model.moveCursor(2);
      logStep('navigateDownToEnd_017', 'down', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      checkLeftMatchesInput(model);
      TestLogger.end(TAG_COMPOSITION, 'navigateDownToEnd_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0180
     * @tc.name navigateLeftTwice018
     * @tc.desc Two left moves from the end move two characters into the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'navigateLeftTwice_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateLeftTwice_018');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.moveCursor(3);
      logStep('navigateLeftTwice_018', 'first left', model);
      checkSlices(model, 'abcde', '', 'f');
      checkCaret(model, 5, 50);
      model.moveCursor(3);
      logStep('navigateLeftTwice_018', 'second left', model);
      checkSlices(model, 'abcd', '', 'ef');
      checkCaret(model, 4, 40);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'navigateLeftTwice_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0190
     * @tc.name navigateRightAtEndIsNoop019
     * @tc.desc A right move at the end changes nothing because the guard is a strict less-than
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'navigateRightAtEndIsNoop_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateRightAtEndIsNoop_019');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.moveCursor(4);
      logStep('navigateRightAtEndIsNoop_019', 'right at end', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'navigateRightAtEndIsNoop_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0200
     * @tc.name navigateRightOneStep020
     * @tc.desc A right move from the second last position puts the final character back into the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'navigateRightOneStep_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateRightOneStep_020');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcde', '', 'f');
      model.moveCursor(4);
      logStep('navigateRightOneStep_020', 'right', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      checkConcat(model);
      TestLogger.end(TAG_COMPOSITION, 'navigateRightOneStep_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0210
     * @tc.name leftPastZeroThenRecover021
     * @tc.desc A left move at position zero records -1, and a following right move recovers position zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'leftPastZeroThenRecover_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'leftPastZeroThenRecover_021');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abc', '', '');
      model.moveCursor(1);
      model.moveCursor(3);
      logStep('leftPastZeroThenRecover_021', 'left to -1', model);
      expect(model.cursorIndex).assertEqual(-1);
      checkSlices(model, '', '', 'abc');
      expect(model.cursorLeft).assertEqual(0);
      model.moveCursor(4);
      logStep('leftPastZeroThenRecover_021', 'right to 0', model);
      checkSlices(model, '', '', 'abc');
      checkCaret(model, 0, 0);
      expect(model.message()).assertEqual('abc');
      TestLogger.end(TAG_COMPOSITION, 'leftPastZeroThenRecover_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0220
     * @tc.name threeRightMoves022
     * @tc.desc Three right moves from the start leave three characters in the prefix and the rest in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'threeRightMoves_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'threeRightMoves_022');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.moveCursor(1);
      logStep('threeRightMoves_022', 'up', model);
      model.moveCursor(4);
      model.moveCursor(4);
      model.moveCursor(4);
      logStep('threeRightMoves_022', 'three right', model);
      checkSlices(model, 'abc', '', 'def');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'threeRightMoves_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0230
     * @tc.name moveLeftFoldsSelection023
     * @tc.desc A left move with an active selection folds the selected text back into the message before stepping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveLeftFoldsSelection_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'moveLeftFoldsSelection_023');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.moveCursor(3);
      logStep('moveLeftFoldsSelection_023', 'after left', model);
      checkSlices(model, 'abc', '', 'def');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abcdef');
      expect(model.selectInput).assertEqual('');
      TestLogger.end(TAG_COMPOSITION, 'moveLeftFoldsSelection_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0240
     * @tc.name moveLeftFromStaleCaret024
     * @tc.desc A stale caret of 2 over a six-character message steps to 1 and rebuilds both slices around it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveLeftFromStaleCaret_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'moveLeftFromStaleCaret_024');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'ab',
        selectInput: 'cd',
        lastInput: 'ef',
        cursorIndex: 2,
        selectIndex: 2,
        cursorLeft: 20
      };
      model.loadState(state);
      model.moveCursor(3);
      logStep('moveLeftFromStaleCaret_024', 'after left', model);
      checkSlices(model, 'a', '', 'bcdef');
      checkCaret(model, 1, 10);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'moveLeftFromStaleCaret_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0250
     * @tc.name moveUpFoldsSelection025
     * @tc.desc An up move with a selection folds it and leaves all six characters as the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveUpFoldsSelection_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'moveUpFoldsSelection_025');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.moveCursor(1);
      logStep('moveUpFoldsSelection_025', 'up', model);
      checkSlices(model, '', '', 'abcdef');
      checkCaret(model, 0, 0);
      checkMessage(model, 'abcdef');
      checkConcat(model);
      TestLogger.end(TAG_COMPOSITION, 'moveUpFoldsSelection_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0260
     * @tc.name moveDownFoldsSelection026
     * @tc.desc A down move with a selection folds it and moves the caret to the full message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveDownFoldsSelection_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'moveDownFoldsSelection_026');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.moveCursor(2);
      logStep('moveDownFoldsSelection_026', 'down', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'moveDownFoldsSelection_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0270
     * @tc.name leftBelowZeroTwice027
     * @tc.desc Two left moves at the start record -2 while substring still keeps the whole message in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'leftBelowZeroTwice_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'leftBelowZeroTwice_027');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abc', '', '');
      model.moveCursor(1);
      model.moveCursor(3);
      model.moveCursor(3);
      logStep('leftBelowZeroTwice_027', 'minus two', model);
      expect(model.cursorIndex).assertEqual(-2);
      checkSlices(model, '', '', 'abc');
      expect(model.cursorLeft).assertEqual(0);
      expect(model.message()).assertEqual('abc');
      TestLogger.end(TAG_COMPOSITION, 'leftBelowZeroTwice_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0280
     * @tc.name rightBeyondMessage028
     * @tc.desc A caret already beyond the message is left untouched by a right move, so the prefix is the whole text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rightBeyondMessage_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'rightBeyondMessage_028');
      let model: TextEditingModel = newUniformModel(100);
      let state: TextState = {
        inputText: 'abcdef',
        selectInput: '',
        lastInput: '',
        cursorIndex: 10,
        selectIndex: 10,
        cursorLeft: 60
      };
      model.loadState(state);
      model.moveCursor(4);
      logStep('rightBeyondMessage_028', 'right beyond', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(10);
      expect(model.selectIndex).assertEqual(10);
      expect(model.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_COMPOSITION, 'rightBeyondMessage_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0290
     * @tc.name navigateChineseText029
     * @tc.desc Two right moves and one left move over two Chinese characters split them one code unit apart
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'navigateChineseText_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'navigateChineseText_029');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, '中文', '', '');
      model.moveCursor(1);
      model.moveCursor(4);
      model.moveCursor(4);
      logStep('navigateChineseText_029', 'two right', model);
      checkSlices(model, '中文', '', '');
      expect(model.cursorIndex).assertEqual(2);
      model.moveCursor(3);
      logStep('navigateChineseText_029', 'one left', model);
      checkSlices(model, '中', '', '文');
      checkCaret(model, 1, 10);
      checkMessage(model, '中文');
      TestLogger.end(TAG_COMPOSITION, 'navigateChineseText_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0300
     * @tc.name unknownDirectionKeepsCaret030
     * @tc.desc A direction outside 1..4 clears the selection and resplits at the unchanged caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'unknownDirectionKeepsCaret_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'unknownDirectionKeepsCaret_030');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', '', 'cd');
      model.moveCursor(0);
      logStep('unknownDirectionKeepsCaret_030', 'direction zero', model);
      checkSlices(model, 'ab', '', 'cd');
      checkCaret(model, 2, 20);
      checkMessage(model, 'abcd');
      expect(model.selectInput).assertEqual('');
      TestLogger.end(TAG_COMPOSITION, 'unknownDirectionKeepsCaret_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0310
     * @tc.name selectLeftSelectsTail031
     * @tc.desc One anchor-left move selects the final character and keeps the caret at the message end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectLeftSelectsTail_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectLeftSelectsTail_031');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByMovement(3);
      logStep('selectLeftSelectsTail_031', 'anchor left', model);
      checkSlices(model, 'abcde', 'f', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(5);
      expect(model.cursorLeft).assertEqual(60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'selectLeftSelectsTail_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0320
     * @tc.name selectLeftTwiceSelectsTwo032
     * @tc.desc Two anchor-left moves select the last two characters while the caret stays at six
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectLeftTwiceSelectsTwo_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectLeftTwiceSelectsTwo_032');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByMovement(3);
      model.selectByMovement(3);
      logStep('selectLeftTwiceSelectsTwo_032', 'anchor left twice', model);
      checkSlices(model, 'abcd', 'ef', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(4);
      expect(model.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_COMPOSITION, 'selectLeftTwiceSelectsTwo_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0330
     * @tc.name anchorRightAtEndIsNoop033
     * @tc.desc An anchor-right move at the end is clamped by the guard and leaves the selection empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorRightAtEndIsNoop_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorRightAtEndIsNoop_033');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByMovement(4);
      logStep('anchorRightAtEndIsNoop_033', 'anchor right', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_COMPOSITION, 'anchorRightAtEndIsNoop_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0340
     * @tc.name selectUpSelectsAll034
     * @tc.desc An anchor-up move selects the whole message and turns the prefix into an empty slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectUpSelectsAll_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectUpSelectsAll_034');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByMovement(1);
      logStep('selectUpSelectsAll_034', 'anchor up', model);
      checkSlices(model, '', 'abcdef', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_COMPOSITION, 'selectUpSelectsAll_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0350
     * @tc.name selectDownClearsSelection035
     * @tc.desc An anchor-down move at the end keeps the whole prefix and clears the selection slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectDownClearsSelection_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectDownClearsSelection_035');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByMovement(2);
      logStep('selectDownClearsSelection_035', 'anchor down', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(6);
      TestLogger.end(TAG_COMPOSITION, 'selectDownClearsSelection_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0360
     * @tc.name anchorRightWithinSelection036
     * @tc.desc Moving the anchor right inside an existing selection shrinks the selected slice from its left side
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorRightWithinSelection_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorRightWithinSelection_036');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.selectByMovement(4);
      logStep('anchorRightWithinSelection_036', 'anchor right', model);
      checkSlices(model, 'abc', 'd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(3);
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_COMPOSITION, 'anchorRightWithinSelection_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0370
     * @tc.name anchorLeftCreatesSelection037
     * @tc.desc With an empty selection at the caret, one anchor-left move produces a one-character selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'anchorLeftCreatesSelection_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorLeftCreatesSelection_037');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcd', '', 'ef');
      model.selectByMovement(3);
      logStep('anchorLeftCreatesSelection_037', 'anchor left', model);
      checkSlices(model, 'abc', 'd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(3);
      expect(model.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_COMPOSITION, 'anchorLeftCreatesSelection_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0380
     * @tc.name anchorLeftOfCaretGrows038
     * @tc.desc An anchor already left of the caret moves one more step and grows the selected prefix slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorLeftOfCaretGrows_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorLeftOfCaretGrows_038');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'a', 'bcd', 'ef');
      model.selectByMovement(3);
      logStep('anchorLeftOfCaretGrows_038', 'anchor left', model);
      checkSlices(model, '', 'abcd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(0);
      expect(model.message()).assertEqual('abcdef');
      TestLogger.end(TAG_COMPOSITION, 'anchorLeftOfCaretGrows_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0390
     * @tc.name endFlagSelectsSuffix039
     * @tc.desc The END_FLAG range moves the whole message into the selected slice and leaves the caret offset stale
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'endFlagSelectsSuffix_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'endFlagSelectsSuffix_039');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByRange(0, END_FLAG);
      logStep('endFlagSelectsSuffix_039', 'end flag', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'endFlagSelectsSuffix_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0400
     * @tc.name endFlagFromMiddleCaret040
     * @tc.desc The END_FLAG range keeps the prefix up to the caret and selects only the remaining suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'endFlagFromMiddleCaret_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'endFlagFromMiddleCaret_040');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', '', 'cdef');
      model.selectByRange(0, END_FLAG);
      logStep('endFlagFromMiddleCaret_040', 'end flag', model);
      checkSlices(model, 'ab', 'cdef', '');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_COMPOSITION, 'endFlagFromMiddleCaret_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0410
     * @tc.name endFlagOnEmptyText041
     * @tc.desc The END_FLAG range on an empty message keeps every slice empty and the caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'endFlagOnEmptyText_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'endFlagOnEmptyText_041');
      let model: TextEditingModel = newUniformModel(100);
      model.selectByRange(0, END_FLAG);
      logStep('endFlagOnEmptyText_041', 'end flag empty', model);
      checkSlices(model, '', '', '');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(0);
      checkMessage(model, '');
      TestLogger.end(TAG_COMPOSITION, 'endFlagOnEmptyText_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0420
     * @tc.name plainRangeSelectsFromStart042
     * @tc.desc A non-sentinel forward range selects everything left of the caret and leaves the caret index untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'plainRangeSelectsFromStart_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'plainRangeSelectsFromStart_042');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', '', 'cdef');
      model.selectByRange(1, 5);
      logStep('plainRangeSelectsFromStart_042', 'plain range', model);
      checkSlices(model, '', 'ab', 'cdef');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(20);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'plainRangeSelectsFromStart_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0430
     * @tc.name zeroRangeResetsToStart043
     * @tc.desc The (0, 0) range empties the prefix and moves the caret to the start without losing text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'zeroRangeResetsToStart_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroRangeResetsToStart_043');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.selectByRange(0, 0);
      logStep('zeroRangeResetsToStart_043', 'zero range', model);
      checkSlices(model, '', '', 'abcdef');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(0);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'zeroRangeResetsToStart_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0440
     * @tc.name changeSelectionForward044
     * @tc.desc A forward changeSelection puts two characters into the selected slice and advances the caret offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeSelectionForward_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'changeSelectionForward_044');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.changeSelection(2, 4);
      logStep('changeSelectionForward_044', 'forward', model);
      checkSlices(model, 'ab', 'cd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(40);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'changeSelectionForward_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0450
     * @tc.name selectAllMovesEverythingToSelection045
     * @tc.desc SELECT_ALL empties the prefix and the trailing slice, puts all six characters into the selection and moves the caret to six
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllMovesEverythingToSelection_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectAllMovesEverythingToSelection_045');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.handleExtendAction(0);
      logStep('selectAllMovesEverythingToSelection_045', 'select all', model);
      checkSlices(model, '', 'abcdef', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'selectAllMovesEverythingToSelection_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0460
     * @tc.name insertOverSelectionWithTail046
     * @tc.desc An accepted insert over a selection appends to the prefix and drops the two selected characters only
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertOverSelectionWithTail_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'insertOverSelectionWithTail_046');
      let model: TextEditingModel = newUniformModel(60);
      loadPlain(model, 'abc', 'de', 'f');
      expect(model.insertText('Y')).assertTrue();
      logStep('insertOverSelectionWithTail_046', 'after insert', model);
      checkSlices(model, 'abcY', '', 'f');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.cursorLeft).assertEqual(40);
      checkMessage(model, 'abcYf');
      expect(model.message().indexOf('de')).assertEqual(-1);
      TestLogger.end(TAG_COMPOSITION, 'insertOverSelectionWithTail_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0470
     * @tc.name deleteRightOverSelection047
     * @tc.desc A one-character forward delete over a selection drops the selection and one more character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightOverSelection_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteRightOverSelection_047');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.deleteRight(1);
      logStep('deleteRightOverSelection_047', 'after delete right', model);
      checkSlices(model, 'ab', '', 'f');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(4);
      expect(model.cursorLeft).assertEqual(20);
      checkMessage(model, 'abf');
      TestLogger.end(TAG_COMPOSITION, 'deleteRightOverSelection_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0480
     * @tc.name deleteLeftKeepsSelection048
     * @tc.desc A backward delete removes one prefix character but keeps the selected slice intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftKeepsSelection_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'deleteLeftKeepsSelection_048');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.deleteLeft(1);
      logStep('deleteLeftKeepsSelection_048', 'after delete left', model);
      checkSlices(model, 'a', 'cd', 'ef');
      expect(model.cursorIndex).assertEqual(1);
      expect(model.selectIndex).assertEqual(1);
      expect(model.cursorLeft).assertEqual(10);
      checkMessage(model, 'acdef');
      TestLogger.end(TAG_COMPOSITION, 'deleteLeftKeepsSelection_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0490
     * @tc.name zeroRangeAfterSelection049
     * @tc.desc The (0, 0) range after a selection folds the selection back and moves the caret to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroRangeAfterSelection_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroRangeAfterSelection_049');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.selectByRange(0, 0);
      logStep('zeroRangeAfterSelection_049', 'zero range', model);
      checkSlices(model, '', '', 'abcdef');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(0);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'zeroRangeAfterSelection_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0500
     * @tc.name clickCollapsesSelection050
     * @tc.desc A click conversion over a selection drops the selection and positions the caret from the pixel offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickCollapsesSelection_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickCollapsesSelection_050');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.calculateCursor(35);
      logStep('clickCollapsesSelection_050', 'after click', model);
      checkSlices(model, 'abc', '', 'def');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.selectIndex).assertEqual(3);
      expect(model.cursorLeft).assertEqual(30);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickCollapsesSelection_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0510
     * @tc.name selectAllThenDeleteLeft051
     * @tc.desc After SELECT_ALL a forward delete is a no-op and a backward delete keeps the selected text intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllThenDeleteLeft_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'selectAllThenDeleteLeft_051');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.handleExtendAction(0);
      model.deleteRight(2);
      logStep('selectAllThenDeleteLeft_051', 'forward delete no-op', model);
      checkSlices(model, '', 'abcdef', '');
      model.deleteLeft(2);
      logStep('selectAllThenDeleteLeft_051', 'backward delete', model);
      checkSlices(model, '', 'abcdef', '');
      expect(model.cursorIndex).assertEqual(0);
      expect(model.selectIndex).assertEqual(0);
      expect(model.cursorLeft).assertEqual(0);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'selectAllThenDeleteLeft_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0520
     * @tc.name zeroDeleteRightOverSelection052
     * @tc.desc A zero-length forward delete still clears the selection and rebuilds the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'zeroDeleteRightOverSelection_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'zeroDeleteRightOverSelection_052');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.deleteRight(0);
      logStep('zeroDeleteRightOverSelection_052', 'after zero forward delete', model);
      checkSlices(model, 'ab', '', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(4);
      checkMessage(model, 'abef');
      TestLogger.end(TAG_COMPOSITION, 'zeroDeleteRightOverSelection_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0530
     * @tc.name oversizedDeleteRightOverSelection053
     * @tc.desc A forward delete longer than the tail drops the selection and the whole tail, keeping only the prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'oversizedDeleteRightOverSelection_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'oversizedDeleteRightOverSelection_053');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.deleteRight(5);
      logStep('oversizedDeleteRightOverSelection_053', 'after oversized delete', model);
      checkSlices(model, 'ab', '', '');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.cursorLeft).assertEqual(20);
      checkMessage(model, 'ab');
      TestLogger.end(TAG_COMPOSITION, 'oversizedDeleteRightOverSelection_053');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0540
     * @tc.name downFoldsSelection054
     * @tc.desc A down move after a selection folds it into a six-character prefix and empties the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'downFoldsSelection_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'downFoldsSelection_054');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.moveCursor(2);
      logStep('downFoldsSelection_054', 'down', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'downFoldsSelection_054');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0550
     * @tc.name changeSelectionNarrowsSelection055
     * @tc.desc A forward changeSelection inside a selection keeps the message and narrows the selected slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionNarrowsSelection_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'changeSelectionNarrowsSelection_055');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.changeSelection(1, 3);
      logStep('changeSelectionNarrowsSelection_055', 'narrowed', model);
      checkSlices(model, 'a', 'bc', 'def');
      expect(model.cursorIndex).assertEqual(3);
      expect(model.selectIndex).assertEqual(1);
      expect(model.cursorLeft).assertEqual(30);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'changeSelectionNarrowsSelection_055');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0560
     * @tc.name emptyInsertOverSelection056
     * @tc.desc An accepted empty insertion over a selection still discards the selected characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'emptyInsertOverSelection_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'emptyInsertOverSelection_056');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      expect(model.insertText('')).assertTrue();
      logStep('emptyInsertOverSelection_056', 'after empty insert', model);
      checkSlices(model, 'ab', '', 'ef');
      expect(model.cursorIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(20);
      checkMessage(model, 'abef');
      TestLogger.end(TAG_COMPOSITION, 'emptyInsertOverSelection_056');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0570
     * @tc.name anchorRightShrinksSelection057
     * @tc.desc An anchor-right move when the anchor sits left of the caret keeps only the middle character selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorRightShrinksSelection_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorRightShrinksSelection_057');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'a', 'bcd', 'ef');
      model.selectByMovement(4);
      logStep('anchorRightShrinksSelection_057', 'anchor right', model);
      checkSlices(model, 'ab', 'cd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(2);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'anchorRightShrinksSelection_057');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0580
     * @tc.name anchorDownSelectsTail058
     * @tc.desc An anchor-down move moves the anchor past the caret, so the tail after the caret becomes the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'anchorDownSelectsTail_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'anchorDownSelectsTail_058');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'a', 'bcd', 'ef');
      model.selectByMovement(2);
      logStep('anchorDownSelectsTail_058', 'anchor down', model);
      checkSlices(model, 'abcd', 'ef', '');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(10);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'anchorDownSelectsTail_058');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0590
     * @tc.name changeSelectionReverse059
     * @tc.desc A reversed changeSelection swaps its bounds and produces the same slices as the forward form
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionReverse_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'changeSelectionReverse_059');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'ab', 'cd', 'ef');
      model.changeSelection(4, 2);
      logStep('changeSelectionReverse_059', 'reversed', model);
      checkSlices(model, 'ab', 'cd', 'ef');
      expect(model.cursorIndex).assertEqual(4);
      expect(model.selectIndex).assertEqual(2);
      expect(model.cursorLeft).assertEqual(40);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'changeSelectionReverse_059');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0600
     * @tc.name changeSelectionEmptyAtEnd060
     * @tc.desc A changeSelection whose bounds equal the message length produces an empty selection and a full prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionEmptyAtEnd_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'changeSelectionEmptyAtEnd_060');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.changeSelection(6, 6);
      logStep('changeSelectionEmptyAtEnd_060', 'empty at end', model);
      checkSlices(model, 'abcdef', '', '');
      expect(model.cursorIndex).assertEqual(6);
      expect(model.selectIndex).assertEqual(6);
      expect(model.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_COMPOSITION, 'changeSelectionEmptyAtEnd_060');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0610
     * @tc.name clickAtZero061
     * @tc.desc A click at pixel zero moves the whole message into the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'clickAtZero_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickAtZero_061');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(0);
      logStep('clickAtZero_061', 'click zero', model);
      checkSlices(model, '', '', 'abcdef');
      checkCaret(model, 0, 0);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickAtZero_061');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0620
     * @tc.name clickAtThirtyFive062
     * @tc.desc A click at 35 px floors to caret three and splits the six characters into three and three
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'clickAtThirtyFive_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickAtThirtyFive_062');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(35);
      logStep('clickAtThirtyFive_062', 'click 35', model);
      checkSlices(model, 'abc', '', 'def');
      checkCaret(model, 3, 30);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickAtThirtyFive_062');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0630
     * @tc.name clickAtExactEnd063
     * @tc.desc A click at exactly the measured width lands on the final caret position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'clickAtExactEnd_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickAtExactEnd_063');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(60);
      logStep('clickAtExactEnd_063', 'click 60', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      TestLogger.end(TAG_COMPOSITION, 'clickAtExactEnd_063');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0640
     * @tc.name clickJustBeforeEnd064
     * @tc.desc A click one pixel before the end floors to caret five and leaves one character in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickJustBeforeEnd_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickJustBeforeEnd_064');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(59);
      logStep('clickJustBeforeEnd_064', 'click 59', model);
      checkSlices(model, 'abcde', '', 'f');
      checkCaret(model, 5, 50);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickJustBeforeEnd_064');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0650
     * @tc.name clickNegativeOffset065
     * @tc.desc A negative click offset floors below zero, is clamped to caret zero and keeps the message in the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickNegativeOffset_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickNegativeOffset_065');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(-1);
      logStep('clickNegativeOffset_065', 'click minus one', model);
      checkSlices(model, '', '', 'abcdef');
      checkCaret(model, 0, 0);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickNegativeOffset_065');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0660
     * @tc.name clickBeyondEnd066
     * @tc.desc A click far beyond the text is clamped to the message length with an empty tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickBeyondEnd_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickBeyondEnd_066');
      let model: TextEditingModel = newUniformModel(2000);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(1000);
      logStep('clickBeyondEnd_066', 'click 1000', model);
      checkSlices(model, 'abcdef', '', '');
      checkCaret(model, 6, 60);
      checkMessage(model, 'abcdef');
      TestLogger.end(TAG_COMPOSITION, 'clickBeyondEnd_066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0670
     * @tc.name clickOnEmptyMessage067
     * @tc.desc A click on an empty message divides zero by zero and stores NaN for the caret and the anchor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickOnEmptyMessage_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickOnEmptyMessage_067');
      let model: TextEditingModel = newUniformModel(100);
      model.calculateCursor(0);
      logStep('clickOnEmptyMessage_067', 'empty click', model);
      expect(Number.isNaN(model.cursorIndex)).assertTrue();
      expect(Number.isNaN(model.selectIndex)).assertTrue();
      checkSlices(model, '', '', '');
      expect(model.cursorLeft).assertEqual(0);
      checkMessage(model, '');
      TestLogger.end(TAG_COMPOSITION, 'clickOnEmptyMessage_067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0680
     * @tc.name clickNonZeroOnEmptyMessage068
     * @tc.desc A non-zero click on an empty message has the same NaN outcome as a zero click
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'clickNonZeroOnEmptyMessage_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'clickNonZeroOnEmptyMessage_068');
      let model: TextEditingModel = newUniformModel(100);
      model.calculateCursor(50);
      logStep('clickNonZeroOnEmptyMessage_068', 'empty click 50', model);
      expect(Number.isNaN(model.cursorIndex)).assertTrue();
      expect(Number.isNaN(model.selectIndex)).assertTrue();
      expect(model.inputText).assertEqual('');
      expect(model.lastInput).assertEqual('');
      expect(model.selectInput).assertEqual('');
      TestLogger.end(TAG_COMPOSITION, 'clickNonZeroOnEmptyMessage_068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_COMPOSITION_0690
     * @tc.name insertAfterClick069
     * @tc.desc After a click at caret three, an insertion appends to the three-character prefix before the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertAfterClick_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_COMPOSITION, 'insertAfterClick_069');
      let model: TextEditingModel = newUniformModel(100);
      loadPlain(model, 'abcdef', '', '');
      model.calculateCursor(35);
      expect(model.insertText('X')).assertTrue();
      logStep('insertAfterClick_069', 'after insert', model);
      checkSlices(model, 'abcX', '', 'def');
      checkCaret(model, 4, 40);
      checkMessage(model, 'abcXdef');
      TestLogger.end(TAG_COMPOSITION, 'insertAfterClick_069');
      await yieldToEventLoop();
      done();
    });

  });
}
