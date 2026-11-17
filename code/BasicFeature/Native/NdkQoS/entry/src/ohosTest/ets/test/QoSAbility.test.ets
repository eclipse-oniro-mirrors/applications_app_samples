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
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_NdkQosAbilityTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const TITLE: string = 'QoS Sample';
const HIGH_BUTTON: string = 'High level QoS test';
const LOW_BUTTON: string = 'Low level QoS test';
const BENCH_ENTRY: string = 'Level benchmark';
const BENCH_MARK: string = 'Rounds per level';
const LEVEL_ENTRY: string = 'QoS level settings';
const LEVEL_MARK: string = 'Select a QoS level';
const HISTORY_ENTRY: string = 'Run records';
const HISTORY_MARK: string = 'QoS level to run';
const INDEX_BUTTONS: number = 7;
const INDEX_PROBE_TIMEOUT: number = 4000;
const BACK_ATTEMPTS: number = 3;
const BACK_TEXTS: string[] = ['Back', '返回'];
// 五个页面入口同时登记中英文标签，两种语言下都能计数
const ENTRY_PAIRS: string[][] = [
  ['QoS level settings', 'QoS 等级设置'],
  ['Level benchmark', '等级基准测试'],
  ['Concurrent stress test', '并发压测'],
  ['CPU topology and affinity', 'CPU 拓扑与亲和性'],
  ['Run records', '实验记录']
];
const WAIT_TIMEOUT: number = 15000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 首页文案随系统语言切换，英文与中文标签都要能识别
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['QoS Sample', 'QoS 示例'],
  ['High level QoS test', '高等级 QoS 测试'],
  ['Low level QoS test', '低等级 QoS 测试'],
  ['Level benchmark', '等级基准测试'],
  ['Rounds per level', '每等级轮次'],
  ['QoS level settings', 'QoS 等级设置'],
  ['Select a QoS level', '选择 QoS 等级'],
  ['Run records', '实验记录'],
  ['QoS level to run', '实验使用的 QoS 等级'],
  ['Back', '返回']
]);

function zhOf(text: string): string {
  const value: string | undefined = ZH_TEXTS.get(text);
  return value === undefined ? text : value;
}

function matchedText(actual: string, english: string): boolean {
  return actual === english || actual === zhOf(english);
}

const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function launchAbility(): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    return true;
  } catch (error) {
    logInfo('startAbility failed: ' + JSON.stringify(error));
    return false;
  }
}

async function tryFindText(driver: Driver, text: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.text(text));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo('findText failed: ' + text + ' -> ' + JSON.stringify(error));
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
    logInfo('waitForText failed: ' + text + ' -> ' + JSON.stringify(error));
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

async function ensurePage(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, HIGH_BUTTON, WAIT_TIMEOUT)) {
    return true;
  }
  if (!await launchAbility()) {
    return false;
  }
  await driver.delayMs(1000);
  return await waitForText(driver, HIGH_BUTTON, WAIT_TIMEOUT);
}

async function countButtons(driver: Driver): Promise<number> {
  try {
    const buttons: Component[] = await driver.findComponents(ON.type('Button'));
    return buttons.length;
  } catch (error) {
    logInfo('countButtons failed -> ' + JSON.stringify(error));
    return -1;
  }
}

async function countText(driver: Driver, text: string): Promise<number> {
  try {
    const components: Component[] | null = await driver.findComponents(ON.text(text));
    return components === null ? 0 : components.length;
  } catch (error) {
    logInfo('countText failed: ' + text);
    return -1;
  }
}

// 当前语言只会显示其中一种写法，两者相加不会重复计数
async function countLocalized(driver: Driver, text: string): Promise<number> {
  const english: number = await countText(driver, text);
  const localized: string = zhOf(text);
  if (localized === text) {
    return english;
  }
  return english + await countText(driver, localized);
}

async function clickText(driver: Driver, text: string): Promise<boolean> {
  const component: Component | undefined = await findText(driver, text);
  if (component === undefined) {
    logInfo('clickText missed: ' + text);
    return false;
  }
  await component.click();
  await driver.delayMs(800);
  return true;
}

// 上一条用例可能停在子页，先回退再兜底重启
async function goHome(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, HIGH_BUTTON, INDEX_PROBE_TIMEOUT)) {
    return true;
  }
  for (let attempt = 0; attempt < BACK_ATTEMPTS; attempt++) {
    let back: Component | undefined = undefined;
    for (let index = 0; index < BACK_TEXTS.length; index++) {
      back = await findText(driver, BACK_TEXTS[index]);
      if (back !== undefined) {
        break;
      }
    }
    if (back === undefined) {
      break;
    }
    await back.click();
    await driver.delayMs(1000);
    if (await waitForText(driver, HIGH_BUTTON, INDEX_PROBE_TIMEOUT)) {
      return true;
    }
  }
  return await ensurePage(driver);
}

async function openChildPage(driver: Driver, entryText: string, pageMark: string): Promise<boolean> {
  if (await waitForText(driver, pageMark, INDEX_PROBE_TIMEOUT)) {
    return true;
  }
  if (!await goHome(driver)) {
    return false;
  }
  if (!await clickText(driver, entryText)) {
    return false;
  }
  return await waitForText(driver, pageMark, WAIT_TIMEOUT);
}

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_ABILITY_0001
     * @tc.name      testNdkQosAbility0001
     * @tc.desc      Checks the QoS sample ability starts and shows both QoS buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      logInfo('testNdkQosAbility0001 begin');
      const driver: Driver = Driver.create();
      expect(await launchAbility()).assertTrue();
      expect(await waitForText(driver, TITLE, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, HIGH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosAbility0001 end');
      done();
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0002
     * @tc.name      testNdkQosAbility0002
     * @tc.desc      Checks the page title text and that only one title is rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0002 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const title: Component | undefined = await findText(driver, TITLE);
      expect(title !== undefined).assertTrue();
      if (title === undefined) {
        return;
      }
      const titleText: string = await title.getText();
      expect(matchedText(titleText, TITLE)).assertTrue();
      expect(await countLocalized(driver, TITLE)).assertEqual(1);
      logInfo('testNdkQosAbility0002 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0003
     * @tc.name      testNdkQosAbility0003
     * @tc.desc      Checks the page renders the two QoS buttons and the five page entries.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0003 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const buttonCount: number = await countButtons(driver);
      logInfo('button count = ' + buttonCount.toString());
      expect(buttonCount).assertEqual(7);
      expect(await findText(driver, HIGH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosAbility0003 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0004
     * @tc.name      testNdkQosAbility0004
     * @tc.desc      Checks both buttons expose their own label.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0004 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const highButton: Component | undefined = await findText(driver, HIGH_BUTTON);
      const lowButton: Component | undefined = await findText(driver, LOW_BUTTON);
      expect(highButton !== undefined).assertTrue();
      expect(lowButton !== undefined).assertTrue();
      if (highButton === undefined || lowButton === undefined) {
        return;
      }
      const highText: string = await highButton.getText();
      const lowText: string = await lowButton.getText();
      expect(matchedText(highText, HIGH_BUTTON)).assertTrue();
      expect(matchedText(lowText, LOW_BUTTON)).assertTrue();
      logInfo('testNdkQosAbility0004 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0005
     * @tc.name      testNdkQosAbility0005
     * @tc.desc      Checks the high QoS button is placed above the low QoS button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0005 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const highButton: Component | undefined = await findText(driver, HIGH_BUTTON);
      const lowButton: Component | undefined = await findText(driver, LOW_BUTTON);
      expect(highButton !== undefined).assertTrue();
      expect(lowButton !== undefined).assertTrue();
      if (highButton === undefined || lowButton === undefined) {
        return;
      }
      const highBounds: Rect = await highButton.getBounds();
      const lowBounds: Rect = await lowButton.getBounds();
      logInfo('high button top = ' + highBounds.top.toString() + ', low button top = ' + lowBounds.top.toString());
      expect(highBounds.top < lowBounds.top).assertTrue();
      expect(highBounds.right - highBounds.left > 0).assertTrue();
      expect(lowBounds.bottom - lowBounds.top > 0).assertTrue();
      logInfo('testNdkQosAbility0005 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0006
     * @tc.name      testNdkQosAbility0006
     * @tc.desc      Checks the page stays usable after the ability is started twice.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0006 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      expect(await launchAbility()).assertTrue();
      expect(await waitForText(driver, HIGH_BUTTON, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      expect(await countLocalized(driver, TITLE)).assertEqual(1);
      logInfo('testNdkQosAbility0006 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0007
     * @tc.name      testNdkQosAbility0007
     * @tc.desc      Checks the page back entry returns from a child page to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0007 begin');
      const driver: Driver = Driver.create();
      expect(await openChildPage(driver, BENCH_ENTRY, BENCH_MARK)).assertTrue();
      // The system back key tears down the UiTest session, so leave the child page with its own back entry.
      expect(await clickText(driver, BACK_TEXTS[0])).assertTrue();
      expect(await waitForText(driver, HIGH_BUTTON, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, BENCH_MARK) === undefined).assertTrue();
      expect(await countButtons(driver)).assertEqual(INDEX_BUTTONS);
      logInfo('testNdkQosAbility0007 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0008
     * @tc.name      testNdkQosAbility0008
     * @tc.desc      Checks every page entry label appears once on the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0008 begin');
      const driver: Driver = Driver.create();
      expect(await goHome(driver)).assertTrue();
      for (let index = 0; index < ENTRY_PAIRS.length; index++) {
        const count: number = await countText(driver, ENTRY_PAIRS[index][0]) +
          await countText(driver, ENTRY_PAIRS[index][1]);
        logInfo('entry ' + ENTRY_PAIRS[index][0] + ' count = ' + count.toString());
        expect(count).assertEqual(1);
      }
      expect(await countLocalized(driver, HIGH_BUTTON)).assertEqual(1);
      expect(await countLocalized(driver, LOW_BUTTON)).assertEqual(1);
      logInfo('testNdkQosAbility0008 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0009
     * @tc.name      testNdkQosAbility0009
     * @tc.desc      Checks the level page can be entered again after leaving it with its back entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0009 begin');
      const driver: Driver = Driver.create();
      expect(await openChildPage(driver, LEVEL_ENTRY, LEVEL_MARK)).assertTrue();
      expect(await findText(driver, LEVEL_MARK) !== undefined).assertTrue();
      expect(await goHome(driver)).assertTrue();
      expect(await findText(driver, LEVEL_MARK) === undefined).assertTrue();
      expect(await openChildPage(driver, LEVEL_ENTRY, LEVEL_MARK)).assertTrue();
      expect(await countButtons(driver)).assertLarger(0);
      expect(await goHome(driver)).assertTrue();
      logInfo('testNdkQosAbility0009 end');
    })

    /**
     * @tc.number    SUB_QOS_ABILITY_0010
     * @tc.name      testNdkQosAbility0010
     * @tc.desc      Checks the home page stays usable after visiting two different child pages.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosAbility0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosAbility0010 begin');
      const driver: Driver = Driver.create();
      expect(await openChildPage(driver, BENCH_ENTRY, BENCH_MARK)).assertTrue();
      expect(await goHome(driver)).assertTrue();
      expect(await openChildPage(driver, HISTORY_ENTRY, HISTORY_MARK)).assertTrue();
      expect(await goHome(driver)).assertTrue();
      expect(await countButtons(driver)).assertEqual(INDEX_BUTTONS);
      expect(await findText(driver, HIGH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      expect(await countLocalized(driver, TITLE)).assertEqual(1);
      logInfo('testNdkQosAbility0010 end');
    })
  })
}
