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
import { CpuTopology } from 'libentry.so';

const TAG: string = '[Sample_NdkQosPageDeviceTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const INDEX_MARK: string = 'High level QoS test';
const ENTRY_TEXT: string = 'CPU topology and affinity';
const PAGE_MARK: string = 'Computation CPU';
const BACK_BUTTON: string = 'Back';
const REFRESH_BUTTON: string = 'Refresh topology';
const BIND_BUTTON: string = 'Bind current thread';
const RESET_BUTTON: string = 'Reset affinity';
const IDLE_STATUS: string = 'Refresh the topology to start.';
const DONE_STATUS: string = 'Topology refreshed.';
const BOUND_STATUS: string = 'Thread bound to the selected CPU.';
const RESET_STATUS: string = 'Affinity reset to all CPUs.';
const NOTE_TEXT: string = 'Affinity applies to the thread that calls the interface.';
const SENTINEL_TEXT: string = '-1';
const EMPTY_AFFINITY_TEXT: string = '-';
const FIXED_BUTTON_COUNT: number = 4;
const SENTINEL_ROWS: number = 3;
const WAIT_TIMEOUT: number = 15000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// The sample ships English and Chinese resource sets, so every label is resolved in both locales.
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['High level QoS test', '高等级 QoS 测试'],
  ['Back', '返回'],
  ['CPU topology and affinity', 'CPU 拓扑与亲和性'],
  ['Computation CPU', '计算绑定核'],
  ['Refresh topology', '刷新拓扑'],
  ['Bind current thread', '绑定当前线程'],
  ['Reset affinity', '解除绑定'],
  ['Refresh the topology to start.', '刷新拓扑后开始。'],
  ['Topology refreshed.', '拓扑已刷新。'],
  ['Thread bound to the selected CPU.', '线程已绑定到所选核。'],
  ['Affinity reset to all CPUs.', '已恢复为全部核可用。'],
  ['Affinity applies to the thread that calls the interface.', '亲和性只作用于调用接口的线程。'],
  ['CPU count', 'CPU 核数'],
  ['Affinity CPUs', '当前可用核'],
  ['Select a CPU to bind', '选择要绑定的核'],
  ['Bind result', '绑定返回码'],
  ['Target CPU', '目标核']
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

async function openDevicePage(driver: Driver): Promise<boolean> {
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

async function countButtons(driver: Driver): Promise<number> {
  try {
    const buttons: Component[] | null = await driver.findComponents(ON.type('Button'));
    return buttons === null ? 0 : buttons.length;
  } catch (error) {
    logInfo('countButtons failed');
    return -1;
  }
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

// 核编号按钮与信息行的数值同形，必须按控件类型取到按钮本身再点击
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

async function reopenDevicePage(driver: Driver): Promise<boolean> {
  if (!await openDevicePage(driver)) {
    return false;
  }
  if (!await clickText(driver, BACK_BUTTON)) {
    return false;
  }
  if (!await waitForText(driver, INDEX_MARK, INDEX_PROBE_TIMEOUT)) {
    return false;
  }
  return await openDevicePage(driver);
}

export default function ndkQosDevicePageTest(): void {
  describe('NdkQosPageDevice', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0001
     * @tc.name      testNdkQosPageDevice0001
     * @tc.desc      Checks the device page opens with the topology labels and asks for a refresh first.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0001 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await findText(driver, 'CPU count') !== undefined).assertTrue();
      expect(await findText(driver, 'Affinity CPUs') !== undefined).assertTrue();
      expect(await findText(driver, 'Select a CPU to bind') !== undefined).assertTrue();
      const status: Component | undefined = await findText(driver, IDLE_STATUS);
      expect(status !== undefined).assertTrue();
      if (status !== undefined) {
        expect(matchedText(await status.getText(), IDLE_STATUS)).assertTrue();
      }
      logInfo('testNdkQosPageDevice0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0002
     * @tc.name      testNdkQosPageDevice0002
     * @tc.desc      Checks refreshing the topology offers one bind target per core and reports the refreshed status.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0002 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('device cpu count = ' + topology.cpuCount.toString());
      expect(topology.cpuCount).assertLarger(0);
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      // The info rows are rendered by a by-value builder, so their values keep the first state;
      // the bind target chips are the part of the page that follows the refreshed core count.
      let chips: number = 0;
      for (let cpu = 0; cpu < topology.cpuCount; cpu++) {
        if (await findText(driver, cpu.toString()) !== undefined) {
          chips++;
        }
      }
      logInfo('bind chips = ' + chips.toString() + ', cpu count = ' + topology.cpuCount.toString());
      expect(chips).assertEqual(topology.cpuCount);
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0003
     * @tc.name      testNdkQosPageDevice0003
     * @tc.desc      Checks one choice is offered for every core plus the fixed action buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0003 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      const buttons: number = await countButtons(driver);
      logInfo('button count = ' + buttons.toString() + ', cpu count = ' + topology.cpuCount.toString());
      expect(buttons).assertEqual(topology.cpuCount + FIXED_BUTTON_COUNT);
      expect(await findText(driver, (topology.cpuCount - 1).toString()) !== undefined).assertTrue();
      expect(await findText(driver, BACK_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0004
     * @tc.name      testNdkQosPageDevice0004
     * @tc.desc      Checks binding the current thread narrows the affinity to a single core.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0004 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('affinity after bind = ' + JSON.stringify(topology.affinityCpus));
      expect(topology.affinityCount).assertEqual(1);
      expect(topology.affinityCpus[0]).assertEqual(topology.selectedCpu);
      expect(await findText(driver, 'Bind result') !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0005
     * @tc.name      testNdkQosPageDevice0005
     * @tc.desc      Checks resetting the affinity restores every core of the device.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0005 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await waitForText(driver, RESET_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('affinity after reset = ' + topology.affinityCount.toString());
      expect(topology.affinityCount).assertEqual(topology.cpuCount);
      expect(topology.affinityCpus.length).assertEqual(topology.cpuCount);
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0006
     * @tc.name      testNdkQosPageDevice0006
     * @tc.desc      Checks a freshly opened page shows the unset markers until the topology is refreshed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0006 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await openDevicePage(driver)).assertTrue();
      const markers: number = await countText(driver, SENTINEL_TEXT);
      logInfo('unset markers = ' + markers.toString());
      expect(markers >= SENTINEL_ROWS).assertTrue();
      expect(await findText(driver, EMPTY_AFFINITY_TEXT) !== undefined).assertTrue();
      expect(await findText(driver, 'Target CPU') !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0007
     * @tc.name      testNdkQosPageDevice0007
     * @tc.desc      Checks the back entry returns to the home page from the device page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0007 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_MARK, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, PAGE_MARK) === undefined).assertTrue();
      expect(await findText(driver, ENTRY_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0008
     * @tc.name      testNdkQosPageDevice0008
     * @tc.desc      Checks a bounded thread keeps its single-core affinity when the topology is refreshed again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0008 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      const bound: CpuTopology = testNapi.getCpuTopology();
      expect(bound.affinityCount).assertEqual(1);
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const after: CpuTopology = testNapi.getCpuTopology();
      logInfo('affinity after refresh = ' + after.affinityCount.toString());
      expect(after.affinityCount).assertEqual(1);
      expect(after.affinityCpus[0]).assertEqual(bound.affinityCpus[0]);
      logInfo('testNdkQosPageDevice0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0009
     * @tc.name      testNdkQosPageDevice0009
     * @tc.desc      Checks a refresh after the affinity reset reports every core as available again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0009 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, RESET_BUTTON)).assertTrue();
      expect(await waitForText(driver, RESET_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('affinity after reset and refresh = ' + topology.affinityCount.toString());
      expect(topology.affinityCount).assertEqual(topology.cpuCount);
      expect(topology.affinityCpus.length).assertEqual(topology.cpuCount);
      expect(await findText(driver, NOTE_TEXT) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0010
     * @tc.name      testNdkQosPageDevice0010
     * @tc.desc      Checks two refreshes report the same core count and the same default target core.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0010 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const first: CpuTopology = testNapi.getCpuTopology();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const second: CpuTopology = testNapi.getCpuTopology();
      logInfo('cpu count ' + first.cpuCount.toString() + ' -> ' + second.cpuCount.toString());
      expect(second.cpuCount).assertEqual(first.cpuCount);
      expect(second.selectedCpu).assertEqual(first.selectedCpu);
      let chips: number = 0;
      for (let cpu = 0; cpu < second.cpuCount; cpu++) {
        if (await findText(driver, cpu.toString()) !== undefined) {
          chips++;
        }
      }
      expect(chips).assertEqual(second.cpuCount);
      logInfo('testNdkQosPageDevice0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0011
     * @tc.name      testNdkQosPageDevice0011
     * @tc.desc      Checks the chosen target core is the one the thread is bound to.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0011 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      expect(topology.cpuCount).assertLarger(0);
      const target: number = topology.cpuCount > 1 ? topology.cpuCount - 1 : 0;
      expect(await clickButton(driver, target.toString())).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      const bound: CpuTopology = testNapi.getCpuTopology();
      logInfo('bound core = ' + bound.affinityCpus[0].toString() + ', target = ' + target.toString());
      expect(bound.affinityCount).assertEqual(1);
      expect(bound.affinityCpus[0]).assertEqual(target);
      logInfo('testNdkQosPageDevice0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0012
     * @tc.name      testNdkQosPageDevice0012
     * @tc.desc      Checks a chosen target core survives a topology refresh before the thread is bound.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0012 begin');
      const driver: Driver = await createDriver();
      expect(await openDevicePage(driver)).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      const topology: CpuTopology = testNapi.getCpuTopology();
      const target: number = topology.cpuCount > 1 ? 1 : 0;
      expect(await clickButton(driver, target.toString())).assertTrue();
      expect(await clickText(driver, REFRESH_BUTTON)).assertTrue();
      expect(await waitForText(driver, DONE_STATUS, WAIT_TIMEOUT)).assertTrue();
      expect(await clickText(driver, BIND_BUTTON)).assertTrue();
      expect(await waitForText(driver, BOUND_STATUS, WAIT_TIMEOUT)).assertTrue();
      const bound: CpuTopology = testNapi.getCpuTopology();
      logInfo('kept core = ' + bound.affinityCpus[0].toString() + ', target = ' + target.toString());
      expect(bound.affinityCount).assertEqual(1);
      expect(bound.affinityCpus[0]).assertEqual(target);
      expect(await findText(driver, 'Bind result') !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PAGE_DEVICE_0013
     * @tc.name      testNdkQosPageDevice0013
     * @tc.desc      Checks a reopened page offers no core choice and only the four fixed buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosPageDevice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosPageDevice0013 begin');
      const driver: Driver = await createDriver();
      expect(await reopenDevicePage(driver)).assertTrue();
      const markers: number = await countText(driver, SENTINEL_TEXT);
      logInfo('unset markers on reopen = ' + markers.toString());
      expect(markers).assertEqual(SENTINEL_ROWS);
      expect(await countButtons(driver)).assertEqual(FIXED_BUTTON_COUNT);
      expect(await findText(driver, EMPTY_AFFINITY_TEXT) !== undefined).assertTrue();
      expect(await findText(driver, IDLE_STATUS) !== undefined).assertTrue();
      logInfo('testNdkQosPageDevice0013 end');
    })
  })
}
