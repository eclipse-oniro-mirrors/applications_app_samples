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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common, ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { display, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  findModule,
  homeWant,
  launchHome,
  selfBundle,
  stopHome,
  topAbility
} from './shared/AppProbe';
import { GcSnapshot, gcStat, hintGC, KEY_GC_COUNT, KEY_GC_TIME } from './shared/GcProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// Lifecycle transitions are observed through the delegator ability monitor, whose handlers are the lifecycle
// callbacks of the observed ability (create, window stage create, foreground, background, window stage destroy,
// destroy). Every case launches the real EntryAbility of this sample, so the observations are runtime facts and
// never mocked. The counter sampling cases interleave GC snapshots with the same lifecycle churn to prove the
// cumulative runtime counters never move backwards while abilities are created and torn down.
const EVENT_WAIT_MS: number = 4000;
const POLL_MS: number = 100;
const SETTLE_MS: number = 800;

const EVENT_CREATE: string = 'create';
const EVENT_WINDOW_STAGE_CREATE: string = 'windowStageCreate';
const EVENT_FOREGROUND: string = 'foreground';
const EVENT_BACKGROUND: string = 'background';
const EVENT_WINDOW_STAGE_DESTROY: string = 'windowStageDestroy';
const EVENT_DESTROY: string = 'destroy';

const RANK_CREATE: number = 10;
const RANK_WINDOW_STAGE_CREATE: number = 20;
const RANK_FOREGROUND: number = 30;
const RANK_BACKGROUND: number = 40;
const RANK_WINDOW_STAGE_DESTROY: number = 50;
const RANK_DESTROY: number = 60;
const RANK_UNKNOWN: number = -1;

const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;
const THREE: number = 3;
const MISSING_INDEX: number = -1;
const COLD_START_MIN_EVENTS: number = 3;
const COLD_START_MAX_EVENTS: number = 6;

const UNKNOWN_ABILITY: string = 'NoSuchAbility';
const FOREIGN_MODULE: string = 'entry_test';
const EMPTY_TEXT: string = '';
const SEPARATOR: string = ',';
const ACTION_HOME: string = 'ohos.want.action.home';
const ENTITY_HOME: string = 'entity.system.home';
const PHONE_DEVICE: string = 'phone';
const COLOR_MODE_DARK: number = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
const COLOR_MODE_LIGHT: number = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
const COLOR_MODE_NOT_SET: number = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
const ERR_BACKGROUND_NOT_FOREGROUND: number = 16000065;

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

function stateOf(ability: UIAbility): abilityDelegatorRegistry.AbilityLifecycleState {
  return delegator().getAbilityState(ability);
}

// a destroyed ability may refuse to report a state, UNINITIALIZED is the documented invalid state fallback
function stateOrUninitialized(ability: UIAbility): abilityDelegatorRegistry.AbilityLifecycleState {
  try {
    return delegator().getAbilityState(ability);
  } catch (error) {
    logCase('stateOrUninitialized', `fallbackCode=${Number((error as BusinessError).code)}`);
    return abilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED;
  }
}

function isForeground(ability: UIAbility): boolean {
  return stateOf(ability) === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND;
}

function isBackground(ability: UIAbility): boolean {
  return stateOf(ability) === abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND;
}

function sameInstance(left: UIAbility, right: UIAbility): boolean {
  return left === right;
}

function distinctInstances(items: UIAbility[]): number {
  const seen: UIAbility[] = [];
  items.forEach((item: UIAbility) => {
    if (seen.indexOf(item) < ZERO) {
      seen.push(item);
    }
  });
  return seen.length;
}

function namesJoined(items: UIAbility[]): string {
  return items.map((item: UIAbility) => item.context.abilityInfo.name).join(SEPARATOR);
}

function modulesJoined(items: UIAbility[]): string {
  return items.map((item: UIAbility) => item.context.abilityInfo.moduleName).join(SEPARATOR);
}

function rankOf(event: string): number {
  if (event === EVENT_CREATE) {
    return RANK_CREATE;
  }
  if (event === EVENT_WINDOW_STAGE_CREATE) {
    return RANK_WINDOW_STAGE_CREATE;
  }
  if (event === EVENT_FOREGROUND) {
    return RANK_FOREGROUND;
  }
  if (event === EVENT_BACKGROUND) {
    return RANK_BACKGROUND;
  }
  if (event === EVENT_WINDOW_STAGE_DESTROY) {
    return RANK_WINDOW_STAGE_DESTROY;
  }
  if (event === EVENT_DESTROY) {
    return RANK_DESTROY;
  }
  return RANK_UNKNOWN;
}

function ranksOf(events: string[]): number[] {
  return events.map((event: string) => rankOf(event));
}

function ranksAscending(values: number[]): boolean {
  for (let index: number = ONE; index < values.length; index++) {
    if (values[index] < values[index - ONE]) {
      return false;
    }
  }
  return values.length > ZERO;
}

// true when the log strictly alternates between the two given callbacks, starting with the first one
function alternates(events: string[], first: string, second: string): boolean {
  let expectFirst: boolean = true;
  for (let index: number = ZERO; index < events.length; index++) {
    const expected: string = expectFirst ? first : second;
    if (events[index] !== expected) {
      return false;
    }
    expectFirst = !expectFirst;
  }
  return events.length > ZERO;
}

function occurrencesOf(events: string[], name: string): number {
  let total: number = ZERO;
  events.forEach((event: string) => {
    if (event === name) {
      total += ONE;
    }
  });
  return total;
}

function distinctEventsOf(events: string[]): number {
  const seen: string[] = [];
  events.forEach((event: string) => {
    if (seen.indexOf(event) < ZERO) {
      seen.push(event);
    }
  });
  return seen.length;
}

function allNonNegative(values: number[]): boolean {
  return values.length > ZERO && values.every((value: number) => value >= ZERO);
}

// Records the lifecycle callbacks the delegator delivers for the EntryAbility of the sample.
class LifecycleTap {
  events: string[] = [];
  createdInstance: UIAbility | undefined = undefined;
  stagedInstance: UIAbility | undefined = undefined;
  destroyedInstance: UIAbility | undefined = undefined;
  stage: window.WindowStage | undefined = undefined;
  readonly monitor: abilityDelegatorRegistry.AbilityMonitor;

  constructor(abilityName: string, moduleName: string) {
    this.monitor = {
      abilityName: abilityName,
      moduleName: moduleName,
      onAbilityCreate: (ability: UIAbility) => {
        this.createdInstance = ability;
        this.events.push(EVENT_CREATE);
      },
      onWindowStageCreate: (ability: UIAbility) => {
        this.stagedInstance = ability;
        this.stage = ability.context.windowStage;
        this.events.push(EVENT_WINDOW_STAGE_CREATE);
      },
      onAbilityForeground: () => {
        this.events.push(EVENT_FOREGROUND);
      },
      onAbilityBackground: () => {
        this.events.push(EVENT_BACKGROUND);
      },
      onWindowStageDestroy: () => {
        this.events.push(EVENT_WINDOW_STAGE_DESTROY);
      },
      onAbilityDestroy: (ability: UIAbility) => {
        this.destroyedInstance = ability;
        this.events.push(EVENT_DESTROY);
      }
    };
  }

  start(): void {
    delegator().addAbilityMonitorSync(this.monitor);
  }

  stop(): void {
    delegator().removeAbilityMonitorSync(this.monitor);
  }

  size(): number {
    return this.events.length;
  }

  has(name: string): boolean {
    return this.events.indexOf(name) >= ZERO;
  }

  countOf(name: string): number {
    return occurrencesOf(this.events, name);
  }

  firstIndex(name: string): number {
    return this.events.indexOf(name);
  }

  lastIndex(name: string): number {
    return this.events.lastIndexOf(name);
  }

  firstEvent(): string {
    return this.events.length === ZERO ? EMPTY_TEXT : this.events[ZERO];
  }

  lastEvent(): string {
    return this.events.length === ZERO ? EMPTY_TEXT : this.events[this.events.length - ONE];
  }

  ordered(): boolean {
    return ranksAscending(ranksOf(this.events));
  }

  text(): string {
    return this.events.join(SEPARATOR);
  }
}

async function waitTapEvent(tap: LifecycleTap, name: string, timeoutMs: number,
  minimumCount: number = ONE): Promise<boolean> {
  for (let waited: number = ZERO; waited < timeoutMs; waited += POLL_MS) {
    if (tap.countOf(name) >= minimumCount) {
      return true;
    }
    await sleepMs(POLL_MS);
  }
  return tap.countOf(name) >= minimumCount;
}

async function waitForeground(ability: UIAbility, timeoutMs: number): Promise<boolean> {
  for (let waited: number = ZERO; waited < timeoutMs; waited += POLL_MS) {
    if (isForeground(ability)) {
      return true;
    }
    await sleepMs(POLL_MS);
  }
  return isForeground(ability);
}

async function waitBackground(ability: UIAbility, timeoutMs: number): Promise<boolean> {
  for (let waited: number = ZERO; waited < timeoutMs; waited += POLL_MS) {
    if (isBackground(ability)) {
      return true;
    }
    await sleepMs(POLL_MS);
  }
  return isBackground(ability);
}

// isWindowShowing can reject with 1300002 while the window is mid transition, so poll briefly and report the
// last observed answer
async function showingWhenReady(main: window.Window, timeoutMs: number): Promise<boolean> {
  let answer: boolean = false;
  let lastCode: number = ZERO;
  for (let waited: number = ZERO; waited <= timeoutMs; waited += POLL_MS) {
    try {
      answer = main.isWindowShowing();
      if (answer) {
        return true;
      }
    } catch (error) {
      lastCode = Number((error as BusinessError).code);
    }
    await sleepMs(POLL_MS);
  }
  logCase('showingWhenReady', `lastCode=${lastCode}`);
  return answer;
}

// cold start under observation: the tap stays registered only while the ability is being created
async function coldStart(tap: LifecycleTap): Promise<UIAbility> {
  await stopHome();
  tap.start();
  try {
    await delegator().startAbility(homeWant());
    const ability: UIAbility = await delegator().waitAbilityMonitor(tap.monitor, EVENT_WAIT_MS);
    await sleepMs(SETTLE_MS);
    return ability;
  } finally {
    tap.stop();
  }
}

async function terminateWithTap(tap: LifecycleTap, ability: UIAbility): Promise<void> {
  tap.start();
  try {
    const minimumCount: number = tap.countOf(EVENT_DESTROY) + ONE;
    await ability.context.terminateSelf();
    const destroyed: boolean = await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS, minimumCount);
    if (!destroyed) {
      throw new Error('terminateWithTap: timed out waiting for a new destroy callback');
    }
    await sleepMs(SETTLE_MS);
  } finally {
    tap.stop();
  }
}

async function backgroundWithTap(tap: LifecycleTap, ability: UIAbility): Promise<void> {
  tap.start();
  try {
    const minimumCount: number = tap.countOf(EVENT_BACKGROUND) + ONE;
    await moveToBackground(ability);
    const backgrounded: boolean = await waitTapEvent(tap, EVENT_BACKGROUND, EVENT_WAIT_MS, minimumCount);
    if (!backgrounded) {
      throw new Error('backgroundWithTap: timed out waiting for a new background callback');
    }
  } finally {
    tap.stop();
  }
}

async function resumeWithTap(tap: LifecycleTap): Promise<void> {
  tap.start();
  try {
    const minimumCount: number = tap.countOf(EVENT_FOREGROUND) + ONE;
    await delegator().startAbility(homeWant());
    const resumed: boolean = await waitTapEvent(tap, EVENT_FOREGROUND, EVENT_WAIT_MS, minimumCount);
    if (!resumed) {
      throw new Error('resumeWithTap: timed out waiting for a new foreground callback');
    }
    await sleepMs(SETTLE_MS);
  } finally {
    tap.stop();
  }
}

// launches while the tap stays registered, so later transitions are appended to the same log; the monitor is
// re-armed first because one registration answers exactly one wait on this runtime
async function startObserved(tap: LifecycleTap): Promise<UIAbility> {
  tap.stop();
  tap.start();
  await delegator().startAbility(homeWant());
  const ability: UIAbility = await delegator().waitAbilityMonitor(tap.monitor, EVENT_WAIT_MS);
  await sleepMs(SETTLE_MS);
  return ability;
}

async function startHomeAndSettle(): Promise<void> {
  await delegator().startAbility(homeWant());
  await sleepMs(SETTLE_MS);
}

async function moveToBackground(ability: UIAbility): Promise<void> {
  const abilityContext: common.UIAbilityContext = ability.context;
  try {
    await abilityContext.moveAbilityToBackground();
  } catch (error) {
    logCase('moveToBackground', `code=${Number((error as BusinessError).code)}`);
  }
  await sleepMs(SETTLE_MS);
}

async function terminateQuietly(ability: UIAbility | undefined): Promise<void> {
  if (ability === undefined) {
    return;
  }
  try {
    await ability.context.terminateSelf();
  } catch (error) {
    logCase('terminateQuietly', `code=${Number((error as BusinessError).code)}`);
  }
  await sleepMs(SETTLE_MS);
}

async function mainWindowOf(ability: UIAbility): Promise<window.Window> {
  return await window.getLastWindow(ability.context);
}

function rectOf(win: window.Window): window.Rect {
  return win.getWindowProperties().windowRect;
}

function areaOf(win: window.Window): number {
  const rect: window.Rect = rectOf(win);
  return rect.width * rect.height;
}

function screenOf(): display.Display {
  return display.getDefaultDisplaySync();
}

function snapshot(): GcSnapshot {
  return new GcSnapshot();
}

function statsMonotone(before: GcSnapshot, after: GcSnapshot): boolean {
  return after.notBefore(before);
}

function countDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.count - before.count;
}

function allocatedDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.allocated - before.allocated;
}

function timeDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.time - before.time;
}

function freedDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.freed - before.freed;
}

function longFullGcDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.longFullGc - before.longFullGc;
}

function deltasOf(before: GcSnapshot, after: GcSnapshot): number[] {
  return [countDelta(before, after), timeDelta(before, after), allocatedDelta(before, after),
    freedDelta(before, after), longFullGcDelta(before, after)];
}

function deltaText(before: GcSnapshot, after: GcSnapshot): string {
  return deltasOf(before, after).join(SEPARATOR);
}

async function entryModuleInfo(): Promise<bundleManager.HapModuleInfo> {
  const info: bundleManager.BundleInfo = await selfBundle();
  return findModule(info, ENTRY_MODULE);
}

async function declaredEntryAbility(): Promise<bundleManager.AbilityInfo> {
  const module: bundleManager.HapModuleInfo = await entryModuleInfo();
  return module.abilitiesInfo.find((item: bundleManager.AbilityInfo) => item.name === ENTRY_ABILITY) as
    bundleManager.AbilityInfo;
}

function declaresHomeSkill(info: bundleManager.AbilityInfo): boolean {
  return info.skills.some((skill: bundleManager.Skill) => skill.actions.indexOf(ACTION_HOME) >= ZERO &&
    skill.entities.indexOf(ENTITY_HOME) >= ZERO);
}

function declaresDevice(info: bundleManager.AbilityInfo, device: string): boolean {
  return info.deviceTypes.indexOf(device) >= ZERO;
}

export default function abilityLifecycleMatrixTest() {
  describe('AbilityLifecycleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0100
     * @tc.name      testFreshLaunchForegroundIdentity0001
     * @tc.desc      Launch EntryAbility once and check the fresh instance is in the foreground, is the current top
     *               ability and reports the names declared by the sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFreshLaunchForegroundIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const top: UIAbility | undefined = await topAbility();
      logCase('testFreshLaunchForegroundIdentity0001', `state=${stateOf(ability)} topIsAbility=${top === ability} ` +
        `name=${ability.context.abilityInfo.name} module=${ability.context.abilityInfo.moduleName}`);
      expect(isForeground(ability)).assertTrue();
      expect(top === ability).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0200
     * @tc.name      testFreshLaunchPairDistinct0002
     * @tc.desc      Launch EntryAbility twice in a row and check the two launches never hand back the same ability
     *               instance while both report the entry ability name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFreshLaunchPairDistinct0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: UIAbility = await launchHome();
      const second: UIAbility = await launchHome();
      const pair: UIAbility[] = [first, second];
      logCase('testFreshLaunchPairDistinct0002', `distinct=${distinctInstances(pair)} names=${namesJoined(pair)} ` +
        `secondForeground=${isForeground(second)} firstForeground=${isForeground(first)}`);
      expect(sameInstance(first, second)).assertFalse();
      expect(distinctInstances(pair)).assertEqual(TWO);
      expect(isForeground(second)).assertTrue();
      expect(namesJoined(pair)).assertEqual(`${ENTRY_ABILITY}${SEPARATOR}${ENTRY_ABILITY}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0300
     * @tc.name      testRelaunchAfterStopFreshInstance0003
     * @tc.desc      Stop the running EntryAbility, check no ability is left on top, then relaunch and check the new
     *               instance is a foreground ability that differs from the stopped one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRelaunchAfterStopFreshInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: UIAbility = await launchHome();
      await stopHome();
      const between: UIAbility | undefined = await topAbility();
      const second: UIAbility = await launchHome();
      logCase('testRelaunchAfterStopFreshInstance0003', `betweenIsFirst=${between === first} ` +
        `secondIsFirst=${second === first} secondState=${stateOf(second)}`);
      expect(between === first).assertFalse();
      expect(second === first).assertFalse();
      expect(between === second).assertFalse();
      expect(isForeground(second)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0400
     * @tc.name      testColdStartTapInstanceMatch0004
     * @tc.desc      Record the lifecycle callbacks of a cold start and check the ability captured at create and at
     *               window stage create is exactly the instance the delegator hands back
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColdStartTapInstanceMatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const created: UIAbility | undefined = tap.createdInstance;
      const staged: UIAbility | undefined = tap.stagedInstance;
      logCase('testColdStartTapInstanceMatch0004', `events=${tap.text()} createdMatches=${created === ability} ` +
        `stagedMatches=${staged === ability}`);
      expect(created === ability).assertTrue();
      expect(staged === ability).assertTrue();
      expect(tap.has(EVENT_CREATE)).assertTrue();
      expect(tap.has(EVENT_FOREGROUND)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0500
     * @tc.name      testForegroundStateEnumAfterLaunch0005
     * @tc.desc      Poll the delegator state of a fresh EntryAbility and check it settles on the foreground enum and
     *               never reports the background enum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundStateEnumAfterLaunch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const settled: boolean = await waitForeground(ability, EVENT_WAIT_MS);
      const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
      logCase('testForegroundStateEnumAfterLaunch0005', `settled=${settled} state=${state} ` +
        `background=${isBackground(ability)}`);
      expect(settled).assertTrue();
      expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      expect(isBackground(ability)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0600
     * @tc.name      testTopAbilityIdentityStable0006
     * @tc.desc      Read the top ability twice with a settle gap in between and check both reads return the same
     *               foreground instance with an unchanged ability name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTopAbilityIdentityStable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const firstRead: UIAbility | undefined = await topAbility();
      await sleepMs(SETTLE_MS);
      const secondRead: UIAbility | undefined = await topAbility();
      logCase('testTopAbilityIdentityStable0006', `firstIsAbility=${firstRead === ability} ` +
        `secondIsAbility=${secondRead === ability} sameRead=${firstRead === secondRead}`);
      expect(firstRead === ability).assertTrue();
      expect(secondRead === ability).assertTrue();
      expect(firstRead === secondRead).assertTrue();
      expect((secondRead as UIAbility).context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0700
     * @tc.name      testThreeLaunchesDistinctInstances0007
     * @tc.desc      Launch EntryAbility three separate times and check the launches hand back three pairwise
     *               distinct foreground instances
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testThreeLaunchesDistinctInstances0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const second: UIAbility = await launchHome();
      const third: UIAbility = await launchHome();
      const all: UIAbility[] = [first, second, third];
      logCase('testThreeLaunchesDistinctInstances0007', `distinct=${distinctInstances(all)} ` +
        `secondVsThird=${second === third} firstVsThird=${first === third} foreground=${isForeground(third)}`);
      expect(distinctInstances(all)).assertEqual(THREE);
      expect(second === third).assertFalse();
      expect(first === third).assertFalse();
      expect(isForeground(third)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0800
     * @tc.name      testRelaunchAfterImmediateTerminate0008
     * @tc.desc      Wait for the destroy callback of the terminated EntryAbility, then relaunch without an extra
     *               settle gap and check the new instance is foreground and distinct from the destroyed one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRelaunchAfterImmediateTerminate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      let second: UIAbility | undefined = undefined;
      try {
        tap.start();
        await first.context.terminateSelf();
        for (let waited: number = ZERO; waited < EVENT_WAIT_MS; waited += POLL_MS) {
          if (tap.destroyedInstance === first) {
            break;
          }
          await sleepMs(POLL_MS);
        }
        if (tap.destroyedInstance !== first) {
          throw new Error('testRelaunchAfterImmediateTerminate0008: timed out waiting for first to be destroyed');
        }
        expect(tap.destroyedInstance === first).assertTrue();
        second = await launchHome();
        const moduleName: string = second.context.abilityInfo.moduleName;
        logCase('testRelaunchAfterImmediateTerminate0008', `secondIsFirst=${second === first} ` +
          `module=${moduleName} state=${stateOf(second)} events=${tap.text()}`);
        expect(second === first).assertFalse();
        expect(moduleName).assertEqual(ENTRY_MODULE);
        expect(isForeground(second)).assertTrue();
        expect((await topAbility()) === second).assertTrue();
      } finally {
        tap.stop();
        if (tap.destroyedInstance !== first) {
          await terminateQuietly(first);
        }
        await terminateQuietly(second);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_0900
     * @tc.name      testLaunchKeepsModuleContext0009
     * @tc.desc      Read the context of a fresh EntryAbility and check its application info names the sample bundle
     *               and carries a positive token identifier
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLaunchKeepsModuleContext0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const appName: string = ability.context.applicationInfo.name;
      const token: number = Number(ability.context.applicationInfo.accessTokenId);
      logCase('testLaunchKeepsModuleContext0009', `appName=${appName} token=${token} ` +
        `bundle=${ability.context.abilityInfo.bundleName}`);
      expect(appName).assertEqual(BUNDLE_NAME);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      expect(token > ZERO).assertTrue();
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1000
     * @tc.name      testColdLaunchCreateBeforeWindowStage0010
     * @tc.desc      Compare the recorded positions of the create and window stage create callbacks of a cold launch
     *               and check create is delivered first
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testColdLaunchCreateBeforeWindowStage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await coldStart(tap);
      const createIndex: number = tap.firstIndex(EVENT_CREATE);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_CREATE);
      logCase('testColdLaunchCreateBeforeWindowStage0010', `events=${tap.text()} createIndex=${createIndex} ` +
        `stageIndex=${stageIndex}`);
      expect(createIndex >= ZERO).assertTrue();
      expect(stageIndex >= ZERO).assertTrue();
      expect(createIndex < stageIndex).assertTrue();
      expect(tap.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1100
     * @tc.name      testWindowStageCreateBeforeForeground0011
     * @tc.desc      Compare the recorded positions of the window stage create and foreground callbacks and check a
     *               cold launch reaches the foreground only after the window stage exists
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStageCreateBeforeForeground0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await coldStart(tap);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_CREATE);
      const foregroundIndex: number = tap.firstIndex(EVENT_FOREGROUND);
      logCase('testWindowStageCreateBeforeForeground0011', `stageIndex=${stageIndex} ` +
        `foregroundIndex=${foregroundIndex} events=${tap.text()}`);
      expect(stageIndex >= ZERO).assertTrue();
      expect(foregroundIndex >= ZERO).assertTrue();
      expect(stageIndex < foregroundIndex).assertTrue();
      expect(tap.countOf(EVENT_BACKGROUND)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1200
     * @tc.name      testColdStartFirstEventCreate0012
     * @tc.desc      Inspect the head and the tail of the cold start callback log and check the session opens with
     *               create and closes with foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColdStartFirstEventCreate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const head: string = tap.firstEvent();
      const tail: string = tap.lastEvent();
      logCase('testColdStartFirstEventCreate0012', `head=${head} tail=${tail} size=${tap.size()} ` +
        `abilityName=${ability.context.abilityInfo.name}`);
      expect(head).assertEqual(EVENT_CREATE);
      expect(tail).assertEqual(EVENT_FOREGROUND);
      expect(tap.size() >= COLD_START_MIN_EVENTS).assertTrue();
      expect(tap.countOf(EVENT_CREATE)).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1300
     * @tc.name      testColdStartSingleCreateCount0013
     * @tc.desc      Count the create and window stage create callbacks of one cold launch and check each fires
     *               exactly once while destroy never fires
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColdStartSingleCreateCount0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await coldStart(tap);
      const creates: number = tap.countOf(EVENT_CREATE);
      const stages: number = tap.countOf(EVENT_WINDOW_STAGE_CREATE);
      logCase('testColdStartSingleCreateCount0013', `creates=${creates} stages=${stages} ` +
        `destroys=${tap.countOf(EVENT_DESTROY)} events=${tap.text()}`);
      expect(creates).assertEqual(ONE);
      expect(stages).assertEqual(ONE);
      expect(tap.countOf(EVENT_DESTROY)).assertEqual(ZERO);
      expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1400
     * @tc.name      testColdStartEndsForeground0014
     * @tc.desc      Check the cold start callback log ends on foreground, records at least one foreground event and
     *               never records a background event
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testColdStartEndsForeground0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const backgrounds: number = tap.countOf(EVENT_BACKGROUND);
      logCase('testColdStartEndsForeground0014', `last=${tap.lastEvent()} backgrounds=${backgrounds} ` +
        `foregrounds=${tap.countOf(EVENT_FOREGROUND)} state=${stateOf(ability)}`);
      expect(tap.lastEvent()).assertEqual(EVENT_FOREGROUND);
      expect(tap.countOf(EVENT_FOREGROUND) >= ONE).assertTrue();
      expect(backgrounds).assertEqual(ZERO);
      expect(tap.lastIndex(EVENT_BACKGROUND)).assertEqual(MISSING_INDEX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1500
     * @tc.name      testColdStartNoDestroyEvents0015
     * @tc.desc      Check a plain cold launch records no window stage destroy and no destroy callback and that the
     *               recorded ranks never move backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testColdStartNoDestroyEvents0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await coldStart(tap);
      const ranks: number[] = ranksOf(tap.events);
      logCase('testColdStartNoDestroyEvents0015', `events=${tap.text()} ranks=${ranks.join(SEPARATOR)} ` +
        `unknownRanks=${ranks.filter((value: number) => value === RANK_UNKNOWN).length}`);
      expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ZERO);
      expect(tap.countOf(EVENT_DESTROY)).assertEqual(ZERO);
      expect(ranks.indexOf(RANK_UNKNOWN)).assertEqual(MISSING_INDEX);
      expect(tap.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1600
     * @tc.name      testTapCapturesStageInstance0016
     * @tc.desc      Check the window stage delivered by the window stage create callback is present and belongs to
     *               the same ability instance that was captured at create
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTapCapturesStageInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const stageDefined: boolean = tap.stage !== undefined;
      const created: UIAbility | undefined = tap.createdInstance;
      const staged: UIAbility | undefined = tap.stagedInstance;
      logCase('testTapCapturesStageInstance0016', `stageDefined=${stageDefined} createdIsStaged=${created === staged} ` +
        `stagedIsAbility=${staged === ability}`);
      expect(stageDefined).assertTrue();
      expect(created === staged).assertTrue();
      expect(staged === ability).assertTrue();
      expect(tap.has(EVENT_WINDOW_STAGE_CREATE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1700
     * @tc.name      testTapStageNonNullDuringForeground0017
     * @tc.desc      Check that once the foreground callback has been delivered the recorded window stage is non null
     *               and the main window of the ability is showing with a positive area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTapStageNonNullDuringForeground0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const main: window.Window = await mainWindowOf(ability);
      const area: number = areaOf(main);
      const showing: boolean = await showingWhenReady(main, EVENT_WAIT_MS);
      logCase('testTapStageNonNullDuringForeground0017', `stageDefined=${tap.stage !== undefined} ` +
        `showing=${showing} area=${area} foregroundIndex=${tap.firstIndex(EVENT_FOREGROUND)}`);
      expect(tap.stage !== undefined).assertTrue();
      expect(tap.firstIndex(EVENT_FOREGROUND) > tap.firstIndex(EVENT_WINDOW_STAGE_CREATE)).assertTrue();
      expect(showing).assertTrue();
      expect(area > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1800
     * @tc.name      testForeignAbilityNameSilentTap0018
     * @tc.desc      Register the lifecycle tap for an ability name this sample does not declare, launch EntryAbility
     *               and check the tap records nothing while the real ability reaches the foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForeignAbilityNameSilentTap0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tap: LifecycleTap = new LifecycleTap(UNKNOWN_ABILITY, ENTRY_MODULE);
      await stopHome();
      tap.start();
      try {
        await startHomeAndSettle();
        const top: UIAbility | undefined = await topAbility();
        logCase('testForeignAbilityNameSilentTap0018', `recorded=${tap.size()} topDefined=${top !== undefined} ` +
          `tapName=${UNKNOWN_ABILITY} events=${tap.text()}`);
        expect(tap.size()).assertEqual(ZERO);
        expect(tap.has(EVENT_CREATE)).assertFalse();
        expect(top !== undefined).assertTrue();
        expect((top as UIAbility).context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_1900
     * @tc.name      testForeignModuleNameSilentTap0019
     * @tc.desc      Register the lifecycle tap with the correct ability name but the test module name, launch the
     *               entry module ability and check the module filter keeps the tap empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForeignModuleNameSilentTap0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, FOREIGN_MODULE);
      await stopHome();
      tap.start();
      try {
        await startHomeAndSettle();
        const top: UIAbility | undefined = await topAbility();
        logCase('testForeignModuleNameSilentTap0019', `recorded=${tap.size()} module=${FOREIGN_MODULE} ` +
          `hasCreate=${tap.has(EVENT_CREATE)} topDefined=${top !== undefined}`);
        expect(tap.size()).assertEqual(ZERO);
        expect(tap.has(EVENT_CREATE)).assertFalse();
        expect(tap.has(EVENT_FOREGROUND)).assertFalse();
        expect(isForeground(top as UIAbility)).assertTrue();
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2000
     * @tc.name      testTerminateWindowStageBeforeDestroy0020
     * @tc.desc      Terminate the running EntryAbility and check the window stage destroy callback is delivered
     *               before the destroy callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testTerminateWindowStageBeforeDestroy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY);
      const destroyIndex: number = tap.firstIndex(EVENT_DESTROY);
      logCase('testTerminateWindowStageBeforeDestroy0020', `events=${tap.text()} stageIndex=${stageIndex} ` +
        `destroyIndex=${destroyIndex}`);
      expect(stageIndex >= ZERO).assertTrue();
      expect(destroyIndex >= ZERO).assertTrue();
      expect(stageIndex < destroyIndex).assertTrue();
      expect(tap.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2100
     * @tc.name      testTerminateDestroyIsLastEvent0021
     * @tc.desc      Terminate the running EntryAbility and check the destroy callback is the last recorded event and
     *               was delivered exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTerminateDestroyIsLastEvent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const destroys: number = tap.countOf(EVENT_DESTROY);
      logCase('testTerminateDestroyIsLastEvent0021', `last=${tap.lastEvent()} destroys=${destroys} ` +
        `stages=${tap.countOf(EVENT_WINDOW_STAGE_DESTROY)} events=${tap.text()}`);
      expect(tap.lastEvent()).assertEqual(EVENT_DESTROY);
      expect(destroys).assertEqual(ONE);
      expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ONE);
      expect(tap.lastIndex(EVENT_DESTROY)).assertEqual(tap.size() - ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2200
     * @tc.name      testTerminateStartsWithoutCreate0022
     * @tc.desc      Register the tap only after EntryAbility already runs, terminate it and check the termination
     *               segment contains no create callback and leaves no top ability behind
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTerminateStartsWithoutCreate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const after: UIAbility | undefined = await topAbility();
      logCase('testTerminateStartsWithoutCreate0022', `creates=${tap.countOf(EVENT_CREATE)} ` +
        `events=${tap.text()} topIsAbility=${after === ability}`);
      expect(tap.countOf(EVENT_CREATE)).assertEqual(ZERO);
      expect(tap.has(EVENT_WINDOW_STAGE_DESTROY)).assertTrue();
      expect(tap.has(EVENT_DESTROY)).assertTrue();
      expect(after === ability).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2300
     * @tc.name      testColdStartEventCountBounds0023
     * @tc.desc      Check the cold start callback log keeps a plausible size, uses at least three distinct callback
     *               kinds and stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testColdStartEventCountBounds0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const total: number = tap.size();
      const kinds: number = distinctEventsOf(tap.events);
      logCase('testColdStartEventCountBounds0023', `total=${total} kinds=${kinds} events=${tap.text()} ` +
        `name=${ability.context.abilityInfo.name}`);
      expect(total >= COLD_START_MIN_EVENTS).assertTrue();
      expect(total <= COLD_START_MAX_EVENTS).assertTrue();
      expect(kinds >= THREE).assertTrue();
      expect(tap.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2400
     * @tc.name      testBackgroundThenForegroundEvents0024
     * @tc.desc      Keep one tap registered across a cold launch, a move to the background and a relaunch, then
     *               check background is followed by another foreground callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundThenForegroundEvents0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      let observed: UIAbility | undefined = undefined;
      tap.start();
      try {
        const ability: UIAbility = await startObserved(tap);
        observed = ability;
        await moveToBackground(ability);
        await waitTapEvent(tap, EVENT_BACKGROUND, EVENT_WAIT_MS);
        await delegator().startAbility(homeWant());
        await waitTapEvent(tap, EVENT_FOREGROUND, TWO * EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        logCase('testBackgroundThenForegroundEvents0024', `events=${tap.text()} ` +
          `backgrounds=${tap.countOf(EVENT_BACKGROUND)} foregrounds=${tap.countOf(EVENT_FOREGROUND)}`);
        expect(tap.countOf(EVENT_BACKGROUND) >= ONE).assertTrue();
        expect(tap.lastIndex(EVENT_FOREGROUND) > tap.lastIndex(EVENT_BACKGROUND)).assertTrue();
        expect(tap.countOf(EVENT_FOREGROUND) >= TWO).assertTrue();
        expect(isForeground(ability)).assertTrue();
      } finally {
        tap.stop();
        await terminateQuietly(observed);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2500
     * @tc.name      testMoveToBackgroundStateFlip0025
     * @tc.desc      Move a foreground EntryAbility to the background and check the delegator state flips from
     *               foreground to background exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testMoveToBackgroundStateFlip0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const beforeState: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        await moveToBackground(ability);
        const reached: boolean = await waitBackground(ability, EVENT_WAIT_MS);
        logCase('testMoveToBackgroundStateFlip0025', `before=${beforeState} after=${stateOf(ability)} ` +
          `reached=${reached} foreground=${isForeground(ability)}`);
        expect(beforeState).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
        expect(reached).assertTrue();
        expect(isForeground(ability)).assertFalse();
        expect(isBackground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2600
     * @tc.name      testBackgroundResumeSameInstance0026
     * @tc.desc      Move EntryAbility to the background and resume it, then check the resume reuses the ability
     *               without a second create or window stage create and keeps the same context object
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundResumeSameInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const contextBefore: common.UIAbilityContext = ability.context;
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      try {
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await resumeWithTap(tap);
        logCase('testBackgroundResumeSameInstance0026', `events=${tap.text()} ` +
          `stages=${tap.countOf(EVENT_WINDOW_STAGE_CREATE)} creates=${tap.countOf(EVENT_CREATE)} ` +
          `sameContext=${ability.context === contextBefore}`);
        expect(tap.countOf(EVENT_WINDOW_STAGE_CREATE)).assertEqual(ZERO);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(ZERO);
        expect(tap.countOf(EVENT_FOREGROUND) >= ONE).assertTrue();
        expect(ability.context === contextBefore).assertTrue();
        expect(isForeground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2700
     * @tc.name      testBackgroundTapRecordsBackground0027
     * @tc.desc      Register the tap after EntryAbility is already running, move it to the background and check only
     *               a background callback is recorded
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundTapRecordsBackground0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      try {
        await backgroundWithTap(tap, ability);
        logCase('testBackgroundTapRecordsBackground0027', `events=${tap.text()} ` +
          `backgrounds=${tap.countOf(EVENT_BACKGROUND)} foregrounds=${tap.countOf(EVENT_FOREGROUND)}`);
        expect(tap.countOf(EVENT_BACKGROUND)).assertEqual(ONE);
        expect(tap.countOf(EVENT_FOREGROUND)).assertEqual(ZERO);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(ZERO);
        expect(tap.ordered()).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2800
     * @tc.name      testBackgroundTwicePulse0028
     * @tc.desc      Run two background round trips on one EntryAbility and check both background callbacks and both
     *               resume foreground callbacks are recorded
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundTwicePulse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      try {
        await backgroundWithTap(tap, ability);
        await resumeWithTap(tap);
        await backgroundWithTap(tap, ability);
        await resumeWithTap(tap);
        const backgrounds: number = tap.countOf(EVENT_BACKGROUND);
        const foregrounds: number = tap.countOf(EVENT_FOREGROUND);
        logCase('testBackgroundTwicePulse0028', `events=${tap.text()} backgrounds=${backgrounds} ` +
          `foregrounds=${foregrounds} alternating=${alternates(tap.events, EVENT_BACKGROUND, EVENT_FOREGROUND)}`);
        expect(alternates(tap.events, EVENT_BACKGROUND, EVENT_FOREGROUND)).assertTrue();
        expect(backgrounds).assertEqual(TWO);
        expect(foregrounds).assertEqual(backgrounds);
        expect(isForeground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_2900
     * @tc.name      testResumeAfterBackgroundNamesIntact0029
     * @tc.desc      Move EntryAbility to the background and resume it, then check the ability info names and the
     *               visible main window survived the round trip
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResumeAfterBackgroundNamesIntact0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      try {
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await startHomeAndSettle();
        const main: window.Window = await mainWindowOf(ability);
        const showing: boolean = await showingWhenReady(main, EVENT_WAIT_MS);
        logCase('testResumeAfterBackgroundNamesIntact0029', `name=${ability.context.abilityInfo.name} ` +
          `module=${ability.context.abilityInfo.moduleName} showing=${showing}`);
        expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
        expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
        expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
        expect(showing).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3000
     * @tc.name      testBackgroundWindowStillUsable0030
     * @tc.desc      Save the foreground main window handle, move EntryAbility to the background and check the saved
     *               handle still reports a positive, stable rectangle while the ability is backgrounded
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundWindowStillUsable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const main: window.Window = await mainWindowOf(ability);
        await moveToBackground(ability);
        const backgrounded: boolean = await waitBackground(ability, EVENT_WAIT_MS);
        expect(backgrounded).assertTrue();
        const firstRect: window.Rect = rectOf(main);
        const secondRect: window.Rect = rectOf(main);
        const screen: display.Display = screenOf();
        logCase('testBackgroundWindowStillUsable0030', `first=${firstRect.width}x${firstRect.height} ` +
          `second=${secondRect.width}x${secondRect.height} screenWidth=${screen.width}`);
        expect(firstRect.width > ZERO).assertTrue();
        expect(firstRect.height > ZERO).assertTrue();
        expect(firstRect.left).assertEqual(secondRect.left);
        expect(firstRect.top).assertEqual(secondRect.top);
        expect(firstRect.width).assertEqual(secondRect.width);
        expect(firstRect.height).assertEqual(secondRect.height);
        expect(firstRect.width <= screen.width).assertTrue();
        expect(isBackground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3100
     * @tc.name      testBackgroundStatsMonotone0031
     * @tc.desc      Sample the runtime counters around a move to the background and check every counter stays
     *               monotone while the ability is parked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundStatsMonotone0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const before: GcSnapshot = snapshot();
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const after: GcSnapshot = snapshot();
        logCase('testBackgroundStatsMonotone0031', `deltas=${deltaText(before, after)} ` +
          `countBefore=${before.count} countAfter=${after.count}`);
        expect(statsMonotone(before, after)).assertTrue();
        expect(allNonNegative(deltasOf(before, after))).assertTrue();
        expect(countDelta(before, after) >= ZERO).assertTrue();
        expect(after.count >= before.count).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3200
     * @tc.name      testResumeTopAbilityIdentity0032
     * @tc.desc      Resume a backgrounded EntryAbility and check it becomes the top ability again with the same
     *               instance identity as before the move
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResumeTopAbilityIdentity0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const appNameBefore: string = ability.context.applicationInfo.name;
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await startHomeAndSettle();
        const top: UIAbility | undefined = await topAbility();
        const topAppName: string = (top as UIAbility).context.applicationInfo.name;
        logCase('testResumeTopAbilityIdentity0032', `topIsAbility=${top === ability} ` +
          `appNameBefore=${appNameBefore} appNameAfter=${topAppName}`);
        expect(top === ability).assertTrue();
        expect(topAppName).assertEqual(appNameBefore);
        expect((top as UIAbility).context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3300
     * @tc.name      testBackgroundStateEnumExact0033
     * @tc.desc      Check the delegator reports the background lifecycle enum for an ability parked in the
     *               background and no longer the foreground enum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStateEnumExact0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      try {
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        logCase('testBackgroundStateEnumExact0033', `state=${state} ` +
          `expected=${abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND}`);
        expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
        expect(state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND).assertFalse();
        expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3400
     * @tc.name      testTerminateFromBackgroundTopAbsent0034
     * @tc.desc      Move EntryAbility to the background, terminate it there and check the next launch creates a
     *               different foreground instance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTerminateFromBackgroundTopAbsent0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      await moveToBackground(ability);
      await waitBackground(ability, EVENT_WAIT_MS);
      await terminateQuietly(ability);
      const afterTerminate: UIAbility | undefined = await topAbility();
      const relaunched: UIAbility = await launchHome();
      logCase('testTerminateFromBackgroundTopAbsent0034', `topIsAbility=${afterTerminate === ability} ` +
        `relaunchedIsAbility=${relaunched === ability} foreground=${isForeground(relaunched)}`);
      expect(afterTerminate === ability).assertFalse();
      expect(relaunched === ability).assertFalse();
      expect(isForeground(relaunched)).assertTrue();
      expect(relaunched.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3500
     * @tc.name      testTerminateFromBackgroundDestroyOrder0035
     * @tc.desc      Keep one tap registered while EntryAbility is backgrounded and then terminated, and check the
     *               background, window stage destroy and destroy callbacks arrive in that order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTerminateFromBackgroundDestroyOrder0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      let observed: UIAbility | undefined = undefined;
      tap.start();
      try {
        const ability: UIAbility = await startObserved(tap);
        observed = ability;
        await moveToBackground(ability);
        await waitTapEvent(tap, EVENT_BACKGROUND, EVENT_WAIT_MS);
        await ability.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        logCase('testTerminateFromBackgroundDestroyOrder0035', `events=${tap.text()}`);
        expect(tap.firstIndex(EVENT_BACKGROUND) < tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY)).assertTrue();
        expect(tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY) < tap.firstIndex(EVENT_DESTROY)).assertTrue();
        expect(tap.lastEvent()).assertEqual(EVENT_DESTROY);
        expect(tap.countOf(EVENT_DESTROY)).assertEqual(ONE);
      } finally {
        tap.stop();
        await terminateQuietly(observed);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3600
     * @tc.name      testBackgroundTerminateLaunchCycle0036
     * @tc.desc      Run a background, terminate and relaunch cycle and check the relaunch produces a fresh
     *               foreground instance with the entry module identity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundTerminateLaunchCycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      await moveToBackground(first);
      await waitBackground(first, EVENT_WAIT_MS);
      await terminateQuietly(first);
      const second: UIAbility = await launchHome();
      logCase('testBackgroundTerminateLaunchCycle0036', `same=${second === first} ` +
        `state=${stateOf(second)} module=${second.context.abilityInfo.moduleName}`);
      expect(sameInstance(first, second)).assertFalse();
      expect(isForeground(second)).assertTrue();
      expect(second.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(stateOf(second)).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3700
     * @tc.name      testBackgroundRelaunchStatsMonotone0037
     * @tc.desc      Interleave three counter snapshots with a background move and a relaunch, and check the
     *               consecutive snapshot pairs are all monotone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundRelaunchStatsMonotone0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const first: GcSnapshot = snapshot();
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const second: GcSnapshot = snapshot();
        await startHomeAndSettle();
        const third: GcSnapshot = snapshot();
        logCase('testBackgroundRelaunchStatsMonotone0037', `firstToSecond=${deltaText(first, second)} ` +
          `secondToThird=${deltaText(second, third)}`);
        expect(statsMonotone(first, second)).assertTrue();
        expect(statsMonotone(second, third)).assertTrue();
        expect(statsMonotone(first, third)).assertTrue();
        expect(allNonNegative(deltasOf(second, third))).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3800
     * @tc.name      testSecondBackgroundIdempotent0038
     * @tc.desc      Repeat a background move and require SDK error 16000065, check the saved window rectangle and
     *               background state are unchanged, then resume and verify the original instance is foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSecondBackgroundIdempotent0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const main: window.Window = await mainWindowOf(ability);
        await moveToBackground(ability);
        const backgrounded: boolean = await waitBackground(ability, EVENT_WAIT_MS);
        expect(backgrounded).assertTrue();
        expect(isBackground(ability)).assertTrue();
        const firstRect: window.Rect = rectOf(main);
        let secondMoveCode: number = ZERO;
        try {
          // UIAbilityContext.moveAbilityToBackground is foreground-only; the SDK specifies 16000065 otherwise.
          await ability.context.moveAbilityToBackground();
        } catch (error) {
          secondMoveCode = Number((error as BusinessError).code);
        }
        expect(secondMoveCode).assertEqual(ERR_BACKGROUND_NOT_FOREGROUND);
        const secondRect: window.Rect = rectOf(main);
        const top: UIAbility | undefined = await topAbility();
        logCase('testSecondBackgroundIdempotent0038', `first=${firstRect.width}x${firstRect.height} ` +
          `second=${secondRect.width}x${secondRect.height} code=${secondMoveCode} topIsAbility=${top === ability}`);
        expect(isBackground(ability)).assertTrue();
        expect(firstRect.width > ZERO).assertTrue();
        expect(firstRect.height > ZERO).assertTrue();
        expect(firstRect.left).assertEqual(secondRect.left);
        expect(firstRect.top).assertEqual(secondRect.top);
        expect(firstRect.width).assertEqual(secondRect.width);
        expect(firstRect.height).assertEqual(secondRect.height);
        expect(top === ability).assertFalse();
        await startHomeAndSettle();
        const foregrounded: boolean = await waitForeground(ability, EVENT_WAIT_MS);
        expect(foregrounded).assertTrue();
        expect(isForeground(ability)).assertTrue();
        expect((await topAbility()) === ability).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_3900
     * @tc.name      testRapidBackgroundForegroundPulse0039
     * @tc.desc      Pulse EntryAbility through two short background and foreground round trips observed by one tap
     *               and check the log alternates and ends in the foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRapidBackgroundForegroundPulse0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      try {
        await backgroundWithTap(tap, ability);
        await resumeWithTap(tap);
        await backgroundWithTap(tap, ability);
        await resumeWithTap(tap);
        const backgrounds: number = tap.countOf(EVENT_BACKGROUND);
        const foregrounds: number = tap.countOf(EVENT_FOREGROUND);
        logCase('testRapidBackgroundForegroundPulse0039', `events=${tap.text()} backgrounds=${backgrounds} ` +
          `foregrounds=${foregrounds}`);
        expect(backgrounds).assertEqual(TWO);
        expect(foregrounds >= TWO).assertTrue();
        expect(tap.lastEvent()).assertEqual(EVENT_FOREGROUND);
        expect(isForeground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4000
     * @tc.name      testThreeStartStopCyclesInstances0040
     * @tc.desc      Run three explicit start and stop cycles and check the three returned instances are distinct,
     *               the last one is in the foreground and every one belongs to the entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testThreeStartStopCyclesInstances0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: UIAbility = await launchHome();
      await stopHome();
      const second: UIAbility = await launchHome();
      await stopHome();
      const third: UIAbility = await launchHome();
      const cycle: UIAbility[] = [first, second, third];
      logCase('testThreeStartStopCyclesInstances0040', `distinct=${distinctInstances(cycle)} ` +
        `modules=${modulesJoined(cycle)} foreground=${isForeground(third)}`);
      expect(distinctInstances(cycle)).assertEqual(THREE);
      expect(third === first).assertFalse();
      expect(isForeground(third)).assertTrue();
      expect(modulesJoined(cycle)).assertEqual(
        `${ENTRY_MODULE}${SEPARATOR}${ENTRY_MODULE}${SEPARATOR}${ENTRY_MODULE}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4100
     * @tc.name      testThreeCyclesStatsMonotone0041
     * @tc.desc      Sample the runtime counters after every one of three start and stop cycles and check the four
     *               consecutive snapshots never move backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testThreeCyclesStatsMonotone0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const base: GcSnapshot = snapshot();
      await launchHome();
      await stopHome();
      const afterFirst: GcSnapshot = snapshot();
      await launchHome();
      await stopHome();
      const afterSecond: GcSnapshot = snapshot();
      const last: UIAbility = await launchHome();
      const afterThird: GcSnapshot = snapshot();
      logCase('testThreeCyclesStatsMonotone0041', `baseToFirst=${deltaText(base, afterFirst)} ` +
        `firstToSecond=${deltaText(afterFirst, afterSecond)} secondToThird=${deltaText(afterSecond, afterThird)} ` +
        `lastState=${stateOf(last)}`);
      expect(statsMonotone(base, afterFirst)).assertTrue();
      expect(statsMonotone(afterFirst, afterSecond)).assertTrue();
      expect(statsMonotone(afterSecond, afterThird)).assertTrue();
      expect(statsMonotone(base, afterThird)).assertTrue();
      expect(allNonNegative(deltasOf(base, afterThird))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4200
     * @tc.name      testTwoCyclesTapCreateCount0042
     * @tc.desc      Keep one tap registered across two full create and destroy cycles and check the create callback
     *               fires once per cycle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoCyclesTapCreateCount0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        const first: UIAbility = await startObserved(tap);
        await first.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        const second: UIAbility = await startObserved(tap);
        logCase('testTwoCyclesTapCreateCount0042', `events=${tap.text()} creates=${tap.countOf(EVENT_CREATE)} ` +
          `same=${second === first}`);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(TWO);
        expect(second === first).assertFalse();
        expect(isForeground(second)).assertTrue();
        expect(tap.countOf(EVENT_DESTROY)).assertEqual(ONE);
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4300
     * @tc.name      testTwoCyclesWindowStageCount0043
     * @tc.desc      Run two observed cold starts and check the window stage create callback count keeps step with the
     *               create callback count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoCyclesWindowStageCount0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        const first: UIAbility = await startObserved(tap);
        await first.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        await startObserved(tap);
        const stages: number = tap.countOf(EVENT_WINDOW_STAGE_CREATE);
        const creates: number = tap.countOf(EVENT_CREATE);
        const kinds: number = distinctEventsOf(tap.events);
        logCase('testTwoCyclesWindowStageCount0043', `stages=${stages} creates=${creates} kinds=${kinds} ` +
          `events=${tap.text()}`);
        expect(stages).assertEqual(TWO);
        expect(creates).assertEqual(TWO);
        expect(stages).assertEqual(creates);
        expect(kinds >= THREE).assertTrue();
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4400
     * @tc.name      testTwoCyclesDestroyCount0044
     * @tc.desc      Terminate two successive observed launches and check every cycle reports one window stage
     *               destroy and one destroy, with destroy as the final event
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoCyclesDestroyCount0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        const first: UIAbility = await startObserved(tap);
        await first.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        const second: UIAbility = await startObserved(tap);
        await second.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, THREE * EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        logCase('testTwoCyclesDestroyCount0044', `destroys=${tap.countOf(EVENT_DESTROY)} ` +
          `stageDestroys=${tap.countOf(EVENT_WINDOW_STAGE_DESTROY)} last=${tap.lastEvent()} events=${tap.text()}`);
        expect(tap.countOf(EVENT_DESTROY)).assertEqual(TWO);
        expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(TWO);
        expect(tap.lastEvent()).assertEqual(EVENT_DESTROY);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(TWO);
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4500
     * @tc.name      testThreeCyclePairwiseDistinct0045
     * @tc.desc      Compare three instances produced by three cycles pairwise and check no two of them are the same
     *               object
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testThreeCyclePairwiseDistinct0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: UIAbility = await launchHome();
      const second: UIAbility = await launchHome();
      const third: UIAbility = await launchHome();
      logCase('testThreeCyclePairwiseDistinct0045', `firstVsSecond=${first === second} ` +
        `secondVsThird=${second === third} firstVsThird=${first === third} ` +
        `names=${namesJoined([first, second, third])}`);
      expect(first === second).assertFalse();
      expect(second === third).assertFalse();
      expect(first === third).assertFalse();
      expect(third.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4600
     * @tc.name      testCycleStatsChainMonotone0046
     * @tc.desc      Compare the freed byte and gc count counters along a three cycle chain and check each counter
     *               grows or stays flat
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCycleStatsChainMonotone0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = snapshot();
      const first: UIAbility = await launchHome();
      await first.context.terminateSelf();
      await sleepMs(SETTLE_MS);
      const middle: GcSnapshot = snapshot();
      const second: UIAbility = await launchHome();
      await second.context.terminateSelf();
      await sleepMs(SETTLE_MS);
      const end: GcSnapshot = snapshot();
      logCase('testCycleStatsChainMonotone0046', `startToMiddle=${deltaText(start, middle)} ` +
        `middleToEnd=${deltaText(middle, end)}`);
      expect(freedDelta(start, middle) >= ZERO).assertTrue();
      expect(freedDelta(middle, end) >= ZERO).assertTrue();
      expect(countDelta(start, end) >= ZERO).assertTrue();
      expect(statsMonotone(start, end)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4700
     * @tc.name      testStopLeavesNoTopInstance0047
     * @tc.desc      Stop the running EntryAbility and check the stopped instance is no longer the top ability and
     *               no longer reports the foreground state
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStopLeavesNoTopInstance0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      await stopHome();
      const top: UIAbility | undefined = await topAbility();
      const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOrUninitialized(ability);
      logCase('testStopLeavesNoTopInstance0047', `topIsAbility=${top === ability} state=${state} ` +
        `foreground=${isForeground(ability)}`);
      expect(top === ability).assertFalse();
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND).assertFalse();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4800
     * @tc.name      testDoubleStopHomeSafe0048
     * @tc.desc      Stop the same EntryAbility twice in a row and check the second stop is harmless and a later
     *               launch still reaches the foreground with a different instance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDoubleStopHomeSafe0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      await stopHome();
      await stopHome();
      const relaunched: UIAbility = await launchHome();
      logCase('testDoubleStopHomeSafe0048', `same=${relaunched === ability} ` +
        `state=${stateOf(relaunched)} module=${relaunched.context.abilityInfo.moduleName}`);
      expect(relaunched === ability).assertFalse();
      expect(isForeground(relaunched)).assertTrue();
      expect(relaunched.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect((await topAbility()) === relaunched).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_4900
     * @tc.name      testCycleNamesStable0049
     * @tc.desc      Check the ability name and module name reported by every instance of a three cycle run stay at
     *               the declared values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCycleNamesStable0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: UIAbility = await launchHome();
      const second: UIAbility = await launchHome();
      const third: UIAbility = await launchHome();
      const cycle: UIAbility[] = [first, second, third];
      const names: string = namesJoined(cycle);
      logCase('testCycleNamesStable0049', `names=${names} modules=${modulesJoined(cycle)} ` +
        `distinct=${distinctInstances(cycle)}`);
      expect(names).assertEqual(
        `${ENTRY_ABILITY}${SEPARATOR}${ENTRY_ABILITY}${SEPARATOR}${ENTRY_ABILITY}`);
      expect(modulesJoined(cycle)).assertEqual(
        `${ENTRY_MODULE}${SEPARATOR}${ENTRY_MODULE}${SEPARATOR}${ENTRY_MODULE}`);
      expect(distinctInstances(cycle)).assertEqual(THREE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5000
     * @tc.name      testCycleWindowShownTwice0050
     * @tc.desc      Launch EntryAbility twice and check the latest instance drives a showing main window with a
     *               positive area while the earlier window may already be torn down
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCycleWindowShownTwice0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const firstWindow: window.Window = await mainWindowOf(first);
      const firstArea: number = areaOf(firstWindow);
      const second: UIAbility = await launchHome();
      const secondWindow: window.Window = await mainWindowOf(second);
      const secondArea: number = areaOf(secondWindow);
      const firstShowing: boolean = await showingWhenReady(firstWindow, EVENT_WAIT_MS);
      const secondShowing: boolean = await showingWhenReady(secondWindow, EVENT_WAIT_MS);
      logCase('testCycleWindowShownTwice0050', `firstArea=${firstArea} secondArea=${secondArea} ` +
        `firstShowing=${firstShowing} secondShowing=${secondShowing}`);
      expect(secondShowing).assertTrue();
      expect(firstArea > ZERO).assertTrue();
      expect(secondArea > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5100
     * @tc.name      testCycleWithHintGcStats0051
     * @tc.desc      Force a garbage collection hint between two launches and check the gc count counter neither
     *               resets nor decreases around the lifecycle work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCycleWithHintGcStats0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = snapshot();
      const first: UIAbility = await launchHome();
      hintGC();
      await sleepMs(SETTLE_MS);
      const middle: GcSnapshot = snapshot();
      await first.context.terminateSelf();
      hintGC();
      await sleepMs(SETTLE_MS);
      const after: GcSnapshot = snapshot();
      logCase('testCycleWithHintGcStats0051', `beforeToMiddle=${deltaText(before, middle)} ` +
        `middleToAfter=${deltaText(middle, after)}`);
      expect(statsMonotone(before, middle)).assertTrue();
      expect(statsMonotone(middle, after)).assertTrue();
      expect(middle.count >= before.count).assertTrue();
      expect(after.count >= middle.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5200
     * @tc.name      testWindowStageDestroyRecorded0052
     * @tc.desc      Terminate the running EntryAbility and check the window stage destroy callback is recorded once
     *               while the ability context still reports the entry ability name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStageDestroyRecorded0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const nameBefore: string = ability.context.abilityInfo.name;
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const stageDestroys: number = tap.countOf(EVENT_WINDOW_STAGE_DESTROY);
      logCase('testWindowStageDestroyRecorded0052', `stageDestroys=${stageDestroys} ` +
        `nameBefore=${nameBefore} events=${tap.text()}`);
      expect(tap.has(EVENT_WINDOW_STAGE_DESTROY)).assertTrue();
      expect(stageDestroys).assertEqual(ONE);
      expect(tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY) >= ZERO).assertTrue();
      expect(nameBefore).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5300
     * @tc.name      testDestroyOncePerTerminate0053
     * @tc.desc      Terminate a running EntryAbility under observation and check exactly two teardown callbacks are
     *               recorded, the window stage destroy first and the destroy second
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDestroyOncePerTerminate0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      logCase('testDestroyOncePerTerminate0053', `size=${tap.size()} first=${tap.firstEvent()} ` +
        `last=${tap.lastEvent()} events=${tap.text()}`);
      expect(tap.size()).assertEqual(TWO + tap.countOf(EVENT_BACKGROUND));
      expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ONE);
      expect(tap.countOf(EVENT_DESTROY)).assertEqual(ONE);
      expect(tap.lastEvent()).assertEqual(EVENT_DESTROY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5400
     * @tc.name      testNoDestroyWhileRunning0054
     * @tc.desc      Observe a running EntryAbility for a full settle window and check no teardown callback is
     *               delivered while the ability stays in the foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNoDestroyWhileRunning0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        await sleepMs(TWO * SETTLE_MS);
        logCase('testNoDestroyWhileRunning0054', `recorded=${tap.size()} ` +
          `hasDestroy=${tap.has(EVENT_DESTROY)} foreground=${isForeground(ability)}`);
        expect(tap.size()).assertEqual(ZERO);
        expect(tap.has(EVENT_WINDOW_STAGE_DESTROY)).assertFalse();
        expect(tap.has(EVENT_DESTROY)).assertFalse();
        expect(isForeground(ability)).assertTrue();
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5500
     * @tc.name      testWindowStageDestroyAfterBackground0055
     * @tc.desc      Background EntryAbility, terminate it from the background and check the background callback
     *               precedes the window stage destroy callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowStageDestroyAfterBackground0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        await moveToBackground(ability);
        await waitTapEvent(tap, EVENT_BACKGROUND, EVENT_WAIT_MS);
        await ability.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        const afterTop: UIAbility | undefined = await topAbility();
        logCase('testWindowStageDestroyAfterBackground0055', `events=${tap.text()} ` +
          `topIsAbility=${afterTop === ability} creates=${tap.countOf(EVENT_CREATE)}`);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(ZERO);
        expect(tap.firstIndex(EVENT_BACKGROUND) < tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY)).assertTrue();
        expect(tap.lastIndex(EVENT_DESTROY)).assertEqual(tap.size() - ONE);
        expect(afterTop === ability).assertFalse();
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5600
     * @tc.name      testWindowStageDestroyWithoutBackground0056
     * @tc.desc      Terminate EntryAbility directly from the foreground and check the window stage destroy callback
     *               sits immediately before the final destroy callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowStageDestroyWithoutBackground0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_DESTROY);
      logCase('testWindowStageDestroyWithoutBackground0056', `events=${tap.text()} stageIndex=${stageIndex} ` +
        `size=${tap.size()}`);
      expect(tap.lastIndex(EVENT_WINDOW_STAGE_DESTROY) + ONE).assertEqual(tap.lastIndex(EVENT_DESTROY));
      expect(tap.lastEvent()).assertEqual(EVENT_DESTROY);
      expect(tap.countOf(EVENT_DESTROY)).assertEqual(ONE);
      expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5700
     * @tc.name      testDoubleTerminateSingleDestroy0057
     * @tc.desc      Terminate the same EntryAbility twice and check the second request does not produce a second
     *               destroy callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDoubleTerminateSingleDestroy0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        await ability.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        try {
          await ability.context.terminateSelf();
        } catch (error) {
          logCase('testDoubleTerminateSingleDestroy0057', `secondCode=${Number((error as BusinessError).code)}`);
        }
        await sleepMs(TWO * SETTLE_MS);
        logCase('testDoubleTerminateSingleDestroy0057', `destroys=${tap.countOf(EVENT_DESTROY)} ` +
          `size=${tap.size()} events=${tap.text()}`);
        expect(tap.countOf(EVENT_DESTROY)).assertEqual(ONE);
        expect(tap.countOf(EVENT_WINDOW_STAGE_DESTROY)).assertEqual(ONE);
        expect(tap.countOf(EVENT_CREATE)).assertEqual(ZERO);
        expect(tap.countOf(EVENT_FOREGROUND)).assertEqual(ZERO);
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5800
     * @tc.name      testTopAbsentAfterDestroy0058
     * @tc.desc      Terminate EntryAbility, check it no longer owns the top slot nor reports the foreground state,
     *               then check a new launch takes the foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTopAbsentAfterDestroy0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const afterTop: UIAbility | undefined = await topAbility();
      const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOrUninitialized(ability);
      const fresh: UIAbility = await launchHome();
      logCase('testTopAbsentAfterDestroy0058', `topIsAbility=${afterTop === ability} state=${state} ` +
        `freshIsAbility=${fresh === ability} freshForeground=${isForeground(fresh)}`);
      expect(afterTop === ability).assertFalse();
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND).assertFalse();
      expect(fresh === ability).assertFalse();
      expect(isForeground(fresh)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_5900
     * @tc.name      testStageInstanceHeldUntilDestroy0059
     * @tc.desc      Capture the window stage at create time, terminate the ability under a second tap and check the
     *               captured stage belonged to the terminated instance and the teardown callbacks arrived
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStageInstanceHeldUntilDestroy0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(createTap);
      const staged: UIAbility | undefined = createTap.stagedInstance;
      const endTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(endTap, ability);
      logCase('testStageInstanceHeldUntilDestroy0059', `stagedIsAbility=${staged === ability} ` +
        `stageDefined=${createTap.stage !== undefined} endEvents=${endTap.text()}`);
      expect(staged === ability).assertTrue();
      expect(createTap.stage !== undefined).assertTrue();
      expect(endTap.has(EVENT_WINDOW_STAGE_DESTROY)).assertTrue();
      expect(endTap.has(EVENT_DESTROY)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6000
     * @tc.name      testTwoCycleDestroyOrder0060
     * @tc.desc      Observe two cycles with one tap each and check every cycle opens with create and closes with
     *               destroy while the two cycles produce different instances
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoCycleDestroyOrder0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const first: UIAbility = await coldStart(startTap);
      const firstEndTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(firstEndTap, first);
      const secondTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const second: UIAbility = await coldStart(secondTap);
      const secondEndTap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(secondEndTap, second);
      logCase('testTwoCycleDestroyOrder0060', `firstStart=${startTap.text()} firstEnd=${firstEndTap.text()} ` +
        `secondStart=${secondTap.text()} secondEnd=${secondEndTap.text()} same=${second === first}`);
      expect(startTap.firstEvent()).assertEqual(EVENT_CREATE);
      expect(firstEndTap.lastEvent()).assertEqual(EVENT_DESTROY);
      expect(secondTap.firstEvent()).assertEqual(EVENT_CREATE);
      expect(secondEndTap.lastEvent()).assertEqual(EVENT_DESTROY);
      expect(second === first).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6100
     * @tc.name      testTapStoppedBeforeTerminate0061
     * @tc.desc      Unregister the tap before terminating EntryAbility and check the termination is silent for the
     *               tap while the ability still leaves the top slot
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTapStoppedBeforeTerminate0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      tap.stop();
      await ability.context.terminateSelf();
      await sleepMs(TWO * SETTLE_MS);
      const top: UIAbility | undefined = await topAbility();
      const fresh: UIAbility = await launchHome();
      logCase('testTapStoppedBeforeTerminate0061', `recorded=${tap.size()} topIsAbility=${top === ability} ` +
        `freshForeground=${isForeground(fresh)}`);
      expect(tap.size()).assertEqual(ZERO);
      expect(top === ability).assertFalse();
      expect(isForeground(fresh)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6200
     * @tc.name      testLaunchAfterDestroyEvent0062
     * @tc.desc      Wait for the destroy callback of the first instance and relaunch immediately, then check the new
     *               instance is different and owns the top slot
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLaunchAfterDestroyEvent0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, first);
      const destroyedSeen: boolean = tap.has(EVENT_DESTROY);
      const second: UIAbility = await launchHome();
      const top: UIAbility | undefined = await topAbility();
      logCase('testLaunchAfterDestroyEvent0062', `destroyedSeen=${destroyedSeen} same=${second === first} ` +
        `topIsSecond=${top === second} module=${second.context.abilityInfo.moduleName}`);
      expect(destroyedSeen).assertTrue();
      expect(second === first).assertFalse();
      expect(top === second).assertTrue();
      expect(second.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6300
     * @tc.name      testTopAbilityInfoContract0063
     * @tc.desc      Read the ability info of the current top ability and check it names the EntryAbility of the
     *               entry module of the sample bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testTopAbilityInfoContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      const top: UIAbility | undefined = await topAbility();
      const info: bundleManager.AbilityInfo = (top as UIAbility).context.abilityInfo;
      logCase('testTopAbilityInfoContract0063', `topDefined=${top !== undefined} name=${info.name} ` +
        `module=${info.moduleName} bundle=${info.bundleName}`);
      expect(top !== undefined).assertTrue();
      expect(info.name).assertEqual(ENTRY_ABILITY);
      expect(info.moduleName).assertEqual(ENTRY_MODULE);
      expect(info.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6400
     * @tc.name      testTopApplicationInfoFields0064
     * @tc.desc      Read the application info behind a fresh EntryAbility and check the bundle identity, a non empty
     *               version name and a positive application uid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTopApplicationInfoFields0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const appInfo: bundleManager.ApplicationInfo = ability.context.applicationInfo;
      const bundle: bundleManager.BundleInfo = await selfBundle();
      const uid: number = Number(appInfo.uid);
      const versionName: string = bundle.versionName;
      logCase('testTopApplicationInfoFields0064', `name=${appInfo.name} bundle=${bundle.name} ` +
        `version=${versionName} uid=${uid}`);
      expect(appInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundle.name).assertEqual(BUNDLE_NAME);
      expect(versionName.length > ZERO).assertTrue();
      expect(uid > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6500
     * @tc.name      testContextResourceColorMode0065
     * @tc.desc      Compare the colour mode reported by the ability configuration with the one of the resource
     *               manager and check both agree on a concrete dark or light mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextResourceColorMode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const abilityMode: number = Number(ability.context.config.colorMode);
      const resourceMode: number = Number(ability.context.resourceManager.getConfigurationSync().colorMode);
      logCase('testContextResourceColorMode0065', `abilityMode=${abilityMode} resourceMode=${resourceMode}`);
      expect(abilityMode === COLOR_MODE_NOT_SET).assertFalse();
      expect(abilityMode === COLOR_MODE_DARK || abilityMode === COLOR_MODE_LIGHT).assertTrue();
      expect(abilityMode).assertEqual(resourceMode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6600
     * @tc.name      testAbilityInfoLaunchType0066
     * @tc.desc      Check a fresh EntryAbility reports the singleton launch type and the bundle name declared by the
     *               sample; the ability type enum is FA model only and is therefore not read in Stage mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityInfoLaunchType0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      logCase('testAbilityInfoLaunchType0066', `launchType=${info.launchType} bundle=${info.bundleName} ` +
        `name=${info.name}`);
      expect(info.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      expect(info.bundleName).assertEqual(BUNDLE_NAME);
      expect(info.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6700
     * @tc.name      testAbilityInfoExportedEnabled0067
     * @tc.desc      Check the runtime ability info marks EntryAbility exported and enabled and carries a non empty
     *               label describing the ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityInfoExportedEnabled0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      logCase('testAbilityInfoExportedEnabled0067', `exported=${info.exported} enabled=${info.enabled} ` +
        `labelLength=${info.label.length}`);
      expect(info.exported).assertTrue();
      expect(info.enabled).assertTrue();
      expect(info.label.length > ZERO).assertTrue();
      expect(info.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6800
     * @tc.name      testDeclaredRuntimeInfoAgree0068
     * @tc.desc      Compare the launch type, the exported flag and the name of the manifest declaration with the
     *               ones the running EntryAbility reports
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeclaredRuntimeInfoAgree0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      const runtime: bundleManager.AbilityInfo = ability.context.abilityInfo;
      logCase('testDeclaredRuntimeInfoAgree0068', `declaredName=${declared.name} runtimeName=${runtime.name} ` +
        `declaredExported=${declared.exported} runtimeExported=${runtime.exported}`);
      expect(runtime.name).assertEqual(declared.name);
      expect(runtime.launchType).assertEqual(declared.launchType);
      expect(runtime.exported).assertEqual(declared.exported);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_6900
     * @tc.name      testDeclaredBundleFieldsMatch0069
     * @tc.desc      Check the manifest declaration of EntryAbility carries the sample bundle name, the entry module
     *               name and that the entry module declares exactly one ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeclaredBundleFieldsMatch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      const module: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testDeclaredBundleFieldsMatch0069', `bundle=${declared.bundleName} module=${declared.moduleName} ` +
        `abilities=${module.abilitiesInfo.length}`);
      expect(declared.bundleName).assertEqual(BUNDLE_NAME);
      expect(declared.moduleName).assertEqual(ENTRY_MODULE);
      expect(module.abilitiesInfo.length).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7000
     * @tc.name      testDeclaredHomeSkill0070
     * @tc.desc      Check the manifest declaration of EntryAbility carries the home action and the system home
     *               entity so the ability can be started as the launcher entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeclaredHomeSkill0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      const hasSkill: boolean = declaresHomeSkill(declared);
      logCase('testDeclaredHomeSkill0070', `skills=${declared.skills.length} hasHomeSkill=${hasSkill} ` +
        `name=${declared.name}`);
      expect(hasSkill).assertTrue();
      expect(declared.skills.length >= ONE).assertTrue();
      expect(declared.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7100
     * @tc.name      testDeclaredEntryAbilityFirst0071
     * @tc.desc      Check the manifest declaration of EntryAbility is the first ability of the entry module and that
     *               the declared record is exported and enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeclaredEntryAbilityFirst0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      const module: bundleManager.HapModuleInfo = await entryModuleInfo();
      const firstDeclared: string = module.abilitiesInfo[ZERO].name;
      logCase('testDeclaredEntryAbilityFirst0071', `declared=${declared.name} first=${firstDeclared} ` +
        `exported=${declared.exported} enabled=${declared.enabled}`);
      expect(declared.name).assertEqual(ENTRY_ABILITY);
      expect(firstDeclared).assertEqual(ENTRY_ABILITY);
      expect(declared.exported).assertTrue();
      expect(declared.enabled).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7200
     * @tc.name      testDeclaredDeviceTypes0072
     * @tc.desc      Check the manifest declaration of EntryAbility lists the phone device type used by this sample
     *               and that the runtime instance agrees on the ability name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeclaredDeviceTypes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      logCase('testDeclaredDeviceTypes0072', `deviceTypes=${declared.deviceTypes.join(SEPARATOR)} ` +
        `hasPhone=${declaresDevice(declared, PHONE_DEVICE)} runtime=${ability.context.abilityInfo.name}`);
      expect(declaresDevice(declared, PHONE_DEVICE)).assertTrue();
      expect(declared.deviceTypes.length >= ONE).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual(declared.name);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7300
     * @tc.name      testApplicationInfoChain0073
     * @tc.desc      Compare the runtime application info reached through the ability context with the application
     *               record of the installed bundle and check the uid and the bundle name agree while the version code
     *               and the token stay positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplicationInfoChain0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const bundle: bundleManager.BundleInfo = await selfBundle();
      const runtimeApp: bundleManager.ApplicationInfo = ability.context.abilityInfo.applicationInfo;
      const bundleApp: bundleManager.ApplicationInfo = bundle.appInfo;
      const versionCode: number = bundle.versionCode;
      logCase('testApplicationInfoChain0073', `runtimeUid=${runtimeApp.uid} bundleUid=${bundleApp.uid} ` +
        `bundle=${bundle.name} versionCode=${versionCode}`);
      expect(Number(runtimeApp.uid)).assertEqual(Number(bundleApp.uid));
      expect(runtimeApp.name).assertEqual(bundle.name);
      expect(versionCode > ZERO).assertTrue();
      expect(Number(runtimeApp.accessTokenId) > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7400
     * @tc.name      testAbilityInfoProcessField0074
     * @tc.desc      Check the undeclared ability process is empty and agrees with the installed ability record,
     *               while the runtime application process defaults to the sample bundle name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityInfoProcessField0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      const process: string = ability.context.abilityInfo.process;
      const applicationProcess: string = ability.context.applicationInfo.process;
      logCase('testAbilityInfoProcessField0074', `process=${process} declaredProcess=${declared.process} ` +
        `applicationProcess=${applicationProcess}`);
      expect(process).assertEqual(EMPTY_TEXT);
      expect(process).assertEqual(declared.process);
      expect(applicationProcess).assertEqual(BUNDLE_NAME);
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7500
     * @tc.name      testWindowShowingAfterLaunch0075
     * @tc.desc      Check the main window of a fresh EntryAbility is showing and its area stays within the area of
     *               the default display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowShowingAfterLaunch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await mainWindowOf(ability);
      const area: number = areaOf(main);
      const screen: display.Display = screenOf();
      const screenArea: number = screen.width * screen.height;
      const showing: boolean = await showingWhenReady(main, EVENT_WAIT_MS);
      logCase('testWindowShowingAfterLaunch0075', `showing=${showing} area=${area} ` +
        `screenArea=${screenArea}`);
      expect(showing).assertTrue();
      expect(area > ZERO).assertTrue();
      expect(area <= screenArea).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7600
     * @tc.name      testWindowRectWithinScreen0076
     * @tc.desc      Read the window rectangle of a fresh EntryAbility and check it has a positive size that fits
     *               inside the default display bounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectWithinScreen0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const rect: window.Rect = rectOf(await mainWindowOf(ability));
      const screen: display.Display = screenOf();
      logCase('testWindowRectWithinScreen0076', `rect=${rect.width}x${rect.height} ` +
        `screen=${screen.width}x${screen.height}`);
      expect(rect.width > ZERO).assertTrue();
      expect(rect.height > ZERO).assertTrue();
      expect(rect.width <= screen.width).assertTrue();
      expect(rect.height <= screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7700
     * @tc.name      testWindowStageRecordedAtCreate0077
     * @tc.desc      Check the window stage create callback is the second callback of a cold start, right after
     *               create, and that it hands back the launched ability instance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStageRecordedAtCreate0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_CREATE);
      const staged: UIAbility | undefined = tap.stagedInstance;
      logCase('testWindowStageRecordedAtCreate0077', `stageIndex=${stageIndex} events=${tap.text()} ` +
        `stagedIsAbility=${staged === ability}`);
      expect(stageIndex).assertEqual(ONE);
      expect(staged === ability).assertTrue();
      expect(tap.stage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7800
     * @tc.name      testWindowRectStableAcrossReads0078
     * @tc.desc      Read the main window rectangle of one EntryAbility twice with a settle gap and check width,
     *               height and area are unchanged
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectStableAcrossReads0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const firstRect: window.Rect = rectOf(await mainWindowOf(ability));
      const firstArea: number = firstRect.width * firstRect.height;
      await sleepMs(SETTLE_MS);
      const secondRect: window.Rect = rectOf(await mainWindowOf(ability));
      const secondArea: number = secondRect.width * secondRect.height;
      logCase('testWindowRectStableAcrossReads0078', `first=${firstRect.width}x${firstRect.height} ` +
        `second=${secondRect.width}x${secondRect.height} areas=${firstArea}/${secondArea}`);
      expect(firstRect.width).assertEqual(secondRect.width);
      expect(firstRect.height).assertEqual(secondRect.height);
      expect(firstArea).assertEqual(secondArea);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_7900
     * @tc.name      testWindowShowingAfterRoundTrip0079
     * @tc.desc      Park EntryAbility in the background, bring it back and check its main window is showing again
     *               with a positive area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowShowingAfterRoundTrip0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await startHomeAndSettle();
        const main: window.Window = await mainWindowOf(ability);
        logCase('testWindowShowingAfterRoundTrip0079', `showing=${main.isWindowShowing()} ` +
          `area=${areaOf(main)} foreground=${isForeground(ability)}`);
        expect(main.isWindowShowing()).assertTrue();
        expect(areaOf(main) > ZERO).assertTrue();
        expect(isForeground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8000
     * @tc.name      testWindowRectStableAcrossBackground0080
     * @tc.desc      Compare the main window rectangle before and after a background round trip and check the size of
     *               the window is preserved
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRectStableAcrossBackground0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const before: window.Rect = rectOf(await mainWindowOf(ability));
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await startHomeAndSettle();
        const after: window.Rect = rectOf(await mainWindowOf(ability));
        logCase('testWindowRectStableAcrossBackground0080', `before=${before.width}x${before.height} ` +
          `after=${after.width}x${after.height}`);
        expect(after.width).assertEqual(before.width);
        expect(after.height).assertEqual(before.height);
        expect(isForeground(ability)).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8100
     * @tc.name      testWindowAreaProduct0081
     * @tc.desc      Check the window area helper agrees with the product of the reported rectangle edges and that
     *               the window is showing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAreaProduct0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await mainWindowOf(ability);
      const rect: window.Rect = rectOf(main);
      const expected: number = rect.width * rect.height;
      const measured: number = areaOf(main);
      logCase('testWindowAreaProduct0081', `expected=${expected} measured=${measured} ` +
        `edges=${rect.width}x${rect.height}`);
      expect(measured).assertEqual(expected);
      expect(measured > ZERO).assertTrue();
      expect(main.isWindowShowing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8200
     * @tc.name      testScreenBoundsPositive0082
     * @tc.desc      Check the default display reports positive width, height and density, and that the entry window
     *               does not exceed the display area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScreenBoundsPositive0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const screen: display.Display = screenOf();
      const windowArea: number = areaOf(await mainWindowOf(ability));
      logCase('testScreenBoundsPositive0082', `screen=${screen.width}x${screen.height} ` +
        `density=${screen.densityPixels} windowArea=${windowArea}`);
      expect(screen.width > ZERO).assertTrue();
      expect(screen.height > ZERO).assertTrue();
      expect(screen.densityPixels > ZERO).assertTrue();
      expect(windowArea <= screen.width * screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8300
     * @tc.name      testWindowShownOnSecondLaunch0083
     * @tc.desc      Launch EntryAbility twice and check each of the two distinct instances drives a showing window
     *               with a positive area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowShownOnSecondLaunch0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const firstArea: number = areaOf(await mainWindowOf(first));
      const second: UIAbility = await launchHome();
      const secondWindow: window.Window = await mainWindowOf(second);
      const secondArea: number = areaOf(secondWindow);
      logCase('testWindowShownOnSecondLaunch0083', `firstArea=${firstArea} secondArea=${secondArea} ` +
        `same=${second === first} showing=${secondWindow.isWindowShowing()}`);
      expect(firstArea > ZERO).assertTrue();
      expect(secondArea > ZERO).assertTrue();
      expect(second === first).assertFalse();
      expect(secondWindow.isWindowShowing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8400
     * @tc.name      testWindowStageNonEmptyAtForeground0084
     * @tc.desc      Check that at the moment the foreground callback arrives the recorded window stage exists and
     *               the ability window already has a positive area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowStageNonEmptyAtForeground0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const stageIndex: number = tap.firstIndex(EVENT_WINDOW_STAGE_CREATE);
      const foregroundIndex: number = tap.firstIndex(EVENT_FOREGROUND);
      const area: number = areaOf(await mainWindowOf(ability));
      logCase('testWindowStageNonEmptyAtForeground0084', `stageIndex=${stageIndex} ` +
        `foregroundIndex=${foregroundIndex} area=${area} stageDefined=${tap.stage !== undefined}`);
      expect(tap.stage !== undefined).assertTrue();
      expect(foregroundIndex > stageIndex).assertTrue();
      expect(area > ZERO).assertTrue();
      expect(tap.size() >= COLD_START_MIN_EVENTS).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8500
     * @tc.name      testStateForegroundEnumExact0085
     * @tc.desc      Check a freshly created EntryAbility reports exactly the foreground lifecycle enum and neither
     *               the create nor the destroy enum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStateForegroundEnumExact0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
      logCase('testStateForegroundEnumExact0085', `state=${state} events=${tap.text()} ` +
        `name=${ability.context.abilityInfo.name}`);
      expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.CREATE).assertFalse();
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.DESTROY).assertFalse();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8600
     * @tc.name      testStateTripletAcrossRoundTrip0086
     * @tc.desc      Collect the lifecycle state before, during and after a background round trip and check the three
     *               values alternate foreground, background, foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStateTripletAcrossRoundTrip0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const firstState: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const middleState: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        await startHomeAndSettle();
        const finalState: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        logCase('testStateTripletAcrossRoundTrip0086', `first=${firstState} middle=${middleState} ` +
          `final=${finalState}`);
        expect(firstState).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
        expect(middleState).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
        expect(finalState).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8700
     * @tc.name      testStateAfterResumeIsForeground0087
     * @tc.desc      Resume a backgrounded EntryAbility and check it is back on top with the foreground state and not
     *               left in the uninitialized state
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStateAfterResumeIsForeground0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      try {
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        await startHomeAndSettle();
        const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOf(ability);
        const top: UIAbility | undefined = await topAbility();
        logCase('testStateAfterResumeIsForeground0087', `state=${state} topIsAbility=${top === ability}`);
        expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
        expect(state === abilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED).assertFalse();
        expect(top === ability).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8800
     * @tc.name      testStateUninitializedAfterDestroyFallback0088
     * @tc.desc      Confirm the destroy callback identifies the terminated EntryAbility, then check its state no
     *               longer reports foreground and the instance no longer holds the top slot
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStateUninitializedAfterDestroyFallback0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
      const ability: UIAbility = await launchHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await terminateWithTap(tap, ability);
      const state: abilityDelegatorRegistry.AbilityLifecycleState = stateOrUninitialized(ability);
      const top: UIAbility | undefined = await topAbility();
      logCase('testStateUninitializedAfterDestroyFallback0088', `state=${state} topIsAbility=${top === ability} ` +
        `events=${tap.text()} destroyedIsAbility=${tap.destroyedInstance === ability}`);
      expect(tap.destroyedInstance === ability).assertTrue();
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND).assertFalse();
      expect(top === ability).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_8900
     * @tc.name      testTapRanksMonotoneColdStart0089
     * @tc.desc      Convert the cold start callback log into lifecycle ranks and check the ranks start at create,
     *               end at foreground and never step backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTapRanksMonotoneColdStart0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      await coldStart(tap);
      const ranks: number[] = ranksOf(tap.events);
      logCase('testTapRanksMonotoneColdStart0089', `ranks=${ranks.join(SEPARATOR)} events=${tap.text()}`);
      expect(ranksAscending(ranks)).assertTrue();
      expect(ranks[ZERO]).assertEqual(RANK_CREATE);
      expect(ranks[ranks.length - ONE]).assertEqual(RANK_FOREGROUND);
      expect(ranks.indexOf(RANK_UNKNOWN)).assertEqual(MISSING_INDEX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9000
     * @tc.name      testStatsMonotoneAcrossLaunch0090
     * @tc.desc      Sample the gc counters before and after a cold launch and check the count, the gc time and the
     *               allocated bytes did not decrease
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatsMonotoneAcrossLaunch0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = snapshot();
      const ability: UIAbility = await launchHome();
      const after: GcSnapshot = snapshot();
      logCase('testStatsMonotoneAcrossLaunch0090', `deltas=${deltaText(before, after)} ` +
        `name=${ability.context.abilityInfo.name}`);
      expect(statsMonotone(before, after)).assertTrue();
      expect(countDelta(before, after) >= ZERO).assertTrue();
      expect(timeDelta(before, after) >= ZERO).assertTrue();
      expect(allocatedDelta(before, after) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9100
     * @tc.name      testStatsMonotoneAcrossTerminate0091
     * @tc.desc      Sample the gc counters around a termination and check the freed bytes and the allocated bytes
     *               both stayed cumulative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsMonotoneAcrossTerminate0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const before: GcSnapshot = snapshot();
      await terminateQuietly(ability);
      const after: GcSnapshot = snapshot();
      logCase('testStatsMonotoneAcrossTerminate0091', `deltas=${deltaText(before, after)} ` +
        `freed=${before.freed}->${after.freed}`);
      expect(statsMonotone(before, after)).assertTrue();
      expect(freedDelta(before, after) >= ZERO).assertTrue();
      expect(after.allocated >= before.allocated).assertTrue();
      expect(after.count >= before.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9200
     * @tc.name      testStatsMonotoneAcrossStopHome0092
     * @tc.desc      Sample the gc counters before and after two repeated stop requests and check every counter of the
     *               snapshot pair is non decreasing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsMonotoneAcrossStopHome0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await launchHome();
      const before: GcSnapshot = snapshot();
      await stopHome();
      await stopHome();
      const after: GcSnapshot = snapshot();
      logCase('testStatsMonotoneAcrossStopHome0092', `deltas=${deltaText(before, after)} ` +
        `longFullGc=${before.longFullGc}->${after.longFullGc}`);
      expect(statsMonotone(before, after)).assertTrue();
      expect(allNonNegative(deltasOf(before, after))).assertTrue();
      expect(after.freed >= before.freed).assertTrue();
      expect(longFullGcDelta(before, after) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9300
     * @tc.name      testStatsThreeStepChain0093
     * @tc.desc      Chain three snapshots across a launch, a stop request and a second launch, and check the chain is
     *               monotone end to end while the relaunch hands back a new instance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsThreeStepChain0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const opening: GcSnapshot = snapshot();
      const first: UIAbility = await launchHome();
      const middle: GcSnapshot = snapshot();
      await stopHome();
      const closing: GcSnapshot = snapshot();
      const second: UIAbility = await launchHome();
      const resumed: GcSnapshot = snapshot();
      logCase('testStatsThreeStepChain0093', `openingToMiddle=${deltaText(opening, middle)} ` +
        `middleToClosing=${deltaText(middle, closing)} closingToResumed=${deltaText(closing, resumed)} ` +
        `same=${second === first}`);
      expect(statsMonotone(opening, middle)).assertTrue();
      expect(statsMonotone(middle, closing)).assertTrue();
      expect(statsMonotone(closing, resumed)).assertTrue();
      expect(second === first).assertFalse();
      expect(allocatedDelta(opening, resumed) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9400
     * @tc.name      testStatsFourSnapshotsTwoCycles0094
     * @tc.desc      Take four counter snapshots across two launch and terminate cycles and check every consecutive
     *               pair is monotone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsFourSnapshotsTwoCycles0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const beforeAll: GcSnapshot = snapshot();
      const first: UIAbility = await launchHome();
      const afterFirstLaunch: GcSnapshot = snapshot();
      await terminateQuietly(first);
      const afterFirstTerminate: GcSnapshot = snapshot();
      const second: UIAbility = await launchHome();
      const afterSecondLaunch: GcSnapshot = snapshot();
      logCase('testStatsFourSnapshotsTwoCycles0094', `a=${deltaText(beforeAll, afterFirstLaunch)} ` +
        `b=${deltaText(afterFirstLaunch, afterFirstTerminate)} ` +
        `c=${deltaText(afterFirstTerminate, afterSecondLaunch)} same=${second === first}`);
      expect(statsMonotone(beforeAll, afterFirstLaunch)).assertTrue();
      expect(statsMonotone(afterFirstLaunch, afterFirstTerminate)).assertTrue();
      expect(statsMonotone(afterFirstTerminate, afterSecondLaunch)).assertTrue();
      expect(second === first).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9500
     * @tc.name      testStatsCountNeverDecreases0095
     * @tc.desc      Read the gc count counter three times around a launch and a terminate and check the middle and
     *               the last read are never smaller than the earlier ones
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsCountNeverDecreases0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = gcStat(KEY_GC_COUNT);
      const ability: UIAbility = await launchHome();
      const middle: number = gcStat(KEY_GC_COUNT);
      await terminateQuietly(ability);
      const end: number = gcStat(KEY_GC_COUNT);
      logCase('testStatsCountNeverDecreases0095', `start=${start} middle=${middle} end=${end}`);
      expect(middle >= start).assertTrue();
      expect(end >= middle).assertTrue();
      expect(end >= start).assertTrue();
      expect(Number.isFinite(end)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9600
     * @tc.name      testStatsAfterHintGc0096
     * @tc.desc      Force collection hints before and after a lifecycle step and check the snapshots taken around the
     *               hints remain monotone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsAfterHintGc0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const beforeHint: GcSnapshot = snapshot();
      hintGC();
      await sleepMs(SETTLE_MS);
      const afterHint: GcSnapshot = snapshot();
      const ability: UIAbility = await launchHome();
      hintGC();
      await sleepMs(SETTLE_MS);
      const afterLaunch: GcSnapshot = snapshot();
      logCase('testStatsAfterHintGc0096', `hint=${deltaText(beforeHint, afterHint)} ` +
        `launch=${deltaText(afterHint, afterLaunch)} name=${ability.context.abilityInfo.name}`);
      expect(statsMonotone(beforeHint, afterHint)).assertTrue();
      expect(statsMonotone(afterHint, afterLaunch)).assertTrue();
      expect(freedDelta(beforeHint, afterHint) >= ZERO).assertTrue();
      expect(countDelta(afterHint, afterLaunch) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9700
     * @tc.name      testStatsFreedWithinAllocated0097
     * @tc.desc      Check the freed byte counter never exceeds the allocated byte counter and that both are finite
     *               positive cumulative values after a launch
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsFreedWithinAllocated0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await launchHome();
      const stats: GcSnapshot = snapshot();
      logCase('testStatsFreedWithinAllocated0097', `allocated=${stats.allocated} freed=${stats.freed} ` +
        `count=${stats.count}`);
      expect(stats.freed <= stats.allocated).assertTrue();
      expect(stats.allocated > ZERO).assertTrue();
      expect(Number.isFinite(stats.freed)).assertTrue();
      expect(stats.count >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9800
     * @tc.name      testStatsKeysReadableDuringChurn0098
     * @tc.desc      Read the gc count and gc time keys directly around ability churn and check both stay readable and
     *               non decreasing while the ability is created and destroyed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsKeysReadableDuringChurn0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countStart: number = gcStat(KEY_GC_COUNT);
      const timeStart: number = gcStat(KEY_GC_TIME);
      const ability: UIAbility = await launchHome();
      await terminateQuietly(ability);
      const countEnd: number = gcStat(KEY_GC_COUNT);
      const timeEnd: number = gcStat(KEY_GC_TIME);
      logCase('testStatsKeysReadableDuringChurn0098', `count=${countStart}->${countEnd} ` +
        `time=${timeStart}->${timeEnd}`);
      expect(countEnd >= countStart).assertTrue();
      expect(timeEnd >= timeStart).assertTrue();
      expect(timeEnd > ZERO).assertTrue();
      expect(countEnd >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_9900
     * @tc.name      testStatsAndStateAfterRepeatedStops0099
     * @tc.desc      Run three launch and stop cycles, check the counters only grow, the final instance is foreground
     *               and the three instances differ
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsAndStateAfterRepeatedStops0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = snapshot();
      const first: UIAbility = await launchHome();
      await stopHome();
      const second: UIAbility = await launchHome();
      await stopHome();
      const third: UIAbility = await launchHome();
      const end: GcSnapshot = snapshot();
      const cycle: UIAbility[] = [first, second, third];
      logCase('testStatsAndStateAfterRepeatedStops0099', `deltas=${deltaText(start, end)} ` +
        `state=${stateOf(third)} distinct=${distinctInstances(cycle)}`);
      expect(statsMonotone(start, end)).assertTrue();
      expect(allNonNegative(deltasOf(start, end))).assertTrue();
      expect(stateOf(third)).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      expect(distinctInstances(cycle)).assertEqual(THREE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10000
     * @tc.name      testColdStartForegroundBeforeSecondCycle0100
     * @tc.desc      Observe two successive launch and terminate cycles with one tap and check the first foreground
     *               callback precedes the create callback of the second cycle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testColdStartForegroundBeforeSecondCycle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stopHome();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      tap.start();
      try {
        const first: UIAbility = await startObserved(tap);
        await first.context.terminateSelf();
        await waitTapEvent(tap, EVENT_DESTROY, EVENT_WAIT_MS);
        await sleepMs(SETTLE_MS);
        await startObserved(tap);
        logCase('testColdStartForegroundBeforeSecondCycle0100', `events=${tap.text()} ` +
          `firstForeground=${tap.firstIndex(EVENT_FOREGROUND)} lastCreate=${tap.lastIndex(EVENT_CREATE)}`);
        expect(tap.firstIndex(EVENT_FOREGROUND) < tap.lastIndex(EVENT_CREATE)).assertTrue();
        expect(tap.firstIndex(EVENT_DESTROY) < tap.lastIndex(EVENT_CREATE)).assertTrue();
        expect(tap.countOf(EVENT_CREATE)).assertEqual(TWO);
        expect(tap.lastEvent()).assertEqual(EVENT_FOREGROUND);
      } finally {
        tap.stop();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10100
     * @tc.name      testTopAbilityChangesWhenBackground0101
     * @tc.desc      Track the top ability across a background move and the following resume and check the ability
     *               owns the top slot before and after but not while it is parked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTopAbilityChangesWhenBackground0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const before: UIAbility | undefined = await topAbility();
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const during: UIAbility | undefined = await topAbility();
        await startHomeAndSettle();
        const after: UIAbility | undefined = await topAbility();
        logCase('testTopAbilityChangesWhenBackground0101', `before=${before === ability} ` +
          `during=${during === ability} after=${after === ability}`);
        expect(before === ability).assertTrue();
        expect(during === ability).assertFalse();
        expect(after === ability).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10200
     * @tc.name      testWindowStageFreshAfterRelaunch0102
     * @tc.desc      Terminate EntryAbility, relaunch it under a new tap and check the new instance owns a recorded
     *               window stage and a showing window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowStageFreshAfterRelaunch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      await terminateQuietly(first);
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const second: UIAbility = await coldStart(tap);
      const main: window.Window = await mainWindowOf(second);
      logCase('testWindowStageFreshAfterRelaunch0102', `same=${second === first} ` +
        `stageDefined=${tap.stage !== undefined} showing=${main.isWindowShowing()}`);
      expect(second === first).assertFalse();
      expect(tap.stage !== undefined).assertTrue();
      expect(tap.has(EVENT_WINDOW_STAGE_CREATE)).assertTrue();
      expect(main.isWindowShowing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10300
     * @tc.name      testContextModuleMatchesDeclared0103
     * @tc.desc      Check the module of the runtime ability info matches the module that declares EntryAbility and
     *               that the module holds the ability entry for it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextModuleMatchesDeclared0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const module: bundleManager.HapModuleInfo = await entryModuleInfo();
      const declared: bundleManager.AbilityInfo = await declaredEntryAbility();
      logCase('testContextModuleMatchesDeclared0103', `runtime=${ability.context.abilityInfo.moduleName} ` +
        `declared=${declared.moduleName} module=${module.name}`);
      expect(ability.context.abilityInfo.moduleName).assertEqual(declared.moduleName);
      expect(module.name).assertEqual(ENTRY_MODULE);
      expect(module.abilitiesInfo.length).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10400
     * @tc.name      testAbilityInfoIconLabelNonEmpty0104
     * @tc.desc      Check the runtime ability info of EntryAbility carries a non empty icon, label and description so
     *               the launcher entry is fully described
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityInfoIconLabelNonEmpty0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      logCase('testAbilityInfoIconLabelNonEmpty0104', `iconLength=${info.icon.length} ` +
        `labelLength=${info.label.length} descriptionLength=${info.description.length}`);
      expect(info.icon.length > ZERO).assertTrue();
      expect(info.label.length > ZERO).assertTrue();
      expect(info.description.length > ZERO).assertTrue();
      expect(info.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10500
     * @tc.name      testStatsTimeNeverDecreases0105
     * @tc.desc      Read the gc time counter at three points of a background round trip and check the accumulated gc
     *               time grows monotonically with the lifecycle work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatsTimeNeverDecreases0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      try {
        const beforeMove: number = gcStat(KEY_GC_TIME);
        await moveToBackground(ability);
        await waitBackground(ability, EVENT_WAIT_MS);
        const inBackground: number = gcStat(KEY_GC_TIME);
        await startHomeAndSettle();
        hintGC();
        await sleepMs(SETTLE_MS);
        const afterResume: number = gcStat(KEY_GC_TIME);
        logCase('testStatsTimeNeverDecreases0105', `before=${beforeMove} background=${inBackground} ` +
          `resumed=${afterResume}`);
        expect(inBackground >= beforeMove).assertTrue();
        expect(afterResume >= inBackground).assertTrue();
        expect(afterResume >= beforeMove).assertTrue();
      } finally {
        await terminateQuietly(ability);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10600
     * @tc.name      testCycleWindowAreaStable0106
     * @tc.desc      Compare the window size of two successive EntryAbility instances and check width, height and area
     *               are identical across the two launches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCycleWindowAreaStable0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      const firstRect: window.Rect = rectOf(await mainWindowOf(first));
      const second: UIAbility = await launchHome();
      const secondRect: window.Rect = rectOf(await mainWindowOf(second));
      logCase('testCycleWindowAreaStable0106', `first=${firstRect.width}x${firstRect.height} ` +
        `second=${secondRect.width}x${secondRect.height}`);
      expect(firstRect.width).assertEqual(secondRect.width);
      expect(firstRect.height).assertEqual(secondRect.height);
      expect(firstRect.width * firstRect.height > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10700
     * @tc.name      testForegroundAfterFullChurn0107
     * @tc.desc      Drive EntryAbility through launch, background, resume, terminate and relaunch, then check the final
     *               instance is a new foreground ability while the counters stayed monotone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundAfterFullChurn0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = snapshot();
      const ability: UIAbility = await launchHome();
      await moveToBackground(ability);
      await waitBackground(ability, EVENT_WAIT_MS);
      await startHomeAndSettle();
      await terminateQuietly(ability);
      const finalAbility: UIAbility = await launchHome();
      const end: GcSnapshot = snapshot();
      const main: window.Window = await mainWindowOf(finalAbility);
      logCase('testForegroundAfterFullChurn0107', `same=${finalAbility === ability} ` +
        `state=${stateOf(finalAbility)} deltas=${deltaText(start, end)}`);
      expect(finalAbility === ability).assertFalse();
      expect(isForeground(finalAbility)).assertTrue();
      expect(statsMonotone(start, end)).assertTrue();
      expect(main.isWindowShowing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLEMATRIX_10800
     * @tc.name      testCompositeLifecycleInvariant0108
     * @tc.desc      Combine the lifecycle invariants of a full observed run: foreground state, ordered cold start,
     *               recorded window stage, showing window, declared name and monotone counters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCompositeLifecycleInvariant0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: GcSnapshot = snapshot();
      const tap: LifecycleTap = new LifecycleTap(ENTRY_ABILITY, ENTRY_MODULE);
      const ability: UIAbility = await coldStart(tap);
      const end: GcSnapshot = snapshot();
      const main: window.Window = await mainWindowOf(ability);
      logCase('testCompositeLifecycleInvariant0108', `events=${tap.text()} state=${stateOf(ability)} ` +
        `stageDefined=${tap.stage !== undefined} showing=${main.isWindowShowing()} ` +
        `deltas=${deltaText(start, end)}`);
      expect(isForeground(ability)).assertTrue();
      expect(tap.ordered()).assertTrue();
      expect(tap.stage !== undefined).assertTrue();
      expect(main.isWindowShowing()).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(statsMonotone(start, end)).assertTrue();
    });
  });
}
