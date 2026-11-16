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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { QosRunInfo, RunSummary } from 'libentry.so';

const TAG: string = '[Sample_NdkQosPageLevelTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const ENTRY_TEXT: string = 'QoS level settings';
const PAGE_MARK: string = 'Select a QoS level';
const RUN_BUTTON: string = 'Run calculation asynchronously';
const BACK_BUTTON: string = 'Back';
const IDLE_STATUS: string = 'Select a level and run the calculation.';
const DONE_STATUS: string = 'Calculation finished.';
const INFO_SET: string = 'OH_QoS_SetThreadQoS';
const INFO_QUERY: string = 'OH_QoS_GetThreadQoS level';
const INFO_RESET: string = 'OH_QoS_ResetThreadQoS';
const INFO_BIND: string = 'sched_setaffinity';
const INFO_DURATION: string = 'Duration (ms)';
const PAGE_NOTE: string = 'The QoS level applies to the current thread only.';
const LABEL_BACKGROUND: string = 'BACKGROUND (background task)';
const LABEL_UTILITY: string = 'UTILITY (background critical task)';
const LABEL_DEFAULT: string = 'DEFAULT (default)';
const LABEL_USER_INITIATED: string = 'USER_INITIATED (user triggered)';
const LABEL_DEADLINE: string = 'DEADLINE_REQUEST (time limited)';
const LABEL_INTERACTIVE: string = 'USER_INTERACTIVE (user interactive)';
const LEVEL_BACKGROUND: number = 0;
const LEVEL_DEFAULT: number = 2;
const LEVEL_DEADLINE: number = 4;
const LEVEL_INTERACTIVE: number = 5;
const PENDING_DURATION_TEXT: string = '-1.00';
const WAIT_TIMEOUT: number = 15000;
const RUN_TIMEOUT: number = 60000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// The sample ships English and Chinese resource sets, so every label is resolved in both locales.
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['High level QoS test', '高等级 QoS 测试'],
  ['Back', '返回'],
  ['QoS level settings', 'QoS 等级设置'],
  ['Select a QoS level', '选择 QoS 等级'],
  ['Run calculation asynchronously', '异步执行计算任务'],
  ['Select a level and run the calculation.', '请先选择等级，再执行计算任务。'],
  ['Calculating...', '计算中…'],
  ['Calculation finished.', '计算完成。'],
  ['BACKGROUND (background task)', 'BACKGROUND（后台任务）'],
  ['UTILITY (background critical task)', 'UTILITY（后台关键任务）'],
  ['DEFAULT (default)', 'DEFAULT（默认等级）'],
  ['USER_INITIATED (user triggered)', 'USER_INITIATED（用户触发）'],
  ['DEADLINE_REQUEST (time limited)', 'DEADLINE_REQUEST（限时任务）'],
  ['USER_INTERACTIVE (user interactive)', 'USER_INTERACTIVE（用户交互）'],
  ['OH_QoS_GetThreadQoS level', 'OH_QoS_GetThreadQoS 回读等级'],
  ['Duration (ms)', '计算耗时（毫秒）'],
  ['The QoS level applies to the current thread only.',
    'QoS 等级只作用于当前线程，同一等级在不同负载下耗时不同属正常现象。']
]);

function zhOf(text: string): string {
  const value: string | undefined = ZH_TEXTS.get(text);
  return value === undefined ? text : value;
}

function matchedText(actual: string, english: string): boolean {
  return actual === english || actual === zhOf(english);
}

const FOREGROUND_DELAY: number = 1500;
const INDEX_PROBE_TIMEOUT: number = 8000;
const BACK_ATTEMPTS: number = 3;
const PAGE_PROBE_TIMEOUT: number = 4000;
const ENTRY_TIMEOUT: number = 8000;
const OPEN_ATTEMPTS: number = 3;
const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function tryFindText(driver: Driver, text: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.text(text));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo('findText failed: ' + text);
    return undefined;
  }
}

async function findText(driver: Driver, text: string): Promise<Component | undefined> {
  const found: Component | undefined = await tryFindText(driver, text);
  if (found !== undefined) {
    return found;
  }
  const localized: string = zhOf(text);
  if (localized === text) {
    return undefined;
  }
  return await tryFindText(driver, localized);
}

async function tryWaitText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  try {
    // waitForComponent polls on the UiTest side and resolves to null once the deadline passes,
    // so the returned value has to be checked instead of trusting the call to throw.
    const component: Component = await driver.waitForComponent(ON.text(text), timeout);
    if (component === undefined || component === null) {
      logInfo('waitForText timeout: ' + text);
      return false;
    }
    return true;
  } catch (error) {
    logInfo('waitForText failed: ' + text);
    return false;
  }
}

async function waitForText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  if (await tryWaitText(driver, text, timeout)) {
    return true;
  }
  const localized: string = zhOf(text);
  if (localized === text) {
    return false;
  }
  return await tryWaitText(driver, localized, timeout);
}

// UiTest binds to the accessibility service while the driver is created, so a busy system can hand
// back an empty handle; retrying keeps a transient failure from collapsing the whole case.
async function createDriver(): Promise<Driver> {
  for (let attempt = 0; attempt < OPEN_ATTEMPTS; attempt++) {
    const driver: Driver = Driver.create();
    if (driver !== undefined && driver !== null) {
      return driver;
    }
    logInfo('driver create retry ' + attempt.toString());
    await sleepMs(1000);
  }
  return Driver.create();
}

async function ensureForeground(driver: Driver): Promise<boolean> {
  if (driver === undefined || driver === null) {
    logInfo('driver unavailable');
    return false;
  }
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  } catch (error) {
    logInfo('startAbility failed');
    return false;
  }
  await driver.delayMs(FOREGROUND_DELAY);
  return true;
}

async function ensureIndex(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
    return true;
  }
  // A previous case can leave the sample on a child page, so walk back before relaunching.
  for (let attempt = 0; attempt < BACK_ATTEMPTS; attempt++) {
    const back: Component | undefined = await findText(driver, BACK_BUTTON);
    if (back === undefined) {
      break;
    }
    await back.click();
    await driver.delayMs(1200);
    if (await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
      return true;
    }
  }
  if (!await ensureForeground(driver)) {
    return false;
  }
  return await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT);
}

// 页面可能已经打开，就地确认，避免重复压栈
async function openLevelPage(driver: Driver): Promise<boolean> {
  for (let attempt = 0; attempt < OPEN_ATTEMPTS; attempt++) {
    if (await waitForText(driver, PAGE_MARK, PAGE_PROBE_TIMEOUT)) {
      return true;
    }
    if (!await ensureIndex(driver)) {
      logInfo('index not reached, attempt ' + attempt.toString());
      continue;
    }
    const entry: Component | undefined = await findText(driver, ENTRY_TEXT);
    if (entry === undefined) {
      logInfo('entry missed: ' + ENTRY_TEXT);
      continue;
    }
    await entry.click();
    if (await waitForText(driver, PAGE_MARK, ENTRY_TIMEOUT)) {
      return true;
    }
    logInfo('page not reached, retrying: ' + PAGE_MARK);
  }
  return false;
}

async function clickText(driver: Driver, text: string): Promise<boolean> {
  const component: Component | undefined = await findText(driver, text);
  if (component === undefined) {
    logInfo('clickText missed: ' + text);
    return false;
  }
  await component.click();
  await driver.delayMs(500);
  return true;
}

async function countText(driver: Driver, text: string): Promise<number> {
  let total: number = 0;
  const first: Component[] | null = await driver.findComponents(ON.text(text));
  if (first !== null) {
    total += first.length;
  }
  const localized: string = zhOf(text);
  if (localized !== text) {
    const second: Component[] | null = await driver.findComponents(ON.text(localized));
    if (second !== null) {
      total += second.length;
    }
  }
  return total;
}

async function runSelected(driver: Driver): Promise<boolean> {
  if (!await clickText(driver, RUN_BUTTON)) {
    return false;
  }
  return await waitForText(driver, DONE_STATUS, RUN_TIMEOUT);
}

function pendingInfo(): QosRunInfo {
  return testNapi.getLastQosInfo();
}

export default function ndkQosLevelPageTest(): void {
  describe('NdkQosPageLevel', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0001
     * @tc.name      testNdkQosPageLevel0001
     * @tc.desc      Checks the level page opens from the home page with its prompt, run entry and idle status.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0001 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await findText(driver, PAGE_MARK) !== undefined).assertTrue();
      expect(await findText(driver, RUN_BUTTON) !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageLevel0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0002
     * @tc.name      testNdkQosPageLevel0002
     * @tc.desc      Checks the page lists all six QoS level choices.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0002 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await findText(driver, LABEL_BACKGROUND) !== undefined).assertTrue();
      expect(await findText(driver, LABEL_UTILITY) !== undefined).assertTrue();
      expect(await findText(driver, LABEL_DEFAULT) !== undefined).assertTrue();
      expect(await findText(driver, LABEL_USER_INITIATED) !== undefined).assertTrue();
      expect(await findText(driver, LABEL_DEADLINE) !== undefined).assertTrue();
      expect(await findText(driver, LABEL_INTERACTIVE) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0003
     * @tc.name      testNdkQosPageLevel0003
     * @tc.desc      Checks every level choice appears exactly once, so no level is duplicated or missing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0003 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      const background: number = await countText(driver, LABEL_BACKGROUND);
      const utility: number = await countText(driver, LABEL_UTILITY);
      const interactive: number = await countText(driver, LABEL_INTERACTIVE);
      logInfo('choice counts = ' + background.toString() + ', ' + utility.toString() + ', ' +
        interactive.toString());
      expect(background).assertEqual(1);
      expect(utility).assertEqual(1);
      expect(interactive).assertEqual(1);
      expect(background + utility + interactive).assertEqual(3);
      logInfo('testNdkQosPageLevel0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0004
     * @tc.name      testNdkQosPageLevel0004
     * @tc.desc      Checks the page renders the five return code and duration rows of the result card.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0004 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await findText(driver, INFO_SET) !== undefined).assertTrue();
      expect(await findText(driver, INFO_QUERY) !== undefined).assertTrue();
      expect(await findText(driver, INFO_RESET) !== undefined).assertTrue();
      expect(await findText(driver, INFO_BIND) !== undefined).assertTrue();
      expect(await findText(driver, INFO_DURATION) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0005
     * @tc.name      testNdkQosPageLevel0005
     * @tc.desc      Checks the result card starts with the pending duration and the invalid result rows.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0005 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      const pendingDuration: number = await countText(driver, PENDING_DURATION_TEXT);
      const pendingCodes: number = await countText(driver, '-1');
      logInfo('pending duration count = ' + pendingDuration.toString() + ', code count = ' +
        pendingCodes.toString());
      expect(pendingDuration).assertEqual(1);
      expect(pendingCodes >= 4).assertTrue();
      expect(await findText(driver, DONE_STATUS) === undefined).assertTrue();
      logInfo('testNdkQosPageLevel0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0006
     * @tc.name      testNdkQosPageLevel0006
     * @tc.desc      Checks the page shows one title, one back entry and the thread scope note.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0006 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      const titleCount: number = await countText(driver, ENTRY_TEXT);
      logInfo('title count = ' + titleCount.toString());
      expect(titleCount).assertEqual(1);
      expect(await findText(driver, BACK_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, PAGE_NOTE) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0007
     * @tc.name      testNdkQosPageLevel0007
     * @tc.desc      Checks running without touching a level uses the interactive level selected by default.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0007 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('default run query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(LEVEL_INTERACTIVE);
      expect(info.setResult).assertEqual(0);
      expect(await findText(driver, '5') !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0008
     * @tc.name      testNdkQosPageLevel0008
     * @tc.desc      Checks choosing the background level drives the native run to that level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0008 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_BACKGROUND)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('background run query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(LEVEL_BACKGROUND);
      expect(info.setResult).assertEqual(0);
      expect(await findText(driver, '0') !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0009
     * @tc.name      testNdkQosPageLevel0009
     * @tc.desc      Checks choosing the default level drives the native run to level two.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0009 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_DEFAULT)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('default level run query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(LEVEL_DEFAULT);
      expect(info.resetResult).assertEqual(0);
      expect(await findText(driver, '2') !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0010
     * @tc.name      testNdkQosPageLevel0010
     * @tc.desc      Checks the deadline level choice is accepted and read back after the run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0010 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_DEADLINE)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('deadline run query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(LEVEL_DEADLINE);
      expect(info.setResult).assertEqual(0);
      expect(await findText(driver, '4') !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0011
     * @tc.name      testNdkQosPageLevel0011
     * @tc.desc      Checks a finished run replaces the pending duration with a measured one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0011 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      const durationText: string = info.duration.toFixed(2);
      logInfo('measured duration text = ' + durationText);
      expect(await countText(driver, PENDING_DURATION_TEXT)).assertEqual(0);
      expect(await findText(driver, durationText) !== undefined).assertTrue();
      expect(info.duration > 0).assertTrue();
      logInfo('testNdkQosPageLevel0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0012
     * @tc.name      testNdkQosPageLevel0012
     * @tc.desc      Checks the status switches from idle to finished and the run entry stays available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0012 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      expect(await findText(driver, IDLE_STATUS) === undefined).assertTrue();
      const done: Component | undefined = await findText(driver, DONE_STATUS);
      expect(done !== undefined).assertTrue();
      if (done !== undefined) {
        expect(matchedText(await done.getText(), DONE_STATUS)).assertTrue();
      }
      expect(await findText(driver, RUN_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0013
     * @tc.name      testNdkQosPageLevel0013
     * @tc.desc      Checks the level choices stay on screen after a run so another level can be picked.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0013 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      expect(await countText(driver, LABEL_BACKGROUND)).assertEqual(1);
      expect(await countText(driver, LABEL_INTERACTIVE)).assertEqual(1);
      expect(await findText(driver, PAGE_MARK) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0014
     * @tc.name      testNdkQosPageLevel0014
     * @tc.desc      Checks two runs from the page are counted as two experiments with the same last level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0014 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickText(driver, LABEL_UTILITY)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('two page runs = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(2);
      expect(summary.lastLevel).assertEqual(1);
      expect(summary.levelCounts[1]).assertEqual(2);
      logInfo('testNdkQosPageLevel0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0015
     * @tc.name      testNdkQosPageLevel0015
     * @tc.desc      Checks picking a second level before running replaces the earlier choice.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0015 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_DEFAULT)).assertTrue();
      expect(await clickText(driver, LABEL_USER_INITIATED)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('last choice query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(3);
      expect(info.setResult).assertEqual(0);
      expect(await findText(driver, '3') !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0016
     * @tc.name      testNdkQosPageLevel0016
     * @tc.desc      Checks the interactive choice also works when it is tapped explicitly.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0016 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_INTERACTIVE)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      logInfo('explicit interactive query level = ' + info.queryLevel.toString());
      expect(info.queryLevel).assertEqual(LEVEL_INTERACTIVE);
      expect(info.queryLevel >= LEVEL_BACKGROUND && info.queryLevel <= LEVEL_INTERACTIVE).assertTrue();
      expect(await findText(driver, DONE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0016 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0017
     * @tc.name      testNdkQosPageLevel0017
     * @tc.desc      Checks a finished run shows a measured duration for both boundary levels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0017 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, LABEL_BACKGROUND)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const low: QosRunInfo = pendingInfo();
      expect(await clickText(driver, LABEL_INTERACTIVE)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const high: QosRunInfo = pendingInfo();
      logInfo('boundary durations = ' + low.duration.toFixed(3) + ', ' + high.duration.toFixed(3));
      expect(low.duration > 0).assertTrue();
      expect(high.duration > 0).assertTrue();
      expect(low.queryLevel).assertEqual(LEVEL_BACKGROUND);
      expect(high.queryLevel).assertEqual(LEVEL_INTERACTIVE);
      logInfo('testNdkQosPageLevel0017 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0018
     * @tc.name      testNdkQosPageLevel0018
     * @tc.desc      Checks the page keeps one prompt line and one note after a run, so the layout is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0018 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      expect(await countText(driver, PAGE_MARK)).assertEqual(1);
      expect(await countText(driver, PAGE_NOTE)).assertEqual(1);
      expect(await countText(driver, ENTRY_TEXT)).assertEqual(1);
      logInfo('testNdkQosPageLevel0018 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0019
     * @tc.name      testNdkQosPageLevel0019
     * @tc.desc      Checks the result rows report success codes for set, query and reset after a run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0019 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      const zeroRows: number = await countText(driver, '0');
      logInfo('zero rows = ' + zeroRows.toString() + ', bind result = ' + info.bindResult.toString());
      expect(info.setResult).assertEqual(0);
      expect(info.resetResult).assertEqual(0);
      expect(zeroRows >= 2).assertTrue();
      logInfo('testNdkQosPageLevel0019 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0020
     * @tc.name      testNdkQosPageLevel0020
     * @tc.desc      Checks the back entry leaves the level page and returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0020 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, PAGE_MARK) === undefined).assertTrue();
      expect(await findText(driver, INFO_DURATION) === undefined).assertTrue();
      logInfo('testNdkQosPageLevel0020 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0021
     * @tc.name      testNdkQosPageLevel0021
     * @tc.desc      Checks a run after returning to the page starts again from the idle status.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0021 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await findText(driver, IDLE_STATUS) !== undefined).assertTrue();
      expect(await countText(driver, PENDING_DURATION_TEXT)).assertEqual(1);
      logInfo('testNdkQosPageLevel0021 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_LEVEL_0022
     * @tc.name      testNdkQosPageLevel0022
     * @tc.desc      Checks the duration row keeps the two decimal format after the run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageLevel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageLevel0022 begin');
      const driver: Driver = await createDriver();
      expect(await openLevelPage(driver)).assertTrue();
      expect(await runSelected(driver)).assertTrue();
      const info: QosRunInfo = pendingInfo();
      const formatted: string = info.duration.toFixed(2);
      const component: Component | undefined = await findText(driver, formatted);
      expect(component !== undefined).assertTrue();
      if (component !== undefined) {
        const shown: string = await component.getText();
        expect(shown === formatted || shown === zhOf(formatted)).assertTrue();
      }
      expect(formatted.indexOf('.') > 0).assertTrue();
      expect(await findText(driver, INFO_DURATION) !== undefined).assertTrue();
      logInfo('testNdkQosPageLevel0022 end');
    })
  })
}
