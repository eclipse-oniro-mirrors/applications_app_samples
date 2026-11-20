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
* Expanded ability recovery, idle policy and persistent route suites.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { UIAbility } from '@kit.AbilityKit';
import { KeyCode } from '@kit.InputKit';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
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


async function assertFocusedTab(driver: Driver, index: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  expect(await tab.isFocused()).assertTrue();
  expect((await tab.getText()).trim().length > 0).assertTrue();
}


export default function expandedRecoveryTest(): void {
  describe('ExpandedAbilityRecovery01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3902
     * @tc.name expandedAbilityRecovery01_002
     * @tc.desc Verify EntryAbility restores tab 2 after 1 Home and foreground cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedAbilityRecovery01_002', 0, async (): Promise<void> => {
      await openTab(driver, 2);
      await assertFocusedTab(driver, 2);
      await driver.pressHome();
      await driver.delayMs(150);
      await startAppWithRetry(APP_WANT, 'com.sample.demonstration');
      await driver.delayMs(210);
      await driver.assertComponentExist(ON.text('Entertainment & AV'));
      await assertFocusedTab(driver, 2);
    });



  });

  describe('ExpandedIdlePolicy01Test', () => {
    let driver: Driver;
    let ability: UIAbility;
    // Short injected deadline makes the real timeout path observable instead of
    // waiting for the default 10 s interval that could never fire in a test.
    const IDLE_TIME: number = 400;
    const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;

    const waitForIdleTrigger = async (): Promise<void> => {
      await driver.delayMs(IDLE_TIME + 300);
    };

    const exitSaverByKey = async (): Promise<void> => {
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(750);
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(APP_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(420);
      await restoreRoot(driver);
      ability = await delegator.getCurrentTopAbility();
      globalIdle.init(ability.context, IDLE_TIME);
    });
    beforeEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      await startAppWithRetry(APP_WANT, 'com.sample.demonstration');
      await driver.delayMs(160);
      await restoreRoot(driver);
      globalIdle.resetScreensaver();
      globalIdle.init(ability.context, IDLE_TIME);
    });
    afterEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      await restoreRoot(driver);
    });
    afterAll(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      await restoreRoot(driver);
      await driver.pressHome();
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_2803
     * @tc.name expandedIdlePolicy01_003
     * @tc.desc Verify stopDetect cancels the pending idle timer so no route happens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedIdlePolicy01_003', 0, async (): Promise<void> => {
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      await waitForIdleTrigger();
      expect(router.getState().path).assertEqual('pages/');
      expect(globalIdle.getTriggerPage()).assertEqual('');
    });





















  });

  describe('ExpandedPersistenceRoutes01Test', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3401
     * @tc.name expandedPersistenceRoute01_001
     * @tc.desc Verify persisted SmartLife focus 1 and route 0 resolve to Entertainment & AV
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_001', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 1);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 0 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Entertainment & AV'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3402
     * @tc.name expandedPersistenceRoute01_002
     * @tc.desc Verify persisted SmartLife focus 2 and route 1 resolve to Child Care
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_002', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 2);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 1 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Child Care'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3403
     * @tc.name expandedPersistenceRoute01_003
     * @tc.desc Verify persisted SmartLife focus 0 and route 2 resolve to Efficient Office
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_003', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 0);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 2 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Efficient Office'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3406
     * @tc.name expandedPersistenceRoute01_006
     * @tc.desc Verify persisted SmartLife focus 0 and route 0 resolve to Entertainment & AV
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_006', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 0);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 0 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Entertainment & AV'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3407
     * @tc.name expandedPersistenceRoute01_007
     * @tc.desc Verify persisted SmartLife focus 1 and route 1 resolve to Child Care
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_007', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 1);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 1 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Child Care'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3408
     * @tc.name expandedPersistenceRoute01_008
     * @tc.desc Verify persisted SmartLife focus 2 and route 2 resolve to Efficient Office
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_008', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 2);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 2 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Efficient Office'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3411
     * @tc.name expandedPersistenceRoute01_011
     * @tc.desc Verify persisted SmartLife focus 2 and route 0 resolve to Entertainment & AV
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_011', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 2);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 0 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Entertainment & AV'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3412
     * @tc.name expandedPersistenceRoute01_012
     * @tc.desc Verify persisted SmartLife focus 0 and route 1 resolve to Child Care
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_012', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 0);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 1 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Child Care'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_EXPANDED_3413
     * @tc.name expandedPersistenceRoute01_013
     * @tc.desc Verify persisted SmartLife focus 1 and route 2 resolve to Efficient Office
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('expandedPersistenceRoute01_013', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', 1);
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 2 } });
      await driver.delayMs(380);
      await driver.assertComponentExist(ON.text('Efficient Office'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await driver.pressBack();
      await driver.delayMs(160);
      await restoreRoot(driver);
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
    });



  });

}
