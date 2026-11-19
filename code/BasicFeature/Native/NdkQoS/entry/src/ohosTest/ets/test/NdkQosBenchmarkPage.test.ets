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

const TAG: string = '[Sample_NdkQosPageBenchTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const ENTRY_TEXT: string = 'Level benchmark';
const PAGE_MARK: string = 'Rounds per level';
const RUN_BUTTON: string = 'Run benchmark';
const REFRESH_BUTTON: string = 'Refresh summary';
const RESET_BUTTON: string = 'Reset summary';
const BACK_BUTTON: string = 'Back';
const IDLE_STATUS: string = 'Choose rounds and run the benchmark.';
const DONE_STATUS: string = 'Benchmark finished.';
const EMPTY_TEXT: string = 'No samples yet.';
const COLUMN_AVG: string = 'Avg (ms)';
const COLUMN_MIN: string = 'Min';
const SUMMARY_RUNS: string = 'Summary runs';
const SUMMARY_TOTAL: string = 'Total runs';
const LEVEL_COUNT: number = 6;
const ROUNDS_THREE_RUNS: number = 18;
const SUMMARY_LABELS: string[] = ['Summary runs', 'Last level', 'Summary avg (ms)', 'Summary min (ms)',
  'Summary max (ms)', 'Fastest level', 'Slowest level', 'Total runs'];
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
  ['Level benchmark', '等级基准测试'],
  ['Rounds per level', '每等级轮次'],
  ['Run benchmark', '开始基准测试'],
  ['Refresh summary', '刷新统计'],
  ['Reset summary', '清零统计'],
  ['Choose rounds and run the benchmark.', '选择轮次后开始基准测试。'],
  ['Benchmark finished.', '基准测试完成。'],
  ['No samples yet.', '暂无样本数据。'],
  ['Avg (ms)', '平均(毫秒)'],
  ['Min', '最小'],
  ['Max', '最大'],
  ['Summary runs', '累计次数'],
  ['Last level', '最近等级'],
  ['Summary avg (ms)', '累计平均(毫秒)'],
  ['Summary min (ms)', '累计最小(毫秒)'],
  ['Summary max (ms)', '累计最大(毫秒)'],
  ['Fastest level', '最快等级'],
  ['Slowest level', '最慢等级'],
  ['Total runs', '总实验次数'],
  ['Level', '等级'],
  ['Pass', '成功'],
  ['Fail', '失败']
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

// UiTest binds to the system UI service while the driver is created, so a busy system can hand
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
async function openBenchmarkPage(driver: Driver): Promise<boolean> {
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

// 轮次按钮的数字与结果单元格数字同形，必须按控件类型取到按钮本身再点击
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

async function reopenBenchmarkPage(driver: Driver): Promise<boolean> {
  if (!await openBenchmarkPage(driver)) {
    return false;
  }
  if (!await clickText(driver, BACK_BUTTON)) {
    return false;
  }
  if (!await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
    return false;
  }
  return await openBenchmarkPage(driver);
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

export default function ndkQosBenchmarkPageTest(): void {
  describe('NdkQosPageBench', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0001
     * @tc.name      testNdkQosPageBench0001
     * @tc.desc      Checks the benchmark page opens from the home page with its empty state and idle status.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0001 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      expect(await findText(driver, RUN_BUTTON) !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageBench0001 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0002
     * @tc.name      testNdkQosPageBench0002
     * @tc.desc      Checks the benchmark page shows one title and one back entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0002 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      const titleCount: number = await countText(driver, ENTRY_TEXT);
      logInfo('title count = ' + titleCount.toString());
      expect(titleCount).assertEqual(1);
      expect(await findText(driver, BACK_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, PAGE_MARK) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0002 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0003
     * @tc.name      testNdkQosPageBench0003
     * @tc.desc      Checks the benchmark page renders the three round choices and the action buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0003 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await findText(driver, '1') !== undefined).assertTrue();
      expect(await findText(driver, '2') !== undefined).assertTrue();
      expect(await findText(driver, '3') !== undefined).assertTrue();
      expect(await findText(driver, REFRESH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, RESET_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0003 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0004
     * @tc.name      testNdkQosPageBench0004
     * @tc.desc      Checks one benchmark round fills the table and switches the status to finished.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0004 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      await clickText(driver, RESET_BUTTON);
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) === undefined).assertTrue();
      expect(await findText(driver, COLUMN_AVG) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0004 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0005
     * @tc.name      testNdkQosPageBench0005
     * @tc.desc      Checks one round is counted as one experiment per level after the summary was reset.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0005 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      await clickText(driver, RESET_BUTTON);
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      // The summary card is built with a by-value builder, so the table rows are the view that follows a run.
      const rowCount: number = await countText(driver, COLUMN_MIN);
      logInfo('summary runs = ' + summary.runCount.toString() + ', rows = ' + rowCount.toString());
      expect(summary.runCount).assertEqual(LEVEL_COUNT);
      expect(sumOfCounts(summary)).assertEqual(LEVEL_COUNT);
      expect(await findText(driver, SUMMARY_TOTAL) !== undefined).assertTrue();
      // The result table sits in a fixed height scroll area, so only the rows inside the viewport
      // reach the UI element tree; the column header plus at least one filled row must be there.
      expect(await findText(driver, EMPTY_TEXT) === undefined).assertTrue();
      expect(rowCount).assertLarger(1);
      logInfo('testNdkQosPageBench0005 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0006
     * @tc.name      testNdkQosPageBench0006
     * @tc.desc      Checks the reset entry clears the samples and returns to the idle status.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0006 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      await clickText(driver, RUN_BUTTON);
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await waitForText(driver, EMPTY_TEXT, WAIT_TIMEOUT)).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageBench0006 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0007
     * @tc.name      testNdkQosPageBench0007
     * @tc.desc      Checks two rounds per level are counted as twelve experiments.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0007 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      await clickText(driver, RESET_BUTTON);
      expect(await clickText(driver, '2')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('two round runs = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(LEVEL_COUNT * 2);
      expect(sumOfCounts(summary)).assertEqual(LEVEL_COUNT * 2);
      expect(summary.lastLevel).assertEqual(LEVEL_COUNT - 1);
      logInfo('testNdkQosPageBench0007 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0008
     * @tc.name      testNdkQosPageBench0008
     * @tc.desc      Checks refreshing the summary keeps the finished result and adds no experiment.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0008 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      await clickText(driver, RESET_BUTTON);
      expect(await clickText(driver, '1')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const before: RunSummary = testNapi.getRunSummary();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      const after: RunSummary = testNapi.getRunSummary();
      expect(after.runCount).assertEqual(before.runCount);
      expect(await findText(driver, SUMMARY_RUNS) !== undefined).assertTrue();
      expect(await findText(driver, DONE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0008 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0009
     * @tc.name      testNdkQosPageBench0009
     * @tc.desc      Checks the back entry returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0009 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, PAGE_MARK) === undefined).assertTrue();
      expect(await findText(driver, ENTRY_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0009 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0010
     * @tc.name      testNdkQosPageBench0010
     * @tc.desc      Checks three rounds per level are counted as eighteen experiments.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0010 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      expect(await clickButton(driver, '3')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('three round runs = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(ROUNDS_THREE_RUNS);
      expect(sumOfCounts(summary)).assertEqual(ROUNDS_THREE_RUNS);
      expect(summary.lastLevel).assertEqual(LEVEL_COUNT - 1);
      logInfo('testNdkQosPageBench0010 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0011
     * @tc.name      testNdkQosPageBench0011
     * @tc.desc      Checks two separate one-round benchmarks add up to twelve experiments.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0011 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await clickButton(driver, '1')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const first: RunSummary = testNapi.getRunSummary();
      expect(first.runCount).assertEqual(LEVEL_COUNT);
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const second: RunSummary = testNapi.getRunSummary();
      logInfo('accumulated runs = ' + second.runCount.toString());
      expect(second.runCount).assertEqual(LEVEL_COUNT * 2);
      expect(sumOfCounts(second)).assertEqual(LEVEL_COUNT * 2);
      for (let level = 0; level < LEVEL_COUNT; level++) {
        expect(second.levelCounts[level]).assertEqual(2);
      }
      logInfo('testNdkQosPageBench0011 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0012
     * @tc.name      testNdkQosPageBench0012
     * @tc.desc      Checks picking a round count alone runs nothing and keeps the empty table.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0012 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      const before: RunSummary = testNapi.getRunSummary();
      expect(before.runCount).assertEqual(0);
      expect(await clickButton(driver, '3')).assertTrue();
      const after: RunSummary = testNapi.getRunSummary();
      expect(after.runCount).assertEqual(before.runCount);
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageBench0012 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0013
     * @tc.name      testNdkQosPageBench0013
     * @tc.desc      Checks the last selected round count wins when the choice is changed before a run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0013 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await clickButton(driver, '2')).assertTrue();
      expect(await clickButton(driver, '1')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('runs after switching rounds = ' + summary.runCount.toString());
      expect(summary.runCount).assertEqual(LEVEL_COUNT);
      expect(sumOfCounts(summary)).assertEqual(LEVEL_COUNT);
      expect(summary.lastLevel).assertEqual(LEVEL_COUNT - 1);
      logInfo('testNdkQosPageBench0013 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0014
     * @tc.name      testNdkQosPageBench0014
     * @tc.desc      Checks the result table renders every column header after a benchmark.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0014 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await findText(driver, 'Level') !== undefined).assertTrue();
      expect(await findText(driver, 'Pass') !== undefined).assertTrue();
      expect(await findText(driver, 'Fail') !== undefined).assertTrue();
      expect(await findText(driver, COLUMN_AVG) !== undefined).assertTrue();
      expect(await findText(driver, COLUMN_MIN) !== undefined).assertTrue();
      expect(await findText(driver, 'Max') !== undefined).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) === undefined).assertTrue();
      logInfo('testNdkQosPageBench0014 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0015
     * @tc.name      testNdkQosPageBench0015
     * @tc.desc      Checks a reopened page starts from the empty table while the run summary survives.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0015 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await clickButton(driver, '1')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      const before: number = testNapi.getRunSummary().runCount;
      expect(before).assertEqual(LEVEL_COUNT);
      expect(await reopenBenchmarkPage(driver)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertEqual(before);
      expect(await findText(driver, SUMMARY_RUNS) !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0015 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0016
     * @tc.name      testNdkQosPageBench0016
     * @tc.desc      Checks the summary card lists its eight rows together with the two action entries.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0016 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      let found: number = 0;
      for (let index = 0; index < SUMMARY_LABELS.length; index++) {
        if (await findText(driver, SUMMARY_LABELS[index]) !== undefined) {
          found++;
        }
      }
      logInfo('summary labels found = ' + found.toString());
      expect(found).assertEqual(SUMMARY_LABELS.length);
      expect(await findText(driver, REFRESH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, RESET_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0016 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_BENCH_0017
     * @tc.name      testNdkQosPageBench0017
     * @tc.desc      Checks resetting after a three-round benchmark clears the table and the summary.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageBench0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageBench0017 begin');
      const driver: Driver = await createDriver();
      expect(await openBenchmarkPage(driver)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await clickButton(driver, '3')).assertTrue();
      expect(await clickText(driver, RUN_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertEqual(ROUNDS_THREE_RUNS);
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      expect(await findText(driver, IDLE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageBench0017 end');
    })
  })
}
