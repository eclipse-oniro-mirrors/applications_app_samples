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
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { TestLogger } from '../common/TestLogger';
import {
  BUNDLE_NAME, ENTRY_ABILITY, CASE_PREFIX, TAG_UI, CONTAINER_ID, INPUT_TEXT_ID, SELECT_INPUT_ID,
  LAST_INPUT_ID, BTN_ATTACH_ID, BTN_SHOW_ID, BTN_ON_ID, BTN_UPDATE_CURSOR_ID, BTN_CHANGE_SELECTION_ID,
  BTN_UPDATE_ATTRIBUTE_ID, CURSOR_LEFT_ID, CURSOR_TOP_ID, CURSOR_WIDTH_ID, CURSOR_HEIGHT_ID,
  SELECT_START_ID, SELECT_END_ID, INPUT_TYPE_SELECT_ID, ENTER_KEY_SELECT_ID, STRING_DETACH
} from '../common/TestConstant';

/**
 * UI driver helpers used by this interaction suite.
 *
 * All lookups use findComponent() and return null when an id is absent instead
 * of assertComponentExist(), because the latter throws and would turn a layout
 * assertion into a suite-level error. Callers assert the null check themselves.
 */
export class UiDriverKit {
  static async createDriver(): Promise<Driver> {
    let driver: Driver = Driver.create();
    return driver;
  }

  static async startApp(driver: Driver): Promise<void> {
    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    await delegator.executeShellCommand('aa start -b ' + BUNDLE_NAME + ' -a ' + ENTRY_ABILITY);
    await driver.delayMs(1500);
  }

  /**
   * Returns the editor to its unbound state without restarting the application.
   *
   * The test module is packaged in the same bundle as EntryAbility, so an
   * `aa force-stop` would also stop the test runner. Clicking attach while the
   * button reads "detach" runs the component's detach path, which stops the
   * listener, hides the keyboard and restores the three button labels.
   */
  static async resetEditorState(driver: Driver): Promise<void> {
    let attach: Component | null = await driver.findComponent(ON.id('btnAttach'));
    if (attach !== null) {
      let label: string = await attach.getText();
      if (label === STRING_DETACH) {
        await attach.click();
        await driver.delayMs(500);
      }
    }
    await UiDriverKit.ensureAppForeground(driver);
  }

  /** Brings the sample to the foreground again after a back press or a dialog. */
  static async ensureAppForeground(driver: Driver): Promise<void> {
    let container: Component | null = await driver.findComponent(ON.id('customInputText'));
    if (container === null) {
      await UiDriverKit.startApp(driver);
    }
  }

  static async findById(driver: Driver, id: string): Promise<Component | null> {
    let component: Component | null = await driver.findComponent(ON.id(id));
    return component;
  }

  static async clickId(driver: Driver, id: string): Promise<boolean> {
    let component: Component | null = await driver.findComponent(ON.id(id));
    if (component === null) {
      return false;
    }
    await component.click();
    await driver.delayMs(300);
    return true;
  }

  static async textOfId(driver: Driver, id: string): Promise<string> {
    let component: Component | null = await driver.findComponent(ON.id(id));
    if (component === null) {
      return '';
    }
    let text: string = await component.getText();
    return text;
  }

  /** Waits until the id exists, up to attempts * stepMs. */
  static async waitForId(driver: Driver, id: string, attempts: number, stepMs: number): Promise<boolean> {
    let index: number = 0;
    while (index < attempts) {
      let component: Component | null = await driver.findComponent(ON.id(id));
      if (component !== null) {
        return true;
      }
      await driver.delayMs(stepMs);
      index++;
    }
    return false;
  }

  static async pressBack(driver: Driver): Promise<void> {
    await driver.pressBack();
    await driver.delayMs(500);
  }
}

/**
 * Launch and first-screen contract of the CustomInputText sample.
 *
 * The suite only relies on the shell (aa start), on the detach reset and on the ids
 * declared in pages/Index.ets and components/CustomInputText.ets, so it does not
 * need an input method to be installed. Every case re-creates the driver and
 * brings the sample up on its own, which keeps cases independent of the order
 * the runner picks.
 *
 * Failures are reported through check flags: the body never throws before the
 * final assertions, and done() always runs in the finally block, so a missing
 * component appears as a failed assertion instead of a stuck test.
 */

const WAIT_ATTEMPTS: number = 12;
const WAIT_STEP_MS: number = 500;
const SHORT_WAIT_ATTEMPTS: number = 6;
const MISSING_ID: string = 'customInputTextMissingProbe';

const INITIAL_ATTACH_LABEL: string = 'attach';
const INITIAL_SHOW_LABEL: string = 'show';
const INITIAL_ON_LABEL: string = 'on';
const UPDATE_CURSOR_LABEL: string = 'updateCursor';
const UPDATE_ATTRIBUTE_LABEL: string = 'updateAttribute';
const CHANGE_SELECTION_LABEL: string = 'changeSelection';

/** Starts the sample and waits for the custom editor container. */
async function startAndWait(driver: Driver): Promise<boolean> {
  await UiDriverKit.startApp(driver);
  let appeared: boolean = await UiDriverKit.waitForId(driver, CONTAINER_ID, WAIT_ATTEMPTS, WAIT_STEP_MS);
  return appeared;
}

/** Resets the editor binding, starts the sample and waits for the container. */
async function restartAndWait(driver: Driver): Promise<boolean> {
  await UiDriverKit.resetEditorState(driver);
  let appeared: boolean = await startAndWait(driver);
  return appeared;
}

/** Name of the ability currently on top, or the empty string when unavailable. */
async function topAbilityName(): Promise<string> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let name: string = '';
  try {
    let ability: UIAbility = await delegator.getCurrentTopAbility();
    name = ability.context.abilityInfo.name;
  } catch (error) {
    name = '';
  }
  return name;
}

/** Bundle name of the ability currently on top, or the empty string. */
async function topAbilityBundle(): Promise<string> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let bundle: string = '';
  try {
    let ability: UIAbility = await delegator.getCurrentTopAbility();
    bundle = ability.context.abilityInfo.bundleName;
  } catch (error) {
    bundle = '';
  }
  return bundle;
}

/** True when the id can be found on the current screen. */
async function exists(driver: Driver, id: string): Promise<boolean> {
  let component: Component | null = await UiDriverKit.findById(driver, id);
  let found: boolean = component !== null;
  TestLogger.value(TAG_UI, 'exists:' + id, found.toString());
  return found;
}

/** Text of the id, or the empty string when it is absent. */
async function textOf(driver: Driver, id: string): Promise<string> {
  let text: string = await UiDriverKit.textOfId(driver, id);
  TestLogger.infoPair(TAG_UI, 'text:' + id, text);
  return text;
}

export default function abilityLaunchTest(): void {
  describe('CustomInputTextAbilityLaunchTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0010
     * @tc.name launchTopAbilityIsEntryAbility001
     * @tc.desc Launching the sample puts EntryAbility on top
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'launchTopAbilityIsEntryAbility_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'launchTopAbilityIsEntryAbility_001');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let name: string = await topAbilityName();
        TestLogger.value(TAG_UI, 'topAbilityName', name);
        check01 = name === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'launchTopAbilityIsEntryAbility_001 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'launchTopAbilityIsEntryAbility_001');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0020
     * @tc.name launchTopAbilityBundleName002
     * @tc.desc The top ability belongs to the sample bundle com.samples.customtextinput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'launchTopAbilityBundleName_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'launchTopAbilityBundleName_002');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let bundle: string = await topAbilityBundle();
        TestLogger.value(TAG_UI, 'topAbilityBundle', bundle);
        check01 = bundle === BUNDLE_NAME;
      } catch (error) {
        TestLogger.error(TAG_UI, 'launchTopAbilityBundleName_002 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'launchTopAbilityBundleName_002');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0030
     * @tc.name launchContainerVisible003
     * @tc.desc The custom editor container appears after launch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'launchContainerVisible_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'launchContainerVisible_003');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await UiDriverKit.resetEditorState(driver);
        check01 = await startAndWait(driver);
      } catch (error) {
        TestLogger.error(TAG_UI, 'launchContainerVisible_003 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'launchContainerVisible_003');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0040
     * @tc.name topAbilityNameStableAcrossTwoReads004
     * @tc.desc Two consecutive top ability reads report the same EntryAbility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'topAbilityNameStableAcrossTwoReads_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'topAbilityNameStableAcrossTwoReads_004');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let first: string = await topAbilityName();
        let second: string = await topAbilityName();
        TestLogger.infoPair(TAG_UI, 'first', first);
        TestLogger.infoPair(TAG_UI, 'second', second);
        check01 = first === second;
        check02 = first === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'topAbilityNameStableAcrossTwoReads_004 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'topAbilityNameStableAcrossTwoReads_004');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0050
     * @tc.name launchAfterBindingResetRecovers005
     * @tc.desc Resetting the binding and relaunching restores the editor container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'launchAfterBindingResetRecovers_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'launchAfterBindingResetRecovers_005');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.resetEditorState(driver);
        check01 = await startAndWait(driver);
      } catch (error) {
        TestLogger.error(TAG_UI, 'launchAfterBindingResetRecovers_005 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'launchAfterBindingResetRecovers_005');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0060
     * @tc.name btnAttachExists006
     * @tc.desc The attach button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnAttachExists_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnAttachExists_006');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_ATTACH_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnAttachExists_006 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnAttachExists_006');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0070
     * @tc.name btnShowExists007
     * @tc.desc The show button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnShowExists_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnShowExists_007');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_SHOW_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnShowExists_007 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnShowExists_007');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0080
     * @tc.name btnOnExists008
     * @tc.desc The on button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnOnExists_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnOnExists_008');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_ON_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnOnExists_008 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnOnExists_008');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0090
     * @tc.name btnUpdateCursorExists009
     * @tc.desc The update cursor button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnUpdateCursorExists_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnUpdateCursorExists_009');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_UPDATE_CURSOR_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnUpdateCursorExists_009 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnUpdateCursorExists_009');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0100
     * @tc.name btnChangeSelectionExists010
     * @tc.desc The change selection button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnChangeSelectionExists_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnChangeSelectionExists_010');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_CHANGE_SELECTION_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnChangeSelectionExists_010 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnChangeSelectionExists_010');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0110
     * @tc.name btnUpdateAttributeExists011
     * @tc.desc The update attribute button is part of the initial layout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'btnUpdateAttributeExists_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'btnUpdateAttributeExists_011');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, BTN_UPDATE_ATTRIBUTE_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'btnUpdateAttributeExists_011 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'btnUpdateAttributeExists_011');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0120
     * @tc.name cursorLeftInputExists012
     * @tc.desc The left coordinate input of the cursor panel is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorLeftInputExists_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorLeftInputExists_012');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, CURSOR_LEFT_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorLeftInputExists_012 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'cursorLeftInputExists_012');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0130
     * @tc.name cursorTopInputExists013
     * @tc.desc The top coordinate input of the cursor panel is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorTopInputExists_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorTopInputExists_013');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, CURSOR_TOP_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorTopInputExists_013 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'cursorTopInputExists_013');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0140
     * @tc.name cursorWidthInputExists014
     * @tc.desc The width input of the cursor panel is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorWidthInputExists_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorWidthInputExists_014');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, CURSOR_WIDTH_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorWidthInputExists_014 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'cursorWidthInputExists_014');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0150
     * @tc.name cursorHeightInputExists015
     * @tc.desc The height input of the cursor panel is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorHeightInputExists_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorHeightInputExists_015');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, CURSOR_HEIGHT_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorHeightInputExists_015 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'cursorHeightInputExists_015');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0160
     * @tc.name selectStartInputExists016
     * @tc.desc The selection start input is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectStartInputExists_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'selectStartInputExists_016');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, SELECT_START_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'selectStartInputExists_016 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'selectStartInputExists_016');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0170
     * @tc.name selectEndInputExists017
     * @tc.desc The selection end input is present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'selectEndInputExists_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'selectEndInputExists_017');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, SELECT_END_ID);
      } catch (error) {
        TestLogger.error(TAG_UI, 'selectEndInputExists_017 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'selectEndInputExists_017');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0180
     * @tc.name inputTypeSelectExists018
     * @tc.desc The input type dropdown is present and carries a non-empty value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'inputTypeSelectExists_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'inputTypeSelectExists_018');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, INPUT_TYPE_SELECT_ID);
        let value: string = await textOf(driver, INPUT_TYPE_SELECT_ID);
        check02 = value.length > 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'inputTypeSelectExists_018 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'inputTypeSelectExists_018');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0190
     * @tc.name enterKeySelectExists019
     * @tc.desc The enter key dropdown is present and carries a non-empty value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'enterKeySelectExists_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'enterKeySelectExists_019');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await exists(driver, ENTER_KEY_SELECT_ID);
        let value: string = await textOf(driver, ENTER_KEY_SELECT_ID);
        check02 = value.length > 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'enterKeySelectExists_019 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'enterKeySelectExists_019');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0200
     * @tc.name initialAttachLabel020
     * @tc.desc Before any interaction the attach button reads attach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialAttachLabel_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialAttachLabel_020');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_ATTACH_ID);
        check01 = label === INITIAL_ATTACH_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialAttachLabel_020 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialAttachLabel_020');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0210
     * @tc.name initialShowLabel021
     * @tc.desc Before any interaction the show button reads show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialShowLabel_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialShowLabel_021');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_SHOW_ID);
        check01 = label === INITIAL_SHOW_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialShowLabel_021 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialShowLabel_021');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0220
     * @tc.name initialOnLabel022
     * @tc.desc Before any interaction the listener button reads on
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialOnLabel_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialOnLabel_022');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_ON_ID);
        check01 = label === INITIAL_ON_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialOnLabel_022 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialOnLabel_022');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0230
     * @tc.name initialInputTextEmpty023
     * @tc.desc A fresh launch shows an empty composed-text slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialInputTextEmpty_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialInputTextEmpty_023');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let text: string = await textOf(driver, INPUT_TEXT_ID);
        check01 = text.length === 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialInputTextEmpty_023 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialInputTextEmpty_023');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0240
     * @tc.name initialSelectInputEmpty024
     * @tc.desc A fresh launch shows an empty selection slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialSelectInputEmpty_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialSelectInputEmpty_024');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let text: string = await textOf(driver, SELECT_INPUT_ID);
        check01 = text.length === 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialSelectInputEmpty_024 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialSelectInputEmpty_024');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0250
     * @tc.name initialLastInputEmpty025
     * @tc.desc A fresh launch shows an empty trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'initialLastInputEmpty_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialLastInputEmpty_025');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let text: string = await textOf(driver, LAST_INPUT_ID);
        check01 = text.length === 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialLastInputEmpty_025 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'initialLastInputEmpty_025');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0260
     * @tc.name updateCursorLabel026
     * @tc.desc The cursor panel button carries the updateCursor label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'updateCursorLabel_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'updateCursorLabel_026');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_UPDATE_CURSOR_ID);
        check01 = label === UPDATE_CURSOR_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'updateCursorLabel_026 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'updateCursorLabel_026');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0270
     * @tc.name changeSelectionLabel027
     * @tc.desc The selection panel button carries the changeSelection label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'changeSelectionLabel_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'changeSelectionLabel_027');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_CHANGE_SELECTION_ID);
        check01 = label === CHANGE_SELECTION_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'changeSelectionLabel_027 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'changeSelectionLabel_027');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0280
     * @tc.name updateAttributeLabel028
     * @tc.desc The attribute panel button carries the updateAttribute label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'updateAttributeLabel_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'updateAttributeLabel_028');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let label: string = await textOf(driver, BTN_UPDATE_ATTRIBUTE_ID);
        check01 = label === UPDATE_ATTRIBUTE_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'updateAttributeLabel_028 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'updateAttributeLabel_028');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0290
     * @tc.name relaunchKeepsSingleContainer029
     * @tc.desc A second aa start reuses the existing page instead of stacking editors
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'relaunchKeepsSingleContainer_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'relaunchKeepsSingleContainer_029');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.startApp(driver);
        check01 = await exists(driver, CONTAINER_ID);
        let components: Component[] = await driver.findComponents(ON.id(CONTAINER_ID));
        TestLogger.value(TAG_UI, 'containerCount', components.length.toString());
        check02 = components.length === 1;
      } catch (error) {
        TestLogger.error(TAG_UI, 'relaunchKeepsSingleContainer_029 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'relaunchKeepsSingleContainer_029');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0300
     * @tc.name relaunchTopAbilitySame030
     * @tc.desc Starting the sample twice keeps EntryAbility on top
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'relaunchTopAbilitySame_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'relaunchTopAbilitySame_030');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.startApp(driver);
        let name: string = await topAbilityName();
        TestLogger.value(TAG_UI, 'topAbilityName', name);
        check01 = name === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'relaunchTopAbilitySame_030 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'relaunchTopAbilitySame_030');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0310
     * @tc.name bindingResetRestoresAttachLabel031
     * @tc.desc Resetting the binding and relaunching returns the attach label to its initial text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'bindingResetRestoresAttachLabel_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'bindingResetRestoresAttachLabel_031');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        let afterClick: string = await textOf(driver, BTN_ATTACH_ID);
        TestLogger.value(TAG_UI, 'afterClick', afterClick);
        await UiDriverKit.resetEditorState(driver);
        await startAndWait(driver);
        let afterRestart: string = await textOf(driver, BTN_ATTACH_ID);
        check01 = afterRestart === INITIAL_ATTACH_LABEL;
        check02 = afterRestart.length > 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'bindingResetRestoresAttachLabel_031 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'bindingResetRestoresAttachLabel_031');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0320
     * @tc.name startTwiceWithoutStopKeepsContainer032
     * @tc.desc Two starts without an intervening reset still leave the editor reachable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'startTwiceWithoutStopKeepsContainer_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'startTwiceWithoutStopKeepsContainer_032');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.startApp(driver);
        check01 = await UiDriverKit.waitForId(driver, CONTAINER_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
      } catch (error) {
        TestLogger.error(TAG_UI, 'startTwiceWithoutStopKeepsContainer_032 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'startTwiceWithoutStopKeepsContainer_032');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0330
     * @tc.name thirdStartKeepsTopAbility033
     * @tc.desc A third start keeps EntryAbility as the only top ability
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'thirdStartKeepsTopAbility_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'thirdStartKeepsTopAbility_033');
      let check01: boolean = false;
      let check02: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.startApp(driver);
        await UiDriverKit.startApp(driver);
        let name: string = await topAbilityName();
        let bundle: string = await topAbilityBundle();
        check01 = name === ENTRY_ABILITY;
        check02 = bundle === BUNDLE_NAME;
      } catch (error) {
        TestLogger.error(TAG_UI, 'thirdStartKeepsTopAbility_033 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'thirdStartKeepsTopAbility_033');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0340
     * @tc.name pressBackThenStartRecovers034
     * @tc.desc Pressing back and starting again brings the editor back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pressBackThenStartRecovers_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'pressBackThenStartRecovers_034');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.pressBack(driver);
        check01 = await startAndWait(driver);
      } catch (error) {
        TestLogger.error(TAG_UI, 'pressBackThenStartRecovers_034 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'pressBackThenStartRecovers_034');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0350
     * @tc.name pressBackKeepsAbilityName035
     * @tc.desc After a back press and relaunch the top ability is still EntryAbility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pressBackKeepsAbilityName_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'pressBackKeepsAbilityName_035');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await UiDriverKit.pressBack(driver);
        await UiDriverKit.startApp(driver);
        let name: string = await topAbilityName();
        check01 = name === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'pressBackKeepsAbilityName_035 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'pressBackKeepsAbilityName_035');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0360
     * @tc.name startAfterDelayStillEntry036
     * @tc.desc A start issued after an idle delay still lands on EntryAbility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'startAfterDelayStillEntry_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'startAfterDelayStillEntry_036');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        await driver.delayMs(2000);
        await UiDriverKit.startApp(driver);
        let name: string = await topAbilityName();
        check01 = name === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'startAfterDelayStillEntry_036 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'startAfterDelayStillEntry_036');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0370
     * @tc.name topAbilityStableAcrossThreePolls037
     * @tc.desc Three immediate reads of the top ability all report EntryAbility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'topAbilityStableAcrossThreePolls_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'topAbilityStableAcrossThreePolls_037');
      let check01: boolean = false;
      let check02: boolean = false;
      let check03: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let first: string = await topAbilityName();
        let second: string = await topAbilityName();
        let third: string = await topAbilityName();
        check01 = first === ENTRY_ABILITY;
        check02 = second === ENTRY_ABILITY;
        check03 = third === ENTRY_ABILITY;
      } catch (error) {
        TestLogger.error(TAG_UI, 'topAbilityStableAcrossThreePolls_037 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        expect(check03).assertTrue();
        TestLogger.end(TAG_UI, 'topAbilityStableAcrossThreePolls_037');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0380
     * @tc.name containerAppearsWithinSixSeconds038
     * @tc.desc Polling twelve times at 500 ms finds the container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'containerAppearsWithinSixSeconds_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'containerAppearsWithinSixSeconds_038');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await UiDriverKit.resetEditorState(driver);
        await UiDriverKit.startApp(driver);
        check01 = await UiDriverKit.waitForId(driver, CONTAINER_ID, WAIT_ATTEMPTS, WAIT_STEP_MS);
      } catch (error) {
        TestLogger.error(TAG_UI, 'containerAppearsWithinSixSeconds_038 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'containerAppearsWithinSixSeconds_038');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0390
     * @tc.name containerAppearsWithinThreeSeconds039
     * @tc.desc A shorter six-by-500 ms poll still finds the container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'containerAppearsWithinThreeSeconds_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'containerAppearsWithinThreeSeconds_039');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await UiDriverKit.resetEditorState(driver);
        await UiDriverKit.startApp(driver);
        check01 = await UiDriverKit.waitForId(driver, CONTAINER_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
      } catch (error) {
        TestLogger.error(TAG_UI, 'containerAppearsWithinThreeSeconds_039 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'containerAppearsWithinThreeSeconds_039');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0400
     * @tc.name buttonsAppearWithinLimit040
     * @tc.desc The three toggle buttons all appear inside the polling window
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'buttonsAppearWithinLimit_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'buttonsAppearWithinLimit_040');
      let check01: boolean = false;
      let check02: boolean = false;
      let check03: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await UiDriverKit.waitForId(driver, BTN_ATTACH_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
        check02 = await UiDriverKit.waitForId(driver, BTN_SHOW_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
        check03 = await UiDriverKit.waitForId(driver, BTN_ON_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
      } catch (error) {
        TestLogger.error(TAG_UI, 'buttonsAppearWithinLimit_040 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        expect(check03).assertTrue();
        TestLogger.end(TAG_UI, 'buttonsAppearWithinLimit_040');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0410
     * @tc.name cursorInputsAppearWithinLimit041
     * @tc.desc The four cursor coordinate inputs appear inside the polling window
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorInputsAppearWithinLimit_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorInputsAppearWithinLimit_041');
      let check01: boolean = false;
      let check02: boolean = false;
      let check03: boolean = false;
      let check04: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        check01 = await UiDriverKit.waitForId(driver, CURSOR_LEFT_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
        check02 = await UiDriverKit.waitForId(driver, CURSOR_TOP_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
        check03 = await UiDriverKit.waitForId(driver, CURSOR_WIDTH_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
        check04 = await UiDriverKit.waitForId(driver, CURSOR_HEIGHT_ID, SHORT_WAIT_ATTEMPTS, WAIT_STEP_MS);
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorInputsAppearWithinLimit_041 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        expect(check03).assertTrue();
        expect(check04).assertTrue();
        TestLogger.end(TAG_UI, 'cursorInputsAppearWithinLimit_041');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0420
     * @tc.name missingIdLookupReturnsNull042
     * @tc.desc A lookup of an id that does not exist returns null instead of throwing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'missingIdLookupReturnsNull_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'missingIdLookupReturnsNull_042');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let component: Component | null = await UiDriverKit.findById(driver, MISSING_ID);
        TestLogger.value(TAG_UI, 'missingComponentIsNull', (component === null).toString());
        check01 = component === null;
      } catch (error) {
        TestLogger.error(TAG_UI, 'missingIdLookupReturnsNull_042 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'missingIdLookupReturnsNull_042');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0430
     * @tc.name missingIdWaitTimesOut043
     * @tc.desc Waiting on a missing id reports false after the bounded attempts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'missingIdWaitTimesOut_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'missingIdWaitTimesOut_043');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let appeared: boolean = await UiDriverKit.waitForId(driver, MISSING_ID, 2, 100);
        TestLogger.value(TAG_UI, 'missingAppeared', appeared.toString());
        check01 = !appeared;
      } catch (error) {
        TestLogger.error(TAG_UI, 'missingIdWaitTimesOut_043 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'missingIdWaitTimesOut_043');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0440
     * @tc.name missingIdTextIsEmpty044
     * @tc.desc Asking for the text of a missing id yields the empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(CASE_PREFIX + 'missingIdTextIsEmpty_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'missingIdTextIsEmpty_044');
      let check01: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let text: string = await UiDriverKit.textOfId(driver, MISSING_ID);
        check01 = text.length === 0;
      } catch (error) {
        TestLogger.error(TAG_UI, 'missingIdTextIsEmpty_044 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        TestLogger.end(TAG_UI, 'missingIdTextIsEmpty_044');
        done();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAUNCH_0450
     * @tc.name initialLabelsAllPresent045
     * @tc.desc The three toggle labels are all readable and match their initial strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'initialLabelsAllPresent_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'initialLabelsAllPresent_045');
      let check01: boolean = false;
      let check02: boolean = false;
      let check03: boolean = false;
      try {
        let driver: Driver = await UiDriverKit.createDriver();
        await restartAndWait(driver);
        let attach: string = await textOf(driver, BTN_ATTACH_ID);
        let show: string = await textOf(driver, BTN_SHOW_ID);
        let on: string = await textOf(driver, BTN_ON_ID);
        check01 = attach === INITIAL_ATTACH_LABEL;
        check02 = show === INITIAL_SHOW_LABEL;
        check03 = on === INITIAL_ON_LABEL;
      } catch (error) {
        TestLogger.error(TAG_UI, 'initialLabelsAllPresent_045 threw ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        expect(check03).assertTrue();
        TestLogger.end(TAG_UI, 'initialLabelsAllPresent_045');
        done();
      }
    });
  });
}
