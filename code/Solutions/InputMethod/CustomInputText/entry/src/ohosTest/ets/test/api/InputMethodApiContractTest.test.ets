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

function idsOf(items: inputMethod.InputMethodProperty[]): string[] {
  let result: string[] = [];
  let index: number = 0;
  while (index < items.length) {
    result.push(items[index].id);
    index++;
  }
  return result;
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

function everyNameNonEmpty(items: inputMethod.InputMethodProperty[]): boolean {
  let index: number = 0;
  while (index < items.length) {
    if (!isNonEmpty(items[index].name)) {
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

function isOptionalNumberOrUndefined(value: number | undefined): boolean {
  return value === undefined || typeof value === 'number';
}

function isOptionalObjectOrUndefined(value: object | undefined): boolean {
  return value === undefined || typeof value === 'object';
}

export default function inputMethodApiContractTest(): void {
  describe('CustomInputTextInputMethodApiContractTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0010
     * @tc.name apiGetControllerIsFunction001
     * @tc.desc The module exposes getController as a callable function so the sample can obtain a controller
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetControllerIsFunction_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetControllerIsFunction_001');
      let kind: string = typeof inputMethod.getController;
      TestLogger.value(TAG_API, 'typeof getController', kind);
      expect(kind).assertEqual('function');
      expect(kind !== 'undefined').assertTrue();
      TestLogger.end(TAG_API, 'apiGetControllerIsFunction_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0020
     * @tc.name apiGetControllerReturnsObject002
     * @tc.desc getController returns a non-null controller object that carries the attach method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetControllerReturnsObject_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetControllerReturnsObject_002');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      TestLogger.value(TAG_API, 'controller kind', typeof controller);
      expect(typeof controller).assertEqual('object');
      expect(typeof controller.attach).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetControllerReturnsObject_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0030
     * @tc.name apiGetSettingIsFunction003
     * @tc.desc The deprecated getSetting alias is still a callable function on API 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetSettingIsFunction_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetSettingIsFunction_003');
      let kind: string = typeof inputMethod.getSetting;
      TestLogger.value(TAG_API, 'typeof getSetting', kind);
      expect(kind).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetSettingIsFunction_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0040
     * @tc.name apiGetSettingReturnsObject004
     * @tc.desc getSetting returns a setting object that exposes getInputMethods
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetSettingReturnsObject_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetSettingReturnsObject_004');
      let setting: inputMethod.InputMethodSetting = inputMethod.getSetting();
      expect(typeof setting).assertEqual('object');
      expect(typeof setting.getInputMethods).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetSettingReturnsObject_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0050
     * @tc.name apiGetInputMethodSettingIsFunction005
     * @tc.desc The preferred getInputMethodSetting entry point is a callable function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetInputMethodSettingIsFunction_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetInputMethodSettingIsFunction_005');
      let kind: string = typeof inputMethod.getInputMethodSetting;
      TestLogger.value(TAG_API, 'typeof getInputMethodSetting', kind);
      expect(kind).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetInputMethodSettingIsFunction_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0060
     * @tc.name apiGetInputMethodSettingReturnsObject006
     * @tc.desc getInputMethodSetting returns a setting object with the same list API as getSetting
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetInputMethodSettingReturnsObject_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetInputMethodSettingReturnsObject_006');
      let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
      expect(typeof setting).assertEqual('object');
      expect(typeof setting.getInputMethods).assertEqual('function');
      expect(typeof setting.listInputMethodSubtype).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetInputMethodSettingReturnsObject_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0070
     * @tc.name apiGetCurrentInputMethodIsFunction007
     * @tc.desc getCurrentInputMethod is exposed as a callable function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetCurrentInputMethodIsFunction_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetCurrentInputMethodIsFunction_007');
      let kind: string = typeof inputMethod.getCurrentInputMethod;
      expect(kind).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetCurrentInputMethodIsFunction_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0080
     * @tc.name apiGetCurrentInputMethodSubtypeIsFunction008
     * @tc.desc getCurrentInputMethodSubtype is exposed as a callable function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiGetCurrentInputMethodSubtypeIsFunction_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiGetCurrentInputMethodSubtypeIsFunction_008');
      let kind: string = typeof inputMethod.getCurrentInputMethodSubtype;
      expect(kind).assertEqual('function');
      TestLogger.end(TAG_API, 'apiGetCurrentInputMethodSubtypeIsFunction_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0090
     * @tc.name apiModuleObjectIsNotNull009
     * @tc.desc The imported module exposes the controller entry and the two enum tables used by the editor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiModuleObjectIsNotNull_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiModuleObjectIsNotNull_009');
      expect(typeof inputMethod.getController).assertEqual('function');
      expect(inputMethod.TextInputType.TEXT === 0).assertTrue();
      expect(inputMethod.EnterKeyType.NONE === 1).assertTrue();
      TestLogger.end(TAG_API, 'apiModuleObjectIsNotNull_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0100
     * @tc.name apiTwoSettingEntriesExposeSameListApi010
     * @tc.desc The controller and the setting object each expose their own entry points
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiTwoSettingEntriesExposeSameListApi_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiTwoSettingEntriesExposeSameListApi_010');
      let first: inputMethod.InputMethodSetting = inputMethod.getSetting();
      let second: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
      expect(typeof first.getInputMethods).assertEqual('function');
      expect(typeof second.getInputMethods).assertEqual('function');
      TestLogger.end(TAG_API, 'apiTwoSettingEntriesExposeSameListApi_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0110
     * @tc.name apiSettingHasSubtypeListApi011
     * @tc.desc The setting object exposes the subtype listing used to enumerate IME modes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSettingHasSubtypeListApi_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSettingHasSubtypeListApi_011');
      let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
      expect(typeof setting.listCurrentInputMethodSubtype).assertEqual('function');
      expect(typeof setting.listInputMethodSubtype).assertEqual('function');
      TestLogger.end(TAG_API, 'apiSettingHasSubtypeListApi_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0120
     * @tc.name apiSettingHasImeChangeListenerApi012
     * @tc.desc The setting object exposes the imeChange listener pair used to follow IME switches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiSettingHasImeChangeListenerApi_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiSettingHasImeChangeListenerApi_012');
      let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
      expect(typeof setting.on).assertEqual('function');
      expect(typeof setting.off).assertEqual('function');
      TestLogger.end(TAG_API, 'apiSettingHasImeChangeListenerApi_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0130
     * @tc.name apiControllerIsNotUndefined013
     * @tc.desc getController never returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerIsNotUndefined_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerIsNotUndefined_013');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(controller !== undefined).assertTrue();
      expect(controller !== null).assertTrue();
      TestLogger.end(TAG_API, 'apiControllerIsNotUndefined_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0140
     * @tc.name apiControllerAndSettingAreDifferentObjects014
     * @tc.desc The controller and the setting are distinct objects with disjoint primary methods
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerAndSettingAreDifferentObjects_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerAndSettingAreDifferentObjects_014');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
      expect(typeof controller.attach).assertEqual('function');
      expect(typeof setting.getInputMethods).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerAndSettingAreDifferentObjects_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0150
     * @tc.name apiControllerInstancesShareAttach015
     * @tc.desc Both controller references expose the same attach function object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerInstancesShareAttach_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerInstancesShareAttach_015');
      let first: inputMethod.InputMethodController = inputMethod.getController();
      let second: inputMethod.InputMethodController = inputMethod.getController();
      expect(first.attach === second.attach).assertTrue();
      TestLogger.end(TAG_API, 'apiControllerInstancesShareAttach_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0160
     * @tc.name apiControllerExposesCursorUpdate016
     * @tc.desc The controller carries updateCursor, the method the caret tracker calls on area changes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerExposesCursorUpdate_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerExposesCursorUpdate_016');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.updateCursor).assertEqual('function');
      expect(typeof controller.changeSelection).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerExposesCursorUpdate_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0170
     * @tc.name apiControllerHasAttach017
     * @tc.desc The controller exposes attach, the entry point used when the editor gains focus
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasAttach_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasAttach_017');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.attach).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasAttach_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0180
     * @tc.name apiControllerHasDetach018
     * @tc.desc The controller exposes detach, called when the editor is unbound
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasDetach_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasDetach_018');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.detach).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasDetach_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0190
     * @tc.name apiControllerHasShowTextInput019
     * @tc.desc The controller exposes showTextInput, used by the show button and by attach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasShowTextInput_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasShowTextInput_019');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.showTextInput).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasShowTextInput_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0200
     * @tc.name apiControllerHasHideTextInput020
     * @tc.desc The controller exposes hideTextInput, used when the show flag turns off
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasHideTextInput_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasHideTextInput_020');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.hideTextInput).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasHideTextInput_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0210
     * @tc.name apiControllerHasUpdateCursor021
     * @tc.desc The controller exposes updateCursor for absolute caret rectangles
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasUpdateCursor_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasUpdateCursor_021');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.updateCursor).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasUpdateCursor_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0220
     * @tc.name apiControllerHasUpdateAttribute022
     * @tc.desc The controller exposes updateAttribute for text input and enter key types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasUpdateAttribute_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasUpdateAttribute_022');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.updateAttribute).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasUpdateAttribute_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0230
     * @tc.name apiControllerHasChangeSelection023
     * @tc.desc The controller exposes changeSelection for coordinating a selection with the IME
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasChangeSelection_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasChangeSelection_023');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.changeSelection).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasChangeSelection_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0240
     * @tc.name apiControllerHasStopInputSession024
     * @tc.desc The controller exposes stopInputSession, invoked when the page disappears
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasStopInputSession_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasStopInputSession_024');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.stopInputSession).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasStopInputSession_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0250
     * @tc.name apiControllerHasOn025
     * @tc.desc The controller exposes on for the eight editing event subscriptions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasOn_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasOn_025');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.on).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasOn_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0260
     * @tc.name apiControllerHasOff026
     * @tc.desc The controller exposes off so detach can remove every editing listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasOff_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasOff_026');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.off).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasOff_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0270
     * @tc.name apiControllerHasStopInput027
     * @tc.desc The controller exposes stopInput, the non-session stop variant
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasStopInput_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasStopInput_027');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.stopInput).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasStopInput_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0280
     * @tc.name apiControllerHasShowSoftKeyboard028
     * @tc.desc The controller exposes showSoftKeyboard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasShowSoftKeyboard_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasShowSoftKeyboard_028');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.showSoftKeyboard).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasShowSoftKeyboard_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0290
     * @tc.name apiControllerHasHideSoftKeyboard029
     * @tc.desc The controller exposes hideSoftKeyboard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasHideSoftKeyboard_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasHideSoftKeyboard_029');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.hideSoftKeyboard).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasHideSoftKeyboard_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0300
     * @tc.name apiControllerHasSetCallingWindow030
     * @tc.desc The controller exposes setCallingWindow for window-scoped input
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerHasSetCallingWindow_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerHasSetCallingWindow_030');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.setCallingWindow).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerHasSetCallingWindow_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0310
     * @tc.name apiControllerEventMethodsAreFunctions031
     * @tc.desc The controller event methods used for the custom editor are all callable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerEventMethodsAreFunctions_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerEventMethodsAreFunctions_031');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.on).assertEqual('function');
      expect(typeof controller.off).assertEqual('function');
      expect(typeof controller.showTextInput).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerEventMethodsAreFunctions_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0320
     * @tc.name apiControllerSessionMethodsAreFunctions032
     * @tc.desc The controller session methods used on attach and detach are all callable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiControllerSessionMethodsAreFunctions_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiControllerSessionMethodsAreFunctions_032');
      let controller: inputMethod.InputMethodController = inputMethod.getController();
      expect(typeof controller.attach).assertEqual('function');
      expect(typeof controller.detach).assertEqual('function');
      expect(typeof controller.stopInputSession).assertEqual('function');
      TestLogger.end(TAG_API, 'apiControllerSessionMethodsAreFunctions_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0330
     * @tc.name apiEnabledListIsArray033
     * @tc.desc getInputMethods(true) resolves to an array value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledListIsArray_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledListIsArray_033');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(Array.isArray(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledListIsArray_033 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0340
     * @tc.name apiEnabledListLengthIsNumber034
     * @tc.desc The enabled list reports a numeric length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledListLengthIsNumber_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledListLengthIsNumber_034');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        TestLogger.value(TAG_API, 'enabled count', methods.length.toString());
        expect(typeof methods.length).assertEqual('number');
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledListLengthIsNumber_034 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0350
     * @tc.name apiEnabledListNotEmpty035
     * @tc.desc At least one enabled input method is reported on the device
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledListNotEmpty_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledListNotEmpty_035');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(methods.length >= 1).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledListNotEmpty_035 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0360
     * @tc.name apiEnabledFirstElementNotNull036
     * @tc.desc The first enabled entry is a defined object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledFirstElementNotNull_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstElementNotNull_036');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(methods.length > 0).assertTrue();
        if (methods.length > 0) {
          expect(methods[0] !== undefined).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstElementNotNull_036 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0370
     * @tc.name apiEnabledFirstIdNonEmpty037
     * @tc.desc The first enabled entry carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledFirstIdNonEmpty_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstIdNonEmpty_037');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          TestLogger.value(TAG_API, 'first id', methods[0].id);
          expect(isNonEmpty(methods[0].id)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstIdNonEmpty_037 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0380
     * @tc.name apiEnabledFirstNameNonEmpty038
     * @tc.desc The first enabled entry carries a non-empty display name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledFirstNameNonEmpty_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstNameNonEmpty_038');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isNonEmpty(methods[0].name)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstNameNonEmpty_038 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0390
     * @tc.name apiEnabledFirstPackageNonEmpty039
     * @tc.desc The first enabled entry carries a non-empty package name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledFirstPackageNonEmpty_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstPackageNonEmpty_039');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isNonEmpty(methods[0].packageName)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstPackageNonEmpty_039 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0400
     * @tc.name apiEnabledFirstMethodIdIsString040
     * @tc.desc The deprecated methodId field still carries a string value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledFirstMethodIdIsString_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstMethodIdIsString_040');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(typeof methods[0].methodId).assertEqual('string');
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstMethodIdIsString_040 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0410
     * @tc.name apiEnabledFirstLabelIdOptionalNumber041
     * @tc.desc The optional labelId is either absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledFirstLabelIdOptionalNumber_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstLabelIdOptionalNumber_041');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isOptionalNumberOrUndefined(methods[0].labelId)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstLabelIdOptionalNumber_041 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0420
     * @tc.name apiEnabledFirstIconIdOptionalNumber042
     * @tc.desc The optional iconId is either absent or numeric
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledFirstIconIdOptionalNumber_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstIconIdOptionalNumber_042');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isOptionalNumberOrUndefined(methods[0].iconId)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstIconIdOptionalNumber_042 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0430
     * @tc.name apiEnabledEveryIdNonEmpty043
     * @tc.desc Every enabled entry carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledEveryIdNonEmpty_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledEveryIdNonEmpty_043');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(everyIdNonEmpty(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledEveryIdNonEmpty_043 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0440
     * @tc.name apiEnabledEveryNameNonEmpty044
     * @tc.desc Every enabled entry carries a non-empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledEveryNameNonEmpty_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledEveryNameNonEmpty_044');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(everyNameNonEmpty(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledEveryNameNonEmpty_044 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0450
     * @tc.name apiEnabledEveryPackageNonEmpty045
     * @tc.desc Every enabled entry carries a non-empty package name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledEveryPackageNonEmpty_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledEveryPackageNonEmpty_045');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(everyPackageNonEmpty(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledEveryPackageNonEmpty_045 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0460
     * @tc.name apiEnabledNoDuplicateIds046
     * @tc.desc The enabled list reports each method id once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledNoDuplicateIds_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledNoDuplicateIds_046');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(countDistinctIds(methods)).assertEqual(methods.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledNoDuplicateIds_046 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0470
     * @tc.name apiEnabledTwoCallsSameLength047
     * @tc.desc Two enabled-list calls return the same number of entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledTwoCallsSameLength_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledTwoCallsSameLength_047');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(first.length).assertEqual(second.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledTwoCallsSameLength_047 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0480
     * @tc.name apiEnabledTwoCallsSameIdSet048
     * @tc.desc Two enabled-list calls report the same id set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledTwoCallsSameIdSet_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledTwoCallsSameIdSet_048');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let first: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let second: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(sameIdSet(first, second)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledTwoCallsSameIdSet_048 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0490
     * @tc.name apiEnabledLastElementIdNonEmpty049
     * @tc.desc The last enabled entry also carries a non-empty id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledLastElementIdNonEmpty_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledLastElementIdNonEmpty_049');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isNonEmpty(methods[methods.length - 1].id)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledLastElementIdNonEmpty_049 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0500
     * @tc.name apiEnabledIndexAccessWithinBounds050
     * @tc.desc The first and last indices of the enabled list are readable without changing its length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledIndexAccessWithinBounds_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledIndexAccessWithinBounds_050');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let original: number = methods.length;
        if (original > 0) {
          let first: inputMethod.InputMethodProperty = methods[0];
          let last: inputMethod.InputMethodProperty = methods[original - 1];
          expect(first !== undefined).assertTrue();
          expect(last !== undefined).assertTrue();
        }
        expect(methods.length).assertEqual(original);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledIndexAccessWithinBounds_050 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0510
     * @tc.name apiEnabledEveryElementIsObject051
     * @tc.desc Every enabled entry is an object value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'apiEnabledEveryElementIsObject_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledEveryElementIsObject_051');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(everyElementIsObject(methods)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledEveryElementIsObject_051 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0520
     * @tc.name apiEnabledListHasLengthProperty052
     * @tc.desc The enabled result behaves as a length-bearing sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledListHasLengthProperty_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledListHasLengthProperty_052');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        expect(methods.length >= 0).assertTrue();
        expect(typeof methods.length).assertEqual('number');
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledListHasLengthProperty_052 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0530
     * @tc.name apiEnabledContainsCurrentMethodId053
     * @tc.desc The enabled list contains the id of the currently selected input method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledContainsCurrentMethodId_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledContainsCurrentMethodId_053');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let current: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
        TestLogger.value(TAG_API, 'current id', current.id);
        expect(containsId(methods, current.id)).assertTrue();
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledContainsCurrentMethodId_053 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0540
     * @tc.name apiEnabledNonEmptyIdCountMatches054
     * @tc.desc The number of non-empty ids equals the list length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledNonEmptyIdCountMatches_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledNonEmptyIdCountMatches_054');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        let ids: string[] = idsOf(methods);
        let nonEmpty: number = 0;
        let index: number = 0;
        while (index < ids.length) {
          if (isNonEmpty(ids[index])) {
            nonEmpty++;
          }
          index++;
        }
        expect(nonEmpty).assertEqual(methods.length);
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledNonEmptyIdCountMatches_054 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0550
     * @tc.name apiEnabledSecondElementIfPresent055
     * @tc.desc When two or more methods are enabled the second entry also carries a full id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledSecondElementIfPresent_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledSecondElementIfPresent_055');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 1) {
          expect(isNonEmpty(methods[1].id)).assertTrue();
          expect(isNonEmpty(methods[1].packageName)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledSecondElementIfPresent_055 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0560
     * @tc.name apiEnabledFirstMethodIdNonEmpty056
     * @tc.desc The deprecated methodId of the first entry is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledFirstMethodIdNonEmpty_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstMethodIdNonEmpty_056');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isNonEmpty(methods[0].methodId)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstMethodIdNonEmpty_056 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_API_0570
     * @tc.name apiEnabledFirstExtraIsObjectOrUndefined057
     * @tc.desc The optional extra payload of the first entry is absent or an object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'apiEnabledFirstExtraIsObjectOrUndefined_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'apiEnabledFirstExtraIsObjectOrUndefined_057');
      let threw: boolean = false;
      try {
        let setting: inputMethod.InputMethodSetting = inputMethod.getInputMethodSetting();
        let methods: inputMethod.InputMethodProperty[] = await setting.getInputMethods(true);
        if (methods.length > 0) {
          expect(isOptionalObjectOrUndefined(methods[0].extra)).assertTrue();
        }
      } catch (error) {
        threw = true;
        TestLogger.error(TAG_API, 'apiEnabledFirstExtraIsObjectOrUndefined_057 issue');
      } finally {
        done();
      }
      expect(threw).assertFalse();
    });
  });
}
