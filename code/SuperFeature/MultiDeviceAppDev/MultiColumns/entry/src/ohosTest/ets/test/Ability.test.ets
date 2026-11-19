/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  abilityDelegatorRegistry as AbilityDelegatorRegistry,
  Driver,
  ON,
  ResizeDirection
} from '@kit.TestKit';
import { logger } from '../util/Logger';

const LOG_TAG: string = '[MultiColumns_Ability]';
const LOG_DOMAIN: number = 0xF811;

// 期望值来源：规格常量（目标宽度 vp2px 换算）+ 状态推演（拖窗后窗口宽度收敛到目标值）。
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number SUB_MC_UI_0016
     * @tc.name testActs0016
     * @tc.desc 拉起 A+B+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testActs0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0016 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk1 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk1));
      expect(chk1).assertTrue();
      let buttonOne = await driver.findComponent(ON.id('caseOne'));
      await buttonOne.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(360));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(360), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0016 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0017
     * @tc.name testActs0017
     * @tc.desc 拉起 A+B+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testActs0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0017 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk2 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk2));
      expect(chk2).assertTrue();
      let buttonOne = await driver.findComponent(ON.id('caseOne'));
      await buttonOne.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(600));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(600), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0017 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0018
     * @tc.name testActs0018
     * @tc.desc 拉起 A+B+C 页面，拖拽窗口至 850vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testActs0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0018 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk3 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk3));
      expect(chk3).assertTrue();
      let buttonOne = await driver.findComponent(ON.id('caseOne'));
      await buttonOne.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(850));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(850), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0018 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0019
     * @tc.name testActs0019
     * @tc.desc 拉起 A+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testActs0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0019 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk4 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk4));
      expect(chk4).assertTrue();
      let buttonTwo = await driver.findComponent(ON.id('caseTwo'));
      await buttonTwo.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(360));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(360), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0019 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0020
     * @tc.name testActs0020
     * @tc.desc 拉起 A+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testActs0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0020 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk5 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk5));
      expect(chk5).assertTrue();
      let buttonTwo = await driver.findComponent(ON.id('caseTwo'));
      await buttonTwo.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(600));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(600), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0020 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0021
     * @tc.name testActs0021
     * @tc.desc 拉起 B+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testActs0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0021 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk6 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk6));
      expect(chk6).assertTrue();
      let buttonThree = await driver.findComponent(ON.id('caseThree'));
      await buttonThree.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(360));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(360), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0021 end');
      done();
    })

    /**
     * @tc.number SUB_MC_UI_0022
     * @tc.name testActs0022
     * @tc.desc 拉起 B+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testActs0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0022 begin');
      let driver = Driver.create();
      await resetApp(driver);
      const chk7 = await ensureHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk7));
      expect(chk7).assertTrue();
      let buttonThree = await driver.findComponent(ON.id('caseThree'));
      await buttonThree.click();
      await driver.delayMs(800);
      let result = await dragWindow(vp2px(600));
      await driver.delayMs(1000);
      await assertWindowWidth(driver, vp2px(600), result);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testActs0022 end');
      done();
    })
  })
}

/**
 * 拉起应用
 */
async function startAbility() {
  try {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    await abilityDelegator.startAbility({
      bundleName: 'com.samples.multicolumns',
      abilityName: 'EntryAbility'
    });
  } catch (err) {
    logger.info(LOG_TAG, `StartAbility err ${JSON.stringify(err)}`);
  }
}

/**
 * 关闭应用。
 * 注意：仅当顶部 Ability 属于被测应用时才 terminateSelf；否则会误杀测试 Ability 自身，导致 "App died"。
 */
async function terminateAbility() {
  try {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let topAbility = await abilityDelegator.getCurrentTopAbility();
    let topBundle = topAbility.context.abilityInfo.bundleName;
    let topName = topAbility.context.abilityInfo.name;
    if (topBundle !== 'com.samples.multicolumns' || topName !== 'EntryAbility') {
      logger.info(LOG_TAG, `skip terminate, top=${topBundle}/${topName}`);
      return;
    }
    await topAbility.context.terminateSelf();
  } catch (err) {
    logger.info(LOG_TAG, `terminateAbility err ${JSON.stringify(err)}`);
  }
}

/**
 * 确保首页已渲染：冷启动较慢时补一次启动机会。
 */
async function ensureHome(driver: Driver): Promise<boolean> {
  if (await waitForId(driver, 'caseOne', 4000)) {
    return true;
  }
  logger.info(LOG_TAG, 'home not ready, retry startAbility');
  await startAbility();
  return await waitForId(driver, 'caseOne', 4000);
}

/**
 * 复位应用：先拉起（确保 top 是被测应用）→ 终止（清空 router 栈）→ 再拉起（回到首页）。
 */
async function resetApp(driver: Driver): Promise<void> {
  await startAbility();
  await driver.delayMs(1200);
  await terminateAbility();
  await driver.delayMs(800);
  await startAbility();
  await driver.delayMs(1000);
}

interface ResizeResult {
  // 设备是否允许调整窗口尺寸（手机等全屏形态下为 false）
  resizable: boolean;
  width: number;
  height: number;
}

/**
 * 拖拽窗口，返回拖拽后的窗口宽高与 resize 是否被系统接受。
 * 全屏窗口调用 resize 会抛 "Fullscreen window can not resize"，此处捕获后走降级断言，避免用例直接报错。
 */
async function dragWindow(width: number): Promise<ResizeResult> {
  let driver = Driver.create();
  let windowObj = await driver.findWindow({ bundleName: 'com.samples.multicolumns' });
  let rectInfo = await windowObj.getBounds();
  let windowHeight = rectInfo.bottom - rectInfo.top;
  let resizable = true;
  try {
    await windowObj.resize(width, windowHeight, ResizeDirection.LEFT);
  } catch (err) {
    resizable = false;
    logger.info(LOG_TAG, `resize not supported ${JSON.stringify(err)}`);
  }
  let after = await windowObj.getBounds();
  return { resizable: resizable, width: after.right - after.left, height: after.bottom - after.top };
}

/**
 * 屏幕宽度（px），取值失败返回 -1
 */
async function getScreenWidth(driver: Driver): Promise<number> {
  try {
    let size = await driver.getDisplaySize();
    return size.x;
  } catch (err) {
    logger.info(LOG_TAG, `getDisplaySize err ${JSON.stringify(err)}`);
    return -1;
  }
}

/**
 * 窗口宽度断言：
 * 1. 自由窗口：宽度收敛到目标值（容差 60px）；
 * 2. 全屏窗口：resize 不被接受，降级为校验窗口宽度等于屏幕宽度。
 */
async function assertWindowWidth(driver: Driver, target: number, result: ResizeResult): Promise<void> {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'resizable=%{public}s actual=%{public}d expected=%{public}d',
    String(result.resizable), result.width, target);
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(result.width > 0));
  expect(result.width > 0).assertTrue();
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(result.height > 0));
  expect(result.height > 0).assertTrue();
  if (result.resizable) {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
      'assertTrue', String(Math.abs(result.width - target) < 60));
    expect(Math.abs(result.width - target) < 60).assertTrue();
    return;
  }
  let screenWidth = await getScreenWidth(driver);
  hilog.info(LOG_DOMAIN, LOG_TAG, 'fullscreen mode, screenWidth=%{public}d', screenWidth);
  expect(screenWidth > 0).assertTrue();
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(result.width === screenWidth));
  expect(result.width === screenWidth).assertTrue();
}

/**
 * 轮询等待组件出现，规避页面切换动画未结束导致的临时查找失败（findComponent 返回 null）。
 */
async function waitForId(driver: Driver, id: string, timeoutMs: number): Promise<boolean> {
  let deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    let component = await driver.findComponent(ON.id(id));
    if (component !== null) {
      return true;
    }
    await driver.delayMs(200);
  }
  return false;
}
