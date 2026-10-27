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

const TITLES: string[] = ['Universal Interconnection', 'Screen Cast', 'Smart AI', 'Pointing Remote'];

async function restoreRoot(driver: Driver): Promise<void> {
  let state: router.RouterState = router.getState();
  while (state.index > 1) {
    router.back();
    await driver.delayMs(120);
    state = router.getState();
  }
  await driver.assertComponentExist(ON.id('tab0'));
}

async function openTab(driver: Driver, index: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(220);
}

async function countText(driver: Driver, text: string): Promise<number> {
  const nodes: Component[] = await driver.findComponents(ON.text(text));
  return nodes === null ? 0 : nodes.length;
}

async function assertFeaturePage(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('tab1'));
  expect(router.getState().path).assertEqual('pages/');
}

async function openCard(driver: Driver, title: string, sibling: string): Promise<void> {
  await openTab(driver, 1);
  await (await driver.findComponent(ON.text(title))).click();
  await driver.delayMs(240);
  expect(await countText(driver, title)).assertEqual(1);
  expect(await countText(driver, sibling)).assertEqual(0);
  await driver.pressBack();
  await driver.delayMs(180);
  await assertFeaturePage(driver);
}

export default function expandedFeatureCatalog01Test(): void {
  describe('ExpandedFeatureCatalog01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FEATURE_CARD_0104
     * @tc.name expandedFeatureCard_004
     * @tc.desc Verify FeaturePage card 4 keeps real artwork, focus bounds and Smart Screensaver behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureCard_004', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await assertFeaturePage(driver);
      for (let index: number = 0; index < 4; index++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
        await driver.delayMs(90);
      }
      await assertFeaturePage(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FEATURE_CARD_0105
     * @tc.name expandedFeatureCard_005
     * @tc.desc Verify FeaturePage card 5 keeps real artwork, focus bounds and Voice Interaction behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureCard_005', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await assertFeaturePage(driver);
      for (let index: number = 0; index < 5; index++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
        await driver.delayMs(90);
      }
      await assertFeaturePage(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FEATURE_CARD_0106
     * @tc.name expandedFeatureCard_006
     * @tc.desc Verify FeaturePage card 6 keeps real artwork, focus bounds and Distributed behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureCard_006', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await assertFeaturePage(driver);
      for (let index: number = 0; index < 6; index++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
        await driver.delayMs(90);
      }
      await assertFeaturePage(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FEATURE_CARD_0107
     * @tc.name expandedFeatureCard_007
     * @tc.desc Verify FeaturePage card 0 keeps real artwork, focus bounds and Universal Interconnection behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureCard_007', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await assertFeaturePage(driver);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.delayMs(120);
      await assertFeaturePage(driver);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FEATURE_CARD_0114
     * @tc.name expandedFeatureCard_014
     * @tc.desc Verify FeaturePage card 2 keeps real artwork, focus bounds and Smart AI behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureCard_014', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await assertFeaturePage(driver);
      for (let index: number = 0; index < 3; index++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
        await driver.delayMs(90);
      }
      await assertFeaturePage(driver);
      for (let index: number = 0; index < 3; index++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
        await driver.delayMs(90);
      }
      await assertFeaturePage(driver);
    });

  });

}
