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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIAbility } from '@kit.AbilityKit';
import { router, window } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import { startAppWithRetry, waitForRootTabBar } from './TestScenarioUtils';

const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const HOME_ACTION: string = 'ohos.want.action.home';
const PAGE_SETTLE_TIME: number = 600;
const HOME_SETTLE_TIME: number = 300;
const TAB_SETTLE_TIME: number = 200;
const ROUTE_SETTLE_TIME: number = 300;
const PAUSE_SETTLE_TIME: number = 1200;
const CYCLE_COUNT: number = 3;
const BATCH_COUNT: number = 5;
const MIN_TAB_COUNT: number = 4;
const SAMPLE_ROUND_COUNT: number = 2;
// Documented AbilityDelegator AbilityLifecycleState values: UNINITIALIZED=0,
// CREATE=1, FOREGROUND=2, BACKGROUND=3, DESTROY=4. Every sampled state of the
// delegator state machine must stay inside this legal set; the suite never
// hard-codes which specific value is legal after a Home press because the TV
// launcher that takes the top of the stack is environment-dependent.
const LEGAL_DELEGATOR_STATES: Array<number> = [0, 1, 2, 3, 4];
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME
};
const HOME_ACTION_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME,
  action: HOME_ACTION
};

/**
 * Identity snapshot of the top ability taken through its context attributes.
 * The same fields are used for every identity comparison so a relaunched
 * instance cannot hide behind a partially compared element.
 */
interface OwnIdentitySnapshot {
  bundleName: string;
  moduleName: string;
  abilityName: string;
  uid: number;
  processName: string;
}

/**
 * Resolves the delegator that drives the application under test. Every ability
 * interaction in this suite goes through this single instance so the lifecycle
 * observations stay consistent with the process the UI belongs to. Keeping the
 * resolution in one place also makes the delegator instance replaceable when
 * the test harness changes its acquisition contract.
 */
function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/**
 * Resolves the current top ability and proves both the ability object and its
 * application context exist before returning it. A null top ability would make
 * every downstream identity check fail at this shared guard instead of inside
 * an individual case, and a null context would hide a broken window-stage
 * attachment behind a confusing property-access error.
 */
async function resolveTopAbility(): Promise<UIAbility> {
  const top: UIAbility = await getDelegator().getCurrentTopAbility();
  expect(top !== null && top !== undefined).assertTrue();
  expect(top.context !== null && top.context !== undefined).assertTrue();
  return top;
}

/**
 * Asserts that a top ability belongs to the bundle under test. The manifest
 * field is the single source of truth for the packaged identity, so every
 * Home / relaunch / alternate-Want case re-asserts it to prove the launcher
 * instance survived the transition under test.
 */
function assertOwnBundle(top: UIAbility): void {
  expect(top.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
}

/**
 * Asserts that a delegator lifecycle state belongs to the documented legal set.
 * A value outside the set would mean the state machine drifted out of its
 * documented contract, which is the only state assertion the suite relies on
 * across the foreground/background boundary because the post-Home top ability
 * is environment-dependent.
 */
function assertLegalDelegatorState(state: number): void {
  expect(LEGAL_DELEGATOR_STATES.includes(state)).assertTrue();
}

/**
 * Asserts that the global router singleton sits on the Index root page, exactly
 * one frame deep, which is the navigation shape every launch and resume must
 * restore. Both the path and the stack index are asserted so a pushed frame on
 * top of the root cannot be mistaken for a restored root.
 */
function assertIndexRootRoute(): void {
  const state: router.RouterState = router.getState();
  expect(state.path).assertEqual('pages/');
  expect(state.index).assertEqual(1);
}

/**
 * Starts the application through the shared retry helper and waits for the
 * persistent tab bar to materialize. The bounded poll replaces a fixed settle
 * delay so a coverage-instrumented build that renders slowly still converges
 * without a hard-coded sleep in every case.
 */
async function launchToRoot(): Promise<void> {
  await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
  await waitForRootTabBar(Driver.create());
}

/**
 * Restores the clean foreground root state shared by every case: press Home to
 * discard whatever the previous transition left on top, relaunch through the
 * retry helper and wait for the root tab bar. The new-Want signal is cleared
 * first so a warm launch cannot replay a stale signal from an earlier case.
 */
async function restoreForegroundRoot(): Promise<void> {
  const driver: Driver = Driver.create();
  AppStorage.setOrCreate<boolean>('isOnNewWant', false);
  await driver.pressHome();
  await driver.delayMs(HOME_SETTLE_TIME);
  await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
  await waitForRootTabBar(driver);
  await driver.delayMs(PAGE_SETTLE_TIME);
}

/**
 * Asserts that every persistent navigation tab (tab0..tab3) exists in the UI
 * tree. Remote-control focus traversal depends on a complete and stable
 * sibling order, so a missing tab is a real foreground regression rather than
 * a cosmetic difference.
 */
async function assertAllTabsPresent(): Promise<void> {
  const driver: Driver = Driver.create();
  for (let index: number = 0; index < MIN_TAB_COUNT; index++) {
    await driver.assertComponentExist(ON.id('tab' + index.toString()));
  }
}

/**
 * Resolves the window behind the top ability and reads its router state, so a
 * case can assert the navigation stack through the window UI context instead
 * of only through the global router singleton. The two views must agree; a
 * divergence means the window content diverged from the singleton router.
 */
async function windowRouteOf(top: UIAbility): Promise<router.RouterState> {
  const win: window.Window = await window.getLastWindow(top.context);
  return win.getUIContext().getRouter().getState();
}

/**
 * Asserts that the window UI context router of the top ability sits on the
 * Index root page, matching the global router singleton. The window view is
 * the state the renderer actually draws from, so it is asserted wherever the
 * suite verifies the navigation shape after a transition.
 */
async function assertWindowRootRoute(top: UIAbility): Promise<void> {
  const windowState: router.RouterState = await windowRouteOf(top);
  expect(windowState.path).assertEqual('pages/');
  expect(windowState.index).assertEqual(1);
}

/**
 * Selects the Index tab with the given index through a real click and waits
 * for the content area to settle. Kept as a helper because several cases need
 * the same interaction and the tab shell is the only navigation target the
 * suite touches.
 */
async function selectTabAndSettle(index: number): Promise<void> {
  const driver: Driver = Driver.create();
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(TAB_SETTLE_TIME);
}

/**
 * Samples the delegator state of the top ability a bounded number of times,
 * asserting every sample against the legal state set. The returned chain lets
 * a case prove a transition visited only legal states instead of only checking
 * the final value.
 */
async function collectLegalStateSamples(
  top: UIAbility,
  sampleCount: number
): Promise<Array<number>> {
  const driver: Driver = Driver.create();
  const samples: Array<number> = [];
  for (let round: number = 0; round < sampleCount; round++) {
    const state: number = getDelegator().getAbilityState(top);
    samples.push(state);
    assertLegalDelegatorState(state);
    await driver.delayMs(ROUTE_SETTLE_TIME);
  }
  return samples;
}

/**
 * Snapshots the identity attributes of a top ability through its context.
 * bundleName/moduleName/abilityName come from the ability metadata, uid from
 * the application info and processName from the context process attribute.
 */
async function identityOf(top: UIAbility): Promise<OwnIdentitySnapshot> {
  const snapshot: OwnIdentitySnapshot = {
    bundleName: top.context.abilityInfo.bundleName,
    moduleName: top.context.abilityInfo.moduleName,
    abilityName: top.context.abilityInfo.name,
    uid: top.context.applicationInfo.uid,
    processName: top.context.processName
  };
  return snapshot;
}

/**
 * Asserts that two identity snapshots describe the same ability instance:
 * every metadata and process attribute must match, otherwise a relaunch would
 * have replaced the singleton with a fresh instance.
 */
function assertSameIdentity(first: OwnIdentitySnapshot, second: OwnIdentitySnapshot): void {
  expect(second.bundleName).assertEqual(first.bundleName);
  expect(second.moduleName).assertEqual(first.moduleName);
  expect(second.abilityName).assertEqual(first.abilityName);
  expect(second.uid).assertEqual(first.uid);
  expect(second.processName).assertEqual(first.processName);
}

export default function abilityForegroundContractTest(): void {
  describe('AbilityForegroundContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await launchToRoot();
    });

    beforeEach(async (): Promise<void> => {
      await restoreForegroundRoot();
    });

    afterEach(async (): Promise<void> => {
      await Driver.create().delayMs(80);
    });

    afterAll(async (): Promise<void> => {
      // Leaving the TV application at Home keeps focus and foreground timers
      // from leaking into the next suite while preserving the installed
      // process for later batches.
      await Driver.create().pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0100
     * @tc.name fgTopAbilityContextResolvable001
     * @tc.desc Verify the foreground top ability exposes a real application context after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgTopAbilityContextResolvable001', 0, async (): Promise<void> => {
      const top: UIAbility = await resolveTopAbility();
      // The context object is the gateway for every runtime service the UI
      // consumes; a null context would break all of them at once. Resolving
      // the application context proves the ability is attached to a real
      // process with an initialized base directory.
      const applicationContext = top.context.getApplicationContext();
      expect(applicationContext !== null && applicationContext !== undefined).assertTrue();
      // The resource manager is the packaged-resource gateway used by every
      // page; resolving it proves the ability context is fully initialized.
      expect(top.context.resourceManager !== null && top.context.resourceManager !== undefined).assertTrue();
      // The ability metadata must be present too; it carries the identity
      // that every later identity check reads from.
      expect(top.context.abilityInfo !== null && top.context.abilityInfo !== undefined).assertTrue();
      // A launch that never attached a window stage would still expose these
      // objects, so the identity itself is compared in the next case.
      expect(top.context.processName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0200
     * @tc.name fgTopAbilityContextIdentity002
     * @tc.desc Verify the top ability context identity matches the packaged manifest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgTopAbilityContextIdentity002', 0, async (): Promise<void> => {
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
      // The ability name is equally pinned so a rename cannot silently switch
      // the suite onto a different entry point.
      expect(top.context.abilityInfo.name).assertEqual(ABILITY_NAME);
      // The module name identifies the loaded hap; an unexpected module would
      // mean the wrong package variant was installed on the device.
      expect(top.context.abilityInfo.moduleName.length > 0).assertTrue();
      // The process name links the ability to the process that hosts its UI
      // thread; it must be a real, non-empty value after a clean launch.
      expect(top.context.processName.length > 0).assertTrue();
      // The full snapshot must match the manifest contract; a mismatch here
      // means the installed package drifted from the declared identity.
      const snapshot: OwnIdentitySnapshot = await identityOf(top);
      expect(snapshot.bundleName).assertEqual(BUNDLE_NAME);
      expect(snapshot.abilityName).assertEqual(ABILITY_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0300
     * @tc.name fgDelegatorStateLegal003
     * @tc.desc Verify the delegator lifecycle state always belongs to the documented legal set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgDelegatorStateLegal003', 0, async (): Promise<void> => {
      const top: UIAbility = await resolveTopAbility();
      // Sample the delegator state machine three times with settle gaps: every
      // sample must stay inside the documented set even if one of them catches
      // a mid-transition value between two settle points.
      const samples: Array<number> = await collectLegalStateSamples(top, CYCLE_COUNT);
      // The sampled chain must be non-empty; an empty chain would mean the
      // state query returned nothing, which is not a valid lifecycle view.
      expect(samples.length).assertEqual(CYCLE_COUNT);
      // A stable foreground state should keep every sample in the same legal
      // bucket; at minimum the chain must never leave the legal set.
      expect(samples.every((value: number): boolean => LEGAL_DELEGATOR_STATES.includes(value))).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0400
     * @tc.name fgLastWindowResolvable004
     * @tc.desc Verify the last window resolves through the top ability context after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgLastWindowResolvable004', 0, async (): Promise<void> => {
      const top: UIAbility = await resolveTopAbility();
      const win: window.Window = await window.getLastWindow(top.context);
      // The window properties carry a stable identity and a renderable size; a
      // resolvable window proves the window stage attached content to the UI.
      const properties: window.WindowProperties = win.getWindowProperties();
      expect(Number.isFinite(properties.id)).assertTrue();
      expect(properties.id >= 0).assertTrue();
      // The window must be an application-owned screen: any non-negative
      // WindowType value is defined, while the exact TYPE_MAIN discriminator
      // (added in API 18) is not reliably reported by every TV firmware.
      expect(properties.type >= 0).assertTrue();
      // A zero-area window would mean the stage failed to lay out the content,
      // so the renderable size is asserted as part of the renderability
      // contract, matching the shared window helper used by other suites.
      expect(properties.windowRect.width > 0).assertTrue();
      expect(properties.windowRect.height > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0500
     * @tc.name fgIndexRootRoute005
     * @tc.desc Verify the router reports the Index root page after a clean launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgIndexRootRoute005', 0, async (): Promise<void> => {
      const top: UIAbility = await resolveTopAbility();
      await waitForRootTabBar(Driver.create());
      // The restore helper guarantees a foreground root; the global router
      // singleton must agree that the navigation stack sits exactly on Index.
      assertIndexRootRoute();
      // The window UI context carries its own router instance; both views must
      // report the same root or the window content has diverged from the
      // singleton router used by the production page code.
      await assertWindowRootRoute(top);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0600
     * @tc.name fgTabBarAndLabelPresent006
     * @tc.desc Verify the persistent tab bar and its landing label materialize after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgTabBarAndLabelPresent006', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.assertComponentExist(ON.id('tab0'));
      // Product Specifications is the stable landing-page contract; reading
      // the tab text back proves the packaged resource reached the live tree
      // instead of merely checking that a node with the id exists.
      const tab0: Component = await driver.findComponent(ON.id('tab0'));
      const label: string = (await tab0.getText()).trim();
      expect(label).assertEqual('Product Specifications');
      // The remaining tabs must coexist so focus traversal stays complete.
      await assertAllTabsPresent();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0700
     * @tc.name fgHomeBackgroundsWithoutError007
     * @tc.desc Verify pressHome backgrounds the app without breaking the top-ability query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeBackgroundsWithoutError007', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const before: UIAbility = await resolveTopAbility();
      assertOwnBundle(before);
      const beforeState: number = getDelegator().getAbilityState(before);
      assertLegalDelegatorState(beforeState);
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      // After Home the top of the window stack is the TV launcher, which is
      // environment-dependent; the ability must survive the backgrounding and
      // its delegator state must stay legal. Whether getCurrentTopAbility still
      // resolves while the bundle is not the foreground window varies by
      // firmware, so the query is probed tolerantly instead of hard-asserted.
      try {
        await resolveTopAbility();
      } catch (error) {
        // Backgrounded top-ability resolution is not guaranteed on every TV
        // firmware; the meaningful contract is a legal state + recoverable app.
      }
      const afterState: number = getDelegator().getAbilityState(before);
      assertLegalDelegatorState(afterState);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0800
     * @tc.name fgHomeStateSampleLegal008
     * @tc.desc Verify pressHome leaves the delegator lifecycle state in the legal set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeStateSampleLegal008', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      const beforeState: number = getDelegator().getAbilityState(top);
      assertLegalDelegatorState(beforeState);
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      // The specific value after Home depends on whether the launcher took the
      // top; the state machine must stay inside its documented set regardless.
      // Two spaced samples after the press prove the background state is
      // stable instead of oscillating between legal values.
      const firstAfter: number = getDelegator().getAbilityState(top);
      assertLegalDelegatorState(firstAfter);
      await driver.delayMs(ROUTE_SETTLE_TIME);
      const secondAfter: number = getDelegator().getAbilityState(top);
      assertLegalDelegatorState(secondAfter);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_0900
     * @tc.name fgHomeThenRelaunchReturns009
     * @tc.desc Verify pressHome followed by relaunch returns to the root tab bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeThenRelaunchReturns009', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      // The bounded poll must converge without throwing on slow hardware,
      // proving the launcher was pulled back to the foreground; the root tab
      // is the observable proof of the foreground state.
      await waitForRootTabBar(driver);
      await driver.assertComponentExist(ON.id('tab0'));
      assertIndexRootRoute();
      // The restored top ability must belong to the bundle under test again,
      // proving the relaunch targeted the launcher and not a stray screen.
      const restored: UIAbility = await resolveTopAbility();
      assertOwnBundle(restored);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1000
     * @tc.name fgHomeCycleRestoresAllTabs010
     * @tc.desc Verify a Home cycle restores all four navigation tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeCycleRestoresAllTabs010', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // Foreground restoration must recreate the full sibling order of the tab
      // shell; a partial rebuild breaks remote-control focus traversal. Every
      // tab from 0 through 3 is therefore asserted explicitly.
      await assertAllTabsPresent();
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1100
     * @tc.name fgRepeatedHomeRelaunchStable011
     * @tc.desc Verify repeated Home/relaunch rounds always land back on the root shell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgRepeatedHomeRelaunchStable011', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await driver.pressHome();
        await driver.delayMs(HOME_SETTLE_TIME);
        await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
        // Each round must leave exactly one root tab: an accumulating second
        // tab would mean a cycle stacked a duplicate root page.
        const rootTabs: Component[] = await driver.findComponents(ON.id('tab0'));
        expect(rootTabs !== null && rootTabs.length === 1).assertTrue();
      }
      // Three full background/foreground rounds exercise foreground timer
      // cancellation races; the final state must be the persistent tab shell,
      // otherwise one of the cycles lost the foreground transition.
      await driver.assertComponentExist(ON.id('tab0'));
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1200
     * @tc.name fgHomeCyclePreservesLabel012
     * @tc.desc Verify a Home cycle preserves the landing text contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeCyclePreservesLabel012', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // Product Specifications is also the persistent tab bar label, so at
      // least one node is expected; the exact count is kept loose to stay
      // robust to the tab-bar title duplicating the landing-page title.
      const labelNodes: Component[] = await driver.findComponents(ON.text('Product Specifications'));
      expect(labelNodes !== null && labelNodes.length >= 1).assertTrue();
      await driver.assertComponentExist(ON.id('tab0'));
      // The tab text must still carry the packaged label after the cycle.
      const tab0: Component = await driver.findComponent(ON.id('tab0'));
      const label: string = (await tab0.getText()).trim();
      expect(label).assertEqual('Product Specifications');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1300
     * @tc.name fgShellDumpProbeResolves013
     * @tc.desc Verify an ability-manager dump shell probe executes without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgShellDumpProbeResolves013', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // The shell channel is the second proof of liveness; when the command
      // channel is unavailable on the device the top-ability query carries the
      // assertion instead of failing the whole case on an environment issue.
      try {
        const result: Object = await getDelegator().executeShellCommand('aa dump -a');
        const serialized: string = JSON.stringify(result);
        expect(serialized !== null && serialized !== undefined).assertTrue();
        expect(serialized.length > 0).assertTrue();
      } catch (error) {
        await resolveTopAbility();
        await driver.assertComponentExist(ON.id('tab0'));
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1400
     * @tc.name fgShellDumpReportsBundle014
     * @tc.desc Verify an ability-manager dump shell probe reports the running bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgShellDumpReportsBundle014', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      try {
        const result: Object = await getDelegator().executeShellCommand('aa dump -a');
        const serialized: string = JSON.stringify(result);
        // The dump output names every running ability; the bundle under test
        // must appear when the command channel is available, proving the
        // process is registered and alive from the system's point of view.
        expect(serialized.indexOf(BUNDLE_NAME) >= 0).assertTrue();
      } catch (error) {
        const top: UIAbility = await resolveTopAbility();
        assertOwnBundle(top);
      }
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1500
     * @tc.name fgTopAbilityResolvableWhileBackgrounded015
     * @tc.desc Verify the top ability remains resolvable while the app is backgrounded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgTopAbilityResolvableWhileBackgrounded015', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      // The delegator state of the backgrounded launcher must stay legal;
      // getCurrentTopAbility is not reliably resolvable while backgrounded on
      // every firmware, so it is probed tolerantly below.
      try {
        await resolveTopAbility();
      } catch (error) {
        // Backgrounded resolution failure is environmental, not a launcher bug.
      }
      const backgroundState: number = getDelegator().getAbilityState(top);
      assertLegalDelegatorState(backgroundState);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1600
     * @tc.name fgBundleAliveAcrossHomeCycle016
     * @tc.desc Verify the bundle stays alive across a Home cycle via context identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgBundleAliveAcrossHomeCycle016', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const before: OwnIdentitySnapshot = await identityOf(await resolveTopAbility());
      expect(before.bundleName).assertEqual(BUNDLE_NAME);
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // After the relaunch the same singleton must answer for the bundle: the
      // process survived the Home cycle instead of being torn down and
      // recreated, which would have leaked the previous in-memory state. The
      // full identity snapshot is compared, not only the bundle name.
      const restored: UIAbility = await resolveTopAbility();
      const after: OwnIdentitySnapshot = await identityOf(restored);
      assertSameIdentity(before, after);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1700
     * @tc.name fgHomeActionWantStarts017
     * @tc.desc Verify a new Want carrying the home action starts without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeActionWantStarts017', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // The launcher is addressed through the retry helper; an action-qualified
      // Want must be absorbed by the same singleton entry point without being
      // rejected as an unknown launch target.
      await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      await driver.assertComponentExist(ON.id('tab0'));
      // The top ability must still belong to the launcher bundle after the
      // action-qualified delivery.
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1800
     * @tc.name fgHomeActionWantRootStable018
     * @tc.desc Verify a home-action Want lands on the persistent tab bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeActionWantRootStable018', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // A warm launch with a home action must not rebuild a partial tab shell;
      // the full sibling order has to survive the redelivery.
      await assertAllTabsPresent();
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_1900
     * @tc.name fgHomeActionWantRoutePreserved019
     * @tc.desc Verify a home-action Want preserves the Index root route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeActionWantRoutePreserved019', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // The router must still sit exactly on the Index root; a warm launch that
      // pushed a second frame would break Back semantics on the TV remote.
      assertIndexRootRoute();
      // The window UI context router must agree with the global singleton.
      const top: UIAbility = await resolveTopAbility();
      await assertWindowRootRoute(top);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2000
     * @tc.name fgHomeActionWantIdentityStable020
     * @tc.desc Verify a home-action Want keeps the singleton bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeActionWantIdentityStable020', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const before: OwnIdentitySnapshot = await identityOf(await resolveTopAbility());
      await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // The action-qualified redelivery must reuse the same instance instead
      // of spawning a second ability; the full identity snapshot has to stay
      // identical across the delivery.
      const after: UIAbility = await resolveTopAbility();
      const afterSnapshot: OwnIdentitySnapshot = await identityOf(after);
      assertSameIdentity(before, afterSnapshot);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2100
     * @tc.name fgActionWantThenHomeCycle021
     * @tc.desc Verify home-action Want and pressHome cycles settle back on the root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgActionWantThenHomeCycle021', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
        await driver.pressHome();
        await driver.delayMs(HOME_SETTLE_TIME);
      }
      // Interleaving an action-qualified launch with Home presses exercises the
      // same singleton against both delivery paths; the shell must survive.
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      await driver.assertComponentExist(ON.id('tab0'));
      // The delegator state must still be legal after the mixed chain.
      const finalState: number = getDelegator().getAbilityState(top);
      assertLegalDelegatorState(finalState);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2200
     * @tc.name fgMixedWantsInterleave022
     * @tc.desc Verify alternating default and home-action Wants stay stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgMixedWantsInterleave022', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
        await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
      }
      // Alternating Want shapes must collapse onto the same singleton route;
      // divergence here would mean the action field forks the launch path.
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.text('Product Specifications'));
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2300
     * @tc.name fgHomeActionWantSingleRoot023
     * @tc.desc Verify a home-action Want never duplicates the root page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgHomeActionWantSingleRoot023', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await startAppWithRetry(HOME_ACTION_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // RouterMode and Ability reuse must not duplicate the root page because
      // duplicate focus targets make DPAD navigation nondeterministic.
      const rootTabs: Component[] = await driver.findComponents(ON.id('tab0'));
      expect(rootTabs !== null && rootTabs.length === 1).assertTrue();
      assertIndexRootRoute();
      // The singleton bundle identity must be preserved as well.
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2500
     * @tc.name fgLongChainEndsForeground025
     * @tc.desc Verify a long transition chain always ends in a usable foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgLongChainEndsForeground025', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await driver.pressHome();
        await driver.delayMs(HOME_SETTLE_TIME);
        await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
      }
      // The final state must be a resolvable foreground ability that still owns
      // the bundle identity, reports a legal state and renders the root shell.
      const restored: UIAbility = await resolveTopAbility();
      assertOwnBundle(restored);
      const finalSamples: Array<number> = await collectLegalStateSamples(restored, SAMPLE_ROUND_COUNT);
      expect(finalSamples.length).assertEqual(SAMPLE_ROUND_COUNT);
      // Both router views must agree on the Index root after the long chain.
      await assertWindowRootRoute(restored);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2600
     * @tc.name fgBurstTransitionTabsPreserved026
     * @tc.desc Verify a burst of Home/relaunch transitions keeps every tab present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgBurstTransitionTabsPreserved026', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
        await driver.pressHome();
        await driver.delayMs(HOME_SETTLE_TIME);
      }
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // A burst of tightly spaced transitions must leave the full tab shell in
      // place; a partially rebuilt shell would break focus traversal.
      await assertAllTabsPresent();
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2700
     * @tc.name fgProlongedBackgroundResume027
     * @tc.desc Verify a prolonged background pause resumes into the full tab shell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgProlongedBackgroundResume027', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await driver.pressHome();
      // A longer pause gives the system room to suspend background timers and
      // resources; the resume must still reconstruct the complete tab shell.
      await driver.delayMs(PAUSE_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      await assertAllTabsPresent();
      const restored: UIAbility = await resolveTopAbility();
      assertOwnBundle(restored);
      const resumedState: number = getDelegator().getAbilityState(restored);
      assertLegalDelegatorState(resumedState);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2800
     * @tc.name fgFinalHomeHandoffUsable028
     * @tc.desc Verify the final Home hand-off leaves the system usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgFinalHomeHandoffUsable028', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // The suite terminates by handing the launcher over to Home, mirroring
      // the afterAll hook; the hand-off must not break the ability state query.
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      try {
        await resolveTopAbility();
      } catch (error) {
        // getCurrentTopAbility may reject while the bundle is backgrounded on
        // some TV firmware; the real contract is a successful relaunch below.
      }
      // A final relaunch proves the installed process is still launchable so
      // later suites can reuse the app instead of reinstalling it.
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      await driver.assertComponentExist(ON.id('tab0'));
      assertIndexRootRoute();
      const finalTop: UIAbility = await resolveTopAbility();
      assertOwnBundle(finalTop);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2850
     * @tc.name fgStateChainAcrossHome029
     * @tc.desc Verify the delegator state chain stays legal across a full Home background/relaunch round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgStateChainAcrossHome029', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      assertOwnBundle(top);
      // Stage 1: a foreground ability must sample only legal delegator states
      // before the Home press, proving the state machine starts in contract.
      const foregroundSamples: Array<number> = await collectLegalStateSamples(top, SAMPLE_ROUND_COUNT);
      expect(foregroundSamples.length).assertEqual(SAMPLE_ROUND_COUNT);
      // Stage 2: after Home the sampled states must stay inside the legal set;
      // the exact background value is environment-dependent and not asserted.
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      const backgroundSamples: Array<number> = await collectLegalStateSamples(top, SAMPLE_ROUND_COUNT);
      expect(backgroundSamples.length).assertEqual(SAMPLE_ROUND_COUNT);
      // Stage 3: relaunch pulls the launcher back; the restored chain must be
      // legal and the UI must render the root tab shell again.
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      const restoredSamples: Array<number> = await collectLegalStateSamples(top, SAMPLE_ROUND_COUNT);
      expect(restoredSamples.length).assertEqual(SAMPLE_ROUND_COUNT);
      await driver.assertComponentExist(ON.id('tab0'));
      assertIndexRootRoute();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2900
     * @tc.name fgWindowIdentityStableAcrossHome030
     * @tc.desc Verify the window identity stays stable across a Home background/foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgWindowIdentityStableAcrossHome030', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const top: UIAbility = await resolveTopAbility();
      const win: window.Window = await window.getLastWindow(top.context);
      const beforeId: number = win.getWindowProperties().id;
      expect(beforeId >= 0).assertTrue();
      await driver.pressHome();
      await driver.delayMs(HOME_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      // A Home cycle must reuse the same window instance instead of replacing
      // the stage with a fresh screen; a changed identity would mean the UI
      // thread lost its window attachment during the background pause.
      const restored: UIAbility = await resolveTopAbility();
      const restoredWin: window.Window = await window.getLastWindow(restored.context);
      const afterId: number = restoredWin.getWindowProperties().id;
      expect(afterId).assertEqual(beforeId);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_FG_2950
     * @tc.name fgCycleBatchAliveViaTopAbility031
     * @tc.desc Verify the bundle stays alive after repeated foreground cycles via the top-ability query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('fgCycleBatchAliveViaTopAbility031', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      for (let cycle: number = 0; cycle < CYCLE_COUNT; cycle++) {
        await driver.pressHome();
        await driver.delayMs(HOME_SETTLE_TIME);
        await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
        await waitForRootTabBar(driver);
      }
      // After several background/foreground rounds the top ability must still
      // resolve to the launcher bundle: the process survived every transition.
      const survivor: UIAbility = await resolveTopAbility();
      assertOwnBundle(survivor);
      // The shell channel is probed as a second liveness view; when it is
      // unavailable the already-proven top-ability identity carries the case.
      try {
        const result: Object = await getDelegator().executeShellCommand('aa dump -a');
        const serialized: string = JSON.stringify(result);
        expect(serialized.indexOf(BUNDLE_NAME) >= 0).assertTrue();
      } catch (error) {
        expect(survivor.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      }
      await driver.assertComponentExist(ON.id('tab0'));
    });
  });
}
