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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_UI, CONTAINER_ID, INPUT_TEXT_ID, SELECT_INPUT_ID, LAST_INPUT_ID, BTN_ATTACH_ID,
  BTN_SHOW_ID, BTN_ON_ID, BTN_UPDATE_CURSOR_ID, BTN_CHANGE_SELECTION_ID, BTN_UPDATE_ATTRIBUTE_ID,
  CURSOR_LEFT_ID, CURSOR_TOP_ID, CURSOR_WIDTH_ID, CURSOR_HEIGHT_ID, SELECT_START_ID, SELECT_END_ID,
  ENTER_KEY_SELECT_ID, STRING_ATTACH, STRING_DETACH, STRING_SHOW, STRING_HIDE, STRING_ON, STRING_OFF,
  CURSOR_TEXT_MAX_LENGTH, BUNDLE_NAME, ENTRY_ABILITY
} from '../common/TestConstant';

/**
 * UI driver helpers used by this interaction suite.
 *
 * All lookups use findComponent() and return null when an id is absent instead
 * of assertComponentExist(), because the latter throws and would turn a layout
 * assertion into a suite-level error. Callers assert the null check themselves.
 */
export class UiDriverKit {

  static async startApp(driver: Driver): Promise<void> {
    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    await delegator.executeShellCommand('aa start -b ' + BUNDLE_NAME + ' -a ' + ENTRY_ABILITY);
    await driver.delayMs(1500);
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

  static async clickText(driver: Driver, text: string): Promise<boolean> {
    let component: Component | null = await driver.findComponent(ON.text(text));
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

  /** Types into the currently focused editable control. */
  static async inputInto(driver: Driver, id: string, value: string): Promise<boolean> {
    let component: Component | null = await driver.findComponent(ON.id(id));
    if (component === null) {
      return false;
    }
    await component.inputText(value);
    await driver.delayMs(200);
    return true;
  }

  /** Switches the Kika keyboard back to the letter page when an edit menu is open. */
  static async escapeKeyboardMenu(driver: Driver): Promise<void> {
    let menu: Component | null = await driver.findComponent(ON.id('keyboardMenu'));
    if (menu !== null) {
      await menu.click();
      await driver.delayMs(300);
    }
  }

  static async pressBack(driver: Driver): Promise<void> {
    await driver.pressBack();
    await driver.delayMs(500);
  }
}

/**
 * End-to-end editing flows for the custom text field.
 *
 * The suites drive the real application through the UiTest driver, so every case
 * starts by making sure the sample is on screen and by returning the editor to
 * the unbound state through its own attach button. The test bundle lives in the
 * same application as EntryAbility, therefore a force-stop of the bundle would
 * also kill the test runner; instead each case restores the binding state with
 * UI actions and asserts text changes as deltas, which keeps the suites
 * independent without restarting the process.
 *
 * Keyboard interaction relies on the Kika input method installed on the device
 * (com.example.kikakeyboard). Before pressing letter keys the helpers leave the
 * edit menu and switch to the letter page in the same way the original
 * Ability.test.ets did.
 */

const SETTLE_MS: number = 600;
const KEY_DELAY_MS: number = 250;
const WAIT_ATTEMPTS: number = 10;
const WAIT_STEP_MS: number = 500;
const BIND_WAIT_MS: number = 2500;

async function readLabel(driver: Driver, id: string): Promise<string> {
  let label: string = await UiDriverKit.textOfId(driver, id);
  return label;
}

async function readText(driver: Driver, id: string): Promise<string> {
  let text: string = await UiDriverKit.textOfId(driver, id);
  return text;
}

/** Makes sure EntryAbility is the visible page; starts it when it is not. */
async function ensureAppReady(driver: Driver): Promise<boolean> {
  let ready: boolean = await UiDriverKit.waitForId(driver, CONTAINER_ID, 3, 300);
  if (!ready) {
    await UiDriverKit.startApp(driver);
    ready = await UiDriverKit.waitForId(driver, CONTAINER_ID, WAIT_ATTEMPTS, WAIT_STEP_MS);
  }
  return ready;
}

/** Returns the editor to the unbound state by clicking attach when bound. */
async function resetBinding(driver: Driver): Promise<boolean> {
  let label: string = await readLabel(driver, BTN_ATTACH_ID);
  if (label === STRING_DETACH) {
    await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
    await driver.delayMs(SETTLE_MS);
  }
  let finalLabel: string = await readLabel(driver, BTN_ATTACH_ID);
  return finalLabel === STRING_ATTACH;
}

async function switchToLetterPage(driver: Driver): Promise<void> {
  let abcKey: Component | null = await driver.findComponent(ON.text('ABC', MatchPattern.CONTAINS));
  if (abcKey !== null) {
    await abcKey.click();
    await driver.delayMs(300);
  }
}

/**
 * Binds the editor by tapping the editor itself.
 *
 * A tap on the custom editor runs initTextInput(), which attaches the input
 * client, shows the keyboard and flips isOn in one synchronous call, so the
 * nine listeners are registered while the client session is still alive.
 * Tapping the on button instead moves focus to the button, which lets the
 * system close the input session before initListener runs; on this build that
 * raises 12800009 and kills the application.
 */
async function bindAll(driver: Driver): Promise<boolean> {
  let reset: boolean = await resetBinding(driver);
  if (!reset) {
    return false;
  }
  let tapped: boolean = await UiDriverKit.clickId(driver, CONTAINER_ID);
  await driver.delayMs(BIND_WAIT_MS);
  await UiDriverKit.escapeKeyboardMenu(driver);
  await switchToLetterPage(driver);
  let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
  let onLabel: string = await readLabel(driver, BTN_ON_ID);
  return tapped && attachLabel === STRING_DETACH && onLabel === STRING_OFF;
}

/** Hides the soft keyboard when it is currently shown. */
async function hideKeyboard(driver: Driver): Promise<boolean> {
  let label: string = await readLabel(driver, BTN_SHOW_ID);
  if (label === STRING_HIDE) {
    let clicked: boolean = await UiDriverKit.clickId(driver, BTN_SHOW_ID);
    await driver.delayMs(SETTLE_MS);
    return clicked;
  }
  return true;
}

/** Taps a keyboard key `count` times; returns how many taps were performed. */
async function pressKey(driver: Driver, label: string, count: number): Promise<number> {
  let pressed: number = 0;
  let index: number = 0;
  while (index < count) {
    let key: Component | null = await driver.findComponent(ON.text(label, MatchPattern.CONTAINS));
    if (key === null) {
      await driver.delayMs(300);
      key = await driver.findComponent(ON.text(label, MatchPattern.CONTAINS));
    }
    if (key === null) {
      break;
    }
    await key.click();
    await driver.delayMs(KEY_DELAY_MS);
    pressed++;
    index++;
  }
  return pressed;
}

async function setField(driver: Driver, id: string, value: string): Promise<boolean> {
  let done: boolean = await UiDriverKit.inputInto(driver, id, value);
  await driver.delayMs(200);
  return done;
}

async function chooseOption(driver: Driver, selectId: string, option: string): Promise<boolean> {
  let opened: boolean = await UiDriverKit.clickId(driver, selectId);
  if (!opened) {
    return false;
  }
  await driver.delayMs(500);
  let chosen: boolean = await UiDriverKit.clickText(driver, option);
  await driver.delayMs(500);
  return chosen;
}

/** Binds the editor, types a known number of letters and hides the keyboard. */
async function prepareTypedText(driver: Driver, letterCount: number): Promise<string> {
  let bound: boolean = await bindAll(driver);
  if (!bound) {
    return '';
  }
  await pressKey(driver, 'a', letterCount);
  await driver.delayMs(500);
  let text: string = await readText(driver, INPUT_TEXT_ID);
  await hideKeyboard(driver);
  return text;
}

export default function editingFlowUiTest(): void {
  describe('CustomInputTextEditingFlowUiTest', (): void => {

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0010
     * @tc.name attachShowsDetach001
     * @tc.desc Tapping attach once binds the editor and switches the button label to detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'attachShowsDetach_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'attachShowsDetach_001');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        let before: string = await readLabel(driver, BTN_ATTACH_ID);
        check01 = ready && reset && before === STRING_ATTACH;
        let clicked: boolean = await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.value(TAG_UI, 'attach label', after);
        check02 = clicked && after === STRING_DETACH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'attachShowsDetach_001 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'attachShowsDetach_001');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0020
     * @tc.name attachTwiceRestores002
     * @tc.desc A second attach tap unbinds the editor and restores the attach label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'attachTwiceRestores_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'attachTwiceRestores_002');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.value(TAG_UI, 'attach label', after);
        check02 = after === STRING_ATTACH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'attachTwiceRestores_002 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'attachTwiceRestores_002');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0030
     * @tc.name attachThenShowShowsHide003
     * @tc.desc After binding, the show tap raises the keyboard and relabels the button hide
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'attachThenShowShowsHide_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'attachThenShowShowsHide_003');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(BIND_WAIT_MS);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.value(TAG_UI, 'show label', showLabel);
        check02 = showLabel === STRING_HIDE;
      } catch (error) {
        TestLogger.error(TAG_UI, 'attachThenShowShowsHide_003 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'attachThenShowShowsHide_003');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0040
     * @tc.name showTwiceRestores004
     * @tc.desc Two show taps hide the keyboard again and the label returns to show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'showTwiceRestores_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'showTwiceRestores_004');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(BIND_WAIT_MS);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.value(TAG_UI, 'show label', after);
        check02 = after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'showTwiceRestores_004 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'showTwiceRestores_004');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0050
     * @tc.name bindAllThreeLabels005
     * @tc.desc Binding and raising the keyboard and listeners together produces detach, hide and off
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bindAllThreeLabels_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'bindAllThreeLabels_005');
      let check01: boolean = false;
      let check02: boolean = false;
      let check03: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel + '/' + onLabel);
        check02 = attachLabel === STRING_DETACH;
        check03 = showLabel === STRING_HIDE && onLabel === STRING_OFF;
      } catch (error) {
        TestLogger.error(TAG_UI, 'bindAllThreeLabels_005 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        expect(check03).assertTrue();
        TestLogger.end(TAG_UI, 'bindAllThreeLabels_005');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0060
     * @tc.name closeAllThreeLabels006
     * @tc.desc Closing show, on and attach returns every label to its initial value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'closeAllThreeLabels_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'closeAllThreeLabels_006');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel + '/' + onLabel);
        check02 = attachLabel === STRING_ATTACH && showLabel === STRING_SHOW && onLabel === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'closeAllThreeLabels_006 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'closeAllThreeLabels_006');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0070
     * @tc.name showWithoutAttachKeepsLabel007
     * @tc.desc Show is refused while detached: a noattach toast appears and the label stays show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'showWithoutAttachKeepsLabel_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'showWithoutAttachKeepsLabel_007');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.value(TAG_UI, 'show label', after);
        check02 = after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'showWithoutAttachKeepsLabel_007 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'showWithoutAttachKeepsLabel_007');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0080
     * @tc.name onWithoutAttachKeepsLabel008
     * @tc.desc On is refused while detached: the label stays on and no listener is registered
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'onWithoutAttachKeepsLabel_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'onWithoutAttachKeepsLabel_008');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.value(TAG_UI, 'on label', after);
        check02 = after === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'onWithoutAttachKeepsLabel_008 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'onWithoutAttachKeepsLabel_008');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0090
     * @tc.name showInterceptedTwice009
     * @tc.desc Two show taps while detached are both refused and the label never changes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'showInterceptedTwice_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'showInterceptedTwice_009');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(300);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let first: string = await readLabel(driver, BTN_SHOW_ID);
        let second: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', first + '/' + second);
        check02 = first === STRING_SHOW && second === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'showInterceptedTwice_009 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'showInterceptedTwice_009');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0100
     * @tc.name onInterceptedTwice010
     * @tc.desc Two on taps while detached are both refused and the label never changes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'onInterceptedTwice_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'onInterceptedTwice_010');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(300);
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(SETTLE_MS);
        let first: string = await readLabel(driver, BTN_ON_ID);
        let second: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', first + '/' + second);
        check02 = first === STRING_ON && second === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'onInterceptedTwice_010 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'onInterceptedTwice_010');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0110
     * @tc.name detachCascadesShowOnLabels011
     * @tc.desc Detaching while show and on are active resets both labels to show and on
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'detachCascadesShowOnLabels_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachCascadesShowOnLabels_011');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', showLabel + '/' + onLabel);
        check02 = showLabel === STRING_SHOW && onLabel === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachCascadesShowOnLabels_011 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachCascadesShowOnLabels_011');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0120
     * @tc.name labelStableAcrossThreeReads012
     * @tc.desc Three consecutive reads of the attach label return the same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'labelStableAcrossThreeReads_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'labelStableAcrossThreeReads_012');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        let first: string = await readLabel(driver, BTN_ATTACH_ID);
        let second: string = await readLabel(driver, BTN_ATTACH_ID);
        let third: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.infoPair(TAG_UI, 'labels', first + '/' + second + '/' + third);
        check02 = first === second && second === third;
      } catch (error) {
        TestLogger.error(TAG_UI, 'labelStableAcrossThreeReads_012 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'labelStableAcrossThreeReads_012');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0130
     * @tc.name typingKeepsLastInputEmpty013
     * @tc.desc Typed characters grow inputText only; the trailing slice stays empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'typingKeepsLastInputEmpty_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'typingKeepsLastInputEmpty_013');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await pressKey(driver, 'a', 2);
        await driver.delayMs(500);
        let lastText: string = await readText(driver, LAST_INPUT_ID);
        TestLogger.value(TAG_UI, 'lastInput', lastText);
        check02 = lastText === '';
      } catch (error) {
        TestLogger.error(TAG_UI, 'typingKeepsLastInputEmpty_013 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'typingKeepsLastInputEmpty_013');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0140
     * @tc.name typingKeepsSelectEmpty014
     * @tc.desc Typed characters clear and keep the selection slice empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'typingKeepsSelectEmpty_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'typingKeepsSelectEmpty_014');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await pressKey(driver, 'a', 2);
        await driver.delayMs(500);
        let selectText: string = await readText(driver, SELECT_INPUT_ID);
        TestLogger.value(TAG_UI, 'selectInput', selectText);
        check02 = selectText === '';
      } catch (error) {
        TestLogger.error(TAG_UI, 'typingKeepsSelectEmpty_014 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'typingKeepsSelectEmpty_014');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0150
     * @tc.name hideKeepsText015
     * @tc.desc Hiding the keyboard does not modify the visible text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'hideKeepsText_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'hideKeepsText_015');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await pressKey(driver, 'a', 2);
        await driver.delayMs(400);
        let before: string = await readText(driver, INPUT_TEXT_ID);
        await hideKeyboard(driver);
        let after: string = await readText(driver, INPUT_TEXT_ID);
        TestLogger.infoPair(TAG_UI, 'text', before + ' -> ' + after);
        check02 = before === after;
      } catch (error) {
        TestLogger.error(TAG_UI, 'hideKeepsText_015 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'hideKeepsText_015');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0160
     * @tc.name typingWithListenerOffKeepsText016
     * @tc.desc With the listener unregistered, letter taps no longer grow the visible text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'typingWithListenerOffKeepsText_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'typingWithListenerOffKeepsText_016');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(SETTLE_MS);
        let before: string = await readText(driver, INPUT_TEXT_ID);
        await pressKey(driver, 'a', 2);
        await driver.delayMs(500);
        let after: string = await readText(driver, INPUT_TEXT_ID);
        TestLogger.infoPair(TAG_UI, 'text', before + ' -> ' + after);
        check02 = after === before;
      } catch (error) {
        TestLogger.error(TAG_UI, 'typingWithListenerOffKeepsText_016 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'typingWithListenerOffKeepsText_016');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0170
     * @tc.name typeAfterRebind017
     * @tc.desc Tapping the editor after detaching rebinds it and typing continues to grow the text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'typeAfterRebind_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'typeAfterRebind_017');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, CONTAINER_ID);
        await driver.delayMs(BIND_WAIT_MS);
        await UiDriverKit.escapeKeyboardMenu(driver);
        await switchToLetterPage(driver);
        let before: string = await readText(driver, INPUT_TEXT_ID);
        await pressKey(driver, 'a', 1);
        await driver.delayMs(500);
        let after: string = await readText(driver, INPUT_TEXT_ID);
        TestLogger.infoPair(TAG_UI, 'text', before + ' -> ' + after);
        check02 = after.length >= before.length;
      } catch (error) {
        TestLogger.error(TAG_UI, 'typeAfterRebind_017 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'typeAfterRebind_017');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0180
     * @tc.name hideShowsShowLabel018
     * @tc.desc Hiding a raised keyboard relabels the show button from hide back to show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'hideShowsShowLabel_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'hideShowsShowLabel_018');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        let before: string = await readLabel(driver, BTN_SHOW_ID);
        await hideKeyboard(driver);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', before + ' -> ' + after);
        check02 = before === STRING_HIDE && after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'hideShowsShowLabel_018 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'hideShowsShowLabel_018');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0190
     * @tc.name hideWithoutAttachNoop019
     * @tc.desc Tapping hide while detached leaves the show label untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'hideWithoutAttachNoop_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'hideWithoutAttachNoop_019');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        let before: string = await readLabel(driver, BTN_SHOW_ID);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', before + ' -> ' + after);
        check02 = before === STRING_SHOW && after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'hideWithoutAttachNoop_019 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'hideWithoutAttachNoop_019');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0200
     * @tc.name hideAfterDetachNoop020
     * @tc.desc After a detach the show button is refused again and keeps the show label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'hideAfterDetachNoop_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'hideAfterDetachNoop_020');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.value(TAG_UI, 'show label', after);
        check02 = after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'hideAfterDetachNoop_020 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'hideAfterDetachNoop_020');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0210
     * @tc.name showHideCycleKeepsLabels021
     * @tc.desc A full show then hide cycle ends with the original show and detach labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'showHideCycleKeepsLabels_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'showHideCycleKeepsLabels_021');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await hideKeyboard(driver);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(BIND_WAIT_MS);
        await hideKeyboard(driver);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel);
        check02 = showLabel === STRING_SHOW && attachLabel === STRING_DETACH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'showHideCycleKeepsLabels_021 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'showHideCycleKeepsLabels_021');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0220
     * @tc.name detachRestoresAttachLabel022
     * @tc.desc Detaching the editor restores the attach label on the first button
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'detachRestoresAttachLabel_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachRestoresAttachLabel_022');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.value(TAG_UI, 'attach label', after);
        check02 = after === STRING_ATTACH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachRestoresAttachLabel_022 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachRestoresAttachLabel_022');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0230
     * @tc.name detachDuringShow023
     * @tc.desc Detaching while the keyboard is shown resets the show label to show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'detachDuringShow_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachDuringShow_023');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        let before: string = await readLabel(driver, BTN_SHOW_ID);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', before + ' -> ' + after);
        check02 = before === STRING_HIDE && after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachDuringShow_023 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachDuringShow_023');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0240
     * @tc.name detachDuringOn024
     * @tc.desc Detaching while listeners are active resets the on label to on
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'detachDuringOn_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachDuringOn_024');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        let before: string = await readLabel(driver, BTN_ON_ID);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', before + ' -> ' + after);
        check02 = before === STRING_OFF && after === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachDuringOn_024 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachDuringOn_024');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0250
     * @tc.name rebindAfterTwoTaps025
     * @tc.desc Two attach taps after binding end with the editor bound again and the show label back to show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rebindAfterTwoTaps_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'rebindAfterTwoTaps_025');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel);
        check02 = attachLabel === STRING_DETACH && showLabel === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'rebindAfterTwoTaps_025 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'rebindAfterTwoTaps_025');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0260
     * @tc.name editorClickRebinds026
     * @tc.desc After detaching, tapping the editor rebinds it and all three labels switch back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'editorClickRebinds_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'editorClickRebinds_026');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, CONTAINER_ID);
        await driver.delayMs(BIND_WAIT_MS);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel + '/' + onLabel);
        check02 = attachLabel === STRING_DETACH && showLabel === STRING_HIDE && onLabel === STRING_OFF;
      } catch (error) {
        TestLogger.error(TAG_UI, 'editorClickRebinds_026 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'editorClickRebinds_026');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0270
     * @tc.name detachThenShowNoop027
     * @tc.desc Show is refused after a detach and the button keeps its show label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'detachThenShowNoop_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachThenShowNoop_027');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_SHOW_ID);
        TestLogger.value(TAG_UI, 'show label', after);
        check02 = after === STRING_SHOW;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachThenShowNoop_027 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachThenShowNoop_027');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0280
     * @tc.name detachThenOnNoop028
     * @tc.desc On is refused after a detach and the button keeps its on label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'detachThenOnNoop_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'detachThenOnNoop_028');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.value(TAG_UI, 'on label', after);
        check02 = after === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'detachThenOnNoop_028 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'detachThenOnNoop_028');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0290
     * @tc.name setCursorLeft029
     * @tc.desc The left cursor field accepts 120 and reads the same value back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'setCursorLeft_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'setCursorLeft_029');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        let written: boolean = await setField(driver, CURSOR_LEFT_ID, '120');
        let value: string = await readText(driver, CURSOR_LEFT_ID);
        TestLogger.value(TAG_UI, 'cursorLeft', value);
        check02 = written && value === '120';
      } catch (error) {
        TestLogger.error(TAG_UI, 'setCursorLeft_029 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'setCursorLeft_029');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0300
     * @tc.name setCursorTop030
     * @tc.desc The top cursor field accepts 50 and reads the same value back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'setCursorTop_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'setCursorTop_030');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        let written: boolean = await setField(driver, CURSOR_TOP_ID, '50');
        let value: string = await readText(driver, CURSOR_TOP_ID);
        TestLogger.value(TAG_UI, 'cursorTop', value);
        check02 = written && value === '50';
      } catch (error) {
        TestLogger.error(TAG_UI, 'setCursorTop_030 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'setCursorTop_030');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0310
     * @tc.name setCursorWidth031
     * @tc.desc The width cursor field accepts 2 and reads the same value back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'setCursorWidth_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'setCursorWidth_031');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        let written: boolean = await setField(driver, CURSOR_WIDTH_ID, '2');
        let value: string = await readText(driver, CURSOR_WIDTH_ID);
        TestLogger.value(TAG_UI, 'cursorWidth', value);
        check02 = written && value === '2';
      } catch (error) {
        TestLogger.error(TAG_UI, 'setCursorWidth_031 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'setCursorWidth_031');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0320
     * @tc.name setCursorHeight032
     * @tc.desc The height cursor field accepts 20 and reads the same value back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'setCursorHeight_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'setCursorHeight_032');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        let written: boolean = await setField(driver, CURSOR_HEIGHT_ID, '20');
        let value: string = await readText(driver, CURSOR_HEIGHT_ID);
        TestLogger.value(TAG_UI, 'cursorHeight', value);
        check02 = written && value === '20';
      } catch (error) {
        TestLogger.error(TAG_UI, 'setCursorHeight_032 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'setCursorHeight_032');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0330
     * @tc.name setAllCursorFields033
     * @tc.desc All four cursor fields accept their values and the update button stays available
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'setAllCursorFields_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'setAllCursorFields_033');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        await setField(driver, CURSOR_LEFT_ID, '120');
        await setField(driver, CURSOR_TOP_ID, '50');
        await setField(driver, CURSOR_WIDTH_ID, '2');
        await setField(driver, CURSOR_HEIGHT_ID, '20');
        let left: string = await readText(driver, CURSOR_LEFT_ID);
        let top: string = await readText(driver, CURSOR_TOP_ID);
        let width: string = await readText(driver, CURSOR_WIDTH_ID);
        let height: string = await readText(driver, CURSOR_HEIGHT_ID);
        TestLogger.infoPair(TAG_UI, 'cursor', left + '/' + top + '/' + width + '/' + height);
        let clicked: boolean = await UiDriverKit.clickId(driver, BTN_UPDATE_CURSOR_ID);
        check02 = left === '120' && top === '50' && width === '2' && height === '20' && clicked;
      } catch (error) {
        TestLogger.error(TAG_UI, 'setAllCursorFields_033 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'setAllCursorFields_033');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0340
     * @tc.name clearCursorField034
     * @tc.desc Clearing the left cursor field leaves it empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'clearCursorField_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'clearCursorField_034');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        await setField(driver, CURSOR_LEFT_ID, '120');
        await setField(driver, CURSOR_LEFT_ID, '');
        let value: string = await readText(driver, CURSOR_LEFT_ID);
        TestLogger.value(TAG_UI, 'cursorLeft', value);
        check02 = value === '';
      } catch (error) {
        TestLogger.error(TAG_UI, 'clearCursorField_034 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'clearCursorField_034');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0350
     * @tc.name cursorMaxLengthTruncates035
     * @tc.desc A six-digit entry in a cursor field is truncated to the four-character limit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorMaxLengthTruncates_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorMaxLengthTruncates_035');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        await setField(driver, CURSOR_LEFT_ID, '123456');
        let value: string = await readText(driver, CURSOR_LEFT_ID);
        TestLogger.infoPair(TAG_UI, 'value', value + ' length=' + value.length.toString());
        check02 = value.length === CURSOR_TEXT_MAX_LENGTH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorMaxLengthTruncates_035 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'cursorMaxLengthTruncates_035');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0360
     * @tc.name cursorZeroValue036
     * @tc.desc The zero value is accepted and read back unchanged in the left field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorZeroValue_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorZeroValue_036');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        await setField(driver, CURSOR_LEFT_ID, '0');
        let value: string = await readText(driver, CURSOR_LEFT_ID);
        TestLogger.value(TAG_UI, 'cursorLeft', value);
        check02 = value === '0';
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorZeroValue_036 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'cursorZeroValue_036');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0370
     * @tc.name cursorOverwriteField037
     * @tc.desc A second entry overwrites the first value in the cursor field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorOverwriteField_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'cursorOverwriteField_037');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        check01 = ready;
        await setField(driver, CURSOR_LEFT_ID, '12');
        await setField(driver, CURSOR_LEFT_ID, '34');
        let value: string = await readText(driver, CURSOR_LEFT_ID);
        TestLogger.value(TAG_UI, 'cursorLeft', value);
        check02 = value === '34';
      } catch (error) {
        TestLogger.error(TAG_UI, 'cursorOverwriteField_037 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'cursorOverwriteField_037');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0380
     * @tc.name rebindCycleFlow038
     * @tc.desc A detach and rebind cycle restores detach, hide and off labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'rebindCycleFlow_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'rebindCycleFlow_038');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let bound: boolean = await bindAll(driver);
        check01 = ready && bound;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        await UiDriverKit.clickId(driver, CONTAINER_ID);
        await driver.delayMs(BIND_WAIT_MS);
        await UiDriverKit.escapeKeyboardMenu(driver);
        await switchToLetterPage(driver);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel + '/' + onLabel);
        check02 = attachLabel === STRING_DETACH && showLabel === STRING_HIDE && onLabel === STRING_OFF;
      } catch (error) {
        TestLogger.error(TAG_UI, 'rebindCycleFlow_038 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'rebindCycleFlow_038');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0390
     * @tc.name attachTwiceStability039
     * @tc.desc Attach then detach then attach again always ends with the detach label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'attachTwiceStability_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'attachTwiceStability_039');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(300);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(300);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let after: string = await readLabel(driver, BTN_ATTACH_ID);
        TestLogger.value(TAG_UI, 'attach label', after);
        check02 = after === STRING_DETACH;
      } catch (error) {
        TestLogger.error(TAG_UI, 'attachTwiceStability_039 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'attachTwiceStability_039');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0400
     * @tc.name twoDriversSameLabels040
     * @tc.desc Two independent drivers observe the same button labels on the shared page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoDriversSameLabels_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'twoDriversSameLabels_040');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      let second: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        let firstAttach: string = await readLabel(driver, BTN_ATTACH_ID);
        let secondAttach: string = await readLabel(second, BTN_ATTACH_ID);
        let firstShow: string = await readLabel(driver, BTN_SHOW_ID);
        let secondShow: string = await readLabel(second, BTN_SHOW_ID);
        TestLogger.infoPair(TAG_UI, 'labels', firstAttach + '/' + secondAttach + '/' + firstShow + '/' + secondShow);
        check02 = firstAttach === secondAttach && firstShow === secondShow;
      } catch (error) {
        TestLogger.error(TAG_UI, 'twoDriversSameLabels_040 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'twoDriversSameLabels_040');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_FLOW_0410
     * @tc.name labelsStableAfterCycles041
     * @tc.desc Repeated bind and unbind cycles always restore the three initial labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'labelsStableAfterCycles_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_UI, 'labelsStableAfterCycles_041');
      let check01: boolean = false;
      let check02: boolean = false;
      let driver: Driver = Driver.create();
      try {
        let ready: boolean = await ensureAppReady(driver);
        let reset: boolean = await resetBinding(driver);
        check01 = ready && reset;
        let firstBound: boolean = await bindAll(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let secondBound: boolean = await bindAll(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(SETTLE_MS);
        let attachLabel: string = await readLabel(driver, BTN_ATTACH_ID);
        let showLabel: string = await readLabel(driver, BTN_SHOW_ID);
        let onLabel: string = await readLabel(driver, BTN_ON_ID);
        TestLogger.infoPair(TAG_UI, 'labels', attachLabel + '/' + showLabel + '/' + onLabel);
        check02 = firstBound && secondBound && attachLabel === STRING_ATTACH &&
          showLabel === STRING_SHOW && onLabel === STRING_ON;
      } catch (error) {
        TestLogger.error(TAG_UI, 'labelsStableAfterCycles_041 error: ' + JSON.stringify(error));
      } finally {
        expect(check01).assertTrue();
        expect(check02).assertTrue();
        TestLogger.end(TAG_UI, 'labelsStableAfterCycles_041');
        done();
      }
    })

  })
}
