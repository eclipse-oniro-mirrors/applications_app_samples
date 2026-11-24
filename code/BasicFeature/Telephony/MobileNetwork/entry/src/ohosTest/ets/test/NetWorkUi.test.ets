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

// UI 套件：只用语义 id 定位（simOne/simTwo/mobileData/roaming/dataFlowType/connectState），
// 不写死坐标；页面为纯展示，无交互分支，用例验证存在性与文案规格。
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n } from '@kit.LocalizationKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_NetWorkUi]';
const BUNDLE: string = 'ohos.samples.mobilenetwork';
const ABILITY: string = 'MainAbility';
const HOME_ID: string = 'simOne';
const TURN_ON: string = 'Turn On';
const TURN_OFF: string = 'Turn Off';
const FLOW_TEXTS: string[] = [
  'No upstream or downstream data',
  'Only downlink data',
  'Only upstream data',
  'There is upstream and downstream data',
  'There is no uplink and downlink data, and the underlying link is in a dormant state'
];
const STATE_TEXTS: string[] = [
  'Cellular data link unknown',
  'Cellular data link down',
  'Connecting to cellular data link',
  'Cellular data link connected',
  'Cellular data link is suspended'
];
const ZH_SIM_ONE: string = '卡1';
const ZH_SIM_TWO: string = '卡2';
const ZH_TURN_ON: string = '开启';
const ZH_TURN_OFF: string = '关闭';
const ZH_FLOW_TEXTS: string[] = [
  '没有上行或下行数据',
  '只有下行数据',
  '只有上行数据',
  '有上下行数据',
  '没有上下行数据，底层链路处于休眠状态'
];
const ZH_STATE_TEXTS: string[] = [
  '蜂窝数据链路未知',
  '蜂窝数据链路断开',
  '正在连接蜂窝数据链路',
  '蜂窝数据链路已连接',
  '蜂窝数据链路被挂起'
];

// 设备语言决定首页文案语言：中文设备显示 zh 文案，其余按英文规格文案断言。
function isZhLocale(): boolean {
  return i18n.System.getSystemLanguage().startsWith('zh');
}

function log(message: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

async function existsById(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function existsByText(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (await existsById(driver, id)) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function findById(driver: Driver, id: string): Promise<Component | null> {
  if (!await waitForId(driver, id, 10)) {
    return null;
  }
  return await driver.findComponent(ON.id(id));
}

async function textOf(driver: Driver, id: string): Promise<string> {
  const component: Component | null = await findById(driver, id);
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function unlockIfNeeded(driver: Driver): Promise<void> {
  if (await existsByText(driver, 'Swipe up to unlock') || await existsByText(driver, '向上滑动解锁')) {
    await driver.swipe(360, 1100, 360, 300, 600);
    await delay(1000);
    log('unlocked lock screen');
  }
}

async function dismissDialogs(driver: Driver): Promise<void> {
  const texts: string[] = ['Allow', 'Allow all', 'Always allow', 'While using the app', 'Only this time',
    '允许', '始终允许'];
  for (let round: number = 0; round < 3; round++) {
    let clicked: boolean = false;
    for (let i: number = 0; i < texts.length; i++) {
      if (await existsByText(driver, texts[i])) {
        const button: Component = await driver.findComponent(ON.text(texts[i]));
        if (button) {
          await button.click();
          await delay(400);
          clicked = true;
          break;
        }
      }
    }
    if (!clicked) {
      return;
    }
  }
}

// 单页样例：回到首页 = 首页标记控件可见。
async function ensureHome(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 4; i++) {
    if (await existsById(driver, HOME_ID)) {
      return true;
    }
    await delay(600);
  }
  return await existsById(driver, HOME_ID);
}

async function launchApp(driver: Driver): Promise<boolean> {
  await unlockIfNeeded(driver);
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  for (let i: number = 0; i < 5; i++) {
    const want: Want = { bundleName: BUNDLE, abilityName: ABILITY };
    await delegator.startAbility(want);
    await delay(1500);
    await dismissDialogs(driver);
    if (await waitForId(driver, HOME_ID, 4)) {
      return true;
    }
    log(`launchApp retry ${i}`);
  }
  return false;
}

// 一条断言一处求值：先 log actual/expected 再 assert，失败时日志可直接定位。
function checkEqual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
  expect(actual).assertEqual(expected);
}

function checkTrue(value: boolean): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value));
  expect(value).assertTrue();
}

export default function networkUiTest() {
  describe('NetWorkUiTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      checkTrue(await launchApp(driver));
    });

    afterEach(async () => {
      checkTrue(await ensureHome(driver));
    });

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1001
     * @tc.name testUi1001
     * @tc.desc 首屏数据卡与开关区域四个关键控件存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1001 begin');
      const simOneExists: boolean = await existsById(driver, 'simOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simOne actual=%{public}s expected=true', String(simOneExists));
      expect(simOneExists).assertTrue();
      const simTwoExists: boolean = await existsById(driver, 'simTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simTwo actual=%{public}s expected=true', String(simTwoExists));
      expect(simTwoExists).assertTrue();
      const mobileDataExists: boolean = await existsById(driver, 'mobileData');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mobileData actual=%{public}s expected=true', String(mobileDataExists));
      expect(mobileDataExists).assertTrue();
      const roamingExists: boolean = await existsById(driver, 'roaming');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'roaming actual=%{public}s expected=true', String(roamingExists));
      expect(roamingExists).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1001 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1002
     * @tc.name testUi1002
     * @tc.desc 状态区域控件存在且开关文案落在规格集合 Turn On/Turn Off 内
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1002 begin');
      const turnOn: string = isZhLocale() ? ZH_TURN_ON : TURN_ON;
      const turnOff: string = isZhLocale() ? ZH_TURN_OFF : TURN_OFF;
      const flowExists: boolean = await existsById(driver, 'dataFlowType');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'dataFlowType actual=%{public}s expected=true', String(flowExists));
      expect(flowExists).assertTrue();
      const stateExists: boolean = await existsById(driver, 'connectState');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'connectState actual=%{public}s expected=true', String(stateExists));
      expect(stateExists).assertTrue();
      const mobileText: string = await textOf(driver, 'mobileData');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mobileData text actual=%{public}s expected=%{public}s|%{public}s',
        mobileText, turnOn, turnOff);
      expect(mobileText === turnOn || mobileText === turnOff).assertTrue();
      const roamText: string = await textOf(driver, 'roaming');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'roaming text actual=%{public}s expected=%{public}s|%{public}s',
        roamText, turnOn, turnOff);
      expect(roamText === turnOn || roamText === turnOff).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1002 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1003
     * @tc.name testUi1003
     * @tc.desc 数据卡文案符合规格且流量/连接态文案非空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1003 begin');
      const expSimOne: string = isZhLocale() ? ZH_SIM_ONE : 'Sim One';
      const expSimTwo: string = isZhLocale() ? ZH_SIM_TWO : 'Sim Two';
      const simOneText: string = await textOf(driver, 'simOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simOne actual=%{public}s expected=%{public}s', simOneText, expSimOne);
      expect(simOneText).assertEqual(expSimOne);
      const simTwoText: string = await textOf(driver, 'simTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simTwo actual=%{public}s expected=%{public}s', simTwoText, expSimTwo);
      expect(simTwoText).assertEqual(expSimTwo);
      const flowText: string = await textOf(driver, 'dataFlowType');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'dataFlowType actual=%{public}s expected=non-empty', flowText);
      expect(flowText.length > 0).assertTrue();
      const stateText: string = await textOf(driver, 'connectState');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'connectState actual=%{public}s expected=non-empty', stateText);
      expect(stateText.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1003 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1004
     * @tc.name testUi1004
     * @tc.desc 流量与连接态文案各自落在五档规格文案集合内
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1004 begin');
      const flowSet: string[] = isZhLocale() ? ZH_FLOW_TEXTS : FLOW_TEXTS;
      const stateSet: string[] = isZhLocale() ? ZH_STATE_TEXTS : STATE_TEXTS;
      const flowText: string = await textOf(driver, 'dataFlowType');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'dataFlowType actual=%{public}s expected=one of five spec texts', flowText);
      expect(flowSet.includes(flowText)).assertTrue();
      const stateText: string = await textOf(driver, 'connectState');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'connectState actual=%{public}s expected=one of five spec texts', stateText);
      expect(stateSet.includes(stateText)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'both texts actual=%{public}s,%{public}s expected=non-empty',
        flowText, stateText);
      expect(flowText.length > 0 && stateText.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1004 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1005
     * @tc.name testUi1005
     * @tc.desc 状态稳定：首页标记两次读取一致且副卡控件存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1005 begin');
      const homeOk: boolean = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'home marker actual=%{public}s expected=true', String(homeOk));
      expect(homeOk).assertTrue();
      const first: string = await textOf(driver, 'simOne');
      const second: string = await textOf(driver, 'simOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simOne first=%{public}s second=%{public}s expected=equal', first, second);
      expect(first).assertEqual(second);
      const simTwoExists: boolean = await existsById(driver, 'simTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simTwo actual=%{public}s expected=true', String(simTwoExists));
      expect(simTwoExists).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1005 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1006
     * @tc.name testUi1006
     * @tc.desc 状态稳定：流量与连接态文案重复读取一致
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1006 begin');
      const flowFirst: string = await textOf(driver, 'dataFlowType');
      const flowSecond: string = await textOf(driver, 'dataFlowType');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'flow first=%{public}s second=%{public}s expected=equal', flowFirst, flowSecond);
      expect(flowFirst).assertEqual(flowSecond);
      const stateFirst: string = await textOf(driver, 'connectState');
      const stateSecond: string = await textOf(driver, 'connectState');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'state first=%{public}s second=%{public}s expected=equal',
        stateFirst, stateSecond);
      expect(stateFirst).assertEqual(stateSecond);
      const simOneExists: boolean = await existsById(driver, 'simOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simOne actual=%{public}s expected=true', String(simOneExists));
      expect(simOneExists).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1006 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_UI_1007
     * @tc.name testUi1007
     * @tc.desc 首屏即完整主页：六个语义控件全部可见
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1007 begin');
      const homeOk: boolean = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'home marker actual=%{public}s expected=true', String(homeOk));
      expect(homeOk).assertTrue();
      const simOneExists: boolean = await existsById(driver, 'simOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simOne actual=%{public}s expected=true', String(simOneExists));
      expect(simOneExists).assertTrue();
      const simTwoExists: boolean = await existsById(driver, 'simTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'simTwo actual=%{public}s expected=true', String(simTwoExists));
      expect(simTwoExists).assertTrue();
      const mobileDataExists: boolean = await existsById(driver, 'mobileData');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mobileData actual=%{public}s expected=true', String(mobileDataExists));
      expect(mobileDataExists).assertTrue();
      const roamingExists: boolean = await existsById(driver, 'roaming');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'roaming actual=%{public}s expected=true', String(roamingExists));
      expect(roamingExists).assertTrue();
      const flowExists: boolean = await existsById(driver, 'dataFlowType');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'dataFlowType actual=%{public}s expected=true', String(flowExists));
      expect(flowExists).assertTrue();
      const stateExists: boolean = await existsById(driver, 'connectState');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'connectState actual=%{public}s expected=true', String(stateExists));
      expect(stateExists).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi1007 end');
    })
  })
}
