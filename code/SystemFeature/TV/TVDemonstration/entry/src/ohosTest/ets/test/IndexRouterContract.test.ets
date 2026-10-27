/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Merged from IndexNavigation / IndexPointerContract / IndexFocusPersistenceTraceContract
// / RouterRegistrationContract after the XTS quality audit.
// Calibrated text counting contract: 'Product Specifications' and 'Smart Life' are both
// persistent tab-bar labels, so ON.text matches two nodes while their own page is active
// (page title + tab label) and exactly one node on any other page.

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { UIAbility } from '@kit.AbilityKit';
import { KeyCode } from '@kit.InputKit';
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry } from './TestScenarioUtils';


interface RouteIndex {
  index: number;
}

const INDEX_ROUTER_CONTRACT_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const INDEX_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const INDEX_FOCUS_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const POINTER_IDLE_TIME: number = 400;
const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;

export default function indexRouterContractTest(): void {


  describe('IndexFocusPersistenceTraceContractTest', () => {
    let driver: Driver;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.delayMs(140);
    };

    const tab = async (index: number): Promise<Component> => {
      return driver.findComponent(ON.id('tab' + index.toString()));
    };

    const assertAllTabsVisible = async (): Promise<void> => {
      for (let index: number = 0; index < 4; index++) {
        const nodes: Component[] = await driver.findComponents(ON.id('tab' + index.toString()));
        expect(nodes.length).assertEqual(1);
      }
    };

    const focusedTabCount = async (): Promise<number> => {
      let focusedCount: number = 0;
      for (let index: number = 0; index < 4; index++) {
        const currentTab: Component = await tab(index);
        const focused: boolean = await currentTab.isFocused();
        if (focused) {
          focusedCount++;
        }
      }
      return focusedCount;
    };

    const focusTab = async (index: number): Promise<boolean> => {
      const component: Component = await tab(index);
      await component.click();
      await driver.delayMs(90);
      const focused: boolean = await component.isFocused();
      return focused;
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(INDEX_ROUTER_CONTRACT_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(520);
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      await restoreRoot();
    });

    afterEach(async (): Promise<void> => {
      await restoreRoot();
    });

    afterAll(async (): Promise<void> => {
      await restoreRoot();
      await driver.pressHome();
    });





    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_FOCUS_TRACE_0500
     * @tc.name indexFocusSmartTabReentry005
     * @tc.desc Verify Smart Life reentry recreates the scene catalog after focus leaves the tab bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexFocusSmartTabReentry005', 0, async (): Promise<void> => {
      await focusTab(2);
      const scene: Component[] = await driver.findComponents(ON.text('Entertainment & AV'));
      await (await tab(0)).click();
      await driver.delayMs(120);
      await focusTab(2);
      const reentered: Component[] = await driver.findComponents(ON.text('Entertainment & AV'));
      expect(scene.length).assertEqual(1);
      expect(reentered.length).assertEqual(1);
    });






    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_FOCUS_TRACE_1100
     * @tc.name indexFocusRootRouteAfterMixedKeys012
     * @tc.desc Verify mixed directional input preserves one root route and a valid focused tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexFocusRootRouteAfterMixedKeys012', 0, async (): Promise<void> => {
      await focusTab(0);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.delayMs(120);
      const focusedTabs: number = await focusedTabCount();
      const routeState: router.RouterState = router.getState();
      expect(focusedTabs).assertEqual(1);
      expect(routeState.path).assertEqual('pages/');
      expect(routeState.index).assertEqual(1);
    });

  });

  describe('RouterRegistrationContractTest', () => {
    let driver: Driver;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await (await driver.findComponent(ON.id('tab0'))).click();
      await driver.delayMs(100);
    };

    const openFeature = async (index: number): Promise<void> => {
      await (await driver.findComponent(ON.id('tab1'))).click();
      await driver.delayMs(140);
      const titles: string[] = [
        'Universal Interconnection', 'Screen Cast', 'Smart AI', 'Pointing Remote',
        'Smart Screensaver', 'Voice Interaction', 'Distributed'
      ];
      await (await driver.findComponent(ON.text(titles[index]))).click();
      await driver.delayMs(220);
    };

    const openSmart = async (index: number): Promise<void> => {
      await (await driver.findComponent(ON.id('tab2'))).click();
      await driver.delayMs(140);
      const titles: string[] = ['Entertainment & AV', 'Child Care', 'Efficient Office'];
      await (await driver.findComponent(ON.text(titles[index]))).click();
      await driver.delayMs(260);
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(INDEX_ROUTER_CONTRACT_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      // Router stack state is process-global. Returning to its single root entry
      // prevents a preceding nested route from changing the index expected by this case.
      await restoreRoot();
    });

    afterAll(async (): Promise<void> => {
      await restoreRoot();
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ROUTER_REGISTRATION_0100
     * @tc.name routerRegistrationRootState001
     * @tc.desc Verify router getState identifies pages Index as the single root entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('routerRegistrationRootState001', 0, (): void => {
      const state: router.RouterState = router.getState();
      expect(state.index).assertEqual(1);
      expect(state.path).assertEqual('pages/');
      expect(state.name).assertEqual('Index');
    });






  });
}
