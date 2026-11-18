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

const TAG: string = '[Sample_NdkQosNavigationTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const HIGH_BUTTON: string = 'High level QoS test';
const LOW_BUTTON: string = 'Low level QoS test';
const ENTRY_LEVEL: string = 'QoS level settings';
const ENTRY_BENCH: string = 'Level benchmark';
const ENTRY_CONCURRENT: string = 'Concurrent stress test';
const ENTRY_DEVICE: string = 'CPU topology and affinity';
const ENTRY_HISTORY: string = 'Run records';
const MARK_LEVEL: string = 'Select a QoS level';
const MARK_BENCH: string = 'Rounds per level';
const MARK_CONCURRENT: string = 'Rounds per thread';
const MARK_DEVICE: string = 'Select a CPU to bind';
const MARK_HISTORY: string = 'Records to read';
const BACK_BUTTON: string = 'Back';
const WAIT_TIMEOUT: number = 15000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// The sample ships English and Chinese resource sets, so every label is resolved in both locales.
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['High level QoS test', '高等级 QoS 测试'],
  ['Low level QoS test', '低等级 QoS 测试'],
  ['Back', '返回'],
  ['QoS level settings', 'QoS 等级设置'],
  ['Level benchmark', '等级基准测试'],
  ['Concurrent stress test', '并发压测'],
  ['CPU topology and affinity', 'CPU 拓扑与亲和性'],
  ['Run records', '实验记录'],
  ['Select a QoS level', '选择 QoS 等级'],
  ['Rounds per level', '每等级轮次'],
  ['Rounds per thread', '每线程轮次'],
  ['Select a CPU to bind', '选择要绑定的核'],
  ['Records to read', '读取条数']
]);

function zhOf(text: string): string {
  const value: string | undefined = ZH_TEXTS.get(text);
  return value === undefined ? text : value;
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

async function openPage(driver: Driver, entryText: string, pageMark: string): Promise<boolean> {
  for (let attempt = 0; attempt < OPEN_ATTEMPTS; attempt++) {
    if (await waitForText(driver, pageMark, PAGE_PROBE_TIMEOUT)) {
      return true;
    }
    if (!await ensureIndex(driver)) {
      logInfo('index not reached, attempt ' + attempt.toString());
      continue;
    }
    const entry: Component | undefined = await findText(driver, entryText);
    if (entry === undefined) {
      logInfo('entry missed: ' + entryText);
      continue;
    }
    await entry.click();
    if (await waitForText(driver, pageMark, ENTRY_TIMEOUT)) {
      return true;
    }
    logInfo('page not reached, retrying: ' + pageMark);
  }
  return false;
}

async function goBack(driver: Driver): Promise<boolean> {
  const back: Component | undefined = await findText(driver, BACK_BUTTON);
  if (back === undefined) {
    logInfo('back entry missed');
    return false;
  }
  await back.click();
  await driver.delayMs(800);
  return await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT);
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

export default function ndkQosNavigationTest(): void {
  describe('NdkQosNavigation', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0001
     * @tc.name      testNdkQosNavigation0001
     * @tc.desc      Checks the home page offers both quick tests and the five page entries.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0001 begin');
      const driver: Driver = await createDriver();
      expect(await ensureIndex(driver)).assertTrue();
      expect(await findText(driver, HIGH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_LEVEL) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_BENCH) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_CONCURRENT) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_DEVICE) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_HISTORY) !== undefined).assertTrue();
      logInfo('testNdkQosNavigation0001 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0002
     * @tc.name      testNdkQosNavigation0002
     * @tc.desc      Checks the level entry opens its page and hides the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0002 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_LEVEL, MARK_LEVEL)).assertTrue();
      expect(await findText(driver, MARK_LEVEL) !== undefined).assertTrue();
      expect(await findText(driver, INDEX_MARK) === undefined).assertTrue();
      expect(await findText(driver, ENTRY_BENCH) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0002 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0003
     * @tc.name      testNdkQosNavigation0003
     * @tc.desc      Checks the benchmark entry opens the benchmark page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0003 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_BENCH, MARK_BENCH)).assertTrue();
      expect(await findText(driver, MARK_BENCH) !== undefined).assertTrue();
      expect(await findText(driver, INDEX_MARK) === undefined).assertTrue();
      expect(await findText(driver, MARK_LEVEL) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0003 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0004
     * @tc.name      testNdkQosNavigation0004
     * @tc.desc      Checks the concurrency entry opens the stress test page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0004 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_CONCURRENT, MARK_CONCURRENT)).assertTrue();
      expect(await findText(driver, MARK_CONCURRENT) !== undefined).assertTrue();
      expect(await findText(driver, INDEX_MARK) === undefined).assertTrue();
      expect(await findText(driver, MARK_BENCH) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0004 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0005
     * @tc.name      testNdkQosNavigation0005
     * @tc.desc      Checks the device entry opens the topology and affinity page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0005 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_DEVICE, MARK_DEVICE)).assertTrue();
      expect(await findText(driver, MARK_DEVICE) !== undefined).assertTrue();
      expect(await findText(driver, INDEX_MARK) === undefined).assertTrue();
      expect(await findText(driver, MARK_CONCURRENT) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0005 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0006
     * @tc.name      testNdkQosNavigation0006
     * @tc.desc      Checks the history entry opens the run records page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0006 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_HISTORY, MARK_HISTORY)).assertTrue();
      expect(await findText(driver, MARK_HISTORY) !== undefined).assertTrue();
      expect(await findText(driver, INDEX_MARK) === undefined).assertTrue();
      expect(await findText(driver, MARK_DEVICE) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0006 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0007
     * @tc.name      testNdkQosNavigation0007
     * @tc.desc      Checks two child pages can be visited one after another and each back entry returns home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0007 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_LEVEL, MARK_LEVEL)).assertTrue();
      expect(await goBack(driver)).assertTrue();
      expect(await openPage(driver, ENTRY_BENCH, MARK_BENCH)).assertTrue();
      expect(await goBack(driver)).assertTrue();
      expect(await findText(driver, INDEX_MARK) !== undefined).assertTrue();
      expect(await findText(driver, MARK_BENCH) === undefined).assertTrue();
      logInfo('testNdkQosNavigation0007 end');
    })

    /**
     * @tc.number    SUB_QOS_PAGE_NAV_0008
     * @tc.name      testNdkQosNavigation0008
     * @tc.desc      Checks the level page keeps a single title once the home page entry is no longer visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNavigation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNavigation0008 begin');
      const driver: Driver = await createDriver();
      expect(await openPage(driver, ENTRY_LEVEL, MARK_LEVEL)).assertTrue();
      const titleCount: number = await countText(driver, ENTRY_LEVEL);
      const backCount: number = await countText(driver, BACK_BUTTON);
      logInfo('title count = ' + titleCount.toString() + ', back count = ' + backCount.toString());
      expect(titleCount).assertEqual(1);
      expect(backCount).assertEqual(1);
      expect(await findText(driver, MARK_LEVEL) !== undefined).assertTrue();
      logInfo('testNdkQosNavigation0008 end');
    })
  })
}
