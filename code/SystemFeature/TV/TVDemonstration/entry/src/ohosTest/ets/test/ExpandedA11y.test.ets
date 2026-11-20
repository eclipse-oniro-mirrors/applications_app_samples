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
  await driver.delayMs(90);
}

async function assertBounds(driver: Driver, id: string): Promise<void> {
  const nodes: Component[] = await driver.findComponents(ON.id(id));
  expect(nodes.length).assertEqual(1);
  const bounds: Rect = await nodes[0].getBounds();
  expect(bounds.right > bounds.left).assertTrue();
  expect(bounds.bottom > bounds.top).assertTrue();
}


export default function expandedA11y01Test(): void {
  describe('ExpandedA11y01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_A11Y_0300
     * @tc.name expandedA11y01_004
     * @tc.desc Verify a11y node tab0 remains readable and geometrically visible after up input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedA11y01_004', 0, async (): Promise<void> => {
      await openTab(driver, 0);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      expect(await (await driver.findComponent(ON.id('tab0'))).isFocused()).assertTrue();
      await assertBounds(driver, 'tab0');
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });

  });

}
