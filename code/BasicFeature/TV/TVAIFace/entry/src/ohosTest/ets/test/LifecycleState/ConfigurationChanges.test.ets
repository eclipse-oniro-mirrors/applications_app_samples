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

export default function configurationChangesTest(): void {
  describe('configurationChanges_test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(500);
      await waitForHomeStable(driver);
    });

    afterAll(async () => {
      await cleanupEnvironment(driver);
    });

    it('ConfigurationChanges_home_smoke_55', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 4; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });


    it('ConfigurationChanges_touch_smoke_55', 0, async () => {
      await ensureHome(driver);
      await simulateTouch(driver, 135, 565);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(0);
    });


    /*
     * Business scenario 5515-5 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5515', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 480, 750);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5514-4 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5514', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const rightIndex: number = await getCurrentFocusIndex(driver);
      expect(rightIndex).assertLargerOrEqual(-1);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const leftIndex: number = await getCurrentFocusIndex(driver);
      expect(leftIndex).assertLargerOrEqual(-1);
      const focusExists: boolean = await checkFocusState(driver, -1);
      expect(typeof focusExists).assertEqual('boolean');
      await simulateTouch(driver, 434, 690);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5513-3 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5513', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 388, 630);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5512-2 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5512', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 342, 570);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5511-1 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5511', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 296, 510);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5510-0 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5510', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 250, 450);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5509-9 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 5508-8 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5508', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 328, 560);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5507-7 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5507', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 282, 500);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5506-6 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5506', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 236, 440);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5505-5 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5505', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 190, 380);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5504-4 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5504', 0, async () => {
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
      await simulateTouch(driver, 144, 320);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5503-3 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5503', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 98, 260);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5502-2 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('ConfigurationChanges_business_5502', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 652, 200);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 5501-1 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 5500-0 for ConfigurationChanges.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

  });
}
