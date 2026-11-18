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

/**
 * Read-only contract suite for the input method service used by CustomInputText.
 *
 * The sample obtains a controller, attaches it to the custom editor and pushes
 * cursor and attribute updates. This suite pins down the parts of the API 10
 * interface the sample depends on: the module entry points, the controller method
 * set, the enabled/disabled input method lists, the current method and subtype
 * shapes, the enum values that travel through callbacks, and the literal data
 * interfaces (CursorInfo, TextConfig, Range, Movement, FunctionKey).
 *
 * No state-changing call is made: switchInputMethod, attach, detach,
 * updateCursor, updateAttribute and changeSelection are only inspected through
 * typeof, never invoked. Every promise-based case calls done() in a finally block
 * and re-raises a swallowed assertion through the threw flag.
 */

function isNonEmpty(value: string): boolean {
  return value !== undefined && value !== null && value.length > 0;
}

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

function indexOfId(items: inputMethod.InputMethodProperty[], id: string): number {
  let index: number = 0;
  while (index < items.length) {
    if (items[index].id === id) {
      return index;
    }
    index++;
  }
  return -1;
}

function countDistinctIds(items: inputMethod.InputMethodProperty[]): number {
  let seen: string[] = [];
  let index: number = 0;
  while (index < items.length) {
    let id: string = items[index].id;
    let found: boolean = false;
    let scan: number = 0;
    while (scan < seen.length) {
      if (seen[scan] === id) {
        found = true;
        break;
      }
      scan++;
    }
    if (!found) {
      seen.push(id);
    }
    index++;
  }
  return seen.length;
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

function everyIdNonEmpty(items: inputMethod.InputMethodProperty[]): boolean {
  let index: number = 0;
  while (index < items.length) {
    if (!isNonEmpty(items[index].id)) {
      return false;
    }
    index++;
  }
  return true;
}

function everyPackageNonEmpty(items: inputMethod.InputMethodProperty[]): boolean {
  let index: number = 0;
  while (index < items.length) {
    if (!isNonEmpty(items[index].packageName)) {
      return false;
    }
    index++;
  }
  return true;
}

function everyElementIsObject(items: inputMethod.InputMethodProperty[]): boolean {
  let index: number = 0;
  while (index < items.length) {
    if (typeof items[index] !== 'object') {
      return false;
    }
    index++;
  }
  return true;
}

function everyEnabledIdPresent(enabled: inputMethod.InputMethodProperty[],
  disabled: inputMethod.InputMethodProperty[]): boolean {
  let index: number = 0;
  while (index < disabled.length) {
    if (!containsId(enabled, disabled[index].id)) {
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

function isOptionalNumberOrUndefined(value: number | undefined): boolean {
  return value === undefined || typeof value === 'number';
}

function isOptionalStringOrUndefined(value: string | undefined): boolean {
  return value === undefined || typeof value === 'string';
}

function isOptionalObjectOrUndefined(value: object | undefined): boolean {
  return value === undefined || typeof value === 'object';
}

export default function inputMethodApiContractTestExtra(): void {
  describe('CustomInputTextInputMethodApiContractExtraTest', () => {

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0580
     * @tc.name apiDisabledListIsArray058
     * @tc.desc getInputMethods(false) resolves to an array value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledListIsArray_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledListIsArray_058');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(Array.isArray(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledListIsArray_058 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0590
     * @tc.name apiDisabledListLengthIsNumber059
     * @tc.desc The disabled list reports a numeric length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledListLengthIsNumber_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledListLengthIsNumber_059');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        TestLogger.value(TAG_API, 'disabled count', methods.length.toString());
        expect(typeof methods.length).assertEqual('number');
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledListLengthIsNumber_059 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0600
     * @tc.name apiDisabledIdsSubsetOfEnabled060
     * @tc.desc Every id in the disabled list appears in the enabled list
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledIdsSubsetOfEnabled_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledIdsSubsetOfEnabled_060');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let enabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let disabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(everyEnabledIdPresent(enabled, disabled)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledIdsSubsetOfEnabled_060 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0610
     * @tc.name apiDisabledLengthNotGreater061
     * @tc.desc The disabled list is not longer than the enabled list
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledLengthNotGreater_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledLengthNotGreater_061');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let enabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let disabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(disabled.length <= enabled.length).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledLengthNotGreater_061 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0620
     * @tc.name apiDisabledEveryIdNonEmpty062
     * @tc.desc Every disabled entry carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledEveryIdNonEmpty_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledEveryIdNonEmpty_062');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(everyIdNonEmpty(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledEveryIdNonEmpty_062 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0630
     * @tc.name apiDisabledNoDuplicateIds063
     * @tc.desc The disabled list reports each method id once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledNoDuplicateIds_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledNoDuplicateIds_063');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(countDistinctIds(methods)).assertEqual(methods.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledNoDuplicateIds_063 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0640
     * @tc.name apiDisabledTwoCallsSameLength064
     * @tc.desc Two disabled-list calls return the same number of entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledTwoCallsSameLength_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledTwoCallsSameLength_064');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(first.length).assertEqual(second.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledTwoCallsSameLength_064 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0650
     * @tc.name apiDisabledTwoCallsSameIdSet065
     * @tc.desc Two disabled-list calls report the same id set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledTwoCallsSameIdSet_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledTwoCallsSameIdSet_065');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(sameIdSet(first, second)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledTwoCallsSameIdSet_065 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0660
     * @tc.name apiDisabledLengthNonNegative066
     * @tc.desc An empty disabled list is allowed and still reports zero rather than a negative length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledLengthNonNegative_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledLengthNonNegative_066');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(methods.length >= 0).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledLengthNonNegative_066 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0670
     * @tc.name apiDisabledIdsAllAppearInEnabled067
     * @tc.desc Each disabled id can be located again in the enabled list
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledIdsAllAppearInEnabled_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledIdsAllAppearInEnabled_067');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let enabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let disabled: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        let allFound: boolean = true;
        let index: number = 0;
        while (index < disabled.length) {
          if (indexOfId(enabled, disabled[index].id) < 0) {
            allFound = false;
          }
          index++;
        }
        expect(allFound).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledIdsAllAppearInEnabled_067 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0680
     * @tc.name apiDisabledEveryPackageNonEmpty068
     * @tc.desc Every disabled entry carries a non-empty package name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledEveryPackageNonEmpty_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledEveryPackageNonEmpty_068');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(everyPackageNonEmpty(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledEveryPackageNonEmpty_068 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0690
     * @tc.name apiDisabledEveryElementIsObject069
     * @tc.desc Every disabled entry is an object value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDisabledEveryElementIsObject_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledEveryElementIsObject_069');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(everyElementIsObject(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledEveryElementIsObject_069 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0700
     * @tc.name apiDisabledFirstElementIfPresent070
     * @tc.desc When the disabled list is non-empty its first entry carries id and name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledFirstElementIfPresent_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledFirstElementIfPresent_070');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        if (methods.length > 0) {
          expect(isNonEmpty(methods[0].id)).assertTrue();
          expect(isNonEmpty(methods[0].name)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledFirstElementIfPresent_070 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0710
     * @tc.name apiDisabledDistinctCountMatches071
     * @tc.desc The distinct id count of the disabled list equals its length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiDisabledDistinctCountMatches_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDisabledDistinctCountMatches_071');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(false);
        expect(countDistinctIds(methods)).assertEqual(methods.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiDisabledDistinctCountMatches_071 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0720
     * @tc.name apiCurrentMethodIsObject072
     * @tc.desc getCurrentInputMethod returns an object value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentMethodIsObject_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentMethodIsObject_072');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(typeof current).assertEqual('object');
      TestLogger.end(TAG_API, 'apiCurrentMethodIsObject_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0730
     * @tc.name apiCurrentIdNonEmpty073
     * @tc.desc The current input method carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentIdNonEmpty_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentIdNonEmpty_073');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      TestLogger.value(TAG_API, 'current id', current.id);
      expect(isNonEmpty(current.id)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentIdNonEmpty_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0740
     * @tc.name apiCurrentNameIsString074
     * @tc.desc The current input method reports its display name as a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentNameIsString_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentNameIsString_074');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(typeof current.name).assertEqual('string');
      TestLogger.end(TAG_API, 'apiCurrentNameIsString_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0750
     * @tc.name apiCurrentPackageNonEmpty075
     * @tc.desc The current input method carries a non-empty package name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentPackageNonEmpty_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentPackageNonEmpty_075');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isNonEmpty(current.packageName)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentPackageNonEmpty_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0760
     * @tc.name apiCurrentIdInEnabledList076
     * @tc.desc The current id is contained in the enabled list fetched from the same setting
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentIdInEnabledList_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentIdInEnabledList_076');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
        expect(indexOfId(methods, current.id) >= 0).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiCurrentIdInEnabledList_076 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0770
     * @tc.name apiCurrentMethodIdIsString077
     * @tc.desc The deprecated methodId field of the current method is a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentMethodIdIsString_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentMethodIdIsString_077');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(typeof current.methodId).assertEqual('string');
      TestLogger.end(TAG_API, 'apiCurrentMethodIdIsString_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0780
     * @tc.name apiCurrentLabelOptionalString078
     * @tc.desc The optional label of the current method is absent or a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentLabelOptionalString_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentLabelOptionalString_078');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isOptionalStringOrUndefined(current.label)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentLabelOptionalString_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0790
     * @tc.name apiCurrentLabelIdOptionalNumber079
     * @tc.desc The optional labelId of the current method is absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentLabelIdOptionalNumber_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentLabelIdOptionalNumber_079');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isOptionalNumberOrUndefined(current.labelId)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentLabelIdOptionalNumber_079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0800
     * @tc.name apiCurrentIconOptionalString080
     * @tc.desc The optional icon path of the current method is absent or a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentIconOptionalString_080', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentIconOptionalString_080');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isOptionalStringOrUndefined(current.icon)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentIconOptionalString_080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0810
     * @tc.name apiCurrentIconIdOptionalNumber081
     * @tc.desc The optional iconId of the current method is absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentIconIdOptionalNumber_081', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentIconIdOptionalNumber_081');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isOptionalNumberOrUndefined(current.iconId)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentIconIdOptionalNumber_081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0820
     * @tc.name apiCurrentTwoCallsSameId082
     * @tc.desc Two consecutive current-method calls report the same id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentTwoCallsSameId_082', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentTwoCallsSameId_082');
      let first: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      let second: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(first.id).assertEqual(second.id);
      TestLogger.end(TAG_API, 'apiCurrentTwoCallsSameId_082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0830
     * @tc.name apiCurrentNotUndefined083
     * @tc.desc getCurrentInputMethod never returns undefined or null
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentNotUndefined_083', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentNotUndefined_083');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(current !== undefined).assertTrue();
      expect(current !== null).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentNotUndefined_083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0840
     * @tc.name apiCurrentIdLengthPositive084
     * @tc.desc The current id has a positive string length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentIdLengthPositive_084', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentIdLengthPositive_084');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(current.id.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentIdLengthPositive_084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0850
     * @tc.name apiCurrentNameLengthPositive085
     * @tc.desc The current display name has a positive string length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentNameLengthPositive_085', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentNameLengthPositive_085');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(current.name.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentNameLengthPositive_085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0860
     * @tc.name apiCurrentPackageLengthPositive086
     * @tc.desc The current package name has a positive string length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiCurrentPackageLengthPositive_086', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentPackageLengthPositive_086');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(current.packageName.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentPackageLengthPositive_086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0870
     * @tc.name apiCurrentExtraIsObjectOrUndefined087
     * @tc.desc The optional extra payload of the current method is absent or an object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiCurrentExtraIsObjectOrUndefined_087', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiCurrentExtraIsObjectOrUndefined_087');
      let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
      expect(isOptionalObjectOrUndefined(current.extra)).assertTrue();
      TestLogger.end(TAG_API, 'apiCurrentExtraIsObjectOrUndefined_087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0880
     * @tc.name apiSubtypeIsObject088
     * @tc.desc getCurrentInputMethodSubtype returns an object value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeIsObject_088', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIsObject_088');
      expect(typeof inputMethod.getCurrentInputMethodSubtype()).assertEqual('object');
      TestLogger.end(TAG_API, 'apiSubtypeIsObject_088');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0890
     * @tc.name apiSubtypeIdNonEmpty089
     * @tc.desc The current subtype carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeIdNonEmpty_089', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIdNonEmpty_089');
      TestLogger.value(TAG_API, 'subtype id', inputMethod.getCurrentInputMethodSubtype().id);
      expect(isNonEmpty(inputMethod.getCurrentInputMethodSubtype().id)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeIdNonEmpty_089');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0900
     * @tc.name apiSubtypeNameNonEmpty090
     * @tc.desc The current subtype carries a non-empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeNameNonEmpty_090', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeNameNonEmpty_090');
      expect(isNonEmpty(inputMethod.getCurrentInputMethodSubtype().name)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeNameNonEmpty_090');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0910
     * @tc.name apiSubtypeLocaleIsString091
     * @tc.desc The subtype locale is reported as a string value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeLocaleIsString_091', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLocaleIsString_091');
      expect(typeof inputMethod.getCurrentInputMethodSubtype().locale).assertEqual('string');
      TestLogger.end(TAG_API, 'apiSubtypeLocaleIsString_091');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0920
     * @tc.name apiSubtypeLanguageIsString092
     * @tc.desc The subtype language is reported as a string value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeLanguageIsString_092', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLanguageIsString_092');
      expect(typeof inputMethod.getCurrentInputMethodSubtype().language).assertEqual('string');
      TestLogger.end(TAG_API, 'apiSubtypeLanguageIsString_092');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0930
     * @tc.name apiSubtypeTwoCallsSameId093
     * @tc.desc Two consecutive subtype queries report the same id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeTwoCallsSameId_093', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeTwoCallsSameId_093');
      expect(inputMethod.getCurrentInputMethodSubtype().id)
        .assertEqual(inputMethod.getCurrentInputMethodSubtype().id);
      TestLogger.end(TAG_API, 'apiSubtypeTwoCallsSameId_093');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0940
     * @tc.name apiSubtypeModeOptional094
     * @tc.desc The optional subtype mode is absent, empty when the IME publishes no subtype, or one of the two documented literals
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeModeOptional_094', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeModeOptional_094');
      let mode: string | undefined = inputMethod.getCurrentInputMethodSubtype().mode;
      let valid: boolean = mode === undefined || mode === '' || mode === 'upper' || mode === 'lower';
      TestLogger.value(TAG_API, 'mode', mode === undefined ? 'undefined' : mode);
      expect(valid).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeModeOptional_094');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0950
     * @tc.name apiSubtypeLabelOptional095
     * @tc.desc The optional subtype label is absent or a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeLabelOptional_095', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLabelOptional_095');
      expect(isOptionalStringOrUndefined(inputMethod.getCurrentInputMethodSubtype().label)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeLabelOptional_095');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0960
     * @tc.name apiSubtypeLabelIdOptional096
     * @tc.desc The optional subtype labelId is absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeLabelIdOptional_096', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLabelIdOptional_096');
      expect(isOptionalNumberOrUndefined(inputMethod.getCurrentInputMethodSubtype().labelId)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeLabelIdOptional_096');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0970
     * @tc.name apiSubtypeIconOptional097
     * @tc.desc The optional subtype icon is absent or a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeIconOptional_097', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIconOptional_097');
      expect(isOptionalStringOrUndefined(inputMethod.getCurrentInputMethodSubtype().icon)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeIconOptional_097');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0980
     * @tc.name apiSubtypeIconIdOptional098
     * @tc.desc The optional subtype iconId is absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeIconIdOptional_098', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIconIdOptional_098');
      expect(isOptionalNumberOrUndefined(inputMethod.getCurrentInputMethodSubtype().iconId)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeIconIdOptional_098');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0990
     * @tc.name apiSubtypeExtraOptional099
     * @tc.desc The optional subtype extra payload is absent or an object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeExtraOptional_099', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeExtraOptional_099');
      expect(isOptionalObjectOrUndefined(inputMethod.getCurrentInputMethodSubtype().extra)).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeExtraOptional_099');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1000
     * @tc.name apiSubtypeIdLengthPositive100
     * @tc.desc The subtype id has a positive string length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeIdLengthPositive_100', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIdLengthPositive_100');
      expect(inputMethod.getCurrentInputMethodSubtype().id.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeIdLengthPositive_100');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1010
     * @tc.name apiSubtypeNameLengthPositive101
     * @tc.desc The subtype name has a positive string length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeNameLengthPositive_101', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeNameLengthPositive_101');
      expect(inputMethod.getCurrentInputMethodSubtype().name.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeNameLengthPositive_101');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1020
     * @tc.name apiSubtypeLocaleLengthNonNegative102
     * @tc.desc The subtype locale string reports a non-negative length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeLocaleLengthNonNegative_102', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLocaleLengthNonNegative_102');
      expect(inputMethod.getCurrentInputMethodSubtype().locale.length >= 0).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeLocaleLengthNonNegative_102');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1030
     * @tc.name apiSubtypeLanguageLengthNonNegative103
     * @tc.desc The subtype language string reports a non-negative length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiSubtypeLanguageLengthNonNegative_103', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeLanguageLengthNonNegative_103');
      expect(inputMethod.getCurrentInputMethodSubtype().language.length >= 0).assertTrue();
      TestLogger.end(TAG_API, 'apiSubtypeLanguageLengthNonNegative_103');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1040
     * @tc.name apiSubtypeIdIsString104
     * @tc.desc The subtype id field is a string value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeIdIsString_104', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeIdIsString_104');
      expect(typeof inputMethod.getCurrentInputMethodSubtype().id).assertEqual('string');
      TestLogger.end(TAG_API, 'apiSubtypeIdIsString_104');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1050
     * @tc.name apiSubtypeNameIsString105
     * @tc.desc The subtype name field is a string value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSubtypeNameIsString_105', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSubtypeNameIsString_105');
      expect(typeof inputMethod.getCurrentInputMethodSubtype().name).assertEqual('string');
      TestLogger.end(TAG_API, 'apiSubtypeNameIsString_105');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1060
     * @tc.name apiTextInputTypeNone106
     * @tc.desc TextInputType.NONE is the negative sentinel -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextInputTypeNone_106', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypeNone_106');
      expect(inputMethod.TextInputType.NONE).assertEqual(-1);
      TestLogger.end(TAG_API, 'apiTextInputTypeNone_106');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1070
     * @tc.name apiTextInputTypeText107
     * @tc.desc TextInputType.TEXT is 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextInputTypeText_107', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypeText_107');
      expect(inputMethod.TextInputType.TEXT).assertEqual(0);
      TestLogger.end(TAG_API, 'apiTextInputTypeText_107');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1080
     * @tc.name apiTextInputTypeNumber108
     * @tc.desc TextInputType.NUMBER is 2, after NONE and TEXT in the API 10 enum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextInputTypeNumber_108', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypeNumber_108');
      expect(inputMethod.TextInputType.NUMBER).assertEqual(2);
      TestLogger.end(TAG_API, 'apiTextInputTypeNumber_108');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1090
     * @tc.name apiTextInputTypePhone109
     * @tc.desc TextInputType.PHONE is 3, after NUMBER in the API 10 enum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextInputTypePhone_109', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypePhone_109');
      expect(inputMethod.TextInputType.PHONE).assertEqual(3);
      TestLogger.end(TAG_API, 'apiTextInputTypePhone_109');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1100
     * @tc.name apiTextInputTypeDistinct110
     * @tc.desc The four TextInputType values are pairwise distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTextInputTypeDistinct_110', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTextInputTypeDistinct_110');
      let values: number[] = [
        inputMethod.TextInputType.NONE, inputMethod.TextInputType.TEXT,
        inputMethod.TextInputType.NUMBER, inputMethod.TextInputType.PHONE
      ];
      expect(allDistinct(values)).assertTrue();
      TestLogger.end(TAG_API, 'apiTextInputTypeDistinct_110');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1110
     * @tc.name apiEnterKeyUnspecified111
     * @tc.desc EnterKeyType.UNSPECIFIED is 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeyUnspecified_111', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyUnspecified_111');
      expect(inputMethod.EnterKeyType.UNSPECIFIED).assertEqual(0);
      TestLogger.end(TAG_API, 'apiEnterKeyUnspecified_111');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1120
     * @tc.name apiEnterKeyNone112
     * @tc.desc EnterKeyType.NONE is 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeyNone_112', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyNone_112');
      expect(inputMethod.EnterKeyType.NONE).assertEqual(1);
      TestLogger.end(TAG_API, 'apiEnterKeyNone_112');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1130
     * @tc.name apiEnterKeyGo113
     * @tc.desc EnterKeyType.GO is 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeyGo_113', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyGo_113');
      expect(inputMethod.EnterKeyType.GO).assertEqual(2);
      TestLogger.end(TAG_API, 'apiEnterKeyGo_113');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1140
     * @tc.name apiEnterKeySearch114
     * @tc.desc EnterKeyType.SEARCH is 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeySearch_114', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeySearch_114');
      expect(inputMethod.EnterKeyType.SEARCH).assertEqual(3);
      TestLogger.end(TAG_API, 'apiEnterKeySearch_114');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1150
     * @tc.name apiEnterKeySend115
     * @tc.desc EnterKeyType.SEND is 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeySend_115', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeySend_115');
      expect(inputMethod.EnterKeyType.SEND).assertEqual(4);
      TestLogger.end(TAG_API, 'apiEnterKeySend_115');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1160
     * @tc.name apiEnterKeyDistinct116
     * @tc.desc The five EnterKeyType values are pairwise distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnterKeyDistinct_116', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnterKeyDistinct_116');
      let values: number[] = [
        inputMethod.EnterKeyType.UNSPECIFIED, inputMethod.EnterKeyType.NONE, inputMethod.EnterKeyType.GO,
        inputMethod.EnterKeyType.SEARCH, inputMethod.EnterKeyType.SEND
      ];
      expect(allDistinct(values)).assertTrue();
      expect(values.length).assertEqual(5);
      TestLogger.end(TAG_API, 'apiEnterKeyDistinct_116');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1170
     * @tc.name apiDirectionUp117
     * @tc.desc Direction.CURSOR_UP is 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDirectionUp_117', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionUp_117');
      expect(inputMethod.Direction.CURSOR_UP).assertEqual(1);
      TestLogger.end(TAG_API, 'apiDirectionUp_117');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1180
     * @tc.name apiDirectionDown118
     * @tc.desc Direction.CURSOR_DOWN is 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDirectionDown_118', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionDown_118');
      expect(inputMethod.Direction.CURSOR_DOWN).assertEqual(2);
      TestLogger.end(TAG_API, 'apiDirectionDown_118');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1190
     * @tc.name apiDirectionLeft119
     * @tc.desc Direction.CURSOR_LEFT is 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDirectionLeft_119', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionLeft_119');
      expect(inputMethod.Direction.CURSOR_LEFT).assertEqual(3);
      TestLogger.end(TAG_API, 'apiDirectionLeft_119');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1200
     * @tc.name apiDirectionRight120
     * @tc.desc Direction.CURSOR_RIGHT is 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDirectionRight_120', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionRight_120');
      expect(inputMethod.Direction.CURSOR_RIGHT).assertEqual(4);
      TestLogger.end(TAG_API, 'apiDirectionRight_120');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_1210
     * @tc.name apiDirectionDistinct121
     * @tc.desc The four Direction values are pairwise distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiDirectionDistinct_121', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiDirectionDistinct_121');
      let values: number[] = [
        inputMethod.Direction.CURSOR_UP, inputMethod.Direction.CURSOR_DOWN,
        inputMethod.Direction.CURSOR_LEFT, inputMethod.Direction.CURSOR_RIGHT
      ];
      expect(allDistinct(values)).assertTrue();
      TestLogger.end(TAG_API, 'apiDirectionDistinct_121');
      await yieldToEventLoop();
      done();
    });
  });
}
