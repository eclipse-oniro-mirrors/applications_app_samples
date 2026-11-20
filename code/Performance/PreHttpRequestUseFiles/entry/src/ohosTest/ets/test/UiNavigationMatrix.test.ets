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
import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import { launchHome, stopHome, PAGE_TITLE, NAV_NAME } from './shared/Probe';
import { logCase } from './shared/TestLog';

const BUTTON_TEXT: string = 'push Path to pageOne';
const DRIVER_WAIT_MS: number = 6000;

let uiDriver: Driver | undefined = undefined;

function driver(): Driver {
  const cached: Driver | undefined = uiDriver;
  if (cached === undefined) {
    throw new Error('UI driver is not initialized');
  }
  return cached;
}

export default function uiNavigationMatrixTest() {
  describe('UiNavigationMatrix', () => {
    beforeAll(async () => {
      await launchHome();
      const created: Driver = Driver.create();
      uiDriver = created;
      await created.delayMs(300);
    });

    afterAll(async () => {
      uiDriver = undefined;
      await stopHome();
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0001
     * @tc.name      testUiNavigation0001
     * @tc.desc      Button label is visible on the parent page
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUiNavigation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(150);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(150);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0001', `delay=150`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0002
     * @tc.name      testUiNavigation0002
     * @tc.desc      Parent title text is returned by the navigation title
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUiNavigation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(200);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(200);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0002', `delay=200`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0003
     * @tc.name      testUiNavigation0003
     * @tc.desc      Tap on the button pushes the child page
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUiNavigation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(250);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(250);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0003', `delay=250`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0004
     * @tc.name      testUiNavigation0004
     * @tc.desc      Child page title matches the route name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUiNavigation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(300);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(300);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0004', `delay=300`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0005
     * @tc.name      testUiNavigation0005
     * @tc.desc      Back press restores the parent title
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUiNavigation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(350);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(350);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0005', `delay=350`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0006
     * @tc.name      testUiNavigation0006
     * @tc.desc      Button remains usable after coming back
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUiNavigation0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(400);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(400);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0006', `delay=400`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0007
     * @tc.name      testUiNavigation0007
     * @tc.desc      Child title length matches the route name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUiNavigation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(450);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(450);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0007', `delay=450`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0008
     * @tc.name      testUiNavigation0008
     * @tc.desc      Child page text equals the destination name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUiNavigation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(500);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(500);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0008', `delay=500`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0009
     * @tc.name      testUiNavigation0009
     * @tc.desc      Back press keeps the navigation stack alive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUiNavigation0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(550);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(550);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0009', `delay=550`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0010
     * @tc.name      testUiNavigation0010
     * @tc.desc      Second tap still reaches the child page
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUiNavigation0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(600);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(600);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0010', `delay=600`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0011
     * @tc.name      testUiNavigation0011
     * @tc.desc      Button text length stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUiNavigation0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(650);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(650);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0011', `delay=650`);
    });
    /**
     * @tc.number    SUB_PREHTTP_UI_0012
     * @tc.name      testUiNavigation0012
     * @tc.desc      Parent title keeps eight characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUiNavigation0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ui: Driver = driver();
      const button: Component = await ui.waitForComponent(ON.text(BUTTON_TEXT), DRIVER_WAIT_MS);
      expect(button !== null).assertTrue();
      const buttonText: string = await button.getText();
      expect(buttonText).assertEqual(BUTTON_TEXT);
      await ui.delayMs(700);
      await button.click();
      const child: Component = await ui.waitForComponent(ON.text(NAV_NAME), DRIVER_WAIT_MS);
      expect(child !== null).assertTrue();
      const childText: string = await child.getText();
      expect(childText).assertEqual(NAV_NAME);
      await ui.delayMs(700);
      await ui.pressBack();
      const parent: Component = await ui.waitForComponent(ON.text(PAGE_TITLE), DRIVER_WAIT_MS);
      expect(parent !== null).assertTrue();
      const parentText: string = await parent.getText();
      expect(parentText).assertEqual(PAGE_TITLE);
      expect(parentText.length).assertEqual(16);
      expect(childText.length).assertEqual(7);
      expect(buttonText.length).assertEqual(20);
      logCase('testUiNavigation0012', `delay=700`);
    });
  });
}
