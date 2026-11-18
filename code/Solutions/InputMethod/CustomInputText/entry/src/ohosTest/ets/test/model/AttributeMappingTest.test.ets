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
import { PageStateModel } from '../common/PageStateModel';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_ATTRIBUTE, INPUT_TYPE_RESOURCES, ENTER_KEY_RESOURCES, INPUT_TYPE_FALLBACK,
  ENTER_KEY_FALLBACK, STRING_DEFAULT_INPUT, STRING_TEXT_INPUT, STRING_NUMBER_INPUT, STRING_PHONE_INPUT,
  STRING_DEFAULT_ENTER_KEY, STRING_SEARCH_ENTER_KEY, STRING_SEND_ENTER_KEY, STRING_GO_ENTER_KEY,
  INPUT_TYPE_SELECT_ID, ENTER_KEY_SELECT_ID, SELECT_OPTION_COUNT
} from '../common/TestConstant';

/**
 * Replica of utils/InputAttributeInit.ets without the resource lookup.
 *
 * The original class owns two index -> enum tables and two index -> resource
 * tables. getResourceString() needs a UI ability context, so the replica keeps
 * the resource *selection* rule (which of the five labels is chosen) and leaves
 * the string decoding to the resourceManager contract suite. The tables are
 * indexed exactly like the original, including its treatment of a fractional
 * index: the range guard accepts 1.5 and the array lookup then yields undefined.
 */
export class InputAttributeModel {
  static readonly TEXT_INPUT_TYPES: number[] = [
    inputMethod.TextInputType.NONE,
    inputMethod.TextInputType.TEXT,
    inputMethod.TextInputType.NUMBER,
    inputMethod.TextInputType.PHONE
  ];

  static readonly ENTER_KEY_TYPES: number[] = [
    inputMethod.EnterKeyType.NONE,
    inputMethod.EnterKeyType.SEARCH,
    inputMethod.EnterKeyType.SEND,
    inputMethod.EnterKeyType.GO
  ];

  getInputType(index: number): number | undefined {
    if (index >= 0 && index < InputAttributeModel.TEXT_INPUT_TYPES.length) {
      return InputAttributeModel.TEXT_INPUT_TYPES[index];
    }
    return inputMethod.TextInputType.NONE;
  }

  getEnterType(index: number): number | undefined {
    if (index >= 0 && index < InputAttributeModel.ENTER_KEY_TYPES.length) {
      return InputAttributeModel.ENTER_KEY_TYPES[index];
    }
    return inputMethod.EnterKeyType.NONE;
  }

  /** Resource chosen for the input type dropdown for a given index. */
  getInputTypeResource(index: number): string {
    if (index >= 0 && index < INPUT_TYPE_RESOURCES.length) {
      return INPUT_TYPE_RESOURCES[index];
    }
    return INPUT_TYPE_FALLBACK;
  }

  /** Resource chosen for the enter key dropdown for a given index. */
  getEnterTypeResource(index: number): string {
    if (index >= 0 && index < ENTER_KEY_RESOURCES.length) {
      return ENTER_KEY_RESOURCES[index];
    }
    return ENTER_KEY_FALLBACK;
  }

  getInputTypeCount(): number {
    return InputAttributeModel.TEXT_INPUT_TYPES.length;
  }

  getEnterTypeCount(): number {
    return InputAttributeModel.ENTER_KEY_TYPES.length;
  }

  getOptionCount(): number {
    return SELECT_OPTION_COUNT;
  }

  /** First index that maps to the given input type, or -1. */
  indexOfInputType(type: number): number {
    let index: number = 0;
    while (index < InputAttributeModel.TEXT_INPUT_TYPES.length) {
      if (InputAttributeModel.TEXT_INPUT_TYPES[index] === type) {
        return index;
      }
      index++;
    }
    return -1;
  }

  /** First index that maps to the given enter key type, or -1. */
  indexOfEnterType(type: number): number {
    let index: number = 0;
    while (index < InputAttributeModel.ENTER_KEY_TYPES.length) {
      if (InputAttributeModel.ENTER_KEY_TYPES[index] === type) {
        return index;
      }
      index++;
    }
    return -1;
  }

  /** True when two indices select the same enum value. */
  isSameInputType(first: number, second: number): boolean {
    return this.getInputType(first) === this.getInputType(second);
  }

  /** True when two indices select the same enter key value. */
  isSameEnterType(first: number, second: number): boolean {
    return this.getEnterType(first) === this.getEnterType(second);
  }
}

/**
 * Index mapping contract for utils/InputAttributeInit.ets.
 *
 * The utility owns two four-slot tables: an index -> input type table
 * (NONE, TEXT, NUMBER, PHONE) and an index -> enter key table
 * (NONE, SEARCH, SEND, GO), plus the resource pair shown by the two dropdowns.
 * Both getters use the same half-open range guard, so an index of 4 or more and
 * any negative index fall back to NONE while a fractional index inside the range
 * passes the guard and lets the array lookup return undefined. The suites below
 * pin down the enum values themselves, both tables, both resource tables, the
 * reverse lookup helpers, the equality helpers and the page integration, so a
 * change of order or of an enum value is detected at the exact slot.
 */

function createModel(): InputAttributeModel {
  let model: InputAttributeModel = new InputAttributeModel();
  return model;
}

function logCaseIndex(caseName: string, index: number): void {
  TestLogger.value(TAG_ATTRIBUTE, caseName + ' index', index.toString());
}

function logActual(caseName: string, label: string, value: string): void {
  TestLogger.value(TAG_ATTRIBUTE, caseName + ' ' + label, value);
}

function numberText(value: number | undefined): string {
  if (value === undefined) {
    return 'undefined';
  }
  return value.toString();
}

function containsString(values: string[], target: string): boolean {
  let index: number = 0;
  while (index < values.length) {
    if (values[index] === target) {
      return true;
    }
    index++;
  }
  return false;
}

export default function attributeMappingTest(): void {
  describe('CustomInputTextAttributeMappingTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0010
     * @tc.name inputTypeIndexZero_001
     * @tc.desc Index 0 is the first slot and selects the NONE input type shown as "None" in the dropdown
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputTypeIndexZero_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeIndexZero_001');
      let model: InputAttributeModel = createModel();
      let index: number = 0;
      logCaseIndex('inputTypeIndexZero_001', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeIndexZero_001', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.TextInputType.NONE);
      expect(actual !== inputMethod.TextInputType.TEXT).assertTrue();
      expect(model.getInputTypeResource(index)).assertEqual(STRING_DEFAULT_INPUT);
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeIndexZero_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0020
     * @tc.name inputTypeIndexFour_002
     * @tc.desc Index 4 is one past the four-slot table, so the half-open guard falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputTypeIndexFour_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeIndexFour_002');
      let model: InputAttributeModel = createModel();
      let index: number = 4;
      logCaseIndex('inputTypeIndexFour_002', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeIndexFour_002', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.TextInputType.NONE);
      expect(actual !== inputMethod.TextInputType.PHONE).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeIndexFour_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0030
     * @tc.name enterKeyIndexZero_003
     * @tc.desc Index 0 is the NONE enter key slot shown as "None" in the enter key dropdown
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyIndexZero_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyIndexZero_003');
      let model: InputAttributeModel = createModel();
      let index: number = 0;
      logCaseIndex('enterKeyIndexZero_003', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyIndexZero_003', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.EnterKeyType.NONE);
      expect(actual !== inputMethod.EnterKeyType.UNSPECIFIED).assertTrue();
      expect(model.getEnterTypeResource(index)).assertEqual(STRING_DEFAULT_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyIndexZero_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0040
     * @tc.name enterKeyIndexTwo_004
     * @tc.desc Index 2 is the SEND slot, so the keyboard shows a send action key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyIndexTwo_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyIndexTwo_004');
      let model: InputAttributeModel = createModel();
      let index: number = 2;
      logCaseIndex('enterKeyIndexTwo_004', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyIndexTwo_004', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.EnterKeyType.SEND);
      expect(actual !== inputMethod.EnterKeyType.GO).assertTrue();
      expect(model.getEnterTypeResource(index)).assertEqual(STRING_SEND_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyIndexTwo_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0050
     * @tc.name enterKeyIndexFour_005
     * @tc.desc Enter key index 4 is one past the table, so the half-open guard falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyIndexFour_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyIndexFour_005');
      let model: InputAttributeModel = createModel();
      let index: number = 4;
      logCaseIndex('enterKeyIndexFour_005', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyIndexFour_005', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.EnterKeyType.NONE);
      expect(actual !== inputMethod.EnterKeyType.GO).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyIndexFour_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0060
     * @tc.name inputTypeNegativeZero_006
     * @tc.desc A negative zero index compares equal to zero, so the first NONE slot is selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeNegativeZero_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeNegativeZero_006');
      let model: InputAttributeModel = createModel();
      let index: number = -0;
      logCaseIndex('inputTypeNegativeZero_006', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeNegativeZero_006', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.TextInputType.NONE);
      expect(actual !== undefined).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeNegativeZero_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0070
     * @tc.name inputTypeFractionZeroHalf_007
     * @tc.desc Index 0.5 passes the range guard but is not an array slot, so the lookup yields undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeFractionZeroHalf_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeFractionZeroHalf_007');
      let model: InputAttributeModel = createModel();
      let index: number = 0.5;
      logCaseIndex('inputTypeFractionZeroHalf_007', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeFractionZeroHalf_007', 'actual', numberText(actual));
      expect(actual).assertEqual(undefined);
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeFractionZeroHalf_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0080
     * @tc.name inputTypeNaN_008
     * @tc.desc A NaN index fails both comparisons of the guard and falls back to the NONE input type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeNaN_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeNaN_008');
      let model: InputAttributeModel = createModel();
      let index: number = NaN;
      logCaseIndex('inputTypeNaN_008', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeNaN_008', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.TextInputType.NONE);
      expect(actual !== inputMethod.TextInputType.TEXT).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeNaN_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0090
     * @tc.name inputTypeNegativeInfinity_009
     * @tc.desc A negative infinity index fails the lower comparison and falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeNegativeInfinity_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeNegativeInfinity_009');
      let model: InputAttributeModel = createModel();
      let index: number = -Infinity;
      logCaseIndex('inputTypeNegativeInfinity_009', index);
      let actual: number | undefined = model.getInputType(index);
      logActual('inputTypeNegativeInfinity_009', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.TextInputType.NONE);
      expect(actual !== undefined).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeNegativeInfinity_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0100
     * @tc.name enterKeyFractionZeroHalf_010
     * @tc.desc Enter key index 0.5 passes the guard but is not a slot, so the lookup yields undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeyFractionZeroHalf_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyFractionZeroHalf_010');
      let model: InputAttributeModel = createModel();
      let index: number = 0.5;
      logCaseIndex('enterKeyFractionZeroHalf_010', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyFractionZeroHalf_010', 'actual', numberText(actual));
      expect(actual).assertEqual(undefined);
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyFractionZeroHalf_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0110
     * @tc.name enterKeyNaN_011
     * @tc.desc A NaN enter key index fails both comparisons and falls back to the NONE enter key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeyNaN_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyNaN_011');
      let model: InputAttributeModel = createModel();
      let index: number = NaN;
      logCaseIndex('enterKeyNaN_011', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyNaN_011', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.EnterKeyType.NONE);
      expect(actual !== inputMethod.EnterKeyType.SEARCH).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyNaN_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0120
     * @tc.name enterKeyNegativeInfinity_012
     * @tc.desc A negative infinity enter key index fails the lower comparison and falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeyNegativeInfinity_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyNegativeInfinity_012');
      let model: InputAttributeModel = createModel();
      let index: number = -Infinity;
      logCaseIndex('enterKeyNegativeInfinity_012', index);
      let actual: number | undefined = model.getEnterType(index);
      logActual('enterKeyNegativeInfinity_012', 'actual', numberText(actual));
      expect(actual).assertEqual(inputMethod.EnterKeyType.NONE);
      expect(actual !== undefined).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyNegativeInfinity_012');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group E: index -> resource label selection, valid slots and fallbacks
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0130
     * @tc.name inputTypeResourceSlotZero_013
     * @tc.desc Slot 0 shows the "default_input" label, which the page renders as None
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputTypeResourceSlotZero_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeResourceSlotZero_013');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(0);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_DEFAULT_INPUT);
      expect(containsString(INPUT_TYPE_RESOURCES, resource)).assertTrue();
      expect(resource !== INPUT_TYPE_FALLBACK).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeResourceSlotZero_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0140
     * @tc.name inputTypeResourceSlotOne_014
     * @tc.desc Slot 1 shows the "text_input" label, which the page renders as Text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputTypeResourceSlotOne_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeResourceSlotOne_014');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(1);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_TEXT_INPUT);
      expect(containsString(INPUT_TYPE_RESOURCES, resource)).assertTrue();
      expect(resource !== STRING_DEFAULT_INPUT).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeResourceSlotOne_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0150
     * @tc.name inputTypeResourceSlotTwo_015
     * @tc.desc Slot 2 shows the "number_input" label, which the page renders as Number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputTypeResourceSlotTwo_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeResourceSlotTwo_015');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(2);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_NUMBER_INPUT);
      expect(containsString(INPUT_TYPE_RESOURCES, resource)).assertTrue();
      expect(resource !== STRING_TEXT_INPUT).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeResourceSlotTwo_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0160
     * @tc.name enterKeyResourceSlotZero_016
     * @tc.desc Enter key slot 0 shows the "default_enter_key" label rendered as None
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyResourceSlotZero_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyResourceSlotZero_016');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getEnterTypeResource(0);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_DEFAULT_ENTER_KEY);
      expect(containsString(ENTER_KEY_RESOURCES, resource)).assertTrue();
      expect(resource !== ENTER_KEY_FALLBACK).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyResourceSlotZero_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0170
     * @tc.name enterKeyResourceSlotOne_017
     * @tc.desc Enter key slot 1 shows the "search_enter_key" label rendered as Search
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyResourceSlotOne_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyResourceSlotOne_017');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getEnterTypeResource(1);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_SEARCH_ENTER_KEY);
      expect(containsString(ENTER_KEY_RESOURCES, resource)).assertTrue();
      expect(resource !== STRING_DEFAULT_ENTER_KEY).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyResourceSlotOne_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0180
     * @tc.name enterKeyResourceSlotTwo_018
     * @tc.desc Enter key slot 2 shows the "send_enter_key" label rendered as Send
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterKeyResourceSlotTwo_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyResourceSlotTwo_018');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getEnterTypeResource(2);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_SEND_ENTER_KEY);
      expect(containsString(ENTER_KEY_RESOURCES, resource)).assertTrue();
      expect(resource !== STRING_SEARCH_ENTER_KEY).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyResourceSlotTwo_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0190
     * @tc.name inputTypeResourceFallbackNaN_019
     * @tc.desc A NaN input type index fails the guard and therefore shows the heading label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeResourceFallbackNaN_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeResourceFallbackNaN_019');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(NaN);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(INPUT_TYPE_FALLBACK);
      expect(resource !== undefined).assertTrue();
      expect(containsString(INPUT_TYPE_RESOURCES, resource)).assertFalse();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeResourceFallbackNaN_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0200
     * @tc.name enterKeyResourceFallbackNaN_020
     * @tc.desc A NaN enter key index fails the guard and therefore shows the heading label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeyResourceFallbackNaN_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyResourceFallbackNaN_020');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getEnterTypeResource(NaN);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(ENTER_KEY_FALLBACK);
      expect(resource !== undefined).assertTrue();
      expect(containsString(ENTER_KEY_RESOURCES, resource)).assertFalse();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyResourceFallbackNaN_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0210
     * @tc.name inputTypeResourceFractionZeroHalf_021
     * @tc.desc Resource index 0.5 passes the guard but has no array slot, so no label resource is selected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeResourceFractionZeroHalf_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputTypeResourceFractionZeroHalf_021');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(0.5);
      expect(resource).assertEqual(undefined);
      expect(resource !== STRING_DEFAULT_INPUT).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputTypeResourceFractionZeroHalf_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0220
     * @tc.name enterKeyResourceFractionZeroHalf_022
     * @tc.desc Enter key resource index 0.5 passes the guard but has no slot, so it yields undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeyResourceFractionZeroHalf_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterKeyResourceFractionZeroHalf_022');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getEnterTypeResource(0.5);
      expect(resource).assertEqual(undefined);
      expect(resource !== STRING_DEFAULT_ENTER_KEY).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'enterKeyResourceFractionZeroHalf_022');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group F: table sizes, slot pairings and uniqueness
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0230
     * @tc.name optionCountMatchesSlots_023
     * @tc.desc The dropdown option count equals the four slots exposed by the utility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'optionCountMatchesSlots_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'optionCountMatchesSlots_023');
      let model: InputAttributeModel = createModel();
      expect(model.getOptionCount()).assertEqual(SELECT_OPTION_COUNT);
      expect(model.getOptionCount()).assertEqual(4);
      expect(model.getOptionCount()).assertEqual(model.getInputTypeCount());
      expect(model.getOptionCount()).assertEqual(model.getEnterTypeCount());
      TestLogger.end(TAG_ATTRIBUTE, 'optionCountMatchesSlots_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0240
     * @tc.name inputSlotZeroPairing_024
     * @tc.desc Slot 0 pairs the NONE input type with the "default_input" label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'inputSlotZeroPairing_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputSlotZeroPairing_024');
      let model: InputAttributeModel = createModel();
      expect(model.getInputType(0)).assertEqual(inputMethod.TextInputType.NONE);
      expect(model.getInputTypeResource(0)).assertEqual(STRING_DEFAULT_INPUT);
      expect(INPUT_TYPE_RESOURCES[0]).assertEqual(STRING_DEFAULT_INPUT);
      TestLogger.end(TAG_ATTRIBUTE, 'inputSlotZeroPairing_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0250
     * @tc.name enterSlotZeroPairing_025
     * @tc.desc Enter key slot 0 pairs the NONE key with the "default_enter_key" label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterSlotZeroPairing_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterSlotZeroPairing_025');
      let model: InputAttributeModel = createModel();
      expect(model.getEnterType(0)).assertEqual(inputMethod.EnterKeyType.NONE);
      expect(model.getEnterTypeResource(0)).assertEqual(STRING_DEFAULT_ENTER_KEY);
      expect(ENTER_KEY_RESOURCES[0]).assertEqual(STRING_DEFAULT_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'enterSlotZeroPairing_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0260
     * @tc.name enterSlotTwoPairing_026
     * @tc.desc Enter key slot 2 pairs the SEND key with the "send_enter_key" label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'enterSlotTwoPairing_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'enterSlotTwoPairing_026');
      let model: InputAttributeModel = createModel();
      expect(model.getEnterType(2)).assertEqual(inputMethod.EnterKeyType.SEND);
      expect(model.getEnterTypeResource(2)).assertEqual(STRING_SEND_ENTER_KEY);
      expect(ENTER_KEY_RESOURCES[2]).assertEqual(STRING_SEND_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'enterSlotTwoPairing_026');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group G: reverse lookup from enum value back to the dropdown slot
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0270
     * @tc.name indexOfNoneInputType_027
     * @tc.desc Reverse lookup of the NONE input type returns slot 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfNoneInputType_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfNoneInputType_027');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfInputType(inputMethod.TextInputType.NONE);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(0);
      expect(slot !== -1).assertTrue();
      expect(InputAttributeModel.TEXT_INPUT_TYPES[slot]).assertEqual(inputMethod.TextInputType.NONE);
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfNoneInputType_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0280
     * @tc.name indexOfTextInputType_028
     * @tc.desc Reverse lookup of the TEXT input type returns slot 1, not the numeric value 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfTextInputType_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfTextInputType_028');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfInputType(inputMethod.TextInputType.TEXT);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(1);
      expect(slot !== 0).assertTrue();
      expect(model.getInputType(slot)).assertEqual(inputMethod.TextInputType.TEXT);
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfTextInputType_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0290
     * @tc.name indexOfNumberInputType_029
     * @tc.desc Reverse lookup of the NUMBER input type returns slot 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfNumberInputType_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfNumberInputType_029');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfInputType(inputMethod.TextInputType.NUMBER);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(2);
      expect(model.getInputTypeResource(slot)).assertEqual(STRING_NUMBER_INPUT);
      expect(slot !== -1).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfNumberInputType_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0300
     * @tc.name indexOfNoneEnterKey_030
     * @tc.desc Reverse lookup of the NONE enter key returns slot 0, even though its value is 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfNoneEnterKey_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfNoneEnterKey_030');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfEnterType(inputMethod.EnterKeyType.NONE);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(0);
      expect(InputAttributeModel.ENTER_KEY_TYPES[slot]).assertEqual(inputMethod.EnterKeyType.NONE);
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfNoneEnterKey_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0310
     * @tc.name indexOfSearchEnterKey_031
     * @tc.desc Reverse lookup of the SEARCH enter key returns slot 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfSearchEnterKey_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfSearchEnterKey_031');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfEnterType(inputMethod.EnterKeyType.SEARCH);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(1);
      expect(model.getEnterTypeResource(slot)).assertEqual(STRING_SEARCH_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfSearchEnterKey_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0320
     * @tc.name indexOfSendEnterKey_032
     * @tc.desc Reverse lookup of the SEND enter key returns slot 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'indexOfSendEnterKey_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'indexOfSendEnterKey_032');
      let model: InputAttributeModel = createModel();
      let slot: number = model.indexOfEnterType(inputMethod.EnterKeyType.SEND);
      TestLogger.value(TAG_ATTRIBUTE, 'slot', slot.toString());
      expect(slot).assertEqual(2);
      expect(model.getEnterTypeResource(slot)).assertEqual(STRING_SEND_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'indexOfSendEnterKey_032');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group H: equality helpers used by the page to avoid redundant updates
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0330
     * @tc.name sameInputTypeSameSlot_033
     * @tc.desc Two identical input type indices compare as the same type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sameInputTypeSameSlot_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'sameInputTypeSameSlot_033');
      let model: InputAttributeModel = createModel();
      expect(model.isSameInputType(1, 1)).assertTrue();
      expect(model.isSameInputType(2, 2)).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'sameInputTypeSameSlot_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0340
     * @tc.name fractionAndIntegerInputTypesDiffer_034
     * @tc.desc A fractional index yields undefined while the integer slot yields TEXT, so they differ
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'fractionAndIntegerInputTypesDiffer_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'fractionAndIntegerInputTypesDiffer_034');
      let model: InputAttributeModel = createModel();
      expect(model.isSameInputType(1.5, 1)).assertFalse();
      expect(model.getInputType(1.5)).assertEqual(undefined);
      TestLogger.end(TAG_ATTRIBUTE, 'fractionAndIntegerInputTypesDiffer_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0350
     * @tc.name sameEnterKeySameSlot_035
     * @tc.desc Two identical enter key indices compare as the same key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sameEnterKeySameSlot_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'sameEnterKeySameSlot_035');
      let model: InputAttributeModel = createModel();
      expect(model.isSameEnterType(1, 1)).assertTrue();
      expect(model.isSameEnterType(3, 3)).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'sameEnterKeySameSlot_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0360
     * @tc.name fractionAndIntegerEnterKeysDiffer_036
     * @tc.desc A fractional enter key index yields undefined while slot 2 yields SEND, so they differ
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'fractionAndIntegerEnterKeysDiffer_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'fractionAndIntegerEnterKeysDiffer_036');
      let model: InputAttributeModel = createModel();
      expect(model.isSameEnterType(2.5, 2)).assertFalse();
      expect(model.isSameEnterType(0.5, 2.5)).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'fractionAndIntegerEnterKeysDiffer_036');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group I: consistency between the enum table and the resource table
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0370
     * @tc.name outOfRangeInputResourcesAllFallback_037
     * @tc.desc The three out-of-range input indices all select the heading fallback resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'outOfRangeInputResourcesAllFallback_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'outOfRangeInputResourcesAllFallback_037');
      let model: InputAttributeModel = createModel();
      expect(model.getInputTypeResource(-1)).assertEqual(INPUT_TYPE_FALLBACK);
      expect(model.getInputTypeResource(4)).assertEqual(INPUT_TYPE_FALLBACK);
      expect(model.getInputTypeResource(99)).assertEqual(INPUT_TYPE_FALLBACK);
      TestLogger.end(TAG_ATTRIBUTE, 'outOfRangeInputResourcesAllFallback_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0380
     * @tc.name outOfRangeEnterResourcesAllFallback_038
     * @tc.desc The three out-of-range enter key indices all select the heading fallback resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'outOfRangeEnterResourcesAllFallback_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'outOfRangeEnterResourcesAllFallback_038');
      let model: InputAttributeModel = createModel();
      expect(model.getEnterTypeResource(-1)).assertEqual(ENTER_KEY_FALLBACK);
      expect(model.getEnterTypeResource(4)).assertEqual(ENTER_KEY_FALLBACK);
      expect(model.getEnterTypeResource(99)).assertEqual(ENTER_KEY_FALLBACK);
      TestLogger.end(TAG_ATTRIBUTE, 'outOfRangeEnterResourcesAllFallback_038');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group J: page integration of the dropdowns and the option lists
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0390
     * @tc.name pageBuildsFourInputOptions_039
     * @tc.desc aboutToAppear pushes one dropdown option per input type source entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageBuildsFourInputOptions_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageBuildsFourInputOptions_039');
      let page: PageStateModel = new PageStateModel();
      expect(page.buildInputTypeOptions()).assertEqual(4);
      expect(page.buildInputTypeOptions()).assertEqual(SELECT_OPTION_COUNT);
      TestLogger.end(TAG_ATTRIBUTE, 'pageBuildsFourInputOptions_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0400
     * @tc.name pageBuildsFourEnterKeyOptions_040
     * @tc.desc aboutToAppear pushes one dropdown option per enter key source entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageBuildsFourEnterKeyOptions_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageBuildsFourEnterKeyOptions_040');
      let page: PageStateModel = new PageStateModel();
      expect(page.buildEnterKeyOptions()).assertEqual(4);
      expect(page.buildEnterKeyOptions()).assertEqual(SELECT_OPTION_COUNT);
      TestLogger.end(TAG_ATTRIBUTE, 'pageBuildsFourEnterKeyOptions_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0410
     * @tc.name pageSelectsInputTypeTwo_041
     * @tc.desc Choosing the third input option stores index 2 and refocuses the dropdown
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectsInputTypeTwo_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageSelectsInputTypeTwo_041');
      let page: PageStateModel = new PageStateModel();
      let focusId: string = page.selectInputType(2);
      TestLogger.value(TAG_ATTRIBUTE, 'focus', focusId);
      expect(page.inputTypeIndex).assertEqual(2);
      expect(focusId).assertEqual(INPUT_TYPE_SELECT_ID);
      TestLogger.end(TAG_ATTRIBUTE, 'pageSelectsInputTypeTwo_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0420
     * @tc.name pageSelectsInputTypeZero_042
     * @tc.desc Choosing the first input option stores index 0 and keeps the dropdown focused
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectsInputTypeZero_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageSelectsInputTypeZero_042');
      let page: PageStateModel = new PageStateModel();
      page.selectInputType(3);
      let focusId: string = page.selectInputType(0);
      expect(page.inputTypeIndex).assertEqual(0);
      expect(focusId).assertEqual(INPUT_TYPE_SELECT_ID);
      TestLogger.end(TAG_ATTRIBUTE, 'pageSelectsInputTypeZero_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0430
     * @tc.name pageStoresNegativeInputIndex_043
     * @tc.desc The page stores a negative dropdown index as-is; the utility later falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageStoresNegativeInputIndex_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageStoresNegativeInputIndex_043');
      let page: PageStateModel = new PageStateModel();
      let focusId: string = page.selectInputType(-1);
      expect(page.inputTypeIndex).assertEqual(-1);
      expect(focusId).assertEqual(INPUT_TYPE_SELECT_ID);
      TestLogger.end(TAG_ATTRIBUTE, 'pageStoresNegativeInputIndex_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0440
     * @tc.name pageSelectsEnterKeyThree_044
     * @tc.desc Choosing the last enter key option stores index 3 and refocuses the dropdown
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectsEnterKeyThree_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageSelectsEnterKeyThree_044');
      let page: PageStateModel = new PageStateModel();
      let focusId: string = page.selectEnterKey(3);
      expect(page.enterKeyIndex).assertEqual(3);
      expect(focusId).assertEqual(ENTER_KEY_SELECT_ID);
      expect(focusId !== INPUT_TYPE_SELECT_ID).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'pageSelectsEnterKeyThree_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0450
     * @tc.name pageSelectsEnterKeyZero_045
     * @tc.desc Choosing the first enter key option stores index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectsEnterKeyZero_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageSelectsEnterKeyZero_045');
      let page: PageStateModel = new PageStateModel();
      page.selectEnterKey(2);
      page.selectEnterKey(0);
      expect(page.enterKeyIndex).assertEqual(0);
      expect(ENTER_KEY_RESOURCES[page.enterKeyIndex]).assertEqual(STRING_DEFAULT_ENTER_KEY);
      TestLogger.end(TAG_ATTRIBUTE, 'pageSelectsEnterKeyZero_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0460
     * @tc.name pageStoresNegativeEnterIndex_046
     * @tc.desc The page stores a negative enter key index as-is; the utility later falls back to NONE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageStoresNegativeEnterIndex_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageStoresNegativeEnterIndex_046');
      let page: PageStateModel = new PageStateModel();
      page.selectEnterKey(-5);
      expect(page.enterKeyIndex).assertEqual(-5);
      TestLogger.end(TAG_ATTRIBUTE, 'pageStoresNegativeEnterIndex_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0470
     * @tc.name pageInputLabelFollowsSelection_047
     * @tc.desc After choosing input option 2 the shown label value becomes "2"
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInputLabelFollowsSelection_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageInputLabelFollowsSelection_047');
      let page: PageStateModel = new PageStateModel();
      page.selectInputType(2);
      expect(page.currentInputTypeLabel()).assertEqual('2');
      expect(page.currentEnterKeyLabel()).assertEqual('0');
      TestLogger.end(TAG_ATTRIBUTE, 'pageInputLabelFollowsSelection_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0480
     * @tc.name pageSelectionDoesNotRebuildOptions_048
     * @tc.desc Selecting an option does not change the number of options built on appear
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageSelectionDoesNotRebuildOptions_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageSelectionDoesNotRebuildOptions_048');
      let page: PageStateModel = new PageStateModel();
      page.selectInputType(3);
      page.selectEnterKey(2);
      expect(page.buildInputTypeOptions()).assertEqual(4);
      expect(page.buildEnterKeyOptions()).assertEqual(4);
      TestLogger.end(TAG_ATTRIBUTE, 'pageSelectionDoesNotRebuildOptions_048');
      await yieldToEventLoop();
      done();
    });

    // -----------------------------------------------------------------------
    // Group K: integral floats and non-integer page indices
    // -----------------------------------------------------------------------

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0490
     * @tc.name inputResourceNegativeZero_049
     * @tc.desc A negative zero resource index aliases slot 0, so it selects the "default_input" label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputResourceNegativeZero_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'inputResourceNegativeZero_049');
      let model: InputAttributeModel = createModel();
      let resource: string = model.getInputTypeResource(-0);
      TestLogger.value(TAG_ATTRIBUTE, 'resource', resource);
      expect(resource).assertEqual(STRING_DEFAULT_INPUT);
      expect(resource !== INPUT_TYPE_FALLBACK).assertTrue();
      TestLogger.end(TAG_ATTRIBUTE, 'inputResourceNegativeZero_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0500
     * @tc.name pageStoresFractionalInputIndex_050
     * @tc.desc The page stores a fractional dropdown index verbatim and shows it as the label text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageStoresFractionalInputIndex_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageStoresFractionalInputIndex_050');
      let page: PageStateModel = new PageStateModel();
      let focusId: string = page.selectInputType(1.5);
      expect(page.inputTypeIndex).assertEqual(1.5);
      expect(page.currentInputTypeLabel()).assertEqual('1.5');
      expect(focusId).assertEqual(INPUT_TYPE_SELECT_ID);
      TestLogger.end(TAG_ATTRIBUTE, 'pageStoresFractionalInputIndex_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_ATTRIBUTE_0510
     * @tc.name pageStoresFractionalEnterIndex_051
     * @tc.desc The page stores a fractional enter key index verbatim without rounding it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageStoresFractionalEnterIndex_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_ATTRIBUTE, 'pageStoresFractionalEnterIndex_051');
      let page: PageStateModel = new PageStateModel();
      let focusId: string = page.selectEnterKey(2.5);
      expect(page.enterKeyIndex).assertEqual(2.5);
      expect(page.currentEnterKeyLabel()).assertEqual('2.5');
      expect(focusId).assertEqual(ENTER_KEY_SELECT_ID);
      TestLogger.end(TAG_ATTRIBUTE, 'pageStoresFractionalEnterIndex_051');
      await yieldToEventLoop();
      done();
    });

  });
}
