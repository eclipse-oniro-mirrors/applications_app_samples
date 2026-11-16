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
import { RunSummary } from 'libentry.so';

const TAG: string = '[Sample_NdkQosPageConcurrencyTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const ENTRY_TEXT: string = 'Concurrent stress test';
const PAGE_MARK: string = 'Rounds per thread';
const RUN_BUTTON: string = 'Run stress test';
const BACK_BUTTON: string = 'Back';
const IDLE_STATUS: string = 'Choose level, threads and rounds.';
const DONE_STATUS: string = 'Stress test finished.';
const LEVEL_LABEL: string = 'QoS level';
const THREADS_LABEL: string = 'Threads';
const REQUESTED_LABEL: string = 'Requested runs';
const NOTE_TEXT: string = 'Each thread runs the same QoS experiment on its own thread.';
const DEFAULT_LEVEL_LABEL: string = 'USER_INTERACTIVE (user interactive)';
const BACKGROUND_LEVEL_LABEL: string = 'BACKGROUND (background task)';
const INVALID_DURATION_TEXT: string = '-1.00';
const PLACEHOLDER_ROWS: number = 3;
const LEVEL_COUNT: number = 6;
const MAX_LEVEL: number = 5;
const MAX_THREADS_OPTION: string = '8';
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
  ['Concurrent stress test', '并发压测'],
  ['Rounds per thread', '每线程轮次'],
  ['Run stress test', '开始压测'],
  ['Choose level, threads and rounds.', '选择等级、线程数与轮次。'],
  ['Stress test finished.', '压测完成。'],
  ['QoS level', 'QoS 等级'],
  ['Threads', '线程数'],
  ['Requested runs', '请求次数'],
  ['Each thread runs the same QoS experiment on its own thread.', '每个压测线程独立执行一次完整的 QoS 实验。'],
  ['USER_INTERACTIVE (user interactive)', 'USER_INTERACTIVE（用户交互）'],
  ['BACKGROUND (background task)', 'BACKGROUND（后台任务）'],
  ['Pass', '成功'],
  ['Fail', '失败'],
  ['Avg (ms)', '平均(毫秒)'],
  ['Min (ms)', '最小(毫秒)'],
  ['Max (ms)', '最大(毫秒)']
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

// 页面可能已经打开，先就地确认，避免重复压栈
async function openConcurrencyPage(driver: Driver): Promise<boolean> {
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

// Leaving the page drops the stored choices, so the next visit starts from the shipped defaults.
async function reopenConcurrencyPage(driver: Driver): Promise<boolean> {
  if (!await openConcurrencyPage(driver)) {
    return false;
  }
  const back: Component | undefined = await findText(driver, BACK_BUTTON);
  if (back === undefined) {
    logInfo('back missed: ' + BACK_BUTTON);
    return false;
  }
  await back.click();
  if (!await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
    logInfo('index not reached after back');
    return false;
  }
  return await openConcurrencyPage(driver);
}

async function findButton(driver: Driver, text: string): Promise<Component | undefined> {
  try {
    const candidates: Component[] | null = await driver.findComponents(ON.text(text));
    if (candidates === null) {
      return undefined;
    }
    for (let index = 0; index < candidates.length; index++) {
      const type: string = await candidates[index].getType();
      if (type === 'Button') {
        return candidates[index];
      }
    }
  } catch (error) {
    logInfo('findButton failed: ' + text);
  }
  return undefined;
}

// 等级按钮、线程按钮与结果卡的数字同形，必须按控件类型取到按钮本身再点击
async function clickButton(driver: Driver, text: string): Promise<boolean> {
  const button: Component | undefined = await findButton(driver, text);
  if (button === undefined) {
    logInfo('clickButton missed: ' + text);
    return false;
  }
  await button.click();
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

function sumOfCounts(summary: RunSummary): number {
  let total: number = 0;
  for (let index = 0; index < summary.levelCounts.length; index++) {
    total += summary.levelCounts[index];
  }
  return total;
}

export default function ndkQosConcurrencyPageTest(): void {
  describe('NdkQosPageConcurrency', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0001
     * @tc.name      testNdkQosPageConc0001
     * @tc.desc      Checks the stress test page opens with its idle status and explanatory note.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0001 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      expect(await findText(driver, RUN_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0002
     * @tc.name      testNdkQosPageConc0002
     * @tc.desc      Checks the page starts on the interactive level and shows the level and worker labels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0002 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await findText(driver, LEVEL_LABEL) !== undefined).assertTrue();
      expect(await findText(driver, THREADS_LABEL) !== undefined).assertTrue();
      const label: Component | undefined = await findText(driver, DEFAULT_LEVEL_LABEL);
      expect(label !== undefined).assertTrue();
      if (label !== undefined) {
        expect(matchedText(await label.getText(), DEFAULT_LEVEL_LABEL)).assertTrue();
      }
      logInfo('testNdkQosPageConc0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0003
     * @tc.name      testNdkQosPageConc0003
     * @tc.desc      Checks every level from background to interactive is offered as a choice.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0003 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      let offered: number = 0;
      for (let level = 0; level <= MAX_LEVEL; level++) {
        if (await findText(driver, level.toString()) !== undefined) {
          offered++;
        }
      }
      logInfo('levels offered = ' + offered.toString());
      expect(offered).assertEqual(MAX_LEVEL + 1);
      expect(await findText(driver, MAX_THREADS_OPTION) !== undefined).assertTrue();
      expect(await findText(driver, BACK_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0004
     * @tc.name      testNdkQosPageConc0004
     * @tc.desc      Checks eight workers run one round each and every attempt is counted once.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0004 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickText(driver, MAX_THREADS_OPTION)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('runs after eight workers = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(8);
      expect(sumOfCounts(summary)).assertEqual(8);
      expect(summary.lastLevel).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosPageConc0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0005
     * @tc.name      testNdkQosPageConc0005
     * @tc.desc      Checks the default single worker run counts as one experiment and lists the request total.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0005 begin');
      const driver: Driver = await createDriver();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      expect(summary.runCount).assertEqual(1);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(1);
      expect(await findText(driver, REQUESTED_LABEL) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0006
     * @tc.name      testNdkQosPageConc0006
     * @tc.desc      Checks the result card reports pass, fail and the three duration figures after a run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0006 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await findText(driver, 'Pass') !== undefined).assertTrue();
      expect(await findText(driver, 'Fail') !== undefined).assertTrue();
      expect(await findText(driver, 'Avg (ms)') !== undefined).assertTrue();
      expect(await findText(driver, 'Max (ms)') !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0007
     * @tc.name      testNdkQosPageConc0007
     * @tc.desc      Checks running the stress test twice accumulates two experiments.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0007 begin');
      const driver: Driver = await createDriver();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('runs after two stress tests = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(2);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(2);
      expect(sumOfCounts(summary)).assertEqual(2);
      logInfo('testNdkQosPageConc0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0008
     * @tc.name      testNdkQosPageConc0008
     * @tc.desc      Checks the back entry returns to the home page from the stress test page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0008 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, PAGE_MARK) === undefined).assertTrue();
      expect(await findText(driver, ENTRY_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0009
     * @tc.name      testNdkQosPageConc0009
     * @tc.desc      Checks picking the background level replaces the level label without touching the workers.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0009 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await findText(driver, DEFAULT_LEVEL_LABEL) !== undefined).assertTrue();
      expect(await clickButton(driver, '0')).assertTrue();
      const label: Component | undefined = await findText(driver, BACKGROUND_LEVEL_LABEL);
      expect(label !== undefined).assertTrue();
      if (label !== undefined) {
        expect(matchedText(await label.getText(), BACKGROUND_LEVEL_LABEL)).assertTrue();
      }
      expect(await findText(driver, DEFAULT_LEVEL_LABEL) === undefined).assertTrue();
      logInfo('testNdkQosPageConc0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0010
     * @tc.name      testNdkQosPageConc0010
     * @tc.desc      Checks the selected background level is the one the stress test runs with.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0010 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickButton(driver, '0')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('background runs = ' + summary.runCount.toString() + ', last = ' + summary.lastLevel.toString());
      expect(summary.runCount).assertEqual(1);
      expect(summary.lastLevel).assertEqual(0);
      expect(summary.levelCounts[0]).assertEqual(1);
      expect(sumOfCounts(summary)).assertEqual(1);
      logInfo('testNdkQosPageConc0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0011
     * @tc.name      testNdkQosPageConc0011
     * @tc.desc      Checks eight workers on the background level are counted as eight background runs.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0011 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickButton(driver, '0')).assertTrue();
      expect(await clickButton(driver, MAX_THREADS_OPTION)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('combined runs = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(8);
      expect(summary.levelCounts[0]).assertEqual(8);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(0);
      expect(sumOfCounts(summary)).assertEqual(8);
      logInfo('testNdkQosPageConc0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0012
     * @tc.name      testNdkQosPageConc0012
     * @tc.desc      Checks every level entry and the action stay reachable after a stress test finished.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0012 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      let offered: number = 0;
      for (let level = 0; level <= MAX_LEVEL; level++) {
        if (await findText(driver, level.toString()) !== undefined) {
          offered++;
        }
      }
      logInfo('levels after run = ' + offered.toString());
      expect(offered).assertEqual(LEVEL_COUNT);
      expect(await findText(driver, RUN_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      expect(await findText(driver, DONE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0013
     * @tc.name      testNdkQosPageConc0013
     * @tc.desc      Checks a freshly opened page shows the three duration placeholders in its result card.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0013 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      const placeholders: number = await countText(driver, INVALID_DURATION_TEXT);
      logInfo('duration placeholders = ' + placeholders.toString());
      expect(placeholders).assertEqual(PLACEHOLDER_ROWS);
      expect(await findText(driver, REQUESTED_LABEL) !== undefined).assertTrue();
      expect(await findText(driver, 'Min (ms)') !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0014
     * @tc.name      testNdkQosPageConc0014
     * @tc.desc      Checks a finished run replaces the duration placeholders with measured values.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0014 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      const before: number = await countText(driver, INVALID_DURATION_TEXT);
      expect(before).assertEqual(PLACEHOLDER_ROWS);
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const after: number = await countText(driver, INVALID_DURATION_TEXT);
      logInfo('placeholders before = ' + before.toString() + ', after = ' + after.toString());
      expect(after < PLACEHOLDER_ROWS).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertLarger(0);
      expect(await findText(driver, 'Pass') !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0015
     * @tc.name      testNdkQosPageConc0015
     * @tc.desc      Checks a second run refreshes the same result card instead of stacking a new one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0015 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      testNapi.resetRunSummary();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      expect(summary.runCount).assertEqual(2);
      expect(await countText(driver, REQUESTED_LABEL)).assertEqual(1);
      expect(await countText(driver, 'Pass')).assertEqual(1);
      logInfo('testNdkQosPageConc0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_CONC_0016
     * @tc.name      testNdkQosPageConc0016
     * @tc.desc      Checks revisiting the page restores the default level and the placeholder card.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageConc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageConc0016 begin');
      const driver: Driver = await createDriver();
      expect(await openConcurrencyPage(driver)).assertTrue();
      expect(await clickButton(driver, '0')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await reopenConcurrencyPage(driver)).assertTrue();
      expect(await findText(driver, DEFAULT_LEVEL_LABEL) !== undefined).assertTrue();
      expect(await countText(driver, INVALID_DURATION_TEXT)).assertEqual(PLACEHOLDER_ROWS);
      expect(await findText(driver, IDLE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageConc0016 end');
    })
  })
}
