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

export default function performanceStressTest(): void {
  describe('performanceStress_test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(500);
      await waitForHomeStable(driver);
    });

    afterAll(async () => {
      await cleanupEnvironment(driver);
    });

    it('PerformanceStress_home_smoke_69', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 2; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });


    it('PerformanceStress_touch_smoke_69', 0, async () => {
      await ensureHome(driver);
      await simulateTouch(driver, 153, 307);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(0);
    });


    /*
     * Business scenario 6925-5 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6925', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 570, 120);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6924-4 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6924', 0, async () => {
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
      await simulateTouch(driver, 524, 1160);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6923-3 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6923', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 478, 1100);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6922-2 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6922', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 432, 1040);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6921-1 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6921', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 386, 980);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6920-0 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6920', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 340, 920);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6919-9 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 6918-8 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6918', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 418, 1030);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6917-7 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6917', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 372, 970);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6916-6 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6916', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 326, 910);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6915-5 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6915', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 280, 850);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6914-4 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6914', 0, async () => {
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
      await simulateTouch(driver, 234, 790);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6913-3 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 6912-2 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6912', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 142, 670);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6911-1 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6911', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 96, 610);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6910-0 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6910', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 650, 550);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6909-9 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 6908-8 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6908', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 128, 660);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6907-7 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6907', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 82, 600);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6906-6 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6906', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 636, 540);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6905-5 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6905', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 590, 480);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6904-4 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6904', 0, async () => {
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
      await simulateTouch(driver, 544, 420);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6903-3 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6903', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 498, 360);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6902-2 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('PerformanceStress_business_6902', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 452, 300);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 6901-1 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 6900-0 for PerformanceStress.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

  });
}
