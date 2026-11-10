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

async function countText(driver: Driver, text: string): Promise<number> {
  const nodes: Component[] = await driver.findComponents(ON.text(text));
  return nodes === null ? 0 : nodes.length;
}

async function walkRoute(driver: Driver, route: number[]): Promise<number> {
  for (let index: number = 0; index < route.length; index++) {
    const tabIndex: number = route[index];
    const tab: Component = await driver.findComponent(ON.id('tab' + tabIndex.toString()));
    await tab.click();
    await driver.delayMs(200);
  }
  return route[route.length - 1];
}

async function assertSettled(driver: Driver, tabIndex: number): Promise<void> {
  expect(router.getState().path).assertEqual('pages/');
  expect(await countText(driver, 'Product Specifications')).assertEqual(tabIndex === 0 ? 2 : 1);
  if (tabIndex === 1) {
    expect(await countText(driver, 'Function Directory')).assertEqual(1);
  } else {
    expect(await countText(driver, 'Function Directory')).assertEqual(0);
  }
  if (tabIndex === 2) {
    expect(await countText(driver, 'Entertainment & AV')).assertEqual(1);
  }
  if (tabIndex === 3) {
    const swipers: Component[] = await driver.findComponents(ON.type('Swiper'));
    expect(swipers !== null && swipers.length === 1).assertTrue();
  }
  await driver.assertComponentExist(ON.id('tab0'));
}

export default function expandedChaosRecovery01Test(): void {
  describe('ExpandedChaosRecovery01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_CHAOS_0106
     * @tc.name expandedChaosRecovery01_006
     * @tc.desc Verify cross-domain route sequence 1320 recovers concrete Feature and SmartLife nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedChaosRecovery01_006', 0, async (): Promise<void> => {
      await assertSettled(driver, await walkRoute(driver, [1, 3, 2, 0]));
    });


  });

}
