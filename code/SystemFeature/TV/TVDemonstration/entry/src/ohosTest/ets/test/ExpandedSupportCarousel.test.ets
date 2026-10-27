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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { startAppWithRetry } from './TestScenarioUtils';

const APP_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

async function restoreRoot(driver: Driver): Promise<void> {
  let state: router.RouterState = router.getState();
  while (state.index > 1) {
    router.back();
    await driver.delayMs(120);
    state = router.getState();
  }
  await driver.assertComponentExist(ON.id('tab0'));
}

async function openSupport(driver: Driver): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab3'));
  await tab.click();
  await driver.delayMs(260);
}

async function assertSupportCarousel(driver: Driver): Promise<void> {
  expect(router.getState().path).assertEqual('pages/');
  await driver.assertComponentExist(ON.id('tab3'));
  await driver.assertComponentExist(ON.id('tab0'));
}

async function press(driver: Driver, keyCode: number): Promise<void> {
  await driver.triggerKey(keyCode);
  await driver.delayMs(160);
}

export default function expandedSupportCarousel01Test(): void {
  describe('ExpandedSupportCarousel01Test', () => {
    let driver: Driver;
    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(APP_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(420);
      await restoreRoot(driver);
    });
    beforeEach(async (): Promise<void> => {
      await startAppWithRetry(APP_WANT, 'com.sample.demonstration');
      await driver.delayMs(160);
      await restoreRoot(driver);
    });
    afterEach(async (): Promise<void> => {
      await restoreRoot(driver);
    });
    afterAll(async (): Promise<void> => {
      await restoreRoot(driver);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0101
     * @tc.name expandedSupportCarousel01_001
     * @tc.desc Verify SupportPage image 1 keeps indicator geometry after explicit left carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_001', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await press(driver, KeyCode.KEYCODE_DPAD_LEFT);
      await assertSupportCarousel(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0102
     * @tc.name expandedSupportCarousel01_002
     * @tc.desc Verify SupportPage image 2 keeps indicator geometry after explicit right,left carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_002', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await press(driver, KeyCode.KEYCODE_DPAD_LEFT);
      await assertSupportCarousel(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0103
     * @tc.name expandedSupportCarousel01_003
     * @tc.desc Verify SupportPage image 0 keeps indicator geometry after explicit left,right carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_003', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_LEFT);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await assertSupportCarousel(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0104
     * @tc.name expandedSupportCarousel01_004
     * @tc.desc Verify SupportPage image 1 keeps indicator geometry after explicit right,right carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_004', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await assertSupportCarousel(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0105
     * @tc.name expandedSupportCarousel01_005
     * @tc.desc Verify SupportPage image 2 keeps indicator geometry after explicit left,left carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_005', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_LEFT);
      await press(driver, KeyCode.KEYCODE_DPAD_LEFT);
      await assertSupportCarousel(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_SUPPORT_0106
     * @tc.name expandedSupportCarousel01_006
     * @tc.desc Verify SupportPage image 0 keeps indicator geometry after explicit right carousel input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportCarousel01_006', 0, async (): Promise<void> => {
      await openSupport(driver);
      await press(driver, KeyCode.KEYCODE_DPAD_RIGHT);
      await assertSupportCarousel(driver);
    });

  });

}
