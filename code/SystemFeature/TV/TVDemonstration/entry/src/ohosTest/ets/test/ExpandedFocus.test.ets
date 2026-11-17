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

async function openTab(driver: Driver, index: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(240);
}

async function countText(driver: Driver, text: string): Promise<number> {
  const nodes: Component[] = await driver.findComponents(ON.text(text));
  return nodes === null ? 0 : nodes.length;
}

async function runKeys(driver: Driver, keyCodes: number[]): Promise<void> {
  for (let index: number = 0; index < keyCodes.length; index++) {
    await driver.triggerKey(keyCodes[index]);
    await driver.delayMs(140);
  }
}

async function assertFeatureFocus(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('tab1'));
  expect(router.getState().path).assertEqual('pages/');
}

async function assertSmartFocus(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('tab2'));
  expect(router.getState().path).assertEqual('pages/');
}

async function assertSupportFocus(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('tab3'));
  expect(router.getState().path).assertEqual('pages/');
}

export default function expandedFocusTest(): void {
  describe('ExpandedFeatureFocus01Test', () => {
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

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0101
     * @tc.name expandedFeatureFocus01_001
     * @tc.desc Verify Feature card 1 focus survives down then left remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_001', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_DOWN, KeyCode.KEYCODE_DPAD_LEFT]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0102
     * @tc.name expandedFeatureFocus01_002
     * @tc.desc Verify Feature card 2 focus survives up then right remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_002', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0103
     * @tc.name expandedFeatureFocus01_003
     * @tc.desc Verify Feature card 3 focus survives right then left remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_003', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_LEFT]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0104
     * @tc.name expandedFeatureFocus01_004
     * @tc.desc Verify Feature card 4 focus survives down then right remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_004', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_DOWN, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0105
     * @tc.name expandedFeatureFocus01_005
     * @tc.desc Verify Feature card 5 focus survives down then left remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_005', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_DOWN]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0106
     * @tc.name expandedFeatureFocus01_006
     * @tc.desc Verify Feature card 6 focus survives up then right remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_006', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertFeatureFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0107
     * @tc.name expandedFeatureFocus01_007
     * @tc.desc Verify Feature card 0 focus survives right then left remote input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedFeatureFocus01_007', 0, async (): Promise<void> => {
      await openTab(driver, 1);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertFeatureFocus(driver);
    });
  });

  describe('ExpandedSmartFocus01Test', () => {
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

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0201
     * @tc.name expandedSmartFocus01_001
     * @tc.desc Verify SmartLife card 1 focus survives ordered remote input down,left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartFocus01_001', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_DOWN, KeyCode.KEYCODE_DPAD_LEFT]);
      await assertSmartFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0202
     * @tc.name expandedSmartFocus01_002
     * @tc.desc Verify SmartLife card 2 focus survives ordered remote input right,left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartFocus01_002', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_LEFT]);
      await assertSmartFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0203
     * @tc.name expandedSmartFocus01_003
     * @tc.desc Verify SmartLife card 0 focus survives ordered remote input left,right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartFocus01_003', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertSmartFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0204
     * @tc.name expandedSmartFocus01_004
     * @tc.desc Verify SmartLife card 1 focus survives ordered remote input down,right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSmartFocus01_004', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_DOWN, KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertSmartFocus(driver);
    });
  });

  describe('ExpandedSupportFocus01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0301
     * @tc.name expandedSupportFocus01_001
     * @tc.desc Verify Support indicator focus keeps image 1 visible after right input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportFocus01_001', 0, async (): Promise<void> => {
      await openTab(driver, 3);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_RIGHT]);
      await assertSupportFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0302
     * @tc.name expandedSupportFocus01_002
     * @tc.desc Verify Support indicator focus keeps image 2 visible after up input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportFocus01_002', 0, async (): Promise<void> => {
      await openTab(driver, 3);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_UP]);
      await assertSupportFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0303
     * @tc.name expandedSupportFocus01_003
     * @tc.desc Verify Support indicator focus keeps image 0 visible after down input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportFocus01_003', 0, async (): Promise<void> => {
      await openTab(driver, 3);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_DOWN]);
      await assertSupportFocus(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_FOCUS_0304
     * @tc.name expandedSupportFocus01_004
     * @tc.desc Verify Support indicator focus keeps image 1 visible after left input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedSupportFocus01_004', 0, async (): Promise<void> => {
      await openTab(driver, 3);
      await runKeys(driver, [KeyCode.KEYCODE_DPAD_LEFT]);
      await assertSupportFocus(driver);
    });
  });
}
