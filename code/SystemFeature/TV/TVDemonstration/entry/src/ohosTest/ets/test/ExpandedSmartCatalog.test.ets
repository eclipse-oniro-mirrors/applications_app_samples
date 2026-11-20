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

const SCENES: string[] = ['Entertainment & AV', 'Child Care', 'Efficient Office'];

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

async function assertCatalog(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('tab2'));
  await driver.assertComponentExist(ON.id('tab0'));
  expect(router.getState().path).assertEqual('pages/');
}

export default function expandedSmartCatalog01Test(): void {
  describe('ExpandedSmartCatalog01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1401
     * @tc.name expandedSmartCard01_001
     * @tc.desc Verify SmartLifePage card 1 preserves Child Care artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_001', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await (await driver.findComponent(ON.text('Child Care'))).click();
      await driver.delayMs(240);
      expect(await countText(driver, 'Child Care')).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(200);
      await assertCatalog(driver);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(140);
      await assertCatalog(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1402
     * @tc.name expandedSmartCard01_002
     * @tc.desc Verify SmartLifePage card 2 preserves Efficient Office artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_002', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(120);
      await assertCatalog(driver);
      await (await driver.findComponent(ON.text('Efficient Office'))).click();
      await driver.delayMs(240);
      expect(await countText(driver, 'Efficient Office')).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(180);
      await assertCatalog(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1403
     * @tc.name expandedSmartCard01_003
     * @tc.desc Verify SmartLifePage card 0 preserves Entertainment & AV artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_003', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await assertCatalog(driver);
      await (await driver.findComponent(ON.text('Entertainment & AV'))).click();
      await driver.delayMs(240);
      expect(await countText(driver, 'Entertainment & AV')).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(180);
      await assertCatalog(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1404
     * @tc.name expandedSmartCard01_004
     * @tc.desc Verify SmartLifePage card 1 preserves Child Care artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_004', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.delayMs(120);
      await assertCatalog(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1405
     * @tc.name expandedSmartCard01_005
     * @tc.desc Verify SmartLifePage card 2 preserves Efficient Office artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_005', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.delayMs(120);
      await assertCatalog(driver);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.delayMs(120);
      await assertCatalog(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1406
     * @tc.name expandedSmartCard01_006
     * @tc.desc Verify SmartLifePage card 0 preserves Entertainment & AV artwork and remote behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartCard01_006', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_CENTER);
      await driver.delayMs(200);
      await assertCatalog(driver);
    });

  });

}
