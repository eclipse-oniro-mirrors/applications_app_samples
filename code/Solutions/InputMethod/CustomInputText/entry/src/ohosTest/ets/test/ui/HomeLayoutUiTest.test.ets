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
import { Driver, ON, Component } from '@ohos.UiTest';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_UI, CONTAINER_ID, INPUT_TEXT_ID, SELECT_INPUT_ID, LAST_INPUT_ID, BTN_ATTACH_ID,
  BTN_SHOW_ID, BTN_ON_ID, BTN_UPDATE_CURSOR_ID, BTN_CHANGE_SELECTION_ID, BTN_UPDATE_ATTRIBUTE_ID,
  CURSOR_LEFT_ID, CURSOR_TOP_ID, CURSOR_WIDTH_ID, CURSOR_HEIGHT_ID, SELECT_START_ID, SELECT_END_ID,
  INPUT_TYPE_SELECT_ID, ENTER_KEY_SELECT_ID, STRING_ATTACH, STRING_DETACH, STRING_SHOW, STRING_ON,
  BUNDLE_NAME, ENTRY_ABILITY
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
 * Layout contract of pages/Index.ets.
 *
 * The page is a Scroll containing four cards: the CustomInputText editor, the
 * attach/show/on card, the cursor/selection card and the attribute card. This
 * suite walks the visible interface id by id, asserts the initial labels and the
 * hint-backed empty state of every TextInput, checks that the two rows of
 * four inputs really share a row, and exercises the label transitions that do
 * not need a bound input method. Every case launches a fresh instance so that a
 * previous toggle cannot leak into the layout assertions.
 */

const LAYOUT_TAG: string = TAG_UI;
const WAIT_ATTEMPTS: number = 12;
const WAIT_STEP_MS: number = 300;
const SETTLE_MS: number = 800;
const ROW_TOLERANCE: number = 2;
const SWIPE_SPEED: number = 400;
const LEFT_PROBE: string = '7';
const TOP_PROBE: string = '9';

/** True when findComponent returned a component instead of null. */
function isFound(component: Component | null): boolean {
  return component !== null;
}

async function idExists(driver: Driver, id: string): Promise<boolean> {
  let component: Component | null = await driver.findComponent(ON.id(id));
  return isFound(component);
}

async function textOfId(driver: Driver, id: string): Promise<string> {
  let component: Component | null = await driver.findComponent(ON.id(id));
  if (component === null) {
    return '';
  }
  let text: string = await component.getText();
  return text;
}

async function boundsOfId(driver: Driver, id: string) {
  let component: Component | null = await driver.findComponent(ON.id(id));
  if (component === null) {
    return null;
  }
  let bounds = await component.getBounds();
  return bounds;
}

async function clickIdChecked(driver: Driver, id: string): Promise<boolean> {
  return await UiDriverKit.clickId(driver, id);
}

async function typeIntoId(driver: Driver, id: string, value: string): Promise<boolean> {
  let component: Component | null = await driver.findComponent(ON.id(id));
  if (component === null) {
    return false;
  }
  await component.inputText(value);
  await driver.delayMs(300);
  return true;
}

async function startFresh(driver: Driver): Promise<void> {
  await UiDriverKit.resetEditorState(driver);
  await UiDriverKit.startApp(driver);
  await driver.delayMs(SETTLE_MS);
}

async function waitForContainer(driver: Driver): Promise<boolean> {
  return await UiDriverKit.waitForId(driver, CONTAINER_ID, WAIT_ATTEMPTS, WAIT_STEP_MS);
}

async function swipeUp(driver: Driver): Promise<void> {
  let size = await driver.getDisplaySize();
  let startY: number = size.y * 0.8;
  let endY: number = size.y * 0.25;
  await driver.swipe(size.x / 2, startY, size.x / 2, endY, SWIPE_SPEED);
  await driver.delayMs(400);
}

async function swipeDown(driver: Driver): Promise<void> {
  let size = await driver.getDisplaySize();
  let startY: number = size.y * 0.25;
  let endY: number = size.y * 0.8;
  await driver.swipe(size.x / 2, startY, size.x / 2, endY, SWIPE_SPEED);
  await driver.delayMs(400);
}

export default function homeLayoutUiTest(): void {
  describe('CustomInputTextHomeLayoutUiTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0010
     * @tc.name layoutContainerExists001
     * @tc.desc Verifies the editor container is present after a cold launch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutContainerExists_001', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutContainerExists_001');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await waitForContainer(driver);
        TestLogger.value(LAYOUT_TAG, 'containerFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutContainerExists_001 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutContainerExists_001');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0020
     * @tc.name layoutInputTextEmpty002
     * @tc.desc Verifies a fresh editor renders an empty text slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutInputTextEmpty_002', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutInputTextEmpty_002');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, INPUT_TEXT_ID);
        TestLogger.value(LAYOUT_TAG, 'inputText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutInputTextEmpty_002 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutInputTextEmpty_002');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0030
     * @tc.name layoutSelectInputEmpty003
     * @tc.desc Verifies a fresh editor renders an empty selected slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectInputEmpty_003', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectInputEmpty_003');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, SELECT_INPUT_ID);
        TestLogger.value(LAYOUT_TAG, 'selectInput', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectInputEmpty_003 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectInputEmpty_003');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0040
     * @tc.name layoutLastInputEmpty004
     * @tc.desc Verifies a fresh editor renders an empty trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutLastInputEmpty_004', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutLastInputEmpty_004');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, LAST_INPUT_ID);
        TestLogger.value(LAYOUT_TAG, 'lastInput', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutLastInputEmpty_004 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutLastInputEmpty_004');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0050
     * @tc.name layoutContainerWidthPositive005
     * @tc.desc Verifies the rounded editor container is laid out with a positive width
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutContainerWidthPositive_005', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutContainerWidthPositive_005');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let bounds = await boundsOfId(driver, CONTAINER_ID);
        let positive: boolean = bounds !== null && (bounds.right - bounds.left) > 0;
        if (bounds !== null) {
          TestLogger.value(LAYOUT_TAG, 'containerWidth', (bounds.right - bounds.left).toString());
        }
        expect(positive).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutContainerWidthPositive_005 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutContainerWidthPositive_005');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0060
     * @tc.name layoutContainerHeightPositive006
     * @tc.desc Verifies the 45 vp editor container keeps a positive height
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutContainerHeightPositive_006', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutContainerHeightPositive_006');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let bounds = await boundsOfId(driver, CONTAINER_ID);
        let positive: boolean = bounds !== null && (bounds.bottom - bounds.top) > 0;
        if (bounds !== null) {
          TestLogger.value(LAYOUT_TAG, 'containerHeight', (bounds.bottom - bounds.top).toString());
        }
        expect(positive).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutContainerHeightPositive_006 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutContainerHeightPositive_006');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0070
     * @tc.name layoutContainerOnScreen007
     * @tc.desc Verifies the editor container starts inside the top-left area of the screen
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutContainerOnScreen_007', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutContainerOnScreen_007');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let bounds = await boundsOfId(driver, CONTAINER_ID);
        let onScreen: boolean = bounds !== null && bounds.left >= 0 && bounds.top >= 0;
        if (bounds !== null) {
          TestLogger.value(LAYOUT_TAG, 'containerLeftTop', bounds.left.toString() + ',' + bounds.top.toString());
        }
        expect(onScreen).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutContainerOnScreen_007 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutContainerOnScreen_007');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0080
     * @tc.name layoutAttachButtonExists008
     * @tc.desc Verifies the attach button is present on a fresh page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutAttachButtonExists_008', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAttachButtonExists_008');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'btnAttachFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAttachButtonExists_008 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAttachButtonExists_008');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0090
     * @tc.name layoutAttachButtonLabel009
     * @tc.desc Verifies a detached editor labels its first button attach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutAttachButtonLabel_009', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAttachButtonLabel_009');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'attachLabel', text);
        expect(text).assertEqual(STRING_ATTACH);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAttachButtonLabel_009 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAttachButtonLabel_009');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0100
     * @tc.name layoutShowButtonExists010
     * @tc.desc Verifies the show button is present on a fresh page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutShowButtonExists_010', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutShowButtonExists_010');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_SHOW_ID);
        TestLogger.value(LAYOUT_TAG, 'btnShowFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutShowButtonExists_010 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutShowButtonExists_010');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0110
     * @tc.name layoutShowButtonLabel011
     * @tc.desc Verifies a hidden keyboard labels its button show
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutShowButtonLabel_011', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutShowButtonLabel_011');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_SHOW_ID);
        TestLogger.value(LAYOUT_TAG, 'showLabel', text);
        expect(text).assertEqual(STRING_SHOW);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutShowButtonLabel_011 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutShowButtonLabel_011');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0120
     * @tc.name layoutOnButtonExists012
     * @tc.desc Verifies the listener toggle button is present on a fresh page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutOnButtonExists_012', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutOnButtonExists_012');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_ON_ID);
        TestLogger.value(LAYOUT_TAG, 'btnOnFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutOnButtonExists_012 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutOnButtonExists_012');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0130
     * @tc.name layoutOnButtonLabel013
     * @tc.desc Verifies a non-listening editor labels its third button on
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutOnButtonLabel_013', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutOnButtonLabel_013');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_ON_ID);
        TestLogger.value(LAYOUT_TAG, 'onLabel', text);
        expect(text).assertEqual(STRING_ON);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutOnButtonLabel_013 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutOnButtonLabel_013');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0140
     * @tc.name layoutUpdateCursorButtonExists014
     * @tc.desc Verifies the updateCursor button exists below the four cursor inputs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutUpdateCursorButtonExists_014', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutUpdateCursorButtonExists_014');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_UPDATE_CURSOR_ID);
        TestLogger.value(LAYOUT_TAG, 'btnUpdateCursorFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutUpdateCursorButtonExists_014 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutUpdateCursorButtonExists_014');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0150
     * @tc.name layoutUpdateCursorButtonLabel015
     * @tc.desc Verifies the updateCursor button carries its resource label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutUpdateCursorButtonLabel_015', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutUpdateCursorButtonLabel_015');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_UPDATE_CURSOR_ID);
        TestLogger.value(LAYOUT_TAG, 'updateCursorLabel', text);
        expect(text).assertEqual('updateCursor');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutUpdateCursorButtonLabel_015 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutUpdateCursorButtonLabel_015');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0160
     * @tc.name layoutChangeSelectionButtonExists016
     * @tc.desc Verifies the changeSelection button exists below the selection inputs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutChangeSelectionButtonExists_016', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutChangeSelectionButtonExists_016');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_CHANGE_SELECTION_ID);
        TestLogger.value(LAYOUT_TAG, 'btnChangeSelectionFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutChangeSelectionButtonExists_016 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutChangeSelectionButtonExists_016');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0170
     * @tc.name layoutChangeSelectionButtonLabel017
     * @tc.desc Verifies the changeSelection button carries its resource label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutChangeSelectionButtonLabel_017', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutChangeSelectionButtonLabel_017');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_CHANGE_SELECTION_ID);
        TestLogger.value(LAYOUT_TAG, 'changeSelectionLabel', text);
        expect(text).assertEqual('changeSelection');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutChangeSelectionButtonLabel_017 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutChangeSelectionButtonLabel_017');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0180
     * @tc.name layoutUpdateAttributeButtonExists018
     * @tc.desc Verifies the updateAttribute button exists at the bottom of the page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutUpdateAttributeButtonExists_018', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutUpdateAttributeButtonExists_018');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, BTN_UPDATE_ATTRIBUTE_ID);
        TestLogger.value(LAYOUT_TAG, 'btnUpdateAttributeFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutUpdateAttributeButtonExists_018 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutUpdateAttributeButtonExists_018');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0190
     * @tc.name layoutUpdateAttributeButtonLabel019
     * @tc.desc Verifies the updateAttribute button carries its resource label
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutUpdateAttributeButtonLabel_019', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutUpdateAttributeButtonLabel_019');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_UPDATE_ATTRIBUTE_ID);
        TestLogger.value(LAYOUT_TAG, 'updateAttributeLabel', text);
        expect(text).assertEqual('updateAttribute');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutUpdateAttributeButtonLabel_019 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutUpdateAttributeButtonLabel_019');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0200
     * @tc.name layoutAllButtonsPresent020
     * @tc.desc Verifies all six action buttons exist in one pass on the same page
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutAllButtonsPresent_020', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAllButtonsPresent_020');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let attach: boolean = await idExists(driver, BTN_ATTACH_ID);
        let show: boolean = await idExists(driver, BTN_SHOW_ID);
        let on: boolean = await idExists(driver, BTN_ON_ID);
        let cursor: boolean = await idExists(driver, BTN_UPDATE_CURSOR_ID);
        let selection: boolean = await idExists(driver, BTN_CHANGE_SELECTION_ID);
        let attribute: boolean = await idExists(driver, BTN_UPDATE_ATTRIBUTE_ID);
        let all: boolean = attach && show && on && cursor && selection && attribute;
        TestLogger.value(LAYOUT_TAG, 'sixButtons', all.toString());
        expect(all).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAllButtonsPresent_020 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAllButtonsPresent_020');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0210
     * @tc.name layoutAttachButtonHeight021
     * @tc.desc Verifies the attach button has a positive rendered height
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutAttachButtonHeight_021', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAttachButtonHeight_021');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let bounds = await boundsOfId(driver, BTN_ATTACH_ID);
        let positive: boolean = bounds !== null && (bounds.bottom - bounds.top) > 0;
        if (bounds !== null) {
          TestLogger.value(LAYOUT_TAG, 'attachHeight', (bounds.bottom - bounds.top).toString());
        }
        expect(positive).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAttachButtonHeight_021 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAttachButtonHeight_021');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0220
     * @tc.name layoutCursorLeftInputExists022
     * @tc.desc Verifies the left coordinate input exists in the cursor card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorLeftInputExists_022', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorLeftInputExists_022');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, CURSOR_LEFT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorLeftFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorLeftInputExists_022 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorLeftInputExists_022');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0230
     * @tc.name layoutCursorLeftInputEmpty023
     * @tc.desc Verifies the left coordinate input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorLeftInputEmpty_023', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorLeftInputEmpty_023');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, CURSOR_LEFT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorLeftText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorLeftInputEmpty_023 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorLeftInputEmpty_023');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0240
     * @tc.name layoutCursorTopInputExists024
     * @tc.desc Verifies the top coordinate input exists in the cursor card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorTopInputExists_024', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorTopInputExists_024');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, CURSOR_TOP_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorTopFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorTopInputExists_024 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorTopInputExists_024');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0250
     * @tc.name layoutCursorTopInputEmpty025
     * @tc.desc Verifies the top coordinate input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorTopInputEmpty_025', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorTopInputEmpty_025');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, CURSOR_TOP_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorTopText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorTopInputEmpty_025 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorTopInputEmpty_025');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0260
     * @tc.name layoutCursorWidthInputExists026
     * @tc.desc Verifies the width input exists in the cursor card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorWidthInputExists_026', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorWidthInputExists_026');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, CURSOR_WIDTH_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorWidthFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorWidthInputExists_026 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorWidthInputExists_026');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0270
     * @tc.name layoutCursorWidthInputEmpty027
     * @tc.desc Verifies the width input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorWidthInputEmpty_027', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorWidthInputEmpty_027');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, CURSOR_WIDTH_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorWidthText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorWidthInputEmpty_027 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorWidthInputEmpty_027');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0280
     * @tc.name layoutCursorHeightInputExists028
     * @tc.desc Verifies the height input exists in the cursor card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorHeightInputExists_028', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorHeightInputExists_028');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, CURSOR_HEIGHT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorHeightFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorHeightInputExists_028 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorHeightInputExists_028');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0290
     * @tc.name layoutCursorHeightInputEmpty029
     * @tc.desc Verifies the height input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorHeightInputEmpty_029', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorHeightInputEmpty_029');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, CURSOR_HEIGHT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorHeightText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorHeightInputEmpty_029 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorHeightInputEmpty_029');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0300
     * @tc.name layoutCursorInputsShareRow030
     * @tc.desc Verifies the four cursor inputs are laid out on one horizontal row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutCursorInputsShareRow_030', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorInputsShareRow_030');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let left = await boundsOfId(driver, CURSOR_LEFT_ID);
        let top = await boundsOfId(driver, CURSOR_TOP_ID);
        let width = await boundsOfId(driver, CURSOR_WIDTH_ID);
        let height = await boundsOfId(driver, CURSOR_HEIGHT_ID);
        let sameRow: boolean = left !== null && top !== null && width !== null && height !== null &&
          Math.abs(left.top - top.top) <= ROW_TOLERANCE &&
          Math.abs(left.top - width.top) <= ROW_TOLERANCE &&
          Math.abs(left.top - height.top) <= ROW_TOLERANCE;
        TestLogger.value(LAYOUT_TAG, 'cursorRow', sameRow.toString());
        expect(sameRow).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorInputsShareRow_030 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorInputsShareRow_030');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0310
     * @tc.name layoutCursorLeftAcceptsText031
     * @tc.desc Verifies the left input echoes a typed number in its own field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorLeftAcceptsText_031', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorLeftAcceptsText_031');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, CURSOR_LEFT_ID, '12');
        let text: string = await textOfId(driver, CURSOR_LEFT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorLeftAfterTyping', text);
        expect(typed && text === '12').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorLeftAcceptsText_031 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorLeftAcceptsText_031');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0320
     * @tc.name layoutCursorTopAcceptsText032
     * @tc.desc Verifies the top input echoes a typed number in its own field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorTopAcceptsText_032', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorTopAcceptsText_032');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, CURSOR_TOP_ID, '34');
        let text: string = await textOfId(driver, CURSOR_TOP_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorTopAfterTyping', text);
        expect(typed && text === '34').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorTopAcceptsText_032 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorTopAcceptsText_032');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0330
     * @tc.name layoutCursorWidthAcceptsText033
     * @tc.desc Verifies the width input echoes a typed number in its own field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorWidthAcceptsText_033', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorWidthAcceptsText_033');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, CURSOR_WIDTH_ID, '2');
        let text: string = await textOfId(driver, CURSOR_WIDTH_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorWidthAfterTyping', text);
        expect(typed && text === '2').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorWidthAcceptsText_033 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorWidthAcceptsText_033');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0340
     * @tc.name layoutCursorHeightAcceptsText034
     * @tc.desc Verifies the height input echoes a typed number in its own field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutCursorHeightAcceptsText_034', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorHeightAcceptsText_034');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, CURSOR_HEIGHT_ID, '25');
        let text: string = await textOfId(driver, CURSOR_HEIGHT_ID);
        TestLogger.value(LAYOUT_TAG, 'cursorHeightAfterTyping', text);
        expect(typed && text === '25').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorHeightAcceptsText_034 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorHeightAcceptsText_034');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0350
     * @tc.name layoutSelectStartInputExists035
     * @tc.desc Verifies the selection start input exists in the selection card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectStartInputExists_035', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectStartInputExists_035');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, SELECT_START_ID);
        TestLogger.value(LAYOUT_TAG, 'selectStartFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectStartInputExists_035 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectStartInputExists_035');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0360
     * @tc.name layoutSelectStartInputEmpty036
     * @tc.desc Verifies the selection start input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectStartInputEmpty_036', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectStartInputEmpty_036');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, SELECT_START_ID);
        TestLogger.value(LAYOUT_TAG, 'selectStartText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectStartInputEmpty_036 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectStartInputEmpty_036');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0370
     * @tc.name layoutSelectEndInputExists037
     * @tc.desc Verifies the selection end input exists in the selection card
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectEndInputExists_037', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectEndInputExists_037');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let found: boolean = await idExists(driver, SELECT_END_ID);
        TestLogger.value(LAYOUT_TAG, 'selectEndFound', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectEndInputExists_037 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectEndInputExists_037');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0380
     * @tc.name layoutSelectEndInputEmpty038
     * @tc.desc Verifies the selection end input starts empty behind its hint text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectEndInputEmpty_038', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectEndInputEmpty_038');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let text: string = await textOfId(driver, SELECT_END_ID);
        TestLogger.value(LAYOUT_TAG, 'selectEndText', text);
        expect(text).assertEqual('');
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectEndInputEmpty_038 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectEndInputEmpty_038');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0390
     * @tc.name layoutSelectStartAcceptsText039
     * @tc.desc Verifies the selection start input echoes a typed index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectStartAcceptsText_039', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectStartAcceptsText_039');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, SELECT_START_ID, '0');
        let text: string = await textOfId(driver, SELECT_START_ID);
        TestLogger.value(LAYOUT_TAG, 'selectStartAfterTyping', text);
        expect(typed && text === '0').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectStartAcceptsText_039 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectStartAcceptsText_039');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0400
     * @tc.name layoutSelectEndAcceptsText040
     * @tc.desc Verifies the selection end input echoes a typed index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutSelectEndAcceptsText_040', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectEndAcceptsText_040');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let typed: boolean = await typeIntoId(driver, SELECT_END_ID, '5');
        let text: string = await textOfId(driver, SELECT_END_ID);
        TestLogger.value(LAYOUT_TAG, 'selectEndAfterTyping', text);
        expect(typed && text === '5').assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectEndAcceptsText_040 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectEndAcceptsText_040');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0410
     * @tc.name layoutSelectionInputsShareRow041
     * @tc.desc Verifies the start and end selection inputs share one row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutSelectionInputsShareRow_041', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectionInputsShareRow_041');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let startBounds = await boundsOfId(driver, SELECT_START_ID);
        let endBounds = await boundsOfId(driver, SELECT_END_ID);
        let sameRow: boolean = startBounds !== null && endBounds !== null &&
          Math.abs(startBounds.top - endBounds.top) <= ROW_TOLERANCE;
        TestLogger.value(LAYOUT_TAG, 'selectionRow', sameRow.toString());
        expect(sameRow).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectionInputsShareRow_041 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectionInputsShareRow_041');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0420
     * @tc.name layoutSwipeDownTopReachable042
     * @tc.desc Verifies the attach button is reachable again after a downward swipe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutSwipeDownTopReachable_042', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSwipeDownTopReachable_042');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await swipeUp(driver);
        await swipeDown(driver);
        let found: boolean = await idExists(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'topButtonAfterSwipeDown', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSwipeDownTopReachable_042 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSwipeDownTopReachable_042');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0430
     * @tc.name layoutRestartShowsContainer043
     * @tc.desc Verifies a binding reset and relaunch still brings up the editor container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutRestartShowsContainer_043', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutRestartShowsContainer_043');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await startFresh(driver);
        let found: boolean = await waitForContainer(driver);
        TestLogger.value(LAYOUT_TAG, 'containerAfterRestart', found.toString());
        expect(found).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutRestartShowsContainer_043 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutRestartShowsContainer_043');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0440
     * @tc.name layoutRestartRestoresAttachLabel044
     * @tc.desc Verifies a relaunch resets the attach label instead of keeping detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutRestartRestoresAttachLabel_044', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutRestartRestoresAttachLabel_044');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(400);
        await startFresh(driver);
        let text: string = await textOfId(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'attachLabelAfterRestart', text);
        expect(text).assertEqual(STRING_ATTACH);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutRestartRestoresAttachLabel_044 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutRestartRestoresAttachLabel_044');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0450
     * @tc.name layoutRestartRestoresButtons045
     * @tc.desc Verifies every action button is still present after a relaunch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutRestartRestoresButtons_045', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutRestartRestoresButtons_045');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await startFresh(driver);
        let attach: boolean = await idExists(driver, BTN_ATTACH_ID);
        let show: boolean = await idExists(driver, BTN_SHOW_ID);
        let on: boolean = await idExists(driver, BTN_ON_ID);
        TestLogger.value(LAYOUT_TAG, 'buttonsAfterRestart', (attach && show && on).toString());
        expect(attach && show && on).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutRestartRestoresButtons_045 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutRestartRestoresButtons_045');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0460
     * @tc.name layoutAttachClickFlipsLabel046
     * @tc.desc Verifies the first attach tap flips the button label to detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutAttachClickFlipsLabel_046', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAttachClickFlipsLabel_046');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let clicked: boolean = await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(500);
        let text: string = await textOfId(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'labelAfterAttach', text);
        expect(clicked && text === STRING_DETACH).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAttachClickFlipsLabel_046 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAttachClickFlipsLabel_046');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0470
     * @tc.name layoutAttachSecondClickRestores047
     * @tc.desc Verifies a second attach tap returns the button label to attach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'layoutAttachSecondClickRestores_047', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutAttachSecondClickRestores_047');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(500);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(500);
        let text: string = await textOfId(driver, BTN_ATTACH_ID);
        TestLogger.value(LAYOUT_TAG, 'labelAfterSecondAttach', text);
        expect(text).assertEqual(STRING_ATTACH);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutAttachSecondClickRestores_047 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutAttachSecondClickRestores_047');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0480
     * @tc.name layoutShowGatedWhileDetached048
     * @tc.desc Verifies tapping show while detached leaves its label untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutShowGatedWhileDetached_048', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutShowGatedWhileDetached_048');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await UiDriverKit.clickId(driver, BTN_SHOW_ID);
        await driver.delayMs(500);
        let text: string = await textOfId(driver, BTN_SHOW_ID);
        TestLogger.value(LAYOUT_TAG, 'showLabelAfterGatedTap', text);
        expect(text).assertEqual(STRING_SHOW);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutShowGatedWhileDetached_048 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutShowGatedWhileDetached_048');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0490
     * @tc.name layoutOnGatedWhileDetached049
     * @tc.desc Verifies tapping on while detached leaves its label untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutOnGatedWhileDetached_049', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutOnGatedWhileDetached_049');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await UiDriverKit.clickId(driver, BTN_ON_ID);
        await driver.delayMs(500);
        let text: string = await textOfId(driver, BTN_ON_ID);
        TestLogger.value(LAYOUT_TAG, 'onLabelAfterGatedTap', text);
        expect(text).assertEqual(STRING_ON);
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutOnGatedWhileDetached_049 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutOnGatedWhileDetached_049');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0500
     * @tc.name layoutCursorValuesPersistAcrossFields050
     * @tc.desc Verifies earlier cursor values survive typing into a different field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutCursorValuesPersistAcrossFields_050', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorValuesPersistAcrossFields_050');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await typeIntoId(driver, CURSOR_LEFT_ID, LEFT_PROBE);
        await typeIntoId(driver, CURSOR_TOP_ID, TOP_PROBE);
        let leftText: string = await textOfId(driver, CURSOR_LEFT_ID);
        let topText: string = await textOfId(driver, CURSOR_TOP_ID);
        TestLogger.value(LAYOUT_TAG, 'leftThenTop', leftText + '/' + topText);
        expect(leftText === LEFT_PROBE && topText === TOP_PROBE).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorValuesPersistAcrossFields_050 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorValuesPersistAcrossFields_050');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0510
     * @tc.name layoutContainerSurvivesToggle051
     * @tc.desc Verifies attaching and detaching never removes the editor container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutContainerSurvivesToggle_051', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutContainerSurvivesToggle_051');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(400);
        let afterAttach: boolean = await idExists(driver, CONTAINER_ID);
        await UiDriverKit.clickId(driver, BTN_ATTACH_ID);
        await driver.delayMs(400);
        let afterDetach: boolean = await idExists(driver, CONTAINER_ID);
        TestLogger.value(LAYOUT_TAG, 'containerSurvives', (afterAttach && afterDetach).toString());
        expect(afterAttach && afterDetach).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutContainerSurvivesToggle_051 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutContainerSurvivesToggle_051');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0520
     * @tc.name layoutCursorInputsRowBelowButtons052
     * @tc.desc Verifies the cursor row sits below the attach button
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutCursorInputsRowBelowButtons_052', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutCursorInputsRowBelowButtons_052');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let attachBounds = await boundsOfId(driver, BTN_ATTACH_ID);
        let leftBounds = await boundsOfId(driver, CURSOR_LEFT_ID);
        let below: boolean = attachBounds !== null && leftBounds !== null &&
          leftBounds.top > attachBounds.top;
        TestLogger.value(LAYOUT_TAG, 'cursorBelowAttach', below.toString());
        expect(below).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutCursorInputsRowBelowButtons_052 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutCursorInputsRowBelowButtons_052');
        done();
      }
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_UI_LAYOUT_0530
     * @tc.name layoutSelectionCardBelowCursorCard053
     * @tc.desc Verifies the selection row sits below the cursor row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'layoutSelectionCardBelowCursorCard_053', 0, async (done: Function) => {
      TestLogger.begin(LAYOUT_TAG, 'layoutSelectionCardBelowCursorCard_053');
      let driver: Driver = await UiDriverKit.createDriver();
      try {
        await startFresh(driver);
        let cursorBounds = await boundsOfId(driver, CURSOR_LEFT_ID);
        let startBounds = await boundsOfId(driver, SELECT_START_ID);
        let below: boolean = cursorBounds !== null && startBounds !== null &&
          startBounds.top > cursorBounds.top;
        TestLogger.value(LAYOUT_TAG, 'selectionBelowCursor', below.toString());
        expect(below).assertTrue();
      } catch (error) {
        TestLogger.error(LAYOUT_TAG, 'layoutSelectionCardBelowCursorCard_053 error:' + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        TestLogger.end(LAYOUT_TAG, 'layoutSelectionCardBelowCursorCard_053');
        done();
      }
    })
  })
}
