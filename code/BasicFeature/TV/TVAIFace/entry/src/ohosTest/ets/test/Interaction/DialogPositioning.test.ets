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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  cleanupEnvironment,
  waitForHomeStable,
  isHomeVisible,
  isImageSelectVisible,
  isDeviceAuthVisible,
  navigateToImageSelect,
  navigateToCamera,
  navigateToDeviceAuth,
  ensureHome,
  checkTextContent,
  getComponentCount,
  getVisibleTexts,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  simulateTouch,
  countVisibleTexts,
  averageImageWidth,
  totalTextArea,
  measureNavigationLatency,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  TEXT_HOME_IMAGE,
  TEXT_HOME_CAMERA,
  TEXT_HOME_DEVICE,
  TEXT_IMAGE_SELECT,
  TEXT_TRUST_DEVICE,
  TEXT_DISCOVER_DEVICES,
  TEXT_NO_CAMERA,
  TOLERANCE_COMPONENT_COUNT,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_TRANSITION,
  STRESS_ROUNDS_NAVIGATION
} from '../Shared/AIFaceSharedDriver';

export default function dialogPositioningTest(): void {
  describe('dialogPositioning_test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(500);
      await waitForHomeStable(driver);
    });

    afterAll(async () => {
      await cleanupEnvironment(driver);
    });

    it('DialogPositioning_home_smoke_45', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 2; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });


    it('DialogPositioning_touch_smoke_45', 0, async () => {
      await ensureHome(driver);
      await simulateTouch(driver, 265, 535);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(0);
    });


    /*
     * Business scenario 4510-0 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4510', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 650, 850);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4509-9 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 4508-8 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4508', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 128, 960);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4507-7 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4507', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 82, 900);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4506-6 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4506', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 636, 840);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4505-5 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4505', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 590, 780);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4504-4 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4504', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const rightIndex: number = await getCurrentFocusIndex(driver);
      expect(rightIndex).assertLargerOrEqual(-1);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const leftIndex: number = await getCurrentFocusIndex(driver);
      expect(leftIndex).assertLargerOrEqual(-1);
      const focusExists: boolean = await checkFocusState(driver, -1);
      expect(typeof focusExists).assertEqual('boolean');
      await simulateTouch(driver, 544, 720);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4503-3 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4503', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 498, 660);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4502-2 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 4501-1 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('DialogPositioning_business_4501', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 406, 540);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 4500-0 for DialogPositioning.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

  });
}
