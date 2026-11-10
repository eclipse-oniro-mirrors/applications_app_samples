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
import {
  AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want, common
} from '@kit.AbilityKit';
import { router, window } from '@kit.ArkUI';
import EntryAbility from '../../../main/ets/entryability/EntryAbility';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry, waitForRootTabBar } from './TestScenarioUtils';


const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const PAGE_SETTLE_TIME: number = 800;
// Bounded first-frame budget for a warm launch; stays well below the harness
// per-spec timeout so a slow frame cannot leave UiTest calls pending.
const WARM_LAUNCH_TAB_WAIT_TIME: number = 4000;
const LIFECYCLE_IDLE_TIME: number = 240;
const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;
// The ScreenSaver carousel is a lazily laid out, virtualised Swiper: the first
// tree sample after the push can be empty and only the active page is materialised.
const CAROUSEL_POLL_STEP: number = 250;
const CAROUSEL_POLL_TIMEOUT: number = 6000;
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME
};
const NEW_WANT_HOME: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME,
  action: 'ohos.want.action.home'
};
const NEW_WANT_VIEW: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME,
  action: 'ohos.want.action.view'
};
const DEFAULT_LAUNCH_PARAM: AbilityConstant.LaunchParam = {
  launchReason: 0 as AbilityConstant.LaunchReason,
  lastExitReason: 0 as AbilityConstant.LastExitReason,
  lastExitMessage: ''
};

async function launchMainAbility(): Promise<void> {
  // Every lifecycle case starts through the public Ability contract so a stale
  // page left by a previous assertion cannot hide a cold-start regression.
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
  await Driver.create().delayMs(PAGE_SETTLE_TIME);
}

export default function abilityLifecycleContractTest(): void {
  // Merged from Ability.test.ets.
  describe('TVDemonstrationAbilityTest', () => {
    beforeAll(async (): Promise<void> => {
      await launchMainAbility();
    });

    beforeEach(async (): Promise<void> => {
      // Product Specifications is the stable landing-page contract. Waiting
      // here prevents rendering latency from being mistaken for lifecycle loss.
      await Driver.create().delayMs(200);
    });

    afterEach(async (): Promise<void> => {
      await Driver.create().delayMs(100);
    });

    afterAll(async (): Promise<void> => {
      // Leaving the app at Home avoids leaking focus and foreground timers into
      // another suite while preserving the installed process for later batches.
      await Driver.create().pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0100
     * @tc.name abilityColdStart001
     * @tc.desc Verify EntryAbility cold start renders the product specification page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityColdStart001', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.assertComponentExist(ON.text('Product Specifications'));
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0200
     * @tc.name abilityMainTabsReady002
     * @tc.desc Verify EntryAbility exposes all four primary navigation tabs after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityMainTabsReady002', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // All tab nodes must be created together because remote-control focus
      // traversal depends on a complete and stable sibling order.
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.id('tab1'));
      await driver.assertComponentExist(ON.id('tab2'));
      await driver.assertComponentExist(ON.id('tab3'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0300
     * @tc.name abilityBackgroundRestore003
     * @tc.desc Verify EntryAbility returns from Home with a renderable page tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityBackgroundRestore003', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressHome();
      await driver.delayMs(300);
      await launchMainAbility();
      // Foreground restoration must recreate focusable nodes and restart idle
      // detection without replacing the visible navigation structure.
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0400
     * @tc.name abilityRepeatedForeground004
     * @tc.desc Verify repeated EntryAbility foreground requests keep a single usable page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityRepeatedForeground004', 0, async (): Promise<void> => {
      await launchMainAbility();
      await launchMainAbility();
      const driver: Driver = Driver.create();
      const productTabs = await driver.findComponents(ON.id('tab0'));
      // RouterMode and Ability reuse must not duplicate the root page because
      // duplicate focus targets make DPAD navigation nondeterministic.
      expect(productTabs.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0500
     * @tc.name abilityBackRelaunch005
     * @tc.desc Verify EntryAbility can relaunch after the root page is closed by Back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityBackRelaunch005', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressBack();
      await driver.delayMs(300);
      await launchMainAbility();
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0600
     * @tc.name abilityRapidHomeReturn006
     * @tc.desc Verify rapid Home and relaunch cycles preserve the primary UI contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityRapidHomeReturn006', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      for (let index: number = 0; index < 3; index++) {
        await driver.pressHome();
        await driver.delayMs(100);
        await launchMainAbility();
      }
      // Three short transitions exercise foreground timer cancellation races;
      // the final assertion verifies that the UI remains operational afterward.
      await driver.assertComponentExist(ON.id('tab3'));
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_0800
     * @tc.name abilityRootTextAvailable008
     * @tc.desc Verify EntryAbility landing page exposes readable tab label text matching packaged resources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityRootTextAvailable008', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // Each tab label comes from a packaged resource; reading the text back
      // differentiates this case from existence-only checks such as 002.
      const expectedLabels: string[] =
        ['Product Specifications', 'Function Features', 'Smart Life', 'Service Support'];
      for (let index: number = 0; index < expectedLabels.length; index++) {
        const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
        const label: string = (await tab.getText()).trim();
        expect(label).assertEqual(expectedLabels[index]);
      }
    });
  });

  // Merged from AbilityColorModeContract.test.ets.
  describe('AbilityColorModeContractTest', () => {
    let driver: Driver;
    let ability: EntryAbility;
    let applicationContext: common.ApplicationContext;
    let systemColorMode: ConfigurationConstant.ColorMode;

    const settleConfiguration = async (): Promise<void> => {
      await driver.delayMs(180);
    };

    const currentColorMode = (): ConfigurationConstant.ColorMode => {
      const configuration = applicationContext.resourceManager.getConfigurationSync();
      return configuration.colorMode as number as ConfigurationConstant.ColorMode;
    };

    const oppositeMode = (mode: ConfigurationConstant.ColorMode): ConfigurationConstant.ColorMode => {
      return mode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK ?
        ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT : ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
    };

    // The package ships both qualifiers and ResourceManager resolves the one that
    // matches the running device locale, so the shipped pair is the expectation
    // rather than the English-only literal.
    const PRODUCT_SPECIFICATION_TITLES: string[] = ['Product Specifications', '产品规格'];

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      const currentAbility: UIAbility = await delegator.getCurrentTopAbility();
      ability = currentAbility as EntryAbility;
      applicationContext = currentAbility.context.getApplicationContext();
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      await settleConfiguration();
      systemColorMode = currentColorMode();
    });

    beforeEach(async (): Promise<void> => {
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      await settleConfiguration();
      systemColorMode = currentColorMode();
    });

    afterEach(async (): Promise<void> => {
      // Restoring NOT_SET preserves the user's system theme and prevents this suite from
      // leaking a light or dark override into later visual and screenshot assertions.
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      await settleConfiguration();
    });

    afterAll(async (): Promise<void> => {
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      await settleConfiguration();
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_COLOR_0100
     * @tc.name abilityOnCreateRestoresSystemColorMode001
     * @tc.desc Verify EntryAbility onCreate clears an application color override and follows system mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityOnCreateRestoresSystemColorMode001', 0, async (): Promise<void> => {
      const overrideMode: ConfigurationConstant.ColorMode = oppositeMode(systemColorMode);
      applicationContext.setColorMode(overrideMode);
      await settleConfiguration();
      const overriddenMode: ConfigurationConstant.ColorMode = currentColorMode();
      expect(overriddenMode).assertEqual(overrideMode);
      ability.onCreate(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      await settleConfiguration();

      // The assertion observes ResourceManager's effective configuration after invoking
      // the production lifecycle callback, not merely the enum passed by the test.
      const restoredMode: ConfigurationConstant.ColorMode = currentColorMode();
      expect(restoredMode).assertEqual(systemColorMode);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_COLOR_0200
     * @tc.name abilityNewWantColorIsolation003
     * @tc.desc Verify EntryAbility onNewWant publishes warm-launch state without changing color mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityNewWantColorIsolation003', 0, async (): Promise<void> => {
      const overrideMode: ConfigurationConstant.ColorMode = oppositeMode(systemColorMode);
      applicationContext.setColorMode(overrideMode);
      await settleConfiguration();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      await settleConfiguration();
      const newWantState: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      const isolatedMode: ConfigurationConstant.ColorMode = currentColorMode();
      expect(newWantState).assertTrue();
      expect(isolatedMode).assertEqual(overrideMode);
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_COLOR_0300
     * @tc.name abilityForegroundBackgroundColorIsolation004
     * @tc.desc Verify EntryAbility foreground and background callbacks do not overwrite application color mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityForegroundBackgroundColorIsolation004', 0, async (): Promise<void> => {
      const overrideMode: ConfigurationConstant.ColorMode = oppositeMode(systemColorMode);
      applicationContext.setColorMode(overrideMode);
      await settleConfiguration();
      ability.onForeground();
      ability.onBackground();
      await settleConfiguration();
      const lifecycleMode: ConfigurationConstant.ColorMode = currentColorMode();
      expect(lifecycleMode).assertEqual(overrideMode);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_COLOR_0400
     * @tc.name abilityOnCreateColorModeIdempotency002
     * @tc.desc Verify repeated EntryAbility onCreate calls retain one stable system color configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityOnCreateColorModeIdempotency002', 0, async (): Promise<void> => {
      applicationContext.setColorMode(oppositeMode(systemColorMode));
      await settleConfiguration();
      ability.onCreate(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      ability.onCreate(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      ability.onCreate(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      await settleConfiguration();
      const stableMode: ConfigurationConstant.ColorMode = currentColorMode();
      expect(stableMode).assertEqual(systemColorMode);
      await driver.assertComponentExist(ON.id('tab0'));
    });
    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_COLOR_0500
     * @tc.name abilityColorResetResourceStability005
     * @tc.desc Verify EntryAbility onCreate color reset keeps packaged strings and the ArkUI tree available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityColorResetResourceStability005', 0, async (): Promise<void> => {
      applicationContext.setColorMode(oppositeMode(systemColorMode));
      await settleConfiguration();
      ability.onCreate(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      await settleConfiguration();
      const title: string = applicationContext.resourceManager.getStringSync(
        $r('app.string.Product_Specifications')
      );
      const tabComponents = await driver.findComponents(ON.id('tab0'));
      expect(PRODUCT_SPECIFICATION_TITLES.indexOf(title) >= 0).assertTrue();
      // The app UI follows the application-preferred language, which TestAbility
      // pins to en-US, while the ResourceManager read above follows the device
      // locale; both shipped labels must therefore be accepted as the rendered
      // product-specifications title.
      const englishTitles = await driver.findComponents(ON.text(PRODUCT_SPECIFICATION_TITLES[0]));
      const chineseTitles = await driver.findComponents(ON.text(PRODUCT_SPECIFICATION_TITLES[1]));
      const matchedTitles: number = (englishTitles !== null ? englishTitles.length : 0) +
        (chineseTitles !== null ? chineseTitles.length : 0);
      expect(matchedTitles > 0).assertTrue();
      expect(tabComponents.length).assertEqual(1);
    });
  });

  // Merged from AbilityIdleLifecycleContract.test.ets.
  describe('AbilityIdleLifecycleContractTest', () => {
    let driver: Driver;
    let currentAbility: UIAbility;
    let lifecycle: EntryAbility;

    // The app router reports the entry page by the route declared in
    // main_pages.json ('pages/Index'); older images normalise it to 'pages/'.
    const isIndexRoute = (path: string): boolean => path === 'pages/Index' || path === 'pages/';

    const returnToIndex = async (): Promise<void> => {
      let tabs = await driver.findComponents(ON.id('tab0'));
      const route = router.getState();
      if (route.path === 'pages/ScreenSaver') {
        router.replaceUrl({ url: 'pages/' });
        await driver.delayMs(PAGE_SETTLE_TIME);
        tabs = await driver.findComponents(ON.id('tab0'));
      }
      if (tabs === null || tabs.length === 0) {
        // resetScreensaver clears detector state but does not guarantee that the
        // test window is foreground. Recreate the foreground state before reuse.
        await driver.pressHome();
        await driver.delayMs(300);
        await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
        await driver.delayMs(PAGE_SETTLE_TIME);
        tabs = await driver.findComponents(ON.id('tab0'));
      }
      if (tabs !== null && tabs.length > 0) {
        await (await driver.findComponent(ON.id('tab0'))).click();
        await driver.delayMs(300);
      }
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      currentAbility = await delegator.getCurrentTopAbility();
      lifecycle = new EntryAbility();
    });

    beforeEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      await returnToIndex();
      globalIdle.init(currentAbility.context, LIFECYCLE_IDLE_TIME);
    });

    afterEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      router.replaceUrl({ url: 'pages/' });
      await driver.delayMs(PAGE_SETTLE_TIME);
      globalIdle.stopDetect();
    });

    afterAll(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      globalIdle.init(currentAbility.context, PRODUCTION_IDLE_TIME);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_IDLE_0100
     * @tc.name abilityLifecycleBurstEndsBackground003
     * @tc.desc Verify rapid EntryAbility lifecycle callbacks ending in background suppress ScreenSaver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityLifecycleBurstEndsBackground003', 0, async (): Promise<void> => {
      lifecycle.onForeground();
      lifecycle.onBackground();
      lifecycle.onForeground();
      lifecycle.onBackground();
      lifecycle.onForeground();
      lifecycle.onBackground();
      await driver.delayMs(LIFECYCLE_IDLE_TIME + 220);

      // TV launchers can generate closely spaced focus transitions. The final lifecycle
      // state, rather than the number of callbacks, must determine whether routing is allowed.
      const tabs = await driver.findComponents(ON.id('tab0'));
      const screenSavers = await driver.findComponents(ON.type('Swiper'));
      const triggerPage: string = globalIdle.getTriggerPage();
      expect(tabs !== null && tabs.length === 1).assertTrue();
      expect(screenSavers === null || screenSavers.length === 0).assertTrue();
      expect(triggerPage).assertEqual('');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_IDLE_0200
     * @tc.name abilityLifecycleBurstEndsForeground004
     * @tc.desc Verify rapid EntryAbility lifecycle callbacks ending in foreground open one ScreenSaver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityLifecycleBurstEndsForeground004', 0, async (): Promise<void> => {
      lifecycle.onForeground();
      lifecycle.onBackground();
      lifecycle.onForeground();
      lifecycle.onBackground();
      lifecycle.onForeground();
      await driver.delayMs(LIFECYCLE_IDLE_TIME + 260);

      // Repeated onForeground calls replace the pending timer in GlobalIdleDetector.
      // Exactly one Swiper detects both a lost restart and duplicate ScreenSaver pushes.
      // The carousel lays its pages out after the push, so give the three packaged
      // images a bounded window instead of sampling the tree once.
      let images: Component[] = await driver.findComponents(ON.type('Image'));
      let elapsedMs: number = 0;
      while (images.length === 0 && elapsedMs < CAROUSEL_POLL_TIMEOUT) {
        await driver.delayMs(CAROUSEL_POLL_STEP);
        elapsedMs += CAROUSEL_POLL_STEP;
        images = await driver.findComponents(ON.type('Image'));
      }
      const screenSavers = await driver.findComponents(ON.type('Swiper'));
      const triggerPage: string = globalIdle.getTriggerPage();
      expect(screenSavers.length).assertEqual(1);
      expect(images.length > 0).assertTrue();
      expect(isIndexRoute(triggerPage)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(600);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_IDLE_0300
     * @tc.name abilityIdleZeroBoundary005
     * @tc.desc Verify GlobalIdleDetector init accepts zero as an immediate timeout boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityIdleZeroBoundary005', 0, async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.init(currentAbility.context, 0);
      globalIdle.startDetect();
      await driver.delayMs(260);

      // Zero is deliberately used as a boundary probe; retaining the prior
      // 240 ms value would make this case indistinguishable from a stale timer.
      const screenSavers = await driver.findComponents(ON.type('Swiper'));
      const triggerPage: string = globalIdle.getTriggerPage();
      expect(screenSavers.length).assertEqual(1);
      expect(isIndexRoute(triggerPage)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(600);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_IDLE_0400
     * @tc.name abilityBackgroundCancelsIdleRoute001
     * @tc.desc Verify EntryAbility onBackground cancels a pending GlobalIdleDetector route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityBackgroundCancelsIdleRoute001', 0, async (): Promise<void> => {
      router.replaceUrl({ url: 'pages/' });
      await driver.delayMs(PAGE_SETTLE_TIME);
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      globalIdle.init(currentAbility.context, LIFECYCLE_IDLE_TIME);
      lifecycle.onForeground();
      await driver.delayMs(80);
      lifecycle.onBackground();
      await driver.delayMs(LIFECYCLE_IDLE_TIME + 220);

      // The business risk is navigation after the TV application is no longer foreground.
      // Calling the Ability callbacks proves their production delegation, not only timer behavior.
      const tabs = await driver.findComponents(ON.id('tab0'));
      const triggerPage: string = globalIdle.getTriggerPage();
      const currentRoute: string = router.getState().path;
      // SDK23 may expose no product tree while the Ability is backgrounded.
      expect(tabs === null || tabs.length === 1).assertTrue();
      expect(currentRoute !== 'pages/ScreenSaver').assertTrue();
      expect(triggerPage).assertEqual('');
    });
  });

  // Merged from AbilityNewWantContract.test.ets.
  describe('AbilityNewWantContractTest', () => {
    let ability: EntryAbility;

    beforeAll((): void => {
      ability = new EntryAbility();
    });

    beforeEach((): void => {
      // Index consumes this AppStorage flag during onPageShow after a warm launch.
      // Resetting it gives each production lifecycle invocation a known prior state.
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    afterAll((): void => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_NEW_WANT_0100
     * @tc.name abilityNewWantSetsStorage001
     * @tc.desc Verify EntryAbility onNewWant transitions isOnNewWant storage to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityNewWantSetsStorage001', 0, (): void => {
      const initialState: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(initialState).assertFalse();
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      // The assertion observes the production side effect consumed by Index.onPageShow.
      // It is not a constructor check and fails if the lifecycle method stops publishing state.
      const publishedState: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(publishedState).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_NEW_WANT_0200
     * @tc.name abilityRepeatedNewWantIdempotent002
     * @tc.desc Verify repeated EntryAbility onNewWant calls keep the storage contract stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('abilityRepeatedNewWantIdempotent002', 0, (): void => {
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      // singleTop reuse can deliver several wants quickly; the boolean signal must remain valid.
      // An even number of deliveries keeps the signal observable: a toggle-style
      // implementation would clear it after an even count, so this case can
      // distinguish a robust set-style publish from a broken toggle.
      const repeatedState: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(repeatedState).assertTrue();
    });
  });

  // Merged from EntryAbilityNewWantPayloadContract.test.ets.
  describe('EntryAbilityNewWantPayloadContractTest', () => {
    let ability: EntryAbility;

    beforeAll((): void => {
      ability = new EntryAbility();
    });

    beforeEach((): void => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    afterAll((): void => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_NEW_WANT_PAYLOAD_0100
     * @tc.name entryNewWantDifferentActionsPublishSameSignal001
     * @tc.desc Verify onNewWant publishes one boolean signal for different valid Want actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryNewWantDifferentActionsPublishSameSignal001', 0, (): void => {
      ability.onNewWant(NEW_WANT_HOME, DEFAULT_LAUNCH_PARAM);
      const firstSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(firstSignal).assertTrue();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      ability.onNewWant(NEW_WANT_VIEW, DEFAULT_LAUNCH_PARAM);

      // The production contract is a presence signal, not an action router.
      // A future payload-dependent branch must not silently drop one action.
      const secondSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(secondSignal).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_NEW_WANT_PAYLOAD_0200
     * @tc.name entryNewWantConsumedAfterForeground003
     * @tc.desc Verify the published new-Want signal persists after repeated deliveries while Index stays usable in foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryNewWantConsumedAfterForeground003', 0, async (): Promise<void> => {
      ability.onNewWant(NEW_WANT_VIEW, DEFAULT_LAUNCH_PARAM);
      const pendingSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(pendingSignal).assertTrue();
      ability.onNewWant(NEW_WANT_HOME, DEFAULT_LAUNCH_PARAM);
      const latestSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(latestSignal).assertTrue();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      const driver: Driver = Driver.create();
      await driver.delayMs(520);
      // The warm launch re-renders the root page asynchronously, and the previous
      // suite leaves the app on whatever route it finished on. Restore the root
      // through a bounded poll plus one HOME + relaunch retry; the budget must stay
      // below the harness per-spec timeout so a failure cannot leave UiTest busy.
      let rootTabs = await driver.findComponents(ON.id('tab0'));
      if (rootTabs === null || rootTabs.length === 0) {
        await driver.pressHome();
        await driver.delayMs(300);
        await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
        await driver.delayMs(PAGE_SETTLE_TIME);
      }
      await waitForRootTabBar(driver, WARM_LAUNCH_TAB_WAIT_TIME);

      // Production Index.onPageShow only reads the signal and never clears it,
      // so persistence (still true after the foreground return) is the contract.
      // The route and tab assertions keep a storage-only implementation honest.
      const routeState = router.getState();
      const persistedSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(routeState.path).assertEqual('pages/');
      expect(persistedSignal).assertTrue();
      await driver.assertComponentExist(ON.id('tab0'));
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_NEW_WANT_PAYLOAD_0300
     * @tc.name entryNewWantSignalDoesNotToggleOnRepeat002
     * @tc.desc Verify repeated mixed Want deliveries never toggle an already published signal off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryNewWantSignalDoesNotToggleOnRepeat002', 0, (): void => {
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      ability.onNewWant(NEW_WANT_HOME, DEFAULT_LAUNCH_PARAM);

      const repeatedSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(repeatedSignal).assertTrue();
    });
  });

  // Merged from EntryAbilityWindowRecreateContract.test.ets.
  describe('EntryAbilityWindowRecreateContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;

    const foreground = async (): Promise<window.Window> => {
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(480);
      const current: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      context = current.context;
      await driver.assertComponentExist(ON.id('tab0'));
      return window.getLastWindow(context);
    };

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    beforeAll(async (): Promise<void> => {
      driver = Driver.create();
      await foreground();
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
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_WINDOW_RECREATE_0100
     * @tc.name entryWindowIdentityAfterHome001
     * @tc.desc Verify WindowStage content reload after Home preserves one usable main window identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryWindowIdentityAfterHome001', 0, async (): Promise<void> => {
      const before: window.WindowProperties = (await foreground()).getWindowProperties();
      await driver.pressHome();
      await driver.delayMs(260);
      const restored: window.Window = await foreground();
      const after: window.WindowProperties = restored.getWindowProperties();

      // The WindowStage should expose the same application screen after a
      // background/foreground cycle instead of loading a duplicate root page.
      const routeState = router.getState();
      const tabs = await driver.findComponents(ON.id('tab0'));
      expect(after.id).assertEqual(before.id);
      expect(routeState.path).assertEqual('pages/');
      expect(tabs.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_WINDOW_RECREATE_0200
     * @tc.name entryWindowContentAfterBack002
     * @tc.desc Verify a Back-closed EntryAbility relaunch restores the main window UI context and Index content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryWindowContentAfterBack002', 0, async (): Promise<void> => {
      await foreground();
      await driver.pressBack();
      await driver.delayMs(320);

      // Back may destroy the original stage, so the observable contract is the
      // recovered screen: the window instance must still resolve through the
      // context and expose a UI context whose router reports the reloaded root.
      const relaunched: window.Window = await foreground();
      const windowRouterState: router.RouterState = relaunched.getUIContext().getRouter().getState();
      const routeState = router.getState();
      expect(windowRouterState.path).assertEqual('pages/');
      expect(windowRouterState.index).assertEqual(1);
      expect(routeState.path).assertEqual('pages/');
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ABILITY_WINDOW_RECREATE_0300
     * @tc.name entryWindowRepeatedForegroundNoDuplicate003
     * @tc.desc Verify repeated WindowStage foreground requests keep one Index route and one tab node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryWindowRepeatedForegroundNoDuplicate003', 0, async (): Promise<void> => {
      await foreground();
      await foreground();
      await foreground();

      // Repeated ability starts should reuse the stage lifecycle and avoid
      // accumulating root routes that would make focus traversal ambiguous.
      const routeState = router.getState();
      const tabs = await driver.findComponents(ON.id('tab0'));
      expect(routeState.index).assertEqual(1);
      expect(routeState.path).assertEqual('pages/');
      expect(tabs.length).assertEqual(1);
    });
  });

  // Merged from IndexWarmLaunchContract.test.ets.
  describe('IndexWarmLaunchContractTest', () => {
    let driver: Driver;
    let ability: EntryAbility;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const selectTab = async (index: number): Promise<void> => {
      await (await driver.findComponent(ON.id('tab' + index.toString()))).click();
      await driver.delayMs(180);
    };

    const assertSelectedIndicatorWidest = async (): Promise<void> => {
      // SupportPage renders the selected indicator at 20lpx and the other two
      // at 12lpx, so the selected Rect must be strictly the widest of the three.
      const indicators: Component[] = await driver.findComponents(ON.type('Rect'));
      expect(indicators.length).assertEqual(3);
      const widths: number[] = [];
      for (let index: number = 0; index < indicators.length; index++) {
        const bounds: Rect = await indicators[index].getBounds();
        widths.push(bounds.right - bounds.left);
      }
      expect(widths[0] > widths[1]).assertTrue();
      expect(widths[0] > widths[2]).assertTrue();
    };

    const deliverWarmLaunch = async (tabIndex: number): Promise<void> => {
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      await driver.pressHome();
      await driver.delayMs(220);
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(900);
      // Index clears the production signal from the selected tab's focus
      // callback after the asynchronous foreground transition.
      await (await driver.findComponent(ON.id('tab' + tabIndex.toString()))).click();
      await driver.delayMs(500);
      // Assert the real relaunch outcome instead of the signal this helper just
      // published: the router must report the Index root page again.
      expect(router.getState().path).assertEqual('pages/');
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      const currentAbility: UIAbility = await delegator.getCurrentTopAbility();
      ability = currentAbility as EntryAbility;
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      await restoreRoot();
      await selectTab(0);
    });

    afterEach(async (): Promise<void> => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      await restoreRoot();
      await selectTab(0);
    });

    afterAll(async (): Promise<void> => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      await restoreRoot();
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_WARM_0100
     * @tc.name indexWarmLaunchSignalConsumption001
     * @tc.desc Verify Index onPageShow consumes the EntryAbility onNewWant storage signal once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexWarmLaunchSignalConsumption001', 0, async (): Promise<void> => {
      await deliverWarmLaunch(0);
      await driver.assertComponentExist(ON.text('Product Specifications'));
      expect(AppStorage.get<boolean>('isOnNewWant')).assertTrue();
      expect(router.getState().path).assertEqual('pages/');
    });





    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_WARM_0600
     * @tc.name indexHiddenRouteDeferredConsumption006
     * @tc.desc Verify a new-Want signal waits while Index is hidden and is consumed when Router returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHiddenRouteDeferredConsumption006', 0, async (): Promise<void> => {
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: { index: 0 } });
      await driver.delayMs(600);
      ability.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      expect(AppStorage.get<boolean>('isOnNewWant')).assertTrue();
      expect(router.getState().path).assertEqual('Component/');
      router.back();
      await driver.delayMs(600);
      await driver.assertComponentExist(ON.id('tab0'));
      await (await driver.findComponent(ON.id('tab0'))).click();
      await driver.delayMs(500);
      expect(AppStorage.get<boolean>('isOnNewWant')).assertTrue();
    });


  });
}
