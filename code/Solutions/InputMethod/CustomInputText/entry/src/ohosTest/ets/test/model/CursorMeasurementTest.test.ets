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
  TextEditingModel, TextState, TextMeasure, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure,
  SpyMeasure
} from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, END_FLAG, TAG_MEASURE, CURSOR_DEFAULT_LEFT, CURSOR_DEFAULT_TOP, CURSOR_DEFAULT_WIDTH,
  CURSOR_DEFAULT_HEIGHT, DEFAULT_INPUT_WIDTH, FONT_SIZE, LINE_HEIGHT
} from '../common/TestConstant';

/**
 * Pixel measurement contract of the caret offset.
 *
 * CustomInputText.ets assigns cursorLeft in exactly seven assignments:
 * insertText (after an accepted insertion), deleteLeft, moveCursor, the (0, 0)
 * and default branches of selectByRange, handleExtendAction(SELECT_ALL) and
 * calculateCursor. changeSelection writes it from inputText + selectInput.
 * deleteRight and selectByMovement never write it, so the previous value
 * survives those callbacks.
 *
 * Every case injects a measure that overwrites
 * CanvasRenderingContext2D.measureText().width, executes the real replica from
 * TextEditingModel and asserts the exact pixel value, not just that the field
 * changed. SpyMeasure cases pin down which strings are measured, how often and
 * in which order, because the double measurement during the insert guard is part
 * of the observable cost of the component.
 */

const CHAR_WIDTH: number = 10;
const CANVAS_WIDTH: number = 320;
const TEXT_SIX: string = 'abcdef';
const TEXT_THREE: string = 'abc';
const TEXT_TWO: string = 'ab';
const CJK_TWO: string = '中文';

function makeModel(measure: TextMeasure, width: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, width);
  return model;
}

function makeLoaded(measure: TextMeasure, width: number, inputText: string, selectInput: string,
  lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, width);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function makeStated(measure: TextMeasure, width: number, inputText: string, selectInput: string,
  lastInput: string, cursorIndex: number, selectIndex: number, cursorLeft: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, width);
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

function logCursor(caseName: string, state: TextState): void {
  TestLogger.value(TAG_MEASURE, caseName,
    'left=' + state.cursorLeft.toString() + ';cursor=' + state.cursorIndex.toString() +
      ';input=' + state.inputText);
}

export default function cursorMeasurementTest(): void {
  describe('CustomInputTextCursorMeasurementTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0010
     * @tc.name insertZeroWidthMeasure_001
     * @tc.desc A zero-width font keeps cursorLeft at zero even after five accepted characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertZeroWidthMeasure_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertZeroWidthMeasure_001');
      let model: TextEditingModel = makeModel(new UniformMeasure(0), CANVAS_WIDTH);
      let accepted: boolean = model.insertText('abcde');
      let state: TextState = model.snapshot();
      logCursor('insertZeroWidthMeasure_001', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'insertZeroWidthMeasure_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0020
     * @tc.name insertFractionalWidthCursorLeft_002
     * @tc.desc A half-pixel font makes four characters measure exactly two pixels, an exact binary fraction
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertFractionalWidthCursorLeft_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertFractionalWidthCursorLeft_002');
      let model: TextEditingModel = makeModel(new UniformMeasure(0.5), CANVAS_WIDTH);
      let accepted: boolean = model.insertText('abcd');
      let state: TextState = model.snapshot();
      logCursor('insertFractionalWidthCursorLeft_002', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(2);
      TestLogger.end(TAG_MEASURE, 'insertFractionalWidthCursorLeft_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0030
     * @tc.name insertRejectedKeepsZeroLeft_003
     * @tc.desc Four characters on a thirty-pixel canvas are rejected and cursorLeft stays at its zero default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertRejectedKeepsZeroLeft_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertRejectedKeepsZeroLeft_003');
      let model: TextEditingModel = makeModel(new UniformMeasure(CHAR_WIDTH), 30);
      let accepted: boolean = model.insertText('abcd');
      let state: TextState = model.snapshot();
      logCursor('insertRejectedKeepsZeroLeft_003', state);
      expect(accepted).assertFalse();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'insertRejectedKeepsZeroLeft_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0040
     * @tc.name insertLastInputCausesRejection_004
     * @tc.desc A forty-pixel trailing slice pushes the projection past sixty pixels, so the left offset stays twenty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'insertLastInputCausesRejection_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertLastInputCausesRejection_004');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), 60, TEXT_TWO, '', 'cdef');
      let accepted: boolean = model.insertText('X');
      let state: TextState = model.snapshot();
      logCursor('insertLastInputCausesRejection_004', state);
      expect(accepted).assertFalse();
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'insertLastInputCausesRejection_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0050
     * @tc.name insertCjkMixedMeasure_005
     * @tc.desc Two wide characters under the mixed measure add sixteen pixels each for a total of thirty-two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertCjkMixedMeasure_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertCjkMixedMeasure_005');
      let model: TextEditingModel = makeModel(new MixedMeasure(8, 16), CANVAS_WIDTH);
      let accepted: boolean = model.insertText(CJK_TWO);
      let state: TextState = model.snapshot();
      logCursor('insertCjkMixedMeasure_005', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_MEASURE, 'insertCjkMixedMeasure_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0060
     * @tc.name insertAsciiMixedMeasure_006
     * @tc.desc Three ASCII characters under the mixed measure use the eight-pixel branch and total twenty-four
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertAsciiMixedMeasure_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertAsciiMixedMeasure_006');
      let model: TextEditingModel = makeModel(new MixedMeasure(8, 16), CANVAS_WIDTH);
      let accepted: boolean = model.insertText(TEXT_THREE);
      let state: TextState = model.snapshot();
      logCursor('insertAsciiMixedMeasure_006', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(24);
      TestLogger.end(TAG_MEASURE, 'insertAsciiMixedMeasure_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0070
     * @tc.name insertFixedMeasureIgnoresLength_007
     * @tc.desc A constant two-pixel measure gives cursorLeft two pixels regardless of the three characters added
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertFixedMeasureIgnoresLength_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertFixedMeasureIgnoresLength_007');
      let model: TextEditingModel = makeModel(new FixedMeasure(2), CANVAS_WIDTH);
      let accepted: boolean = model.insertText(TEXT_THREE);
      let state: TextState = model.snapshot();
      logCursor('insertFixedMeasureIgnoresLength_007', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(2);
      TestLogger.end(TAG_MEASURE, 'insertFixedMeasureIgnoresLength_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0080
     * @tc.name insertNaNFixedMeasurePropagatesNaN_008
     * @tc.desc A NaN measure never exceeds the canvas, and the accepted insertion stores NaN in cursorLeft
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertNaNFixedMeasurePropagatesNaN_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertNaNFixedMeasurePropagatesNaN_008');
      let model: TextEditingModel = makeModel(new FixedMeasure(NaN), CANVAS_WIDTH);
      let accepted: boolean = model.insertText('a');
      let state: TextState = model.snapshot();
      logCursor('insertNaNFixedMeasurePropagatesNaN_008', state);
      expect(accepted).assertTrue();
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      TestLogger.end(TAG_MEASURE, 'insertNaNFixedMeasurePropagatesNaN_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0090
     * @tc.name insertInfiniteFixedMeasureRejected_009
     * @tc.desc An infinite measure makes the projection infinite, so the insertion is rejected and the left stays zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertInfiniteFixedMeasureRejected_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertInfiniteFixedMeasureRejected_009');
      let model: TextEditingModel = makeModel(new FixedMeasure(Infinity), CANVAS_WIDTH);
      let accepted: boolean = model.insertText('a');
      let state: TextState = model.snapshot();
      logCursor('insertInfiniteFixedMeasureRejected_009', state);
      expect(accepted).assertFalse();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'insertInfiniteFixedMeasureRejected_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0100
     * @tc.name insertNegativeFixedMeasureAccepted_010
     * @tc.desc A negative measure can never exceed the canvas and is stored verbatim in cursorLeft
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'insertNegativeFixedMeasureAccepted_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'insertNegativeFixedMeasureAccepted_010');
      let model: TextEditingModel = makeModel(new FixedMeasure(-5), CANVAS_WIDTH);
      let accepted: boolean = model.insertText('a');
      let state: TextState = model.snapshot();
      logCursor('insertNegativeFixedMeasureAccepted_010', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(-5);
      TestLogger.end(TAG_MEASURE, 'insertNegativeFixedMeasureAccepted_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0110
     * @tc.name deleteLeftAllRefresh_011
     * @tc.desc Deleting every character measures the empty prefix and resets the offset to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteLeftAllRefresh_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftAllRefresh_011');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteLeft(6);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftAllRefresh_011', state);
      expect(state.cursorLeft).assertEqual(0);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_MEASURE, 'deleteLeftAllRefresh_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0120
     * @tc.name deleteLeftZeroStillRefreshes_012
     * @tc.desc A zero delete length changes nothing but still recomputes the offset to the same sixty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftZeroStillRefreshes_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftZeroStillRefreshes_012');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(CHAR_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain(TEXT_SIX, '', '');
      spy.reset();
      model.deleteLeft(0);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftZeroStillRefreshes_012', state);
      expect(state.cursorLeft).assertEqual(60);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.calls[0]).assertEqual(TEXT_SIX);
      TestLogger.end(TAG_MEASURE, 'deleteLeftZeroStillRefreshes_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0130
     * @tc.name deleteLeftNegativeRefresh_013
     * @tc.desc A minus-one length extends the substring end and keeps the whole text at sixty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftNegativeRefresh_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftNegativeRefresh_013');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteLeft(-1);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftNegativeRefresh_013', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'deleteLeftNegativeRefresh_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0140
     * @tc.name deleteLeftNaNRefresh_014
     * @tc.desc A NaN length becomes a zero substring end, clearing the text and zeroing the offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftNaNRefresh_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftNaNRefresh_014');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteLeft(NaN);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftNaNRefresh_014', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'deleteLeftNaNRefresh_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0150
     * @tc.name deleteLeftInfiniteRefresh_015
     * @tc.desc An infinite length clamps the substring end to zero and the empty prefix measures zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftInfiniteRefresh_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftInfiniteRefresh_015');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteLeft(Infinity);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftInfiniteRefresh_015', state);
      expect(state.inputText).assertEqual('');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'deleteLeftInfiniteRefresh_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0160
     * @tc.name deleteLeftMixedMeasureRefresh_016
     * @tc.desc Deleting the wide character leaves one ASCII letter at the eight-pixel mixed width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftMixedMeasureRefresh_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftMixedMeasureRefresh_016');
      let model: TextEditingModel = makeLoaded(new MixedMeasure(8, 16), CANVAS_WIDTH, 'a中', '', '');
      let before: TextState = model.snapshot();
      expect(before.cursorLeft).assertEqual(24);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftMixedMeasureRefresh_016', state);
      expect(state.inputText).assertEqual('a');
      expect(state.cursorLeft).assertEqual(8);
      TestLogger.end(TAG_MEASURE, 'deleteLeftMixedMeasureRefresh_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0170
     * @tc.name deleteLeftFixedMeasureRefresh_017
     * @tc.desc A constant seven-pixel measure reports seven pixels even for the two remaining characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftFixedMeasureRefresh_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftFixedMeasureRefresh_017');
      let model: TextEditingModel = makeLoaded(new FixedMeasure(7), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftFixedMeasureRefresh_017', state);
      expect(state.cursorLeft).assertEqual(7);
      TestLogger.end(TAG_MEASURE, 'deleteLeftFixedMeasureRefresh_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0180
     * @tc.name deleteLeftSquareMeasureRefresh_018
     * @tc.desc A quadratic one-pixel measure turns four characters into sixteen pixels and three into nine
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftSquareMeasureRefresh_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftSquareMeasureRefresh_018');
      let model: TextEditingModel = makeLoaded(new SquareMeasure(1), CANVAS_WIDTH, 'abcd', '', '');
      let before: TextState = model.snapshot();
      expect(before.cursorLeft).assertEqual(16);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftSquareMeasureRefresh_018', state);
      expect(state.cursorLeft).assertEqual(9);
      TestLogger.end(TAG_MEASURE, 'deleteLeftSquareMeasureRefresh_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0190
     * @tc.name deleteLeftIgnoresSelection_019
     * @tc.desc The offset is measured from inputText alone, so the selected slice contributes nothing after a delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftIgnoresSelection_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftIgnoresSelection_019');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftIgnoresSelection_019', state);
      expect(state.cursorLeft).assertEqual(10);
      expect(state.selectInput).assertEqual('cd');
      TestLogger.end(TAG_MEASURE, 'deleteLeftIgnoresSelection_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0200
     * @tc.name deleteLeftHalfUnitRefresh_020
     * @tc.desc A 0.5 length truncates the substring end to five, deleting one character and leaving fifty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteLeftHalfUnitRefresh_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteLeftHalfUnitRefresh_020');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteLeft(0.5);
      let state: TextState = model.snapshot();
      logCursor('deleteLeftHalfUnitRefresh_020', state);
      expect(state.inputText.length).assertEqual(5);
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_MEASURE, 'deleteLeftHalfUnitRefresh_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0210
     * @tc.name deleteRightKeepsZeroLeft_021
     * @tc.desc A forward delete at a zero caret rewrites the suffix but never measures, so the offset stays zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightKeepsZeroLeft_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightKeepsZeroLeft_021');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, '', '', TEXT_SIX);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logCursor('deleteRightKeepsZeroLeft_021', state);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'deleteRightKeepsZeroLeft_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0220
     * @tc.name deleteRightCaretAtEndKeepsLeft_022
     * @tc.desc A forward delete with the caret at the message end is a no-op and keeps the offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'deleteRightCaretAtEndKeepsLeft_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightCaretAtEndKeepsLeft_022');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logCursor('deleteRightCaretAtEndKeepsLeft_022', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'deleteRightCaretAtEndKeepsLeft_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0230
     * @tc.name deleteRightWithSelectionKeepsLeft_023
     * @tc.desc Dropping the selected slice does not move the caret offset, which still reflects inputText
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightWithSelectionKeepsLeft_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightWithSelectionKeepsLeft_023');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logCursor('deleteRightWithSelectionKeepsLeft_023', state);
      expect(state.cursorLeft).assertEqual(20);
      expect(state.selectInput).assertEqual('');
      TestLogger.end(TAG_MEASURE, 'deleteRightWithSelectionKeepsLeft_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0240
     * @tc.name deleteRightKeepsNaNAndInfinityLeft_024
     * @tc.desc A stale NaN offset survives one forward delete together with an infinite one in a second model
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightKeepsNaNAndInfinityLeft_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightKeepsNaNAndInfinityLeft_024');
      let nanModel: TextEditingModel = makeStated(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, '', '', TEXT_SIX, 0, 0, NaN);
      nanModel.deleteRight(1);
      let nanState: TextState = nanModel.snapshot();
      let infModel: TextEditingModel = makeStated(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, '', '', TEXT_SIX, 0, 0, Infinity);
      infModel.deleteRight(1);
      let infState: TextState = infModel.snapshot();
      logCursor('deleteRightKeepsNaNAndInfinityLeft_024', nanState);
      expect(Number.isNaN(nanState.cursorLeft)).assertTrue();
      expect(infState.cursorLeft).assertEqual(Infinity);
      TestLogger.end(TAG_MEASURE, 'deleteRightKeepsNaNAndInfinityLeft_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0250
     * @tc.name deleteRightFixedMeasureKeepsValue_025
     * @tc.desc A constant three-pixel offset loaded into the model is preserved by a forward delete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightFixedMeasureKeepsValue_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightFixedMeasureKeepsValue_025');
      let model: TextEditingModel = makeStated(new FixedMeasure(3), CANVAS_WIDTH, '', '', TEXT_SIX, 0, 0, 3);
      model.deleteRight(2);
      let state: TextState = model.snapshot();
      logCursor('deleteRightFixedMeasureKeepsValue_025', state);
      expect(state.cursorLeft).assertEqual(3);
      TestLogger.end(TAG_MEASURE, 'deleteRightFixedMeasureKeepsValue_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0260
     * @tc.name deleteRightZeroLengthKeepsLeft_026
     * @tc.desc A zero forward delete clears nothing but the selected slice and leaves the offset intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'deleteRightZeroLengthKeepsLeft_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'deleteRightZeroLengthKeepsLeft_026');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.deleteRight(0);
      let state: TextState = model.snapshot();
      logCursor('deleteRightZeroLengthKeepsLeft_026', state);
      expect(state.cursorLeft).assertEqual(20);
      expect(state.lastInput).assertEqual('ef');
      TestLogger.end(TAG_MEASURE, 'deleteRightZeroLengthKeepsLeft_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0270
     * @tc.name moveUpMeasuresEmptyPrefix_027
     * @tc.desc Moving up from the middle folds the message and measures the empty prefix at zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveUpMeasuresEmptyPrefix_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveUpMeasuresEmptyPrefix_027');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(1);
      let state: TextState = model.snapshot();
      logCursor('moveUpMeasuresEmptyPrefix_027', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'moveUpMeasuresEmptyPrefix_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0280
     * @tc.name moveLeftMeasuresShorterPrefix_028
     * @tc.desc Moving left from the end measures the five-character prefix at fifty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveLeftMeasuresShorterPrefix_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveLeftMeasuresShorterPrefix_028');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logCursor('moveLeftMeasuresShorterPrefix_028', state);
      expect(state.cursorIndex).assertEqual(5);
      expect(state.cursorLeft).assertEqual(50);
      TestLogger.end(TAG_MEASURE, 'moveLeftMeasuresShorterPrefix_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0290
     * @tc.name moveLeftAtZeroMeasuresEmpty_029
     * @tc.desc Moving left at position zero produces the negative index and measures the empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveLeftAtZeroMeasuresEmpty_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveLeftAtZeroMeasuresEmpty_029');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(1);
      let atZero: TextState = model.snapshot();
      expect(atZero.cursorIndex).assertEqual(0);
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logCursor('moveLeftAtZeroMeasuresEmpty_029', state);
      expect(state.cursorIndex).assertEqual(-1);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'moveLeftAtZeroMeasuresEmpty_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0300
     * @tc.name moveRightAtEndKeepsOffset_030
     * @tc.desc Moving right at the message end does not step past it, so the offset stays at sixty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightAtEndKeepsOffset_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveRightAtEndKeepsOffset_030');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logCursor('moveRightAtEndKeepsOffset_030', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'moveRightAtEndKeepsOffset_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0310
     * @tc.name moveRightFromZeroMeasuresOneUnit_031
     * @tc.desc Moving right from position zero advances the offset from zero to one character unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moveRightFromZeroMeasuresOneUnit_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveRightFromZeroMeasuresOneUnit_031');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(1);
      let atZero: TextState = model.snapshot();
      expect(atZero.cursorLeft).assertEqual(0);
      model.moveCursor(4);
      let state: TextState = model.snapshot();
      logCursor('moveRightFromZeroMeasuresOneUnit_031', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(10);
      TestLogger.end(TAG_MEASURE, 'moveRightFromZeroMeasuresOneUnit_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0320
     * @tc.name moveLeftMixedMeasure_032
     * @tc.desc Moving left across a wide character leaves one ASCII letter at the eight-pixel mixed width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveLeftMixedMeasure_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveLeftMixedMeasure_032');
      let model: TextEditingModel = makeLoaded(new MixedMeasure(8, 16), CANVAS_WIDTH, 'a中', '', '');
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logCursor('moveLeftMixedMeasure_032', state);
      expect(state.inputText).assertEqual('a');
      expect(state.cursorLeft).assertEqual(8);
      TestLogger.end(TAG_MEASURE, 'moveLeftMixedMeasure_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0330
     * @tc.name moveUpFixedMeasure_033
     * @tc.desc A constant three-pixel measure reports three pixels even for the empty prefix after moving up
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveUpFixedMeasure_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveUpFixedMeasure_033');
      let model: TextEditingModel = makeLoaded(new FixedMeasure(3), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.moveCursor(1);
      let state: TextState = model.snapshot();
      logCursor('moveUpFixedMeasure_033', state);
      expect(state.cursorLeft).assertEqual(3);
      TestLogger.end(TAG_MEASURE, 'moveUpFixedMeasure_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0340
     * @tc.name moveNaNDirectionFoldsSelection_034
     * @tc.desc A NaN direction likewise matches nothing and measures the prefix up to the unchanged caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moveNaNDirectionFoldsSelection_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'moveNaNDirectionFoldsSelection_034');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.moveCursor(NaN);
      let state: TextState = model.snapshot();
      logCursor('moveNaNDirectionFoldsSelection_034', state);
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MEASURE, 'moveNaNDirectionFoldsSelection_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0350
     * @tc.name rangeResetMeasuresEmpty_035
     * @tc.desc The (0, 0) range resets the caret and stores the measured width of the empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeResetMeasuresEmpty_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeResetMeasuresEmpty_035');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logCursor('rangeResetMeasuresEmpty_035', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'rangeResetMeasuresEmpty_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0360
     * @tc.name rangeResetMeasuresOnce_036
     * @tc.desc The (0, 0) branch measures exactly one empty string and never the old prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeResetMeasuresOnce_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeResetMeasuresOnce_036');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(CHAR_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain(TEXT_SIX, '', '');
      spy.reset();
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logCursor('rangeResetMeasuresOnce_036', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.calls[0]).assertEqual('');
      TestLogger.end(TAG_MEASURE, 'rangeResetMeasuresOnce_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0370
     * @tc.name rangeEndFlagKeepsOffset_037
     * @tc.desc The END_FLAG branch selects the whole tail but leaves the twenty-pixel offset from before the callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeEndFlagKeepsOffset_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeEndFlagKeepsOffset_037');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, '', 'cdef');
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logCursor('rangeEndFlagKeepsOffset_037', state);
      expect(state.selectInput).assertEqual('cdef');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'rangeEndFlagKeepsOffset_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0380
     * @tc.name rangeEndFlagKeepsNaN_038
     * @tc.desc A stale NaN offset survives the END_FLAG branch because that branch never measures
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeEndFlagKeepsNaN_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeEndFlagKeepsNaN_038');
      let model: TextEditingModel = makeStated(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, '', 'cdef',
        2, 2, NaN);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logCursor('rangeEndFlagKeepsNaN_038', state);
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      TestLogger.end(TAG_MEASURE, 'rangeEndFlagKeepsNaN_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0390
     * @tc.name rangeForwardKeepsOffset_039
     * @tc.desc A plain forward range moves the prefix into the selection and leaves the offset at twenty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeForwardKeepsOffset_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeForwardKeepsOffset_039');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, '', 'cdef');
      model.selectByRange(1, 3);
      let state: TextState = model.snapshot();
      logCursor('rangeForwardKeepsOffset_039', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('ab');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'rangeForwardKeepsOffset_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0400
     * @tc.name rangeForwardLargeEndKeepsOffset_040
     * @tc.desc A forward range just below END_FLAG still takes the plain branch and preserves the loaded offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeForwardLargeEndKeepsOffset_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeForwardLargeEndKeepsOffset_040');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, '', 'cdef');
      model.selectByRange(0, 999);
      let state: TextState = model.snapshot();
      logCursor('rangeForwardLargeEndKeepsOffset_040', state);
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'rangeForwardLargeEndKeepsOffset_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0410
     * @tc.name rangeDefaultMeasuresWholeMessage_041
     * @tc.desc A reversed range takes the default branch, puts the caret at the end and measures sixty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rangeDefaultMeasuresWholeMessage_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeDefaultMeasuresWholeMessage_041');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(3, 1);
      let state: TextState = model.snapshot();
      logCursor('rangeDefaultMeasuresWholeMessage_041', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'rangeDefaultMeasuresWholeMessage_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0420
     * @tc.name rangeDefaultEmptyMeasuresZero_042
     * @tc.desc The default branch on an empty editor measures the empty message and reports zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeDefaultEmptyMeasuresZero_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeDefaultEmptyMeasuresZero_042');
      let model: TextEditingModel = makeModel(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH);
      model.selectByRange(1, 0);
      let state: TextState = model.snapshot();
      logCursor('rangeDefaultEmptyMeasuresZero_042', state);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'rangeDefaultEmptyMeasuresZero_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0430
     * @tc.name rangeEqualNonZeroTakesDefault_043
     * @tc.desc A two-to-two range is not a forward range and therefore falls into the default branch at sixty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeEqualNonZeroTakesDefault_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeEqualNonZeroTakesDefault_043');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(2, 2);
      let state: TextState = model.snapshot();
      logCursor('rangeEqualNonZeroTakesDefault_043', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'rangeEqualNonZeroTakesDefault_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0440
     * @tc.name rangeNegativePairTakesDefault_044
     * @tc.desc A minus-one to minus-one range is neither reset nor forward, so the default branch measures the whole text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeNegativePairTakesDefault_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeNegativePairTakesDefault_044');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(-1, -1);
      let state: TextState = model.snapshot();
      logCursor('rangeNegativePairTakesDefault_044', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'rangeNegativePairTakesDefault_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0450
     * @tc.name rangeNaNPairTakesDefault_045
     * @tc.desc NaN endpoints make both comparisons false, so the default branch measures the whole message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeNaNPairTakesDefault_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeNaNPairTakesDefault_045');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(NaN, NaN);
      let state: TextState = model.snapshot();
      logCursor('rangeNaNPairTakesDefault_045', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'rangeNaNPairTakesDefault_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0460
     * @tc.name rangeInfinitePairTakesDefault_046
     * @tc.desc An infinity-to-infinity range is not greater than itself and falls into the default branch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeInfinitePairTakesDefault_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeInfinitePairTakesDefault_046');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.selectByRange(Infinity, Infinity);
      let state: TextState = model.snapshot();
      logCursor('rangeInfinitePairTakesDefault_046', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'rangeInfinitePairTakesDefault_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0470
     * @tc.name rangeEndFlagAtZeroKeepsZero_047
     * @tc.desc END_FLAG with a zero caret builds an empty selection and leaves the zero offset untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeEndFlagAtZeroKeepsZero_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeEndFlagAtZeroKeepsZero_047');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, '', '', TEXT_SIX);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logCursor('rangeEndFlagAtZeroKeepsZero_047', state);
      expect(state.selectIndex).assertEqual(6);
      expect(state.selectInput).assertEqual('abcdef');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'rangeEndFlagAtZeroKeepsZero_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0480
     * @tc.name rangeBranchMeasurementCounts_048
     * @tc.desc Each range branch is audited through one model: reset and default measure once, the other two never
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeBranchMeasurementCounts_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeBranchMeasurementCounts_048');
      let spy: SpyMeasure = new SpyMeasure(new UniformMeasure(CHAR_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, CANVAS_WIDTH);
      model.loadPlain(TEXT_SIX, '', '');
      spy.reset();
      model.selectByRange(0, 0);
      let resetCalls: number = spy.callCount();
      spy.reset();
      model.selectByRange(0, END_FLAG);
      let endCalls: number = spy.callCount();
      spy.reset();
      model.selectByRange(1, 3);
      let forwardCalls: number = spy.callCount();
      spy.reset();
      model.selectByRange(3, 1);
      let defaultCalls: number = spy.callCount();
      TestLogger.value(TAG_MEASURE, 'branch calls', resetCalls.toString() + '/' + endCalls.toString() + '/' +
        forwardCalls.toString() + '/' + defaultCalls.toString());
      expect(resetCalls).assertEqual(1);
      expect(endCalls).assertEqual(0);
      expect(forwardCalls).assertEqual(0);
      expect(defaultCalls).assertEqual(1);
      TestLogger.end(TAG_MEASURE, 'rangeBranchMeasurementCounts_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0490
     * @tc.name rangeDefaultMixedMeasure_049
     * @tc.desc The default branch measures a mixed-script message at its eight-plus-sixteen width of twenty-four
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rangeDefaultMixedMeasure_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'rangeDefaultMixedMeasure_049');
      let model: TextEditingModel = makeLoaded(new MixedMeasure(8, 16), CANVAS_WIDTH, 'a中', '', '');
      model.selectByRange(7, 1);
      let state: TextState = model.snapshot();
      logCursor('rangeDefaultMixedMeasure_049', state);
      expect(state.cursorLeft).assertEqual(24);
      TestLogger.end(TAG_MEASURE, 'rangeDefaultMixedMeasure_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0500
     * @tc.name calculateAtZeroMeasuresEmpty_050
     * @tc.desc A click at offset zero goes to the else branch and measures the empty prefix at zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateAtZeroMeasuresEmpty_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateAtZeroMeasuresEmpty_050');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logCursor('calculateAtZeroMeasuresEmpty_050', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateAtZeroMeasuresEmpty_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0510
     * @tc.name calculateAtThirtyMeasuresWhole_051
     * @tc.desc A click at the exact right edge maps to the last index and measures the whole thirty-pixel text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'calculateAtThirtyMeasuresWhole_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateAtThirtyMeasuresWhole_051');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(30);
      let state: TextState = model.snapshot();
      logCursor('calculateAtThirtyMeasuresWhole_051', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MEASURE, 'calculateAtThirtyMeasuresWhole_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0520
     * @tc.name calculateBeyondFloorsToLast_052
     * @tc.desc A click at thirty-one pixels still floors to three and measures the whole text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateBeyondFloorsToLast_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateBeyondFloorsToLast_052');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(31);
      let state: TextState = model.snapshot();
      logCursor('calculateBeyondFloorsToLast_052', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MEASURE, 'calculateBeyondFloorsToLast_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0530
     * @tc.name calculateNegativeMeasuresEmpty_053
     * @tc.desc A click at minus one floors to minus one, clamps to zero and measures the empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateNegativeMeasuresEmpty_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateNegativeMeasuresEmpty_053');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(-1);
      let state: TextState = model.snapshot();
      logCursor('calculateNegativeMeasuresEmpty_053', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateNegativeMeasuresEmpty_053');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0540
     * @tc.name calculateMinusTenClampsZero_054
     * @tc.desc A click at minus ten floors to minus one, which the first guard clamps to zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateMinusTenClampsZero_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateMinusTenClampsZero_054');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(-10);
      let state: TextState = model.snapshot();
      logCursor('calculateMinusTenClampsZero_054', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateMinusTenClampsZero_054');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0550
     * @tc.name calculateHalfCharMeasuresEmpty_055
     * @tc.desc A click at five pixels floors to zero and therefore measures an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateHalfCharMeasuresEmpty_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateHalfCharMeasuresEmpty_055');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(5);
      let state: TextState = model.snapshot();
      logCursor('calculateHalfCharMeasuresEmpty_055', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateHalfCharMeasuresEmpty_055');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0560
     * @tc.name calculateEmptyMessageNaNCaret_056
     * @tc.desc An empty message makes the average width NaN and the caret NaN, while the empty prefix measures zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateEmptyMessageNaNCaret_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateEmptyMessageNaNCaret_056');
      let model: TextEditingModel = makeModel(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH);
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logCursor('calculateEmptyMessageNaNCaret_056', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateEmptyMessageNaNCaret_056');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0570
     * @tc.name calculateNaNClickMeasuresEmpty_057
     * @tc.desc A NaN click offset propagates into the caret and the else branch measures an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateNaNClickMeasuresEmpty_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateNaNClickMeasuresEmpty_057');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(NaN);
      let state: TextState = model.snapshot();
      logCursor('calculateNaNClickMeasuresEmpty_057', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateNaNClickMeasuresEmpty_057');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0580
     * @tc.name calculateInfiniteClickMeasuresWhole_058
     * @tc.desc An infinite click clamps the caret to the text length and measures the whole thirty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateInfiniteClickMeasuresWhole_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateInfiniteClickMeasuresWhole_058');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(Infinity);
      let state: TextState = model.snapshot();
      logCursor('calculateInfiniteClickMeasuresWhole_058', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MEASURE, 'calculateInfiniteClickMeasuresWhole_058');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0590
     * @tc.name calculateNegativeInfiniteClickZero_059
     * @tc.desc A minus-infinite click clamps to zero and measures the empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateNegativeInfiniteClickZero_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateNegativeInfiniteClickZero_059');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(-Infinity);
      let state: TextState = model.snapshot();
      logCursor('calculateNegativeInfiniteClickZero_059', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateNegativeInfiniteClickZero_059');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0600
     * @tc.name calculateZeroMeasureInfiniteCharWidth_060
     * @tc.desc A zero measure makes the average width zero, the division infinite and the caret clamp to the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateZeroMeasureInfiniteCharWidth_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateZeroMeasureInfiniteCharWidth_060');
      let model: TextEditingModel = makeLoaded(new FixedMeasure(0), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(10);
      let state: TextState = model.snapshot();
      logCursor('calculateZeroMeasureInfiniteCharWidth_060', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'calculateZeroMeasureInfiniteCharWidth_060');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0610
     * @tc.name calculateNaNMeasureNaNCaret_061
     * @tc.desc A NaN measure produces a NaN average and caret, and the empty prefix itself measures NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'calculateNaNMeasureNaNCaret_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'calculateNaNMeasureNaNCaret_061');
      let model: TextEditingModel = makeLoaded(new FixedMeasure(NaN), CANVAS_WIDTH, TEXT_THREE, '', '');
      model.calculateCursor(10);
      let state: TextState = model.snapshot();
      logCursor('calculateNaNMeasureNaNCaret_061', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(Number.isNaN(state.cursorLeft)).assertTrue();
      TestLogger.end(TAG_MEASURE, 'calculateNaNMeasureNaNCaret_061');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0620
     * @tc.name changeSelectionForwardMeasuresUpToCaret_062
     * @tc.desc Selecting zero to two measures inputText plus the selected slice at twenty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeSelectionForwardMeasuresUpToCaret_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionForwardMeasuresUpToCaret_062');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(0, 2);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionForwardMeasuresUpToCaret_062', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('ab');
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'changeSelectionForwardMeasuresUpToCaret_062');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0630
     * @tc.name changeSelectionMiddleMeasuresFour_063
     * @tc.desc Selecting one to four measures the four-character prefix at forty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'changeSelectionMiddleMeasuresFour_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionMiddleMeasuresFour_063');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(1, 4);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionMiddleMeasuresFour_063', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('bcd');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MEASURE, 'changeSelectionMiddleMeasuresFour_063');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0640
     * @tc.name changeSelectionReversedMeasuresSame_064
     * @tc.desc Reversing the endpoints selects the same slice and measures the same forty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionReversedMeasuresSame_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionReversedMeasuresSame_064');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(4, 1);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionReversedMeasuresSame_064', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('bcd');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MEASURE, 'changeSelectionReversedMeasuresSame_064');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0650
     * @tc.name changeSelectionEmptyMeasuresEmpty_065
     * @tc.desc Selecting zero to zero leaves the caret at the start and measures an empty prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionEmptyMeasuresEmpty_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionEmptyMeasuresEmpty_065');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(0, 0);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionEmptyMeasuresEmpty_065', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'changeSelectionEmptyMeasuresEmpty_065');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0660
     * @tc.name changeSelectionNegativeMeasuresEmpty_066
     * @tc.desc A negative range truncates both indices to zero, leaving the whole text in the tail and a zero offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionNegativeMeasuresEmpty_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionNegativeMeasuresEmpty_066');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(-2, -1);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionNegativeMeasuresEmpty_066', state);
      expect(state.selectIndex).assertEqual(-2);
      expect(state.lastInput).assertEqual(TEXT_SIX);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'changeSelectionNegativeMeasuresEmpty_066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0670
     * @tc.name changeSelectionNaNPairKeepsIndices_067
     * @tc.desc NaN endpoints match neither comparison, so the old indices survive and the same forty pixels are measured
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionNaNPairKeepsIndices_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionNaNPairKeepsIndices_067');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(NaN, NaN);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionNaNPairKeepsIndices_067', state);
      expect(state.inputText).assertEqual(TEXT_TWO);
      expect(state.selectInput).assertEqual('cd');
      expect(state.cursorLeft).assertEqual(40);
      TestLogger.end(TAG_MEASURE, 'changeSelectionNaNPairKeepsIndices_067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0680
     * @tc.name changeSelectionInfinitePairKeepsIndices_068
     * @tc.desc Infinite endpoints also leave the old indices unchanged and measure the same forty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionInfinitePairKeepsIndices_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionInfinitePairKeepsIndices_068');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(Infinity, Infinity);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionInfinitePairKeepsIndices_068', state);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'changeSelectionInfinitePairKeepsIndices_068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0690
     * @tc.name changeSelectionNegativeInfinitePairKeeps_069
     * @tc.desc A minus-infinite pair likewise preserves the old indices and the forty-pixel offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionNegativeInfinitePairKeeps_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionNegativeInfinitePairKeeps_069');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(-Infinity, -Infinity);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionNegativeInfinitePairKeeps_069', state);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'changeSelectionNegativeInfinitePairKeeps_069');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0700
     * @tc.name changeSelectionInfiniteEndMeasuresWhole_070
     * @tc.desc An infinite end clamps the caret to six and turns the whole message into the measured selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionInfiniteEndMeasuresWhole_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionInfiniteEndMeasuresWhole_070');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(0, Infinity);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionInfiniteEndMeasuresWhole_070', state);
      expect(state.cursorIndex).assertEqual(6);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'changeSelectionInfiniteEndMeasuresWhole_070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0710
     * @tc.name changeSelectionNegativeEndMeasuresTwo_071
     * @tc.desc A minus-infinite end truncates the prefix away and leaves the first two characters selected at twenty pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionNegativeEndMeasuresTwo_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'changeSelectionNegativeEndMeasuresTwo_071');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.changeSelection(2, -Infinity);
      let state: TextState = model.snapshot();
      logCursor('changeSelectionNegativeEndMeasuresTwo_071', state);
      expect(state.selectInput).assertEqual(TEXT_TWO);
      expect(state.cursorLeft).assertEqual(20);
      TestLogger.end(TAG_MEASURE, 'changeSelectionNegativeEndMeasuresTwo_071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0720
     * @tc.name selectAllEmptyMeasuresZero_072
     * @tc.desc SELECT_ALL on an empty editor measures the empty selection at zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllEmptyMeasuresZero_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'selectAllEmptyMeasuresZero_072');
      let model: TextEditingModel = makeModel(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logCursor('selectAllEmptyMeasuresZero_072', state);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'selectAllEmptyMeasuresZero_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0730
     * @tc.name selectAllFoldsSelectionAndMeasuresSixty_073
     * @tc.desc SELECT_ALL folds a loaded selection into the message and measures all six characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllFoldsSelectionAndMeasuresSixty_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'selectAllFoldsSelectionAndMeasuresSixty_073');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logCursor('selectAllFoldsSelectionAndMeasuresSixty_073', state);
      expect(state.selectInput).assertEqual(TEXT_SIX);
      expect(state.cursorLeft).assertEqual(60);
      TestLogger.end(TAG_MEASURE, 'selectAllFoldsSelectionAndMeasuresSixty_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0740
     * @tc.name selectAllMixedMeasure_074
     * @tc.desc SELECT_ALL measures two wide characters at sixteen pixels each, thirty-two in total
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllMixedMeasure_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'selectAllMixedMeasure_074');
      let model: TextEditingModel = makeLoaded(new MixedMeasure(8, 16), CANVAS_WIDTH, CJK_TWO, '', '');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logCursor('selectAllMixedMeasure_074', state);
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_MEASURE, 'selectAllMixedMeasure_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0750
     * @tc.name selectAllFixedMeasure_075
     * @tc.desc A constant six-pixel measure reports six pixels for the whole selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectAllFixedMeasure_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'selectAllFixedMeasure_075');
      let model: TextEditingModel = makeLoaded(new FixedMeasure(6), CANVAS_WIDTH, TEXT_SIX, '', '');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logCursor('selectAllFixedMeasure_075', state);
      expect(state.cursorLeft).assertEqual(6);
      TestLogger.end(TAG_MEASURE, 'selectAllFixedMeasure_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0760
     * @tc.name sequenceInsertThenEndFlag_076
     * @tc.desc An insertion sets thirty pixels and the following END_FLAG selection keeps that stale offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sequenceInsertThenEndFlag_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'sequenceInsertThenEndFlag_076');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, '', '');
      model.insertText('X');
      let afterInsert: TextState = model.snapshot();
      expect(afterInsert.cursorLeft).assertEqual(30);
      model.selectByRange(0, END_FLAG);
      let state: TextState = model.snapshot();
      logCursor('sequenceInsertThenEndFlag_076', state);
      expect(state.cursorLeft).assertEqual(30);
      TestLogger.end(TAG_MEASURE, 'sequenceInsertThenEndFlag_076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0770
     * @tc.name sequenceDeleteRightThenReset_077
     * @tc.desc A forward delete keeps twenty pixels, then the (0, 0) range measures the empty prefix at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sequenceDeleteRightThenReset_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'sequenceDeleteRightThenReset_077');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), CANVAS_WIDTH, TEXT_TWO, 'cd', 'ef');
      model.deleteRight(1);
      let afterRight: TextState = model.snapshot();
      expect(afterRight.cursorLeft).assertEqual(20);
      model.selectByRange(0, 0);
      let state: TextState = model.snapshot();
      logCursor('sequenceDeleteRightThenReset_077', state);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_MEASURE, 'sequenceDeleteRightThenReset_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0780
     * @tc.name twoModelsKeepIndependentOffsets_078
     * @tc.desc Two editors with different measures keep independent offsets through the same callback sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoModelsKeepIndependentOffsets_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'twoModelsKeepIndependentOffsets_078');
      let first: TextEditingModel = makeModel(new UniformMeasure(10), CANVAS_WIDTH);
      let second: TextEditingModel = makeModel(new UniformMeasure(1), CANVAS_WIDTH);
      first.insertText(TEXT_THREE);
      second.insertText(TEXT_THREE);
      let firstState: TextState = first.snapshot();
      let secondState: TextState = second.snapshot();
      logCursor('twoModelsKeepIndependentOffsets_078', firstState);
      expect(firstState.cursorLeft).assertEqual(30);
      expect(secondState.cursorLeft).assertEqual(3);
      TestLogger.end(TAG_MEASURE, 'twoModelsKeepIndependentOffsets_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_MEASURE_0790
     * @tc.name acceptanceAtExactBoundaryOffset_079
     * @tc.desc An exact fit at seventy pixels is accepted and stores the same seventy pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'acceptanceAtExactBoundaryOffset_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_MEASURE, 'acceptanceAtExactBoundaryOffset_079');
      let model: TextEditingModel = makeLoaded(new UniformMeasure(CHAR_WIDTH), 70, TEXT_SIX, '', '');
      let accepted: boolean = model.insertText('a');
      let state: TextState = model.snapshot();
      logCursor('acceptanceAtExactBoundaryOffset_079', state);
      expect(accepted).assertTrue();
      expect(state.cursorLeft).assertEqual(70);
      TestLogger.end(TAG_MEASURE, 'acceptanceAtExactBoundaryOffset_079');
      await yieldToEventLoop();
      done();
    });

  });
}
