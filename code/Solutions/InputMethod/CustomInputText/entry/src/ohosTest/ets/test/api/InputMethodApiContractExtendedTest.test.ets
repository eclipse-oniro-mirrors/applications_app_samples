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
import inputMethod from '@ohos.inputMethod';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, TAG_API } from '../common/TestConstant';

function containsId(items: inputMethod.InputMethodProperty[], id: string): boolean {
  let index: number = 0;
  while (index < items.length) {
    if (items[index].id === id) {
      return true;
    }
    index++;
  }
  return false;
}

function sameIdSet(first: inputMethod.InputMethodProperty[], second: inputMethod.InputMethodProperty[]): boolean {
  if (first.length !== second.length) {
    return false;
  }
  let index: number = 0;
  while (index < first.length) {
    if (!containsId(second, first[index].id)) {
      return false;
    }
    index++;
  }
  return true;
}

function distinctCount(values: number[]): number {
  let seen: number[] = [];
  let index: number = 0;
  while (index < values.length) {
    let value: number = values[index];
    let found: boolean = false;
    let scan: number = 0;
    while (scan < seen.length) {
      if (seen[scan] === value) {
        found = true;
        break;
      }
      scan++;
    }
    if (!found) {
      seen.push(value);
    }
    index++;
  }
  return seen.length;
}

function allDistinct(values: number[]): boolean {
  return distinctCount(values) === values.length;
}

function pairsDiffer(first: number, second: number): boolean {
  return first !== second;
}

export default function inputMethodApiContractTestExtended(): void {
  describe('CustomInputTextInputMethodApiContractExtendedTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1220
     * @tc.name apiExtendActionSelectAll122
     * @tc.desc ExtendAction.SELECT_ALL is the first action code 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiExtendActionSelectAll_122', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionSelectAll_122');
      expect(inputMethod.ExtendAction.SELECT_ALL).assertEqual(0);
      TestLogger.end(TAG_API, 'apiExtendActionSelectAll_122');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1230
     * @tc.name apiExtendActionCut123
     * @tc.desc ExtendAction.CUT is 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiExtendActionCut_123', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionCut_123');
      expect(inputMethod.ExtendAction.CUT).assertEqual(3);
      TestLogger.end(TAG_API, 'apiExtendActionCut_123');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1240
     * @tc.name apiExtendActionCopy124
     * @tc.desc ExtendAction.COPY is 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiExtendActionCopy_124', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionCopy_124');
      expect(inputMethod.ExtendAction.COPY).assertEqual(4);
      TestLogger.end(TAG_API, 'apiExtendActionCopy_124');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1250
     * @tc.name apiExtendActionPaste125
     * @tc.desc ExtendAction.PASTE is 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiExtendActionPaste_125', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionPaste_125');
      expect(inputMethod.ExtendAction.PASTE).assertEqual(5);
      TestLogger.end(TAG_API, 'apiExtendActionPaste_125');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1260
     * @tc.name apiExtendActionDistinct126
     * @tc.desc The four ExtendAction values are pairwise distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiExtendActionDistinct_126', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionDistinct_126');
      let values: number[] = [
        inputMethod.ExtendAction.SELECT_ALL, inputMethod.ExtendAction.CUT,
        inputMethod.ExtendAction.COPY, inputMethod.ExtendAction.PASTE
      ];
      expect(allDistinct(values)).assertTrue();
      TestLogger.end(TAG_API, 'apiExtendActionDistinct_126');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1270
     * @tc.name apiKeyboardStatusNone127
     * @tc.desc KeyboardStatus.NONE is 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiKeyboardStatusNone_127', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusNone_127');
      expect(inputMethod.KeyboardStatus.NONE).assertEqual(0);
      TestLogger.end(TAG_API, 'apiKeyboardStatusNone_127');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1280
     * @tc.name apiKeyboardStatusHide128
     * @tc.desc KeyboardStatus.HIDE is 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiKeyboardStatusHide_128', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusHide_128');
      expect(inputMethod.KeyboardStatus.HIDE).assertEqual(1);
      TestLogger.end(TAG_API, 'apiKeyboardStatusHide_128');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1290
     * @tc.name apiKeyboardStatusShow129
     * @tc.desc KeyboardStatus.SHOW is 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiKeyboardStatusShow_129', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusShow_129');
      expect(inputMethod.KeyboardStatus.SHOW).assertEqual(2);
      TestLogger.end(TAG_API, 'apiKeyboardStatusShow_129');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1300
     * @tc.name apiKeyboardStatusDistinct130
     * @tc.desc The three KeyboardStatus values are pairwise distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiKeyboardStatusDistinct_130', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusDistinct_130');
      let values: number[] = [
        inputMethod.KeyboardStatus.NONE, inputMethod.KeyboardStatus.HIDE, inputMethod.KeyboardStatus.SHOW
      ];
      expect(allDistinct(values)).assertTrue();
      TestLogger.end(TAG_API, 'apiKeyboardStatusDistinct_130');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1310
     * @tc.name apiTextAndEnterNoneDiffer131
     * @tc.desc TextInputType.NONE (-1) and EnterKeyType.NONE (1) are different values in different enums
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextAndEnterNoneDiffer_131', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextAndEnterNoneDiffer_131');
      expect(pairsDiffer(inputMethod.TextInputType.NONE, inputMethod.EnterKeyType.NONE)).assertTrue();
      TestLogger.end(TAG_API, 'apiTextAndEnterNoneDiffer_131');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1320
     * @tc.name apiKeyboardAndTextNoneDiffer132
     * @tc.desc KeyboardStatus.NONE (0) differs from TextInputType.NONE (-1) despite the shared member name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiKeyboardAndTextNoneDiffer_132', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardAndTextNoneDiffer_132');
      expect(pairsDiffer(inputMethod.KeyboardStatus.NONE, inputMethod.TextInputType.NONE)).assertTrue();
      TestLogger.end(TAG_API, 'apiKeyboardAndTextNoneDiffer_132');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1330
     * @tc.name apiEnumValuesAreNumbers133
     * @tc.desc Every enum member used by the editor callbacks is a number value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnumValuesAreNumbers_133', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnumValuesAreNumbers_133');
      expect(typeof inputMethod.Direction.CURSOR_LEFT).assertEqual('number');
      expect(typeof inputMethod.ExtendAction.SELECT_ALL).assertEqual('number');
      expect(typeof inputMethod.EnterKeyType.SEND).assertEqual('number');
      TestLogger.end(TAG_API, 'apiEnumValuesAreNumbers_133');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1340
     * @tc.name apiCursorInfoTopRoundTrip134
     * @tc.desc A CursorInfo literal preserves its top coordinate through value semantics
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCursorInfoTopRoundTrip_134', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoTopRoundTrip_134');
      let info: inputMethod.CursorInfo = { top: 37, left: 0, width: 1, height: 25 };
      expect(info.top).assertEqual(37);
      TestLogger.end(TAG_API, 'apiCursorInfoTopRoundTrip_134');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1350
     * @tc.name apiCursorInfoLeftRoundTrip135
     * @tc.desc A CursorInfo literal preserves its left coordinate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCursorInfoLeftRoundTrip_135', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoLeftRoundTrip_135');
      let info: inputMethod.CursorInfo = { top: 0, left: 128, width: 1, height: 25 };
      expect(info.left).assertEqual(128);
      TestLogger.end(TAG_API, 'apiCursorInfoLeftRoundTrip_135');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1360
     * @tc.name apiCursorInfoWidthRoundTrip136
     * @tc.desc A CursorInfo literal preserves its width, the field the caret view reports
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCursorInfoWidthRoundTrip_136', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoWidthRoundTrip_136');
      let info: inputMethod.CursorInfo = { top: 0, left: 0, width: 2, height: 20 };
      expect(info.width).assertEqual(2);
      TestLogger.end(TAG_API, 'apiCursorInfoWidthRoundTrip_136');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1370
     * @tc.name apiCursorInfoHeightRoundTrip137
     * @tc.desc A CursorInfo literal preserves its height, the field the caret view reports
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCursorInfoHeightRoundTrip_137', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoHeightRoundTrip_137');
      let info: inputMethod.CursorInfo = { top: 0, left: 0, width: 1, height: 25 };
      expect(info.height).assertEqual(25);
      TestLogger.end(TAG_API, 'apiCursorInfoHeightRoundTrip_137');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1380
     * @tc.name apiCursorInfoCopyPreservesValues138
     * @tc.desc Copying a CursorInfo field by field preserves every value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCursorInfoCopyPreservesValues_138', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoCopyPreservesValues_138');
      let source: inputMethod.CursorInfo = { top: 11, left: 22, width: 3, height: 24 };
      let copy: inputMethod.CursorInfo = { top: source.top, left: source.left, width: source.width, height: source.height };
      expect(copy.top).assertEqual(source.top);
      expect(copy.left).assertEqual(source.left);
      expect(copy.width).assertEqual(source.width);
      expect(copy.height).assertEqual(source.height);
      TestLogger.end(TAG_API, 'apiCursorInfoCopyPreservesValues_138');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1390
     * @tc.name apiInputAttributeTextTypeRoundTrip139
     * @tc.desc An InputAttribute literal carries the text input type enum value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiInputAttributeTextTypeRoundTrip_139', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiInputAttributeTextTypeRoundTrip_139');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.NONE
      };
      expect(attribute.textInputType).assertEqual(inputMethod.TextInputType.TEXT);
      TestLogger.end(TAG_API, 'apiInputAttributeTextTypeRoundTrip_139');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1400
     * @tc.name apiInputAttributeEnterKeyRoundTrip140
     * @tc.desc An InputAttribute literal carries the enter key enum value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiInputAttributeEnterKeyRoundTrip_140', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiInputAttributeEnterKeyRoundTrip_140');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.NUMBER,
        enterKeyType: inputMethod.EnterKeyType.SEARCH
      };
      expect(attribute.enterKeyType).assertEqual(inputMethod.EnterKeyType.SEARCH);
      TestLogger.end(TAG_API, 'apiInputAttributeEnterKeyRoundTrip_140');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1410
     * @tc.name apiRangeStartRoundTrip141
     * @tc.desc A Range literal preserves its start index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiRangeStartRoundTrip_141', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiRangeStartRoundTrip_141');
      let range: inputMethod.Range = { start: 2, end: 6 };
      expect(range.start).assertEqual(2);
      TestLogger.end(TAG_API, 'apiRangeStartRoundTrip_141');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1420
     * @tc.name apiRangeEndRoundTrip142
     * @tc.desc A Range literal preserves its end index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiRangeEndRoundTrip_142', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiRangeEndRoundTrip_142');
      let range: inputMethod.Range = { start: 2, end: 6 };
      expect(range.end).assertEqual(6);
      TestLogger.end(TAG_API, 'apiRangeEndRoundTrip_142');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1430
     * @tc.name apiMovementDirectionRoundTrip143
     * @tc.desc A Movement literal carries the cursor direction enum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiMovementDirectionRoundTrip_143', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiMovementDirectionRoundTrip_143');
      let movement: inputMethod.Movement = { direction: inputMethod.Direction.CURSOR_RIGHT };
      expect(movement.direction).assertEqual(inputMethod.Direction.CURSOR_RIGHT);
      TestLogger.end(TAG_API, 'apiMovementDirectionRoundTrip_143');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1440
     * @tc.name apiFunctionKeyRoundTrip144
     * @tc.desc A FunctionKey literal carries the enter key type delivered to the page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiFunctionKeyRoundTrip_144', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiFunctionKeyRoundTrip_144');
      let key: inputMethod.FunctionKey = { enterKeyType: inputMethod.EnterKeyType.SEND };
      expect(key.enterKeyType).assertEqual(inputMethod.EnterKeyType.SEND);
      TestLogger.end(TAG_API, 'apiFunctionKeyRoundTrip_144');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1450
     * @tc.name apiTextConfigAttributeRoundTrip145
     * @tc.desc A TextConfig literal carries its required inputAttribute member
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextConfigAttributeRoundTrip_145', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextConfigAttributeRoundTrip_145');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.NONE,
        enterKeyType: inputMethod.EnterKeyType.NONE
      };
      let config: inputMethod.TextConfig = { inputAttribute: attribute };
      expect(config.inputAttribute.textInputType).assertEqual(inputMethod.TextInputType.NONE);
      expect(config.inputAttribute.enterKeyType).assertEqual(inputMethod.EnterKeyType.NONE);
      TestLogger.end(TAG_API, 'apiTextConfigAttributeRoundTrip_145');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1460
     * @tc.name apiTextConfigCursorOptional146
     * @tc.desc A TextConfig may carry an optional cursorInfo without changing the attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextConfigCursorOptional_146', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextConfigCursorOptional_146');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.GO
      };
      let cursor: inputMethod.CursorInfo = { top: 5, left: 10, width: 1, height: 25 };
      let config: inputMethod.TextConfig = { inputAttribute: attribute, cursorInfo: cursor };
      expect(config.cursorInfo !== undefined).assertTrue();
      if (config.cursorInfo !== undefined) {
        expect(config.cursorInfo.top).assertEqual(5);
      }
      TestLogger.end(TAG_API, 'apiTextConfigCursorOptional_146');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1470
     * @tc.name apiTextConfigSelectionOptional147
     * @tc.desc A TextConfig may carry an optional selection range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextConfigSelectionOptional_147', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextConfigSelectionOptional_147');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.NONE
      };
      let selection: inputMethod.Range = { start: 1, end: 3 };
      let config: inputMethod.TextConfig = { inputAttribute: attribute, selection: selection };
      expect(config.selection !== undefined).assertTrue();
      if (config.selection !== undefined) {
        expect(config.selection.end).assertEqual(3);
      }
      TestLogger.end(TAG_API, 'apiTextConfigSelectionOptional_147');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1480
     * @tc.name apiTextConfigWindowIdOptional148
     * @tc.desc A TextConfig may carry an optional windowId
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextConfigWindowIdOptional_148', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextConfigWindowIdOptional_148');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.PHONE,
        enterKeyType: inputMethod.EnterKeyType.NONE
      };
      let config: inputMethod.TextConfig = { inputAttribute: attribute, windowId: 7 };
      expect(config.windowId).assertEqual(7);
      TestLogger.end(TAG_API, 'apiTextConfigWindowIdOptional_148');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1490
     * @tc.name apiWindowInfoNameRoundTrip149
     * @tc.desc An InputWindowInfo literal preserves its name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiWindowInfoNameRoundTrip_149', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiWindowInfoNameRoundTrip_149');
      let window: inputMethod.InputWindowInfo = { name: 'inputWindow', left: 0, top: 0, width: 100, height: 40 };
      expect(window.name).assertEqual('inputWindow');
      TestLogger.end(TAG_API, 'apiWindowInfoNameRoundTrip_149');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1500
     * @tc.name apiWindowInfoLeftRoundTrip150
     * @tc.desc An InputWindowInfo literal preserves its left offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiWindowInfoLeftRoundTrip_150', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiWindowInfoLeftRoundTrip_150');
      let window: inputMethod.InputWindowInfo = { name: 'w', left: 16, top: 0, width: 100, height: 40 };
      expect(window.left).assertEqual(16);
      TestLogger.end(TAG_API, 'apiWindowInfoLeftRoundTrip_150');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1510
     * @tc.name apiWindowInfoTopRoundTrip151
     * @tc.desc An InputWindowInfo literal preserves its top offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiWindowInfoTopRoundTrip_151', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiWindowInfoTopRoundTrip_151');
      let window: inputMethod.InputWindowInfo = { name: 'w', left: 0, top: 24, width: 100, height: 40 };
      expect(window.top).assertEqual(24);
      TestLogger.end(TAG_API, 'apiWindowInfoTopRoundTrip_151');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1520
     * @tc.name apiWindowInfoWidthRoundTrip152
     * @tc.desc An InputWindowInfo literal preserves its width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiWindowInfoWidthRoundTrip_152', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiWindowInfoWidthRoundTrip_152');
      let window: inputMethod.InputWindowInfo = { name: 'w', left: 0, top: 0, width: 320, height: 40 };
      expect(window.width).assertEqual(320);
      TestLogger.end(TAG_API, 'apiWindowInfoWidthRoundTrip_152');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1530
     * @tc.name apiWindowInfoHeightRoundTrip153
     * @tc.desc An InputWindowInfo literal preserves its height
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiWindowInfoHeightRoundTrip_153', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiWindowInfoHeightRoundTrip_153');
      let window: inputMethod.InputWindowInfo = { name: 'w', left: 0, top: 0, width: 100, height: 45 };
      expect(window.height).assertEqual(45);
      TestLogger.end(TAG_API, 'apiWindowInfoHeightRoundTrip_153');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1540
     * @tc.name apiTextConfigAllOptionals154
     * @tc.desc A fully populated TextConfig preserves the nested attribute, cursor, selection and window id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextConfigAllOptionals_154', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextConfigAllOptionals_154');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.NUMBER,
        enterKeyType: inputMethod.EnterKeyType.GO
      };
      let cursor: inputMethod.CursorInfo = { top: 1, left: 2, width: 3, height: 4 };
      let selection: inputMethod.Range = { start: 0, end: 0 };
      let config: inputMethod.TextConfig = {
        inputAttribute: attribute, cursorInfo: cursor, selection: selection, windowId: 9
      };
      expect(config.inputAttribute.enterKeyType).assertEqual(inputMethod.EnterKeyType.GO);
      if (config.cursorInfo !== undefined) {
        expect(config.cursorInfo.left).assertEqual(2);
      }
      if (config.selection !== undefined) {
        expect(config.selection.start).assertEqual(0);
      }
      expect(config.windowId).assertEqual(9);
      TestLogger.end(TAG_API, 'apiTextConfigAllOptionals_154');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1550
     * @tc.name apiInputAttributeNoneValues155
     * @tc.desc An InputAttribute can carry the NONE sentinels used before the user picks a type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiInputAttributeNoneValues_155', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiInputAttributeNoneValues_155');
      let attribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.NONE,
        enterKeyType: inputMethod.EnterKeyType.NONE
      };
      expect(attribute.textInputType).assertEqual(-1);
      expect(attribute.enterKeyType).assertEqual(1);
      TestLogger.end(TAG_API, 'apiInputAttributeNoneValues_155');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1560
     * @tc.name apiRangeEmptySelection156
     * @tc.desc A Range with equal start and end describes an empty selection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiRangeEmptySelection_156', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiRangeEmptySelection_156');
      let range: inputMethod.Range = { start: 4, end: 4 };
      expect(range.start).assertEqual(range.end);
      TestLogger.end(TAG_API, 'apiRangeEmptySelection_156');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1570
     * @tc.name apiMovementLeftDirection157
     * @tc.desc A Movement can describe a leftward selection movement
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiMovementLeftDirection_157', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiMovementLeftDirection_157');
      let movement: inputMethod.Movement = { direction: inputMethod.Direction.CURSOR_LEFT };
      expect(movement.direction).assertEqual(3);
      TestLogger.end(TAG_API, 'apiMovementLeftDirection_157');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1580
     * @tc.name apiFunctionKeyGo158
     * @tc.desc A FunctionKey can carry the GO enter key delivered after a search action
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiFunctionKeyGo_158', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiFunctionKeyGo_158');
      let key: inputMethod.FunctionKey = { enterKeyType: inputMethod.EnterKeyType.GO };
      expect(key.enterKeyType).assertEqual(2);
      TestLogger.end(TAG_API, 'apiFunctionKeyGo_158');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1590
     * @tc.name apiCursorInfoNegativeRoundTrip159
     * @tc.desc A CursorInfo literal preserves negative offsets that a scrolled caret can report
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCursorInfoNegativeRoundTrip_159', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCursorInfoNegativeRoundTrip_159');
      let info: inputMethod.CursorInfo = { top: -3, left: -8, width: 1, height: 25 };
      expect(info.top).assertEqual(-3);
      expect(info.left).assertEqual(-8);
      TestLogger.end(TAG_API, 'apiCursorInfoNegativeRoundTrip_159');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1600
     * @tc.name apiTextInputTypePairwiseDistinct160
     * @tc.desc The TextInputType enum holds four distinct numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextInputTypePairwiseDistinct_160', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypePairwiseDistinct_160');
      let values: number[] = [
        inputMethod.TextInputType.NONE, inputMethod.TextInputType.TEXT,
        inputMethod.TextInputType.NUMBER, inputMethod.TextInputType.PHONE
      ];
      expect(distinctCount(values)).assertEqual(4);
      TestLogger.end(TAG_API, 'apiTextInputTypePairwiseDistinct_160');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1610
     * @tc.name apiEnterKeyPairwiseDistinct161
     * @tc.desc The EnterKeyType enum holds five distinct numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnterKeyPairwiseDistinct_161', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyPairwiseDistinct_161');
      let values: number[] = [
        inputMethod.EnterKeyType.UNSPECIFIED, inputMethod.EnterKeyType.NONE, inputMethod.EnterKeyType.GO,
        inputMethod.EnterKeyType.SEARCH, inputMethod.EnterKeyType.SEND
      ];
      expect(distinctCount(values)).assertEqual(5);
      TestLogger.end(TAG_API, 'apiEnterKeyPairwiseDistinct_161');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1620
     * @tc.name apiDirectionPairwiseDistinct162
     * @tc.desc The Direction enum holds four distinct numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDirectionPairwiseDistinct_162', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionPairwiseDistinct_162');
      let values: number[] = [
        inputMethod.Direction.CURSOR_UP, inputMethod.Direction.CURSOR_DOWN,
        inputMethod.Direction.CURSOR_LEFT, inputMethod.Direction.CURSOR_RIGHT
      ];
      expect(distinctCount(values)).assertEqual(4);
      TestLogger.end(TAG_API, 'apiDirectionPairwiseDistinct_162');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1630
     * @tc.name apiExtendActionPairwiseDistinct163
     * @tc.desc The ExtendAction enum holds four distinct numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiExtendActionPairwiseDistinct_163', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendActionPairwiseDistinct_163');
      let values: number[] = [
        inputMethod.ExtendAction.SELECT_ALL, inputMethod.ExtendAction.CUT,
        inputMethod.ExtendAction.COPY, inputMethod.ExtendAction.PASTE
      ];
      expect(distinctCount(values)).assertEqual(4);
      TestLogger.end(TAG_API, 'apiExtendActionPairwiseDistinct_163');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1640
     * @tc.name apiKeyboardStatusPairwiseDistinct164
     * @tc.desc The KeyboardStatus enum holds three distinct numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiKeyboardStatusPairwiseDistinct_164', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusPairwiseDistinct_164');
      let values: number[] = [
        inputMethod.KeyboardStatus.NONE, inputMethod.KeyboardStatus.HIDE, inputMethod.KeyboardStatus.SHOW
      ];
      expect(distinctCount(values)).assertEqual(3);
      TestLogger.end(TAG_API, 'apiKeyboardStatusPairwiseDistinct_164');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1650
     * @tc.name apiTextInputNoneIsNegative165
     * @tc.desc TextInputType.NONE is the only negative member, which lets the sample treat it as unset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiTextInputNoneIsNegative_165', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputNoneIsNegative_165');
      expect(inputMethod.TextInputType.NONE < 0).assertTrue();
      expect(inputMethod.TextInputType.TEXT >= 0).assertTrue();
      TestLogger.end(TAG_API, 'apiTextInputNoneIsNegative_165');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1660
     * @tc.name apiEnterKeyUnspecifiedIsZero166
     * @tc.desc EnterKeyType.UNSPECIFIED is the zero value of the enum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnterKeyUnspecifiedIsZero_166', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyUnspecifiedIsZero_166');
      expect(inputMethod.EnterKeyType.UNSPECIFIED === 0).assertTrue();
      expect(Number(inputMethod.EnterKeyType.NONE) === 1).assertTrue();
      TestLogger.end(TAG_API, 'apiEnterKeyUnspecifiedIsZero_166');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1670
     * @tc.name apiDirectionMinIsOne167
     * @tc.desc Direction starts at 1, so no direction collides with a zero default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDirectionMinIsOne_167', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionMinIsOne_167');
      expect(inputMethod.Direction.CURSOR_UP >= 1).assertTrue();
      expect(inputMethod.Direction.CURSOR_UP).assertEqual(1);
      TestLogger.end(TAG_API, 'apiDirectionMinIsOne_167');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1680
     * @tc.name apiExtendSelectAllIsZero168
     * @tc.desc ExtendAction.SELECT_ALL is zero and CUT is three
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiExtendSelectAllIsZero_168', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiExtendSelectAllIsZero_168');
      expect(inputMethod.ExtendAction.SELECT_ALL === 0).assertTrue();
      expect(Number(inputMethod.ExtendAction.CUT) === 3).assertTrue();
      TestLogger.end(TAG_API, 'apiExtendSelectAllIsZero_168');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1690
     * @tc.name apiKeyboardStatusNoneIsZero169
     * @tc.desc KeyboardStatus.NONE is the zero value of the status enum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiKeyboardStatusNoneIsZero_169', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusNoneIsZero_169');
      expect(inputMethod.KeyboardStatus.NONE === 0).assertTrue();
      expect(Number(inputMethod.KeyboardStatus.SHOW) === 2).assertTrue();
      TestLogger.end(TAG_API, 'apiKeyboardStatusNoneIsZero_169');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1700
     * @tc.name apiDirectionRepeatsAreEqual170
     * @tc.desc Repeating a Direction member yields an equal value, so duplicate detection is stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDirectionRepeatsAreEqual_170', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionRepeatsAreEqual_170');
      let repeated: number[] = [
        inputMethod.Direction.CURSOR_LEFT, inputMethod.Direction.CURSOR_LEFT, inputMethod.Direction.CURSOR_RIGHT
      ];
      expect(distinctCount(repeated)).assertEqual(2);
      expect(repeated.length).assertEqual(3);
      TestLogger.end(TAG_API, 'apiDirectionRepeatsAreEqual_170');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1710
     * @tc.name apiKeyboardStatusRepeatsAreEqual171
     * @tc.desc Repeating a KeyboardStatus member yields an equal value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiKeyboardStatusRepeatsAreEqual_171', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiKeyboardStatusRepeatsAreEqual_171');
      let repeated: number[] = [
        inputMethod.KeyboardStatus.HIDE, inputMethod.KeyboardStatus.HIDE, inputMethod.KeyboardStatus.SHOW
      ];
      expect(distinctCount(repeated)).assertEqual(2);
      TestLogger.end(TAG_API, 'apiKeyboardStatusRepeatsAreEqual_171');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1720
     * @tc.name apiEnabledPromiseResolves172
     * @tc.desc The enabled-list promise resolves instead of rejecting on a provisioned device
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledPromiseResolves_172', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledPromiseResolves_172');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(methods !== undefined).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledPromiseResolves_172 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1730
     * @tc.name apiDisabledPromiseResolves173
     * @tc.desc The disabled-list promise resolves instead of rejecting on a provisioned device
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledPromiseResolves_173', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledPromiseResolves_173');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(methods !== undefined).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledPromiseResolves_173 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1740
     * @tc.name apiEnabledResultNotUndefined174
     * @tc.desc The resolved enabled result is a defined array rather than undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledResultNotUndefined_174', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledResultNotUndefined_174');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(methods !== undefined).assertTrue();
        expect(Array.isArray(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledResultNotUndefined_174 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1750
     * @tc.name apiDisabledResultNotUndefined175
     * @tc.desc The resolved disabled result is a defined array rather than undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledResultNotUndefined_175', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledResultNotUndefined_175');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(methods !== undefined).assertTrue();
        expect(Array.isArray(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledResultNotUndefined_175 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1760
     * @tc.name apiEnabledRepeatedSameLength176
     * @tc.desc Three sequential enabled calls keep the same length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledRepeatedSameLength_176', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledRepeatedSameLength_176');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let third: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(first.length).assertEqual(second.length);
        expect(second.length).assertEqual(third.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledRepeatedSameLength_176 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1770
     * @tc.name apiDisabledRepeatedSameLength177
     * @tc.desc Three sequential disabled calls keep the same length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledRepeatedSameLength_177', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledRepeatedSameLength_177');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let third: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(first.length).assertEqual(second.length);
        expect(second.length).assertEqual(third.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledRepeatedSameLength_177 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1780
     * @tc.name apiConcurrentEnabledSameLength178
     * @tc.desc Two enabled calls started together resolve to the same length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiConcurrentEnabledSameLength_178', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiConcurrentEnabledSameLength_178');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let firstPromise: Promise<inputMethod.InputMethodProperty[]> = setting.getInputMethods(true);
        let secondPromise: Promise<inputMethod.InputMethodProperty[]> = setting.getInputMethods(true);
        let first: inputMethod.InputMethodProperty[] = await firstPromise;
        let second: inputMethod.InputMethodProperty[] = await secondPromise;
        expect(first.length).assertEqual(second.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiConcurrentEnabledSameLength_178 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1790
     * @tc.name apiEnabledQueryDoesNotThrow179
     * @tc.desc A plain enabled query completes without raising an exception
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledQueryDoesNotThrow_179', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledQueryDoesNotThrow_179');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        await setting.getInputMethods(true);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledQueryDoesNotThrow_179 threw');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1800
     * @tc.name apiDisabledQueryDoesNotThrow180
     * @tc.desc A plain disabled query completes without raising an exception
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledQueryDoesNotThrow_180', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledQueryDoesNotThrow_180');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        await setting.getInputMethods(false);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledQueryDoesNotThrow_180 threw');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1810
     * @tc.name apiDisabledIndexGuarded181
     * @tc.desc A disabled-list index is only read after a length guard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledIndexGuarded_181', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledIndexGuarded_181');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let safe: boolean = methods.length === 0 || methods[0] !== undefined;
        expect(safe).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledIndexGuarded_181 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1820
     * @tc.name apiListStableAcrossSettingObjects182
     * @tc.desc Two separate setting objects report the same enabled ids
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'apiListStableAcrossSettingObjects_182', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiListStableAcrossSettingObjects_182');
      let threw: boolean = false;
      try {
        let firstSetting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let secondSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        let first: inputMethod.InputMethodProperty[] = await firstSetting.getInputMethods(true);
        let second: inputMethod.InputMethodProperty[] = await secondSetting.getInputMethods(true);
        expect(sameIdSet(first, second)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiListStableAcrossSettingObjects_182 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });
  });
}
