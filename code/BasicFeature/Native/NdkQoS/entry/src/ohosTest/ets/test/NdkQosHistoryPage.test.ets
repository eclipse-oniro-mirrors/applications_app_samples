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
import { common, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { RecordQueryReport, RecordStatsReport } from 'libentry.so';

const TAG: string = '[Sample_NdkQosPageHistoryTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const ENTRY_TEXT: string = 'Run records';
const PAGE_MARK: string = 'QoS level to run';
const BACK_BUTTON: string = 'Back';
const RECORD_BUTTON: string = 'Run and record';
const READ_BUTTON: string = 'Read records';
const STATS_BUTTON: string = 'Refresh stats';
const CLEAR_BUTTON: string = 'Clear records';
const IDLE_STATUS: string = 'Run a record or read the record file.';
const RECORDED_STATUS: string = 'Record appended.';
const READ_STATUS: string = 'Record file read.';
const CLEARED_STATUS: string = 'Record file cleared.';
const EMPTY_TEXT: string = 'No records yet.';
const NOTE_TEXT: string = 'Records are stored in the application sandbox and capped at 200 entries.';
const READ_LIMIT: number = 10;
const WAIT_TIMEOUT: number = 15000;
const RUN_TIMEOUT: number = 30000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// The sample ships English and Chinese resource sets, so every label is resolved in both locales.
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['High level QoS test', '高等级 QoS 测试'],
  ['Back', '返回'],
  ['Run records', '实验记录'],
  ['QoS level to run', '实验使用的 QoS 等级'],
  ['Run and record', '运行并记录'],
  ['Read records', '读取记录'],
  ['Refresh stats', '刷新统计'],
  ['Clear records', '清空记录'],
  ['Run a record or read the record file.', '运行一次记录或读取记录文件。'],
  ['Record appended.', '记录已追加。'],
  ['Record file read.', '记录文件已读取。'],
  ['Record file cleared.', '记录文件已清空。'],
  ['No records yet.', '暂无记录。'],
  ['Records are stored in the application sandbox and capped at 200 entries.', '记录存放于应用沙箱，最多保留 200 条。'],
  ['Level', '等级'],
  ['Records', '记录总数'],
  ['Capacity', '容量上限']
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

let cachedDir: string = '';

// The page writes through its own UIAbility context, whose files directory is the module one; the
// bundle level directory reported by getAppContext() is a different location.
async function recordDir(): Promise<string> {
  if (cachedDir.length > 0) {
    return cachedDir;
  }
  try {
    const topAbility: UIAbility = await delegator.getCurrentTopAbility();
    cachedDir = topAbility.context.filesDir;
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    logInfo('top ability unavailable, code = ' + failure.code.toString());
  }
  if (cachedDir.length === 0) {
    const appContext: common.Context = delegator.getAppContext();
    cachedDir = appContext.filesDir;
  }
  logInfo('record dir = ' + cachedDir);
  return cachedDir;
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

async function openHistoryPage(driver: Driver): Promise<boolean> {
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

function totalOf(dir: string): number {
  const report: RecordQueryReport = testNapi.readRunRecords(dir, READ_LIMIT);
  return report.total;
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

// 等级按钮、条数按钮与统计卡里的数字同形，必须按控件类型取到按钮本身再点击
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

async function reopenHistoryPage(driver: Driver): Promise<boolean> {
  if (!await openHistoryPage(driver)) {
    return false;
  }
  if (!await clickText(driver, BACK_BUTTON)) {
    return false;
  }
  if (!await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
    return false;
  }
  return await openHistoryPage(driver);
}

export default function ndkQosHistoryPageTest(): void {
  describe('NdkQosPageHistory', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0001
     * @tc.name      testNdkQosPageHistory0001
     * @tc.desc      Checks the record page opens with its four actions, idle status and storage note.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0001 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await findText(driver, RECORD_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, READ_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, STATS_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, CLEAR_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageHistory0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0002
     * @tc.name      testNdkQosPageHistory0002
     * @tc.desc      Checks clearing the records reports the empty state and leaves no record behind.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0002 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(0);
      logInfo('testNdkQosPageHistory0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0003
     * @tc.name      testNdkQosPageHistory0003
     * @tc.desc      Checks one run appends exactly one record and the list replaces the empty hint.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0003 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) === undefined).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(1);
      logInfo('testNdkQosPageHistory0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0004
     * @tc.name      testNdkQosPageHistory0004
     * @tc.desc      Checks reading the records reports the file state and renders the record rows.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0004 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(1);
      expect(await findText(driver, 'Level') !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0005
     * @tc.name      testNdkQosPageHistory0005
     * @tc.desc      Checks the statistics refresh reports totals consistent with the stored records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0005 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, STATS_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      const stats: RecordStatsReport = testNapi.getRecordStats(await recordDir());
      logInfo('record stats = ' + JSON.stringify(stats));
      expect(stats.total).assertEqual(1);
      expect(stats.successCount + stats.failureCount).assertEqual(stats.total);
      expect(await findText(driver, 'Capacity') !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0006
     * @tc.name      testNdkQosPageHistory0006
     * @tc.desc      Checks the read limits are offered and a larger limit keeps the read working.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0006 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await findText(driver, '10') !== undefined).assertTrue();
      expect(await findText(driver, '50') !== undefined).assertTrue();
      expect(await findText(driver, '100') !== undefined).assertTrue();
      expect(await clickText(driver, '50')).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      logInfo('testNdkQosPageHistory0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0007
     * @tc.name      testNdkQosPageHistory0007
     * @tc.desc      Checks clearing twice keeps the file empty and restores the empty hint.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0007 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, EMPTY_TEXT, WAIT_TIMEOUT)).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(0);
      expect(await findText(driver, 'Records') !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0008
     * @tc.name      testNdkQosPageHistory0008
     * @tc.desc      Checks a record taken on the utility level is stored with that level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0008 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickButton(driver, '3')).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      const report: RecordQueryReport = testNapi.readRunRecords(await recordDir(), READ_LIMIT);
      logInfo('recorded level = ' + report.records[0].level.toString());
      expect(report.total).assertEqual(1);
      expect(report.records[0].level).assertEqual(3);
      expect(await findText(driver, EMPTY_TEXT) === undefined).assertTrue();
      expect(await findText(driver, '#0') !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0009
     * @tc.name      testNdkQosPageHistory0009
     * @tc.desc      Checks two recorded runs are numbered in write order starting from zero.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0009 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      const report: RecordQueryReport = testNapi.readRunRecords(await recordDir(), READ_LIMIT);
      logInfo('record numbers = ' + report.records[0].index.toString() + ',' + report.records[1].index.toString());
      expect(report.total).assertEqual(2);
      expect(report.records[0].index).assertEqual(0);
      expect(report.records[1].index).assertEqual(1);
      expect(await findText(driver, '#1') !== undefined).assertTrue();
      expect(testNapi.getRecordStats(await recordDir()).total).assertEqual(2);
      logInfo('testNdkQosPageHistory0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0010
     * @tc.name      testNdkQosPageHistory0010
     * @tc.desc      Checks reading with the medium limit returns the stored record.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0010 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      // The page keeps its level selection while it stays on the stack, so pin the level asserted below.
      expect(await clickButton(driver, '5')).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickButton(driver, '50')).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      const report: RecordQueryReport = testNapi.readRunRecords(await recordDir(), 50);
      logInfo('limit 50 total = ' + report.total.toString() + ', returned = ' + report.returned.toString());
      expect(report.total).assertEqual(1);
      expect(report.returned).assertEqual(1);
      expect(report.records[0].level).assertEqual(5);
      logInfo('testNdkQosPageHistory0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0011
     * @tc.name      testNdkQosPageHistory0011
     * @tc.desc      Checks the read limit larger than the file size still returns every record.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0011 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickButton(driver, '10')).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      const small: RecordQueryReport = testNapi.readRunRecords(await recordDir(), 10);
      expect(await clickButton(driver, '100')).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      const large: RecordQueryReport = testNapi.readRunRecords(await recordDir(), 100);
      logInfo('returned 10/100 = ' + small.returned.toString() + '/' + large.returned.toString());
      expect(small.returned).assertEqual(2);
      expect(large.returned).assertEqual(2);
      expect(large.records[1].index).assertEqual(1);
      logInfo('testNdkQosPageHistory0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0012
     * @tc.name      testNdkQosPageHistory0012
     * @tc.desc      Checks the statistics card reports the stored level and the record capacity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0012 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      // The page keeps its level selection while it stays on the stack, so pin the level asserted below.
      expect(await clickButton(driver, '5')).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      const stats: RecordStatsReport = testNapi.getRecordStats(await recordDir());
      logInfo('stats after one record = ' + JSON.stringify(stats));
      expect(stats.total).assertEqual(1);
      expect(stats.successCount + stats.failureCount).assertEqual(stats.total);
      expect(stats.levelCounts[5]).assertEqual(1);
      expect(await findText(driver, '200') !== undefined).assertTrue();
      expect(await findText(driver, 'Capacity') !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0013
     * @tc.name      testNdkQosPageHistory0013
     * @tc.desc      Checks revisiting the page clears the list while the record file keeps its entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0013 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(1);
      expect(await reopenHistoryPage(driver)).assertTrue();
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      expect(totalOf(await recordDir())).assertEqual(1);
      expect(testNapi.getRecordStats(await recordDir()).total).assertEqual(1);
      logInfo('testNdkQosPageHistory0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0014
     * @tc.name      testNdkQosPageHistory0014
     * @tc.desc      Checks reading an emptied file succeeds and reports no record at all.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0014 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, READ_BUTTON)).assertTrue();
      expect(await waitForText(driver, READ_STATUS, WAIT_TIMEOUT)).assertTrue();
      const report: RecordQueryReport = testNapi.readRunRecords(await recordDir(), READ_LIMIT);
      logInfo('empty file total = ' + report.total.toString());
      expect(report.total).assertEqual(0);
      expect(report.returned).assertEqual(0);
      expect(report.records.length).assertEqual(0);
      expect(await findText(driver, EMPTY_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageHistory0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_HISTORY_0015
     * @tc.name      testNdkQosPageHistory0015
     * @tc.desc      Checks two records on the same level are grouped under that level in the statistics.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageHistory0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageHistory0015 begin');
      const driver: Driver = await createDriver();
      expect(await openHistoryPage(driver)).assertTrue();
      expect(await clickText(driver, CLEAR_BUTTON)).assertTrue();
      expect(await waitForText(driver, CLEARED_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickButton(driver, '3')).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RECORD_BUTTON)).assertTrue();
      expect(await waitForText(driver, RECORDED_STATUS, RUN_TIMEOUT)).assertTrue();
      const stats: RecordStatsReport = testNapi.getRecordStats(await recordDir());
      logInfo('level counts = ' + JSON.stringify(stats.levelCounts));
      expect(stats.total).assertEqual(2);
      expect(stats.levelCounts[3]).assertEqual(2);
      expect(stats.levelCounts[5]).assertEqual(0);
      const report: RecordQueryReport = testNapi.readRunRecords(await recordDir(), READ_LIMIT);
      expect(report.records[0].level).assertEqual(3);
      expect(report.records[1].level).assertEqual(3);
      logInfo('testNdkQosPageHistory0015 end');
    })
  })
}
