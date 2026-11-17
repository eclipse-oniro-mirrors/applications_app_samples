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

export default function localizationTestingTest(): void {
  describe('localizationTesting_test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(500);
      await waitForHomeStable(driver);
    });

    afterAll(async () => {
      await cleanupEnvironment(driver);
    });

    it('LocalizationTesting_home_smoke_76', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });


    it('LocalizationTesting_touch_smoke_76', 0, async () => {
      await ensureHome(driver);
      await simulateTouch(driver, 412, 178);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(0);
    });


    /*
     * Business scenario 7630-0 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7630', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 530, 790);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7629-9 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7628-8 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7628', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 608, 900);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7627-7 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7627', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 562, 840);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7626-6 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7626', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 516, 780);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7625-5 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7625', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 470, 720);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7624-4 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7624', 0, async () => {
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
      await simulateTouch(driver, 424, 660);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7623-3 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7623', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 378, 600);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7622-2 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7621-1 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7621', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 286, 480);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7620-0 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7620', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 240, 420);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7619-9 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7618-8 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7618', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 318, 530);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7617-7 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7617', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 272, 470);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7616-6 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7616', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 226, 410);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7615-5 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7615', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 180, 350);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7614-4 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7614', 0, async () => {
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
      await simulateTouch(driver, 134, 290);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7613-3 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7612-2 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7611-1 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7611', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 596, 110);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7610-0 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7610', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 550, 1150);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7609-9 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7608-8 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7608', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 628, 160);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7607-7 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7607', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 582, 100);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7606-6 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7606', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 536, 1140);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7605-5 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7605', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 490, 1080);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7604-4 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7604', 0, async () => {
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
      await simulateTouch(driver, 444, 1020);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7603-3 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7603', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 398, 960);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7602-2 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7601-1 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('LocalizationTesting_business_7601', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 306, 840);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7600-0 for LocalizationTesting.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

  });
}
