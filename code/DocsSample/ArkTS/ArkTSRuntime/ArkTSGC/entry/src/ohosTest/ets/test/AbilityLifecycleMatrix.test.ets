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
import {
  byteCounterDelta,
  GcSnapshot,
  gcStat,
  hintGC,
  KEY_GC_COUNT,
  KEY_GC_TIME,
  STAT_READ_ALLOCATION_LIMIT_BYTES
} from './shared/GcProbe';
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
// Conservative UI framework allowance for one launch, stop, background, resume or terminate observation.
// It is a lifecycle specific bound kept far below 2^32, not a generic wrap tolerance.
const UI_STEP_BYTES: number = 128 * 1024 * 1024;
const UI_CYCLE_BYTES: number = 2 * UI_STEP_BYTES;

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

function statsMonotone(before: GcSnapshot, after: GcSnapshot, maximumAllocated: number): boolean {
  return after.notBefore(before, maximumAllocated);
}

function countDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.count - before.count;
}

// -1 marks an untrusted byte window so non negative checks fail instead of accepting a modular difference
function allocatedDelta(before: GcSnapshot, after: GcSnapshot, maximumAllocated: number): number {
  return after.bytesInWindow(before, maximumAllocated) ? byteCounterDelta(after.allocated, before.allocated) : -1;
}

function timeDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.time - before.time;
}

function freedDelta(before: GcSnapshot, after: GcSnapshot, maximumAllocated: number): number {
  return after.bytesInWindow(before, maximumAllocated) ? byteCounterDelta(after.freed, before.freed) : -1;
}

function longFullGcDelta(before: GcSnapshot, after: GcSnapshot): number {
  return after.longFullGc - before.longFullGc;
}

function deltasOf(before: GcSnapshot, after: GcSnapshot, maximumAllocated: number): number[] {
  return [countDelta(before, after), timeDelta(before, after), allocatedDelta(before, after, maximumAllocated),
    freedDelta(before, after, maximumAllocated), longFullGcDelta(before, after)];
}

function deltaText(before: GcSnapshot, after: GcSnapshot, maximumAllocated: number): string {
  return deltasOf(before, after, maximumAllocated).join(SEPARATOR);
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

;
  });
}
