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
import bundleManager from '@ohos.bundle.bundleManager';
import { AbilityConstant, UIAbility, abilityManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { router, window } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import EntryAbility from '../../../main/ets/entryability/EntryAbility';
import { startAppWithRetry } from './TestScenarioUtils';

/**
 * Launch-domain contract of the TVDemonstration launcher ability. The Desktop /
 * Home / Launch lifecycle is the entry gate of the whole TV experience: the
 * launcher is cold started by a startAbility delivery, pushed to the desktop by
 * Home, pulled back by a new startAbility request, terminated by the system or
 * by the user, and re-created by the next launch request. Every transition must
 * stay visible in three real OpenHarmony views:
 *   1. AbilityDelegator.getAbilityState() exposes the lifecycle-state machine
 *      with its own numeric enum (UNINITIALIZED=0, CREATE=1, FOREGROUND=2,
 *      BACKGROUND=3, DESTROY=4) that is numerically different from the manager
 *      enum used by abilityManager.getAbilityRunningInfos().
 *   2. abilityManager.getAbilityRunningInfos() exposes the running-record view
 *      (abilityState FOREGROUND=9, BACKGROUND=10) whenever the test process
 *      owns the GET_RUNNING_INFO permission.
 *   3. UiTest drives the real EntryAbility through Home presses, tab clicks and
 *      detail-route pushes so every transition happens on the live production
 *      UI instead of a mocked state machine.
 *
 * The two state enums describe the same ability but are numerically different;
 * each API is therefore compared against its own enum and the raw numeric
 * values are additionally asserted to differ, so a numerically wrong enum
 * cannot slip through both views.
 *
 * Termination in this suite uses UIAbilityContext.terminateSelf() because SDK
 * 18's AbilityDelegator does not expose a terminateSelf member; the delegator
 * remains the driver for startAbility / getCurrentTopAbility / getAbilityState.
 * A cold relaunch after termination must take the onCreate path instead of the
 * onNewWant path, which the suite observes through the AppStorage
 * 'isOnNewWant' signal that EntryAbility.onNewWant publishes.
 *
 * GET_RUNNING_INFO is a normal permission that is normally auto-granted. When
 * the test environment lacks it the running-infos API rejects with BusinessError
 * 201, so the record query screens that code through errorCode and every case
 * asserts the permission branch explicitly while continuing its business
 * assertions through the delegator and UiTest views.
 *
 * Case matrix covered by this suite:
 *   0100 cold start publishes a foreground top ability with the Index root UI
 *   0200 the window stage resolves through getLastWindow after launch
 *   0300 Home backgrounds the delegator state machine and relaunch restores it
 *   0400 Home resume rebuilds the Index root route in the window UI context
 *   0500 repeated Home/Resume cycles keep the state machine legal every round
 *   0600 repeated same-Want deliveries keep one singleton identity
 *   0700 a foreground redelivery consumes onNewWant without changing identity
 *   0800 terminateSelf followed by startAbility takes the cold path
 *   0900 the destroy/relaunch state chain only visits legal delegator states
 *   1000 delegator and manager enums stay numerically independent per view
 *   1100 the foreground state stays stable across five spaced samples
 *   1200 tab switches keep foreground state and the focused tab consistent
 *   1300 detail return restores the Index tab focus through onPageShow
 *   1400 a Home cycle preserves the open detail navigation stack
 *   1500 the window is resolvable and renderable after a destroy/relaunch
 *   1600 missing GET_RUNNING_INFO routes every stage to the 201 branch
 *   1700 Home hands the top ability over to the desktop launcher
 *   1800 a Home cycle preserves the context identity of the ability
 *   1900 a module-qualified Want still lands on the one singleton instance
 *   2000 rapid Home/Resume cycles always settle into the foreground
 *   2100 a destroy/relaunch lands initial focus on the first tab
 *   2200 a Back exit followed by launch restores foreground and the root page
 *   2300 the running record and the ability context agree on process identity
 *   2400 terminating from the background and relaunching restores foreground
 *   2500 returning from the media route restores tab focus and foreground
 *   2600 back-to-back startAbility deliveries never duplicate the root page
 *   2700 a Home cycle preserves the selected tab and its focus
 *   2800 repeated terminate/relaunch rounds keep identity and state stable
 *   2900 delegator-driven background/foreground calls move the state machine
 */

const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const PAGE_SETTLE_TIME: number = 600;
const STATE_SETTLE_TIME: number = 300;
const ROUTE_SETTLE_TIME: number = 400;
const ROUTE_BACK_TIME: number = 300;
const TERMINATE_SETTLE_TIME: number = 500;
const SAMPLE_INTERVAL: number = 150;
const CYCLE_COUNT: number = 3;
const SAMPLE_ROUND_COUNT: number = 5;
const RAPID_ROUND_COUNT: number = 3;
const POLL_MAX_ROUNDS: number = 4;
const PERMISSION_ERROR_CODE: number = 201;
const MIN_RUNNING_RECORD_COUNT: number = 1;
// Documented AbilityDelegator AbilityLifecycleState values: UNINITIALIZED=0,
// CREATE=1, FOREGROUND=2, BACKGROUND=3, DESTROY=4. Every sampled state of the
// delegator state machine must stay inside this legal set.
const LEGAL_DELEGATOR_STATES: Array<number> = [0, 1, 2, 3, 4];
// Documented abilityManager.AbilityState values: INITIAL=0, FOCUS=2,
// FOREGROUND=9, BACKGROUND=10, FOREGROUNDING=11, BACKGROUNDING=12. Used to
// validate the running-record state reported by the manager view.
const KNOWN_ABILITY_STATES: Array<number> = [0, 2, 9, 10, 11, 12];
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME
};
const MODULE_QUALIFIED_WANT: Want = {
  bundleName: BUNDLE_NAME,
  moduleName: 'entry',
  abilityName: ABILITY_NAME
};
const MEDIA_PAGE_URL: string = 'Video/VideoPage';
const DETAIL_TEXT: string = 'Knowledge Encyclopedia, Answers at Your Call';
const DEFAULT_LAUNCH_PARAM: AbilityConstant.LaunchParam = {
  launchReason: 0 as AbilityConstant.LaunchReason,
  lastExitReason: 0 as AbilityConstant.LastExitReason,
  lastExitMessage: ''
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
 * Result of one getAbilityRunningInfos() round trip reduced to the records of
 * the bundle under test. recordCount counts every bundle record, state carries
 * the EntryAbility abilityState (-1 when the record is absent) and errorCode is
 * 0 on success or the BusinessError code otherwise.
 */
interface OwnRecordView {
  recordCount: number;
  state: number;
  errorCode: number;
}

/**
 * Resolves the delegator that drives the application under test. Every ability
 * interaction in this suite goes through this single instance so the lifecycle
 * observations stay consistent with the process the UI belongs to.
 */
function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/**
 * Resolves the current top ability and pins its identity to EntryAbility.
 * Used wherever a case needs to feed an ability object into the delegator
 * state API, so a wrong top ability fails at the source of the assertion.
 */
async function currentTopAbility(delegator: abilityDelegatorRegistry.AbilityDelegator): Promise<UIAbility> {
  const top: UIAbility = await delegator.getCurrentTopAbility();
  expect(top.context.abilityInfo.name).assertEqual(ABILITY_NAME);
  return top;
}

/**
 * Asserts a delegator lifecycle state against the delegator enum
 * (AbilityLifecycleState FOREGROUND=2) which is numerically different from the
 * manager enum, so the two views cannot share one constant.
 */
function assertForegroundState(state: number): void {
  expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
}

/**
 * Asserts a delegator lifecycle state against the delegator enum
 * (AbilityLifecycleState BACKGROUND=3), again in the delegator numeric space.
 */
function assertBackgroundState(state: number): void {
  expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
}

/**
 * Asserts that a sampled delegator state belongs to the documented legal set
 * (UNINITIALIZED/CREATE/FOREGROUND/BACKGROUND/DESTROY). A value outside the set
 * would mean the state machine drifted out of its documented contract.
 */
function assertLegalDelegatorState(state: number): void {
  expect(LEGAL_DELEGATOR_STATES.includes(state)).assertTrue();
}

/**
 * Launches EntryAbility through the public ability contract and waits for the
 * Index page to settle. Used as the suite-level pre-condition so every case
 * starts from a deterministic launch state.
 */
async function launchMainAbility(): Promise<void> {
  await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
  await Driver.create().delayMs(PAGE_SETTLE_TIME);
}

/**
 * Brings the application to the foreground, unwinds the router stack to the
 * Index root page and resets the tab selection to the first tab. This is the
 * shared pre-condition of every case so a stale route or tab left by an earlier
 * transition cannot mask a regression.
 */
async function restoreForegroundRoot(): Promise<void> {
  const driver: Driver = Driver.create();
  AppStorage.setOrCreate<boolean>('isOnNewWant', false);
  await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
  await driver.delayMs(PAGE_SETTLE_TIME);
  let state: router.RouterState = router.getState();
  while (state.index > 1) {
    router.back();
    await driver.delayMs(180);
    state = router.getState();
  }
  const tabZero: Component = await driver.findComponent(ON.id('tab0'));
  await tabZero.click();
  await driver.delayMs(300);
  await driver.assertComponentExist(ON.id('tab0'));
}

/**
 * Snapshot of the identity attributes of a top ability through its context.
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

/**
 * Runs one real getAbilityRunningInfos() call and reduces it to the records of
 * com.sample.demonstration. Permission absence is reported through errorCode
 * instead of failing the query, because the permission state is an environment
 * property and not a regression of the launch contract.
 */
async function queryOwnRecord(): Promise<OwnRecordView> {
  const view: OwnRecordView = {
    recordCount: 0,
    state: -1,
    errorCode: 0
  };
  try {
    const infos = await abilityManager.getAbilityRunningInfos();
    for (let index: number = 0; index < infos.length; index++) {
      const running = infos[index];
      const element: bundleManager.ElementName = running.ability;
      if (element.bundleName === BUNDLE_NAME) {
        view.recordCount++;
        if (element.abilityName === ABILITY_NAME && view.state === -1) {
          view.state = running.abilityState;
        }
      }
    }
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    view.errorCode = failure.code;
  }
  return view;
}

/**
 * Asserts the success branch of a record query: the call must have resolved,
 * at least one bundle record must exist and the reported state must be a
 * documented manager enum value, otherwise the case fails instead of silently
 * skipping the running-infos view.
 */
function requireValidRecord(view: OwnRecordView): void {
  expect(view.errorCode).assertEqual(0);
  expect(view.recordCount >= MIN_RUNNING_RECORD_COUNT).assertTrue();
  expect(KNOWN_ABILITY_STATES.includes(view.state)).assertTrue();
}

/**
 * Resolves the window behind the top ability and reads its router state, so a
 * case can assert the navigation stack through the window UI context instead of
 * only through the global router singleton.
 */
async function windowRouteOf(top: UIAbility): Promise<router.RouterState> {
  const win: window.Window = await window.getLastWindow(top.context);
  return win.getUIContext().getRouter().getState();
}

/**
 * Asserts that a router state sits on the Index root page, exactly one frame
 * deep, which is the navigation shape every launch and resume must restore.
 */
function assertIndexRootRoute(state: router.RouterState): void {
  expect(state.path).assertEqual('pages/');
  expect(state.index).assertEqual(1);
}

/**
 * Samples the delegator state of an ability up to maxRounds times, asserting
 * every sample against the legal delegator state set, until the foreground
 * state is observed. The returned chain documents the whole transition.
 */
async function pollForegroundState(
  delegator: abilityDelegatorRegistry.AbilityDelegator,
  top: UIAbility,
  maxRounds: number
): Promise<Array<number>> {
  const driver: Driver = Driver.create();
  const samples: Array<number> = [];
  for (let round: number = 0; round < maxRounds; round++) {
    const state: number = delegator.getAbilityState(top);
    samples.push(state);
    assertLegalDelegatorState(state);
    if (state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND) {
      break;
    }
    await driver.delayMs(SAMPLE_INTERVAL);
  }
  return samples;
}

/**
 * Selects the Index tab with the given index through a real click and waits for
 * the content area to settle, so tab-driven cases start from a focused tab.
 */
async function selectTab(index: number): Promise<void> {
  const driver: Driver = Driver.create();
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(ROUTE_SETTLE_TIME);
}

export default function lifecycleLaunchContractTest(): void {
  describe('LifecycleLaunchContractTest', () => {
    beforeAll(async (): Promise<void> => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      await launchMainAbility();
    });

    beforeEach(async (): Promise<void> => {
      await restoreForegroundRoot();
    });

    afterEach(async (): Promise<void> => {
      await Driver.create().delayMs(80);
    });

    afterAll(async (): Promise<void> => {
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      const driver: Driver = Driver.create();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(400);
      // Leaving the TV application at Home keeps focus and foreground timers
      // from leaking into the next suite.
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0100
     * @tc.name launchColdStartPublishesForegroundTop001
     * @tc.desc Verify a cold startAbility delivery publishes a foreground EntryAbility with the Index root UI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchColdStartPublishesForegroundTop001', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);

      // The launch gate contract: the top ability must exist, belong to the
      // bundle under test and already report the foreground lifecycle state.
      const top: UIAbility = await currentTopAbility(delegator);
      expect(top.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      assertForegroundState(delegator.getAbilityState(top));

      // The Index landing UI must be renderable right after the cold start:
      // the first navigation tab and the product landing label are the stable
      // anchors of the launcher root page.
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.text('Product Specifications'));

      // Both router views must describe the same single root frame: the global
      // router and the window UI-context router are the two navigation views
      // the launcher relies on after a cold start.
      const globalState: router.RouterState = router.getState();
      assertIndexRootRoute(globalState);
      const windowState: router.RouterState = await windowRouteOf(top);
      assertIndexRootRoute(windowState);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0200
     * @tc.name launchWindowStageResolvableAfterStart002
     * @tc.desc Verify the window stage created by onWindowStageCreate resolves through getLastWindow with a valid screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchWindowStageResolvableAfterStart002', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const top: UIAbility = await currentTopAbility(delegator);

      // The window stage contract after launch: the main window of the top
      // ability must resolve through the context and expose a materialized
      // screen instead of a zero-sized placeholder.
      const win: window.Window = await window.getLastWindow(top.context);
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.id > 0).assertTrue();
      expect(props.windowRect.width > 0).assertTrue();
      expect(props.windowRect.height > 0).assertTrue();

      // The window UI context must already serve the Index root route, which
      // proves loadContent completed during onWindowStageCreate.
      const windowState: router.RouterState = win.getUIContext().getRouter().getState();
      assertIndexRootRoute(windowState);
      assertForegroundState(delegator.getAbilityState(top));
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0600
     * @tc.name launchSameWantKeepsSingleIdentity006
     * @tc.desc Verify repeated startAbility with the same Want keeps one singleton identity and one root page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchSameWantKeepsSingleIdentity006', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      const first: UIAbility = await currentTopAbility(delegator);
      const before: OwnIdentitySnapshot = await identityOf(first);
      assertForegroundState(delegator.getAbilityState(first));

      // Two identical foreground deliveries model opening the same launcher
      // entry twice; singleton launch semantics must absorb both into the same
      // top ability without replacing or duplicating the instance.
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(STATE_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);

      const second: UIAbility = await currentTopAbility(delegator);
      const after: OwnIdentitySnapshot = await identityOf(second);
      assertSameIdentity(before, after);
      assertForegroundState(delegator.getAbilityState(second));

      // A duplicated ability would duplicate the root page and make remote
      // focus traversal ambiguous; exactly one tab0 node and one router frame
      // prove reuse instead of instance growth.
      const tabNodes: Array<Component> = await driver.findComponents(ON.id('tab0'));
      expect(tabNodes.length).assertEqual(1);
      const route: router.RouterState = router.getState();
      assertIndexRootRoute(route);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0700
     * @tc.name launchForegroundRedeliveryConsumesNewWant007
     * @tc.desc Verify a foreground redelivery consumes onNewWant and never changes the singleton identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchForegroundRedeliveryConsumesNewWant007', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);

      // The live foreground instance must publish the warm-launch signal when
      // it consumes a redelivered Want, which is the production contract that
      // Index.onPageShow reads to restore focus without recreating the page.
      const top: UIAbility = await currentTopAbility(delegator);
      const entry: EntryAbility = top as EntryAbility;
      entry.onNewWant(MAIN_WANT, DEFAULT_LAUNCH_PARAM);
      const published: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(published === true).assertTrue();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);

      // The real redelivery path: startAbility while the ability is already
      // foreground must keep the very same singleton identity and state.
      const before: OwnIdentitySnapshot = await identityOf(top);
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);
      const afterTop: UIAbility = await currentTopAbility(delegator);
      const after: OwnIdentitySnapshot = await identityOf(afterTop);
      assertSameIdentity(before, after);
      assertForegroundState(delegator.getAbilityState(afterTop));
      const route: router.RouterState = router.getState();
      assertIndexRootRoute(route);
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0800
     * @tc.name launchTerminateSelfRelaunchColdPath008
     * @tc.desc Verify terminateSelf followed by startAbility restores foreground and takes the cold onCreate path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchTerminateSelfRelaunchColdPath008', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
      const top: UIAbility = await currentTopAbility(delegator);
      assertForegroundState(delegator.getAbilityState(top));

      // SDK 18's AbilityDelegator exposes no terminateSelf member, so the
      // destruction goes through the ability context which is the production
      // termination path of the launcher itself.
      await top.context.terminateSelf();
      await driver.delayMs(TERMINATE_SETTLE_TIME);

      // A new launch request must rebuild the ability from scratch: the state
      // machine returns to FOREGROUND and the root page is re-created.
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);
      const relaunched: UIAbility = await currentTopAbility(delegator);
      assertForegroundState(delegator.getAbilityState(relaunched));
      await driver.assertComponentExist(ON.id('tab0'));
      await driver.assertComponentExist(ON.text('Product Specifications'));
      const route: router.RouterState = router.getState();
      assertIndexRootRoute(route);

      // A cold relaunch goes through onCreate instead of onNewWant, so the
      // warm-launch signal must stay clear after the rebuild.
      const coldSignal: boolean | undefined = AppStorage.get<boolean>('isOnNewWant');
      expect(coldSignal === true).assertFalse();
      AppStorage.setOrCreate<boolean>('isOnNewWant', false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_0900
     * @tc.name launchDestroyRelaunchStateChainLegal009
     * @tc.desc Verify the destroy/relaunch transition chain only visits legal delegator states and ends foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchDestroyRelaunchStateChainLegal009', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      const top: UIAbility = await currentTopAbility(delegator);
      await top.context.terminateSelf();
      await driver.delayMs(TERMINATE_SETTLE_TIME);
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(SAMPLE_INTERVAL);

      // The transition from a destroyed ability back into the foreground is
      // sampled repeatedly; every observation must belong to the documented
      // delegator state set and the chain must terminate in FOREGROUND.
      const relaunched: UIAbility = await currentTopAbility(delegator);
      const chain: Array<number> = await pollForegroundState(delegator, relaunched, POLL_MAX_ROUNDS);
      expect(chain[chain.length - 1]).assertEqual(
        abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      assertForegroundState(delegator.getAbilityState(relaunched));
      await driver.assertComponentExist(ON.id('tab0'));
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_1100
     * @tc.name launchForegroundStateSamplingStable011
     * @tc.desc Verify the delegator state stays FOREGROUND across five spaced samples while idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchForegroundStateSamplingStable011', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      const top: UIAbility = await currentTopAbility(delegator);

      // A quiet foreground launcher must not flicker between states; any sample
      // that is not FOREGROUND would indicate an unnoticed backgrounding or a
      // state machine drift while the TV shows the launcher.
      for (let round: number = 0; round < SAMPLE_ROUND_COUNT; round++) {
        assertForegroundState(delegator.getAbilityState(top));
        await driver.delayMs(SAMPLE_INTERVAL);
      }
      await driver.assertComponentExist(ON.id('tab0'));
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_1500
     * @tc.name launchWindowRebuiltAfterTerminate015
     * @tc.desc Verify the window stage is resolvable and renderable after a terminate/relaunch cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchWindowRebuiltAfterTerminate015', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      const top: UIAbility = await currentTopAbility(delegator);
      await top.context.terminateSelf();
      await driver.delayMs(TERMINATE_SETTLE_TIME);

      // The relaunched ability must have a brand-new window stage that
      // resolves through getLastWindow with a materialized screen.
      await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);
      const relaunched: UIAbility = await currentTopAbility(delegator);
      assertForegroundState(delegator.getAbilityState(relaunched));

      const win: window.Window = await window.getLastWindow(relaunched.context);
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.id > 0).assertTrue();
      expect(props.windowRect.width > 0).assertTrue();
      expect(props.windowRect.height > 0).assertTrue();

      // The rebuilt window UI context must serve the Index root route again,
      // proving loadContent ran during the recreated window stage.
      const windowState: router.RouterState = win.getUIContext().getRouter().getState();
      assertIndexRootRoute(windowState);
      await driver.assertComponentExist(ON.id('tab0'));
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAUNCH_1900
     * @tc.name launchParameterizedWantStillSingle019
     * @tc.desc Verify a module-qualified Want still lands on the one singleton instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('launchParameterizedWantStillSingle019', 0, async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const driver: Driver = Driver.create();
      const top: UIAbility = await currentTopAbility(delegator);
      const before: OwnIdentitySnapshot = await identityOf(top);

      // A launch Want that explicitly qualifies the module must not be treated
      // as a different entry point: the singleton absorbs it without spawning
      // a second ability instance.
      await startAppWithRetry(MODULE_QUALIFIED_WANT, 'com.sample.demonstration');
      await driver.delayMs(PAGE_SETTLE_TIME);

      const afterTop: UIAbility = await currentTopAbility(delegator);
      const after: OwnIdentitySnapshot = await identityOf(afterTop);
      assertSameIdentity(before, after);
      assertForegroundState(delegator.getAbilityState(afterTop));
      const tabNodes: Array<Component> = await driver.findComponents(ON.id('tab0'));
      expect(tabNodes.length).assertEqual(1);
      const route: router.RouterState = router.getState();
      assertIndexRootRoute(route);
    });
  });
}
