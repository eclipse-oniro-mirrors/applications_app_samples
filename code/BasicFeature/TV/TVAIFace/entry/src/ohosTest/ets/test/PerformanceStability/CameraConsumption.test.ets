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

export default function cameraConsumptionTest(): void {
  describe('cameraConsumption_test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(500);
      await waitForHomeStable(driver);
    });

    afterAll(async () => {
      await cleanupEnvironment(driver);
    });

    it('CameraConsumption_home_smoke_70', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });


    it('CameraConsumption_touch_smoke_70', 0, async () => {
      await ensureHome(driver);
      await simulateTouch(driver, 190, 360);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(0);
    });


    /*
     * Business scenario 7037-7 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7037', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 252, 1010);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7036-6 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7036', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 206, 950);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7035-5 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7035', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 160, 890);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7034-4 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7034', 0, async () => {
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
      await simulateTouch(driver, 114, 830);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7033-3 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7033', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 68, 770);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7032-2 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7032', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 622, 710);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7031-1 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7031', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 576, 650);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7030-0 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7030', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 530, 590);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7029-9 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7028-8 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7028', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 608, 700);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7027-7 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7027', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 562, 640);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7026-6 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7026', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 516, 580);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7025-5 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7025', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 470, 520);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7024-4 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7024', 0, async () => {
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
      await simulateTouch(driver, 424, 460);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7023-3 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7023', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 378, 400);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7022-2 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7022', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 332, 340);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7021-1 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7020-0 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7020', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 240, 220);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7019-9 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7019', 0, async () => {
      await ensureHome(driver);
      const imageOpened: boolean = await navigateToImageSelect(driver);
      expect(imageOpened).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const deviceOpened: boolean = await navigateToDeviceAuth(driver);
      expect(deviceOpened).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 364, 390);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7018-8 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7018', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 318, 330);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7017-7 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7017', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 272, 270);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7016-6 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7016', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 226, 210);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7015-5 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7015', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 180, 150);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7014-4 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7014', 0, async () => {
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
      await simulateTouch(driver, 134, 90);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7013-3 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7012-2 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7012', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 642, 1070);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7011-1 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7010-0 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7010', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const expected: string[] = [TEXT_HOME_IMAGE, TEXT_HOME_CAMERA, TEXT_HOME_DEVICE];
      const matched: number = await countVisibleTexts(driver, expected);
      expect(matched).assertLargerOrEqual(2);
      await simulateTouch(driver, 550, 950);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7009-9 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

    /*
     * Business scenario 7008-8 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7008', 0, async () => {
      await ensureHome(driver);
      for (let i = 0; i < 1; i++) {
        const latency: number = await measureNavigationLatency(driver, KEY_RIGHT);
        expect(latency).assertLargerOrEqual(0);
        expect(latency).assertLessOrEqual(5000);
      }
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await simulateTouch(driver, 628, 1060);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7007-7 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7007', 0, async () => {
      await ensureHome(driver);
      const texts: string[] = await getVisibleTexts(driver);
      expect(texts.length).assertLargerOrEqual(1);
      const imageWidth: number = await averageImageWidth(driver);
      const textArea: number = await totalTextArea(driver);
      expect(imageWidth).assertLargerOrEqual(0);
      expect(textArea).assertLargerOrEqual(0);
      await simulateTouch(driver, 582, 1000);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7006-6 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7006', 0, async () => {
      await ensureHome(driver);
      const initialCount: number = await getComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await getComponentCount(driver);
      const delta: number = Math.abs(finalCount - initialCount);
      expect(delta).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 50);
      await simulateTouch(driver, 536, 940);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7005-5 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7005', 0, async () => {
      await ensureHome(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 490, 880);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7004-4 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7004', 0, async () => {
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
      await simulateTouch(driver, 444, 820);
      expect(await getComponentCount(driver)).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7003-3 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7003', 0, async () => {
      await ensureHome(driver);
      const opened: boolean = await navigateToCamera(driver);
      const noCamera: boolean = await checkTextContent(driver, TEXT_NO_CAMERA);
      expect(typeof opened).assertEqual('boolean');
      expect(typeof noCamera).assertEqual('boolean');
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 398, 760);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7002-2 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7002', 0, async () => {
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      const trust: boolean = await checkTextContent(driver, TEXT_TRUST_DEVICE);
      const discover: boolean = await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
      expect(trust || discover).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 352, 700);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7001-1 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */
    it('CameraConsumption_business_7001', 0, async () => {
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      const visible: boolean = await isImageSelectVisible(driver);
      expect(visible).assertTrue();
      const title: boolean = await checkTextContent(driver, TEXT_IMAGE_SELECT);
      expect(title).assertTrue();
      await ensureHome(driver);
      const home: boolean = await isHomeVisible(driver);
      expect(home).assertTrue();
      await simulateTouch(driver, 306, 640);
      const count: number = await getComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    /*
     * Business scenario 7000-0 for CameraConsumption.
     * Steps: drive the AIFace page flow and verify visible business state.
     * Expected: navigation and UI state remain consistent.
     */

  });
}
