/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { AbilityLifecycleCallback, bundleManager, common, UIAbility, WantAgent, wantAgent } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Component, Rect } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY,
  getAbilityName,
  getAppContext,
  getDelegator,
  getTopAbility,
  launchAbility,
  LIFECYCLE_ABILITY,
  settle,
  sleep,
  waitForTopAbility
} from './TestHelper';
import { backToHome, clickId, exists, findId } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';
const FOREGROUND: number = abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND;
const BACKGROUND: number = abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND;

/** 最近一次拉起的 AbilityLifecycleAbility 实例；它可能在后台，取不到栈顶时靠它来结束。 */
let lifecycleRef: UIAbility | undefined = undefined;

function remember(top: UIAbility | undefined): UIAbility {
  if (top === undefined || getAbilityName(top) !== LIFECYCLE_ABILITY) {
    throw new Error(`AbilityLifecycleAbility is not on top, top is ${getAbilityName(top)}`);
  }
  lifecycleRef = top;
  return top;
}

/** 用例自己结束实例时调用，避免复位时再对已销毁的实例 terminateSelf。 */
function forgetLifecycle(): void {
  lifecycleRef = undefined;
}

async function startLifecycle(): Promise<UIAbility> {
  const top: UIAbility | undefined = await launchAbility(LIFECYCLE_ABILITY);
  await sleep(500);
  return remember(top);
}

/** 结束记录下来的 AbilityLifecycleAbility，并等它离开栈顶。 */
async function finishLifecycle(): Promise<void> {
  const target: UIAbility | undefined = lifecycleRef;
  lifecycleRef = undefined;
  if (target !== undefined) {
    try {
      await Promise.race([target.context.terminateSelf(), sleep(3000)]);
    } catch (error) {
      hilog.info(DOMAIN, TAG, '%{public}s', `terminateSelf failed: ${JSON.stringify(error)}`);
    }
  }
  const deadline: number = Date.now() + 3000;
  while (getAbilityName(await getTopAbility()) === LIFECYCLE_ABILITY && Date.now() < deadline) {
    await sleep(200);
  }
  await sleep(500);
}

async function backToEntry(): Promise<UIAbility> {
  await finishLifecycle();
  const top: UIAbility | undefined = await backToHome();
  if (top === undefined || getAbilityName(top) !== ENTRY_ABILITY) {
    throw new Error('EntryAbility is not on top');
  }
  return top;
}

/** 回到首页后点 UIAbilityContext 入口，等 AbilityLifecycleAbility 到栈顶并渲染页面。 */
async function openLifecyclePage(): Promise<UIAbility> {
  await backToEntry();
  await clickId('UIAbilityContext', 500);
  const top: UIAbility = remember(await waitForTopAbility(LIFECYCLE_ABILITY, 6000));
  await sleep(800);
  return top;
}

async function waitForRecord(record: string[], item: string, timeoutMs: number = 4000): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (!record.includes(item) && Date.now() < deadline) {
    await sleep(100);
  }
  return record.includes(item);
}

async function waitForState(ability: UIAbility, state: number, timeoutMs: number = 4000): Promise<number> {
  const deadline: number = Date.now() + timeoutMs;
  while (getDelegator().getAbilityState(ability) !== state && Date.now() < deadline) {
    await sleep(100);
  }
  return getDelegator().getAbilityState(ability);
}

function newMonitor(record: string[]): abilityDelegatorRegistry.AbilityMonitor {
  return {
    abilityName: LIFECYCLE_ABILITY,
    moduleName: 'entry',
    onAbilityCreate: (ability: UIAbility) => record.push('create'),
    onWindowStageCreate: (ability: UIAbility) => record.push('windowStageCreate'),
    onAbilityForeground: (ability: UIAbility) => record.push('foreground'),
    onAbilityBackground: (ability: UIAbility) => record.push('background'),
    onWindowStageDestroy: (ability: UIAbility) => record.push('windowStageDestroy'),
    onAbilityDestroy: (ability: UIAbility) => record.push('destroy')
  };
}

/** 与 AbilityLifecycleAbility 注册的回调一样实现全部必选回调，记录“Ability 名:事件”。 */
function newLifecycleCallback(record: string[]): AbilityLifecycleCallback {
  return {
    onAbilityCreate(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:create`);
    },
    onWindowStageCreate(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:windowStageCreate`);
    },
    onWindowStageActive(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:windowStageActive`);
    },
    onWindowStageInactive(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:windowStageInactive`);
    },
    onWindowStageDestroy(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:windowStageDestroy`);
    },
    onAbilityDestroy(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:destroy`);
    },
    onAbilityForeground(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:foreground`);
    },
    onAbilityBackground(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:background`);
    },
    onAbilityContinue(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:continue`);
    },
    onNewWant(ability: UIAbility) {
      record.push(`${getAbilityName(ability)}:newWant`);
    }
  };
}

/** 只取某个 Ability 的事件，并去掉“Ability 名:”前缀。 */
function only(record: string[], name: string): string[] {
  return record.filter((e: string) => e.startsWith(name + ':')).map((e: string) => e.substring(name.length + 1));
}

function lifecycleAgentInfo(): wantAgent.WantAgentInfo {
  return {
    wants: [{ bundleName: BUNDLE_NAME, abilityName: LIFECYCLE_ABILITY }],
    actionType: wantAgent.OperationType.START_ABILITY,
    requestCode: 21,
    actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
  };
}

function triggerAndWait(agent: WantAgent): Promise<wantAgent.CompleteData> {
  return new Promise<wantAgent.CompleteData>((resolve: (value: wantAgent.CompleteData) => void,
    reject: (reason: BusinessError) => void) => {
    wantAgent.trigger(agent, { code: 0 }, (err: BusinessError, data: wantAgent.CompleteData) =>
      settle(resolve, reject, err, data));
  });
}

export default function abilityLifecycleTest(): void {
  describe('AbilityRuntimeAbilityLifecycleTest', () => {
    beforeAll(async (done: Function) => {
      await startLifecycle();
      await finishLifecycle();
      await backToHome();
      done();
    })

    afterAll(async (done: Function) => {
      await finishLifecycle();
      await backToHome();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0001
     * @tc.name      testAbilityLifecycle0001
     * @tc.desc      拉起 EntryAbility：栈顶为 EntryAbility，状态为 FOREGROUND，所属模块为 entry
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0001 begin');
      const entry: UIAbility = await backToEntry();
      const actual1: string = getAbilityName(entry);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('EntryAbility');
      const actual2: string | number | boolean = getDelegator().getAbilityState(entry);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FOREGROUND);
      const actual3: string = entry.context.abilityInfo.moduleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0002
     * @tc.name      testAbilityLifecycle0002
     * @tc.desc      显式拉起 AbilityLifecycleAbility：成为栈顶，状态为 FOREGROUND，启动模式为单实例
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0002 begin');
      const life: UIAbility = await startLifecycle();
      const actual1: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('AbilityLifecycleAbility');
      const actual2: string | number | boolean = getDelegator().getAbilityState(life);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FOREGROUND);
      const actual3: string | number | boolean = life.context.abilityInfo.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0003
     * @tc.name      testAbilityLifecycle0003
     * @tc.desc      AbilityLifecycleAbility 的 UIAbilityContext：包名正确，所属 entry 模块，filesDir 为 entry 模块的 el2 目录
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0003 begin');
      const life: UIAbility = await startLifecycle();
      const actual1: string = life.context.abilityInfo.bundleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string = life.context.currentHapModuleInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 life.context.filesDir=${life.context.filesDir}`);
      expect(life.context.filesDir).assertEqual('/data/storage/el2/base/haps/entry/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0004
     * @tc.name      testAbilityLifecycle0004
     * @tc.desc      EntryAbility 与 AbilityLifecycleAbility 共用同一个 ApplicationContext：应用名与应用级 filesDir 相同
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0004 begin');
      const entry: UIAbility = await backToEntry();
      const life: UIAbility = await startLifecycle();
      const fromEntry: common.ApplicationContext = entry.context.getApplicationContext();
      const fromLife: common.ApplicationContext = life.context.getApplicationContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 fromLife.applicationInfo.name=${fromLife.applicationInfo.name}`);
      expect(fromLife.applicationInfo.name).assertEqual(fromEntry.applicationInfo.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 fromLife.filesDir=${fromLife.filesDir}`);
      expect(fromLife.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 fromEntry.filesDir=${fromEntry.filesDir}`);
      expect(fromEntry.filesDir).assertEqual(fromLife.filesDir);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0005
     * @tc.name      testAbilityLifecycle0005
     * @tc.desc      AbilityLifecycleAbility 在前台时，先前在前台的 EntryAbility 进入 BACKGROUND
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0005 begin');
      const entry: UIAbility = await backToEntry();
      const life: UIAbility = await startLifecycle();
      const actual1: string | number | boolean = await waitForState(entry, BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(BACKGROUND);
      const actual2: string | number | boolean = getDelegator().getAbilityState(life);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FOREGROUND);
      const actual3: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0006
     * @tc.name      testAbilityLifecycle0006
     * @tc.desc      AbilityMonitor：结束旧实例后重新拉起 AbilityLifecycleAbility，依次收到 create、windowStageCreate、foreground
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0006 begin');
      await finishLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await startLifecycle();
      await waitForRecord(record, 'foreground');
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('create');
      const actual2: string = record.slice(0, 3).join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('create,windowStageCreate,foreground');
      const actual3: boolean = record.includes('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0007
     * @tc.name      testAbilityLifecycle0007
     * @tc.desc      ApplicationContext 的 abilityLifecycle 回调：重新拉起 AbilityLifecycleAbility 时先 create 再 windowStageCreate
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0007 begin');
      await finishLifecycle();
      const record: string[] = [];
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const id: number = ctx.on('abilityLifecycle', newLifecycleCallback(record));
      await startLifecycle();
      await waitForRecord(record, 'AbilityLifecycleAbility:foreground');
      await ctx.off('abilityLifecycle', id);
      const events: string[] = only(record, 'AbilityLifecycleAbility');
      const actual1: string = events[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('create');
      const actual2: boolean = events.indexOf('windowStageCreate') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = events.includes('foreground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0008
     * @tc.name      testAbilityLifecycle0008
     * @tc.desc      单实例 AbilityLifecycleAbility 已在前台时再次拉起：不再 create，回调收到 onNewWant
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0008 begin');
      await startLifecycle();
      const record: string[] = [];
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const id: number = ctx.on('abilityLifecycle', newLifecycleCallback(record));
      const again: UIAbility = await startLifecycle();
      await waitForRecord(record, 'AbilityLifecycleAbility:newWant', 3000);
      await ctx.off('abilityLifecycle', id);
      const events: string[] = only(record, 'AbilityLifecycleAbility');
      const actual1: boolean = events.includes('newWant');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = events.includes('create');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = getAbilityName(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0009
     * @tc.name      testAbilityLifecycle0009
     * @tc.desc      delegator.doAbilityBackground 后 AbilityLifecycleAbility 状态为 BACKGROUND，monitor 收到 background
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0009 begin');
      const life: UIAbility = await startLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await getDelegator().doAbilityBackground(life);
      const state: number = await waitForState(life, BACKGROUND);
      await waitForRecord(record, 'background');
      await getDelegator().removeAbilityMonitor(monitor);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 state=${state}`);
      expect(state).assertEqual(BACKGROUND);
      const actual2: boolean = record.includes('background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.includes('create');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0010
     * @tc.name      testAbilityLifecycle0010
     * @tc.desc      delegator 先后台再前台：AbilityLifecycleAbility 回到 FOREGROUND，monitor 依次收到 background、foreground
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0010 begin');
      const life: UIAbility = await startLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await getDelegator().doAbilityBackground(life);
      await waitForState(life, BACKGROUND);
      await getDelegator().doAbilityForeground(life);
      const state: number = await waitForState(life, FOREGROUND);
      await waitForRecord(record, 'foreground');
      await getDelegator().removeAbilityMonitor(monitor);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 state=${state}`);
      expect(state).assertEqual(FOREGROUND);
      const actual2: string = record.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('background,foreground');
      const actual3: boolean = record.includes('create');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0011
     * @tc.name      testAbilityLifecycle0011
     * @tc.desc      代码调用 UIAbilityContext.moveAbilityToBackground：AbilityLifecycleAbility 进入 BACKGROUND，monitor 收到
     *               background
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0011 begin');
      const life: UIAbility = await startLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await life.context.moveAbilityToBackground();
      const state: number = await waitForState(life, BACKGROUND);
      await waitForRecord(record, 'background');
      await getDelegator().removeAbilityMonitor(monitor);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 state=${state}`);
      expect(state).assertEqual(BACKGROUND);
      const actual2: boolean = record.includes('background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.includes('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0012
     * @tc.name      testAbilityLifecycle0012
     * @tc.desc      已在后台的 AbilityLifecycleAbility 再次显式拉起：复用原实例回到 FOREGROUND，不重新 create
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0012 begin');
      const life: UIAbility = await startLifecycle();
      await life.context.moveAbilityToBackground();
      await waitForState(life, BACKGROUND);
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      const again: UIAbility = await startLifecycle();
      await waitForRecord(record, 'foreground');
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: string = getAbilityName(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('AbilityLifecycleAbility');
      const actual2: string | number | boolean = getDelegator().getAbilityState(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FOREGROUND);
      const actual3: boolean = record.includes('foreground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = record.includes('create');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0013
     * @tc.name      testAbilityLifecycle0013
     * @tc.desc      代码调用 UIAbilityContext.terminateSelf：monitor 先收到 windowStageDestroy 再收到 destroy
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0013 begin');
      const life: UIAbility = await startLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      forgetLifecycle();
      await life.context.terminateSelf();
      await waitForRecord(record, 'destroy');
      await finishLifecycle();
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: boolean = record.includes('windowStageDestroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = record.includes('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.indexOf('windowStageDestroy') < record.indexOf('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0014
     * @tc.name      testAbilityLifecycle0014
     * @tc.desc      terminateSelf 之后再次拉起 AbilityLifecycleAbility 是新实例：monitor 重新收到 create
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0014 begin');
      const first: UIAbility = await startLifecycle();
      forgetLifecycle();
      await first.context.terminateSelf();
      await finishLifecycle();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      const second: UIAbility = await startLifecycle();
      await waitForRecord(record, 'foreground');
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('create');
      const actual2: string | number | boolean = getDelegator().getAbilityState(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FOREGROUND);
      const actual3: string = getAbilityName(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0015
     * @tc.name      testAbilityLifecycle0015
     * @tc.desc      off('abilityLifecycle') 之后再拉起 AbilityLifecycleAbility，回调不再记录任何事件
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0015 begin');
      await finishLifecycle();
      const record: string[] = [];
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const id: number = ctx.on('abilityLifecycle', newLifecycleCallback(record));
      await ctx.off('abilityLifecycle', id);
      await startLifecycle();
      await sleep(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual2: number = only(record, 'AbilityLifecycleAbility').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0016
     * @tc.name      testAbilityLifecycle0016
     * @tc.desc      重新拉起的 AbilityLifecycleAbility 的 launchWant 与显式拉起的 want 一致，并带 isDelegatorCall 标记
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0016 begin');
      await finishLifecycle();
      const life: UIAbility = await startLifecycle();
      const params: Record<string, Object> = life.launchWant.parameters ?? {};
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 life.launchWant.bundleName=${life.launchWant.bundleName}`);
      expect(life.launchWant.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 life.launchWant.abilityName=${life.launchWant.abilityName}`);
      expect(life.launchWant.abilityName).assertEqual('AbilityLifecycleAbility');
      const actual3: Object = params['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0017
     * @tc.name      testAbilityLifecycle0017
     * @tc.desc      waitAbilityMonitor：结束旧实例后拉起，等到的实例就是新建的 AbilityLifecycleAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0017 begin');
      await finishLifecycle();
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor([]);
      const waiting: Promise<UIAbility> = getDelegator().waitAbilityMonitor(monitor, 8000);
      await startLifecycle();
      const created: UIAbility = await waiting;
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: string = getAbilityName(created);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('AbilityLifecycleAbility');
      const actual2: string = created.context.abilityInfo.moduleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('entry');
      const actual3: string | number | boolean = await waitForState(created, FOREGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(FOREGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0018
     * @tc.name      testAbilityLifecycle0018
     * @tc.desc      START_ABILITY 类型的 WantAgent 指向 AbilityLifecycleAbility：trigger 回调 finalCode 为 0，回传的 want 指向
     *               AbilityLifecycleAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0018 begin');
      await backToEntry();
      await sleep(800);
      const agent: WantAgent = await wantAgent.getWantAgent(lifecycleAgentInfo());
      const data: wantAgent.CompleteData = await triggerAndWait(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 data.finalCode=${data.finalCode}`);
      expect(data.finalCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 data.want.abilityName=${data.want.abilityName}`);
      expect(data.want.abilityName).assertEqual('AbilityLifecycleAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 data.want.bundleName=${data.want.bundleName}`);
      expect(data.want.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0019
     * @tc.name      testAbilityLifecycle0019
     * @tc.desc      首页点击 UIAbilityContext 入口：拉起 AbilityLifecycleAbility，页面显示标题与两个按钮文案
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0019 begin');
      const life: UIAbility = await openLifecyclePage();
      const actual1: string = getAbilityName(life);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('AbilityLifecycleAbility');
      const actual2: boolean = await exists('UIAbilityContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0020
     * @tc.name      testAbilityLifecycle0020
     * @tc.desc      页面点击 moveAbilityToBackground：AbilityLifecycleAbility 进入 BACKGROUND，monitor 收到 background
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0020 begin');
      const life: UIAbility = await openLifecyclePage();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await clickId('moveAbilityToBackground', 500);
      const state: number = await waitForState(life, BACKGROUND);
      await waitForRecord(record, 'background');
      await getDelegator().removeAbilityMonitor(monitor);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 state=${state}`);
      expect(state).assertEqual(BACKGROUND);
      const actual2: boolean = record.includes('background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.includes('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0021
     * @tc.name      testAbilityLifecycle0021
     * @tc.desc      退到后台后再从首页点 UIAbilityContext 入口：同一实例回到前台，不重新 create
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0021 begin');
      const life: UIAbility = await openLifecyclePage();
      await clickId('moveAbilityToBackground', 500);
      await waitForState(life, BACKGROUND);
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      await backToHome();
      await clickId('UIAbilityContext', 500);
      const again: UIAbility = remember(await waitForTopAbility('AbilityLifecycleAbility', 6000));
      await waitForRecord(record, 'foreground');
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: boolean = record.includes('foreground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = record.includes('create');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string | number | boolean = getDelegator().getAbilityState(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(FOREGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0022
     * @tc.name      testAbilityLifecycle0022
     * @tc.desc      页面点击 terminateSelf：monitor 收到 windowStageDestroy 与 destroy，AbilityLifecycleAbility 离开栈顶
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0022 begin');
      await openLifecyclePage();
      const record: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = newMonitor(record);
      await getDelegator().addAbilityMonitor(monitor);
      forgetLifecycle();
      await clickId('terminateSelf', 500);
      await waitForRecord(record, 'destroy');
      await finishLifecycle();
      await getDelegator().removeAbilityMonitor(monitor);
      const actual1: boolean = record.includes('windowStageDestroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = record.includes('destroy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = getAbilityName(await getTopAbility()) === 'AbilityLifecycleAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_LIFECYCLE_0023
     * @tc.name      testAbilityLifecycle0023
     * @tc.desc      UIAbilityContext 页两个按钮可点击，moveAbilityToBackground 在 terminateSelf 上方且左右对齐
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0023 begin');
      await openLifecyclePage();
      const move: Component = await findId('moveAbilityToBackground');
      const terminate: Component = await findId('terminateSelf');
      const moveBounds: Rect = await move.getBounds();
      const terminateBounds: Rect = await terminate.getBounds();
      const actual1: boolean = await move.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await terminate.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = moveBounds.bottom <= terminateBounds.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 moveBounds.left=${moveBounds.left}`);
      expect(moveBounds.left).assertEqual(terminateBounds.left);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 moveBounds.right=${moveBounds.right}`);
      expect(moveBounds.right).assertEqual(terminateBounds.right);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0023 end');
    })
  })
}
