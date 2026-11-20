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

function uniAt(unit: number, width: number, inputText: string, selectInput: string, lastInput: string): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(new UniformMeasure(unit), width);
  model.loadPlain(inputText, selectInput, lastInput);
  return model;
}

function logState(caseName: string, state: TextState): void {
  TestLogger.value(TAG_UNICODE, caseName,
    state.inputText + '|' + state.selectInput + '|' + state.lastInput +
    '|cursor=' + state.cursorIndex.toString() + '|anchor=' + state.selectIndex.toString() +
    '|left=' + state.cursorLeft.toString());
}

export default function textUnicodeEditingTestExtended(): void {
  describe('CustomInputTextUnicodeEditingExtendedTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1260
     * @tc.name selectAllWithSelectionEmoji126
     * @tc.desc SELECT_ALL merges an existing selection with the emoji prefix into one selected slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllWithSelectionEmoji_126', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllWithSelectionEmoji_126');
      let model: TextEditingModel = mixState(320, 'a', '\uD83D\uDE00', '', 3, 1, 8);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllWithSelectionEmoji_126', state);
      expect(state.selectInput).assertEqual('a' + '\uD83D\uDE00');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'selectAllWithSelectionEmoji_126');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1270
     * @tc.name selectAllEmptyMessage127
     * @tc.desc SELECT_ALL on an empty composer leaves every slice empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllEmptyMessage_127', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllEmptyMessage_127');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllEmptyMessage_127', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'selectAllEmptyMessage_127');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1280
     * @tc.name extendCutIsNoop128
     * @tc.desc Extend action 3 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendCutIsNoop_128', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendCutIsNoop_128');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(3);
      let state: TextState = model.snapshot();
      logState('extendCutIsNoop_128', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendCutIsNoop_128');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1290
     * @tc.name extendCopyIsNoop129
     * @tc.desc Extend action 4 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendCopyIsNoop_129', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendCopyIsNoop_129');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(4);
      let state: TextState = model.snapshot();
      logState('extendCopyIsNoop_129', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendCopyIsNoop_129');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1300
     * @tc.name extendPasteIsNoop130
     * @tc.desc Extend action 5 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendPasteIsNoop_130', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendPasteIsNoop_130');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(5);
      let state: TextState = model.snapshot();
      logState('extendPasteIsNoop_130', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendPasteIsNoop_130');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1310
     * @tc.name extendUnknownIsNoop131
     * @tc.desc Extend action 99 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendUnknownIsNoop_131', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendUnknownIsNoop_131');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(99);
      let state: TextState = model.snapshot();
      logState('extendUnknownIsNoop_131', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendUnknownIsNoop_131');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1320
     * @tc.name extendNegativeIsNoop132
     * @tc.desc Extend action -1 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendNegativeIsNoop_132', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendNegativeIsNoop_132');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(-1);
      let state: TextState = model.snapshot();
      logState('extendNegativeIsNoop_132', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendNegativeIsNoop_132');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1330
     * @tc.name extendFractionIsNoop133
     * @tc.desc Extend action 0.5 leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendFractionIsNoop_133', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendFractionIsNoop_133');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0.5);
      let state: TextState = model.snapshot();
      logState('extendFractionIsNoop_133', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendFractionIsNoop_133');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1340
     * @tc.name extendNanIsNoop134
     * @tc.desc A NaN extend action leaves the emoji state unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'extendNanIsNoop_134', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'extendNanIsNoop_134');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(NaN);
      let state: TextState = model.snapshot();
      logState('extendNanIsNoop_134', state);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.selectInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'extendNanIsNoop_134');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1350
     * @tc.name selectAllThenInsertDropsEmoji135
     * @tc.desc An insert after SELECT_ALL keeps only the appended text because the selection slice is cleared
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllThenInsertDropsEmoji_135', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllThenInsertDropsEmoji_135');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      model.insertText('a');
      let state: TextState = model.snapshot();
      logState('selectAllThenInsertDropsEmoji_135', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'selectAllThenInsertDropsEmoji_135');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1360
     * @tc.name selectAllThenDeleteLeftKeepsSelection136
     * @tc.desc A left delete after SELECT_ALL only truncates the empty prefix and keeps the selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllThenDeleteLeftKeepsSelection_136', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllThenDeleteLeftKeepsSelection_136');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('selectAllThenDeleteLeftKeepsSelection_136', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'selectAllThenDeleteLeftKeepsSelection_136');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1370
     * @tc.name selectAllRepeatedIsIdempotent137
     * @tc.desc Calling SELECT_ALL twice yields the same slice layout as one call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'selectAllRepeatedIsIdempotent_137', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'selectAllRepeatedIsIdempotent_137');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('selectAllRepeatedIsIdempotent_137', state);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'selectAllRepeatedIsIdempotent_137');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1380
     * @tc.name cursorAtZeroAscii138
     * @tc.desc A click at x=0 on the ascii fixture parks the caret at zero and keeps the whole text trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtZeroAscii_138', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtZeroAscii_138');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('cursorAtZeroAscii_138', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('abc');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'cursorAtZeroAscii_138');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1390
     * @tc.name cursorAtFullWidthAscii139
     * @tc.desc A click at the full ascii width clamps the caret to 3 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtFullWidthAscii_139', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtFullWidthAscii_139');
      let model: TextEditingModel = mixedAt(320, 'abc', '', '');
      model.calculateCursor(24);
      let state: TextState = model.snapshot();
      logState('cursorAtFullWidthAscii_139', state);
      expect(state.cursorIndex).assertEqual(3);
      expect(state.inputText).assertEqual('abc');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(24);
      TestLogger.end(TAG_UNICODE, 'cursorAtFullWidthAscii_139');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1400
     * @tc.name cursorAtZeroCjk140
     * @tc.desc A click at x=0 on the cjk fixture parks the caret at zero and keeps the whole text trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtZeroCjk_140', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtZeroCjk_140');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('cursorAtZeroCjk_140', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('中文');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'cursorAtZeroCjk_140');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1410
     * @tc.name cursorAtFullWidthCjk141
     * @tc.desc A click at the full cjk width clamps the caret to 2 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtFullWidthCjk_141', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtFullWidthCjk_141');
      let model: TextEditingModel = mixedAt(320, '中文', '', '');
      model.calculateCursor(32);
      let state: TextState = model.snapshot();
      logState('cursorAtFullWidthCjk_141', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('中文');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'cursorAtFullWidthCjk_141');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1420
     * @tc.name cursorAtZeroEmoji142
     * @tc.desc A click at x=0 on the emoji fixture parks the caret at zero and keeps the whole text trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtZeroEmoji_142', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtZeroEmoji_142');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('cursorAtZeroEmoji_142', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.selectIndex).assertEqual(0);
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'cursorAtZeroEmoji_142');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1430
     * @tc.name cursorAtFullWidthEmoji143
     * @tc.desc A click at the full emoji width clamps the caret to 2 units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorAtFullWidthEmoji_143', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorAtFullWidthEmoji_143');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(32);
      let state: TextState = model.snapshot();
      logState('cursorAtFullWidthEmoji_143', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorLeft).assertEqual(32);
      TestLogger.end(TAG_UNICODE, 'cursorAtFullWidthEmoji_143');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1440
     * @tc.name cursorNegativeClampsToZero144
     * @tc.desc A negative click offset is clamped to caret 0 with the emoji trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorNegativeClampsToZero_144', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorNegativeClampsToZero_144');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(-1);
      let state: TextState = model.snapshot();
      logState('cursorNegativeClampsToZero_144', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'cursorNegativeClampsToZero_144');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1450
     * @tc.name cursorNegativeInfinityClamps145
     * @tc.desc A negative infinite click offset is clamped to caret 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorNegativeInfinityClamps_145', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorNegativeInfinityClamps_145');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(-Infinity);
      let state: TextState = model.snapshot();
      logState('cursorNegativeInfinityClamps_145', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      TestLogger.end(TAG_UNICODE, 'cursorNegativeInfinityClamps_145');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1460
     * @tc.name cursorPositiveInfinityClamps146
     * @tc.desc A positive infinite click offset clamps the caret to the message length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorPositiveInfinityClamps_146', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorPositiveInfinityClamps_146');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(Infinity);
      let state: TextState = model.snapshot();
      logState('cursorPositiveInfinityClamps_146', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.inputText).assertEqual('\uD83D\uDE00');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'cursorPositiveInfinityClamps_146');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1470
     * @tc.name cursorNanProducesNanCaret147
     * @tc.desc A NaN click offset yields a NaN caret index, an empty prefix and the whole message trailing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorNanProducesNanCaret_147', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorNanProducesNanCaret_147');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(NaN);
      let state: TextState = model.snapshot();
      logState('cursorNanProducesNanCaret_147', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'cursorNanProducesNanCaret_147');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1480
     * @tc.name cursorEmptyMessageNan148
     * @tc.desc A click on an empty composer produces a NaN caret because the average char width is 0/0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorEmptyMessageNan_148', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorEmptyMessageNan_148');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.calculateCursor(0);
      let state: TextState = model.snapshot();
      logState('cursorEmptyMessageNan_148', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(Number.isNaN(state.selectIndex)).assertTrue();
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'cursorEmptyMessageNan_148');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1490
     * @tc.name cursorEmptyMessagePositive149
     * @tc.desc A positive click on an empty composer still produces a NaN caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorEmptyMessagePositive_149', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorEmptyMessagePositive_149');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.calculateCursor(5);
      let state: TextState = model.snapshot();
      logState('cursorEmptyMessagePositive_149', state);
      expect(Number.isNaN(state.cursorIndex)).assertTrue();
      expect(state.cursorLeft).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'cursorEmptyMessagePositive_149');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1500
     * @tc.name cursorCjkBeforeCharWidth150
     * @tc.desc A click just below the 16 px average char width keeps the CJK caret at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorCjkBeforeCharWidth_150', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorCjkBeforeCharWidth_150');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.loadPlain('中文', '', '');
      model.calculateCursor(15);
      let state: TextState = model.snapshot();
      logState('cursorCjkBeforeCharWidth_150', state);
      expect(state.cursorIndex).assertEqual(0);
      expect(state.inputText).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'cursorCjkBeforeCharWidth_150');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1510
     * @tc.name cursorCjkAtCharWidth151
     * @tc.desc A click at exactly 16 px advances the CJK caret to one unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorCjkAtCharWidth_151', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorCjkAtCharWidth_151');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.loadPlain('中文', '', '');
      model.calculateCursor(16);
      let state: TextState = model.snapshot();
      logState('cursorCjkAtCharWidth_151', state);
      expect(state.cursorIndex).assertEqual(1);
      expect(state.inputText).assertEqual('中');
      TestLogger.end(TAG_UNICODE, 'cursorCjkAtCharWidth_151');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1520
     * @tc.name cursorCjkBetweenUnits152
     * @tc.desc A click at 31 px on a two-unit CJK text still lands on unit one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorCjkBetweenUnits_152', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorCjkBetweenUnits_152');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.loadPlain('中文', '', '');
      model.calculateCursor(31);
      let state: TextState = model.snapshot();
      logState('cursorCjkBetweenUnits_152', state);
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'cursorCjkBetweenUnits_152');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1530
     * @tc.name cursorCjkAt32153
     * @tc.desc A click at 32 px on a two-unit CJK text clamps to the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorCjkAt32_153', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'cursorCjkAt32_153');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.loadPlain('中文', '', '');
      model.calculateCursor(32);
      let state: TextState = model.snapshot();
      logState('cursorCjkAt32_153', state);
      expect(state.cursorIndex).assertEqual(2);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'cursorCjkAt32_153');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1540
     * @tc.name spyInsertMeasuresThreeTimes154
     * @tc.desc An accepted insert measures the text, the trailing slice and the new prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'spyInsertMeasuresThreeTimes_154', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'spyInsertMeasuresThreeTimes_154');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('', '', '');
      spy.reset();
      model.insertText('abc');
      let state: TextState = model.snapshot();
      logState('spyInsertMeasuresThreeTimes_154', state);
      expect(spy.callCount()).assertEqual(3);
      expect(spy.countOf('abc')).assertEqual(2);
      expect(spy.countOf('')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'spyInsertMeasuresThreeTimes_154');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1550
     * @tc.name spyMoveCursorMeasuresPrefix155
     * @tc.desc A left move measures only the new prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'spyMoveCursorMeasuresPrefix_155', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'spyMoveCursorMeasuresPrefix_155');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.moveCursor(3);
      let state: TextState = model.snapshot();
      logState('spyMoveCursorMeasuresPrefix_155', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'spyMoveCursorMeasuresPrefix_155');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1560
     * @tc.name spySelectAllMeasuresWhole156
     * @tc.desc SELECT_ALL measures the whole selected message once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'spySelectAllMeasuresWhole_156', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'spySelectAllMeasuresWhole_156');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.handleExtendAction(0);
      let state: TextState = model.snapshot();
      logState('spySelectAllMeasuresWhole_156', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D\uDE00')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'spySelectAllMeasuresWhole_156');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1570
     * @tc.name spyCalculateCursorMeasuresPrefix157
     * @tc.desc A click conversion measures the whole message once and the resulting empty prefix once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'spyCalculateCursorMeasuresPrefix_157', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'spyCalculateCursorMeasuresPrefix_157');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.calculateCursor(10);
      let state: TextState = model.snapshot();
      logState('spyCalculateCursorMeasuresPrefix_157', state);
      expect(spy.callCount()).assertEqual(2);
      expect(spy.countOf('\uD83D\uDE00')).assertEqual(1);
      expect(spy.countOf('')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'spyCalculateCursorMeasuresPrefix_157');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1580
     * @tc.name spyChangeSelectionMeasuresCombined158
     * @tc.desc A range command measures the concatenation of inputText and selectInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'spyChangeSelectionMeasuresCombined_158', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'spyChangeSelectionMeasuresCombined_158');
      let spy: SpyMeasure = new SpyMeasure(new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH));
      let model: TextEditingModel = new TextEditingModel(spy, MODEL_WIDTH);
      model.loadPlain('\uD83D\uDE00', '', '');
      spy.reset();
      model.changeSelection(0, 2);
      let state: TextState = model.snapshot();
      logState('spyChangeSelectionMeasuresCombined_158', state);
      expect(spy.callCount()).assertEqual(1);
      expect(spy.countOf('\uD83D\uDE00')).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'spyChangeSelectionMeasuresCombined_158');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1590
     * @tc.name mixedWidthZwj159
     * @tc.desc The mixed measure charges 16 px for each of the eight ZWJ code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mixedWidthZwj_159', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'mixedWidthZwj_159');
      let measure: MixedMeasure = new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH);
      let width: number = measure.widthOf('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67');
      expect(width).assertEqual(128);
      TestLogger.end(TAG_UNICODE, 'mixedWidthZwj_159');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1600
     * @tc.name mixedWidthCombining160
     * @tc.desc The mixed measure charges 8 px for e and 16 px for the combining mark
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mixedWidthCombining_160', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'mixedWidthCombining_160');
      let measure: MixedMeasure = new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH);
      let width: number = measure.widthOf('é');
      expect(width).assertEqual(24);
      TestLogger.end(TAG_UNICODE, 'mixedWidthCombining_160');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1610
     * @tc.name mixedWidthBidi161
     * @tc.desc The mixed measure charges six ASCII units and five wide units in the bidirectional fixture
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mixedWidthBidi_161', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'mixedWidthBidi_161');
      let measure: MixedMeasure = new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH);
      let width: number = measure.widthOf('abcمرحبا123');
      expect(width).assertEqual(128);
      TestLogger.end(TAG_UNICODE, 'mixedWidthBidi_161');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1620
     * @tc.name mixedWidthNul162
     * @tc.desc The NUL unit is in the ASCII class and measures 8 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mixedWidthNul_162', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'mixedWidthNul_162');
      let measure: MixedMeasure = new MixedMeasure(ASCII_WIDTH, WIDE_WIDTH);
      let width: number = measure.widthOf('\u0000');
      expect(width).assertEqual(8);
      TestLogger.end(TAG_UNICODE, 'mixedWidthNul_162');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1630
     * @tc.name codeUnitCounts163
     * @tc.desc The fixtures expose two units for emoji, eight for the ZWJ family and two for the combining pair
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'codeUnitCounts_163', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'codeUnitCounts_163');
      let emojiCount: number = '\uD83D\uDE00'.length;
      let zwjCount: number = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67'.length;
      let combiningCount: number = 'é'.length;
      expect(emojiCount).assertEqual(2);
      expect(zwjCount).assertEqual(8);
      expect(combiningCount).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'codeUnitCounts_163');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1640
     * @tc.name sequenceInsertDeleteInsert164
     * @tc.desc Typing abc, deleting one unit and inserting an emoji composes ab plus the emoji
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceInsertDeleteInsert_164', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceInsertDeleteInsert_164');
      let model: TextEditingModel = uniAt(10, MODEL_WIDTH, '', '', '');
      model.insertText('abc');
      model.deleteLeft(1);
      model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('sequenceInsertDeleteInsert_164', state);
      expect(state.inputText).assertEqual('ab\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(40);
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'sequenceInsertDeleteInsert_164');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1650
     * @tc.name sequenceTypeThenLeftTwiceThenInsert165
     * @tc.desc Two left moves out of an emoji leave it trailing, so the next insert lands before it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceTypeThenLeftTwiceThenInsert_165', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceTypeThenLeftTwiceThenInsert_165');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.insertText('\uD83D\uDE00');
      model.moveCursor(3);
      model.moveCursor(3);
      model.insertText('a');
      let state: TextState = model.snapshot();
      logState('sequenceTypeThenLeftTwiceThenInsert_165', state);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      expect(state.cursorLeft).assertEqual(8);
      TestLogger.end(TAG_UNICODE, 'sequenceTypeThenLeftTwiceThenInsert_165');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1660
     * @tc.name sequenceSelectThenInsertDropsSelection166
     * @tc.desc An insert after selecting the emoji drops the selection and keeps the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceSelectThenInsertDropsSelection_166', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceSelectThenInsertDropsSelection_166');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.selectByMovement(2);
      model.insertText('x');
      let state: TextState = model.snapshot();
      logState('sequenceSelectThenInsertDropsSelection_166', state);
      expect(state.inputText).assertEqual('x');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'sequenceSelectThenInsertDropsSelection_166');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1670
     * @tc.name sequenceClickThenEndFlag167
     * @tc.desc A click inside the emoji followed by END_FLAG keeps the split caret and clears the tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceClickThenEndFlag_167', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceClickThenEndFlag_167');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(16);
      model.selectByRange(0, 1000);
      let state: TextState = model.snapshot();
      logState('sequenceClickThenEndFlag_167', state);
      expect(state.inputText).assertEqual('\uD83D');
      expect(state.selectInput).assertEqual('\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'sequenceClickThenEndFlag_167');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1680
     * @tc.name sequenceSelectAllThenDeleteLeft168
     * @tc.desc SELECT_ALL followed by a left delete leaves the selection intact and the prefix empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceSelectAllThenDeleteLeft_168', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceSelectAllThenDeleteLeft_168');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      model.deleteLeft(1);
      let state: TextState = model.snapshot();
      logState('sequenceSelectAllThenDeleteLeft_168', state);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'sequenceSelectAllThenDeleteLeft_168');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1690
     * @tc.name sequenceChangeThenDeleteRightLosesSelection169
     * @tc.desc Selecting the high surrogate and deleting right loses both halves of the emoji
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceChangeThenDeleteRightLosesSelection_169', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceChangeThenDeleteRightLosesSelection_169');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(0, 1);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('sequenceChangeThenDeleteRightLosesSelection_169', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'sequenceChangeThenDeleteRightLosesSelection_169');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1700
     * @tc.name sequenceZwjClickMiddle170
     * @tc.desc A click at 64 px inside the ZWJ family splits it after four code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceZwjClickMiddle_170', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceZwjClickMiddle_170');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.insertText('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67');
      model.calculateCursor(64);
      let state: TextState = model.snapshot();
      logState('sequenceZwjClickMiddle_170', state);
      expect(state.inputText).assertEqual('\uD83D\uDC68‍\uD83D');
      expect(state.lastInput).assertEqual('\uDC69‍\uD83D\uDC67');
      expect(state.cursorIndex).assertEqual(4);
      expect(state.cursorLeft).assertEqual(64);
      TestLogger.end(TAG_UNICODE, 'sequenceZwjClickMiddle_170');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1710
     * @tc.name sequenceArabicUpThenInsert171
     * @tc.desc An up move parks the Arabic text in lastInput and the next insert lands in front of it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceArabicUpThenInsert_171', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceArabicUpThenInsert_171');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.insertText('مرحبا');
      model.moveCursor(1);
      model.insertText('a');
      let state: TextState = model.snapshot();
      logState('sequenceArabicUpThenInsert_171', state);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('مرحبا');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'sequenceArabicUpThenInsert_171');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1720
     * @tc.name sequenceDeleteHalfThenInsertPair172
     * @tc.desc Deleting one unit of an emoji then inserting another emoji leaves a broken leading half
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceDeleteHalfThenInsertPair_172', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceDeleteHalfThenInsertPair_172');
      let model: TextEditingModel = mixedAt(320, '', '', '');
      model.insertText('\uD83D\uDE00');
      model.deleteLeft(1);
      model.insertText('\uD83D\uDE00');
      let state: TextState = model.snapshot();
      logState('sequenceDeleteHalfThenInsertPair_172', state);
      expect(state.inputText).assertEqual('\uD83D\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(3);
      TestLogger.end(TAG_UNICODE, 'sequenceDeleteHalfThenInsertPair_172');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1730
     * @tc.name sequenceSelectThenDeleteRight173
     * @tc.desc A right anchor move followed by a forward delete drops the selected units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceSelectThenDeleteRight_173', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceSelectThenDeleteRight_173');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.selectByMovement(4);
      model.deleteRight(1);
      let state: TextState = model.snapshot();
      logState('sequenceSelectThenDeleteRight_173', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('\uDE00');
      expect(state.selectIndex).assertEqual(0);
      TestLogger.end(TAG_UNICODE, 'sequenceSelectThenDeleteRight_173');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1740
     * @tc.name sequenceReversedChangeThenInsert174
     * @tc.desc A reversed selection command followed by an insert overwrites the selected emoji with the new text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceReversedChangeThenInsert_174', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceReversedChangeThenInsert_174');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.changeSelection(2, 0);
      model.insertText('a');
      let state: TextState = model.snapshot();
      logState('sequenceReversedChangeThenInsert_174', state);
      expect(state.inputText).assertEqual('a');
      expect(state.selectInput).assertEqual('');
      expect(state.lastInput).assertEqual('');
      TestLogger.end(TAG_UNICODE, 'sequenceReversedChangeThenInsert_174');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1750
     * @tc.name sequenceEndFlagThenChange175
     * @tc.desc END_FLAG followed by a 0..1 command selects only the high surrogate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceEndFlagThenChange_175', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceEndFlagThenChange_175');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.selectByRange(0, 1000);
      model.changeSelection(0, 1);
      let state: TextState = model.snapshot();
      logState('sequenceEndFlagThenChange_175', state);
      expect(state.inputText).assertEqual('');
      expect(state.selectInput).assertEqual('\uD83D');
      expect(state.lastInput).assertEqual('\uDE00');
      TestLogger.end(TAG_UNICODE, 'sequenceEndFlagThenChange_175');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1760
     * @tc.name sequenceSelectAllThenChangeAll176
     * @tc.desc SELECT_ALL followed by a full range command produces the same layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceSelectAllThenChangeAll_176', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceSelectAllThenChangeAll_176');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.handleExtendAction(0);
      model.changeSelection(0, 2);
      let state: TextState = model.snapshot();
      logState('sequenceSelectAllThenChangeAll_176', state);
      expect(state.selectInput).assertEqual('\uD83D\uDE00');
      expect(state.inputText).assertEqual('');
      expect(state.cursorIndex).assertEqual(2);
      TestLogger.end(TAG_UNICODE, 'sequenceSelectAllThenChangeAll_176');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1770
     * @tc.name sequenceNanClickThenInsert177
     * @tc.desc A NaN click leaves the emoji trailing, so the next insert lands in front of it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceNanClickThenInsert_177', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceNanClickThenInsert_177');
      let model: TextEditingModel = mixedAt(320, '\uD83D\uDE00', '', '');
      model.calculateCursor(NaN);
      model.insertText('a');
      let state: TextState = model.snapshot();
      logState('sequenceNanClickThenInsert_177', state);
      expect(state.inputText).assertEqual('a');
      expect(state.lastInput).assertEqual('\uD83D\uDE00');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'sequenceNanClickThenInsert_177');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UNICODE_1780
     * @tc.name sequenceDeleteRightThenDown178
     * @tc.desc A forward delete from caret 0 leaves the low surrogate trailing and down parks on it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sequenceDeleteRightThenDown_178', 0, async (done: Function) => {
      TestLogger.begin(TAG_UNICODE, 'sequenceDeleteRightThenDown_178');
      let model: TextEditingModel = mixState(320, '', '', '\uD83D\uDE00', 0, 0, 0);
      model.deleteRight(1);
      model.moveCursor(2);
      let state: TextState = model.snapshot();
      logState('sequenceDeleteRightThenDown_178', state);
      expect(state.inputText).assertEqual('\uDE00');
      expect(state.lastInput).assertEqual('');
      expect(state.cursorIndex).assertEqual(1);
      TestLogger.end(TAG_UNICODE, 'sequenceDeleteRightThenDown_178');
      await yieldToEventLoop();
      done();
    });
  });
}
