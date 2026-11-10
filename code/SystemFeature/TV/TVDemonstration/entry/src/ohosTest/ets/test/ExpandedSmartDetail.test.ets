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
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
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

async function openTab(driver: Driver, index: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(220);
}

async function countText(driver: Driver, text: string): Promise<number> {
  const nodes: Component[] = await driver.findComponents(ON.text(text));
  return nodes === null ? 0 : nodes.length;
}

async function openScene(driver: Driver, scene: string, sibling: string): Promise<void> {
  await openTab(driver, 2);
  await (await driver.findComponent(ON.text(scene))).click();
  await driver.delayMs(240);
  expect(await countText(driver, scene)).assertEqual(1);
  expect(await countText(driver, sibling)).assertEqual(0);
  await driver.pressBack();
  await driver.delayMs(200);
  expect(await countText(driver, sibling)).assertEqual(1);
}

export default function expandedSmartDetail01Test(): void {
  describe('ExpandedSmartDetail01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1501
     * @tc.name expandedSmartDetail01_001
     * @tc.desc Verify SmartLifeComponent detail 1 binds Child Care video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_001', 0, async (): Promise<void> => {
      await openScene(driver, 'Child Care', 'Efficient Office');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1502
     * @tc.name expandedSmartDetail01_002
     * @tc.desc Verify SmartLifeComponent detail 2 binds Efficient Office video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_002', 0, async (): Promise<void> => {
      await openScene(driver, 'Efficient Office', 'Child Care');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1503
     * @tc.name expandedSmartDetail01_003
     * @tc.desc Verify SmartLifeComponent detail 0 binds Entertainment & AV video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_003', 0, async (): Promise<void> => {
      await openScene(driver, 'Entertainment & AV', 'Child Care');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1504
     * @tc.name expandedSmartDetail01_004
     * @tc.desc Verify SmartLifeComponent detail 1 binds Child Care video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_004', 0, async (): Promise<void> => {
      await openScene(driver, 'Child Care', 'Entertainment & AV');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1505
     * @tc.name expandedSmartDetail01_005
     * @tc.desc Verify SmartLifeComponent detail 2 binds Efficient Office video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_005', 0, async (): Promise<void> => {
      await openScene(driver, 'Efficient Office', 'Entertainment & AV');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_1506
     * @tc.name expandedSmartDetail01_006
     * @tc.desc Verify SmartLifeComponent detail 0 binds Entertainment & AV video and content state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartDetail01_006', 0, async (): Promise<void> => {
      await openScene(driver, 'Entertainment & AV', 'Efficient Office');
    });

  });

}
