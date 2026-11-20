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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  clickText as clickTextUtil,
  countText as countTextUtil,
  ensureIndex as ensureIndexUtil,
  findText as findTextUtil,
  findType,
  launchAbility as launchAbilityUtil,
  prepareDevice as prepareDeviceUtil,
  pressHome as pressHomeUtil,
  scrollListToTop,
  waitForText as waitForTextUtil
} from './UiDriverUtil';

const TAG: string = '[Sample_NdkRenderNodeAbilityTest]';
const DOMAIN: number = 0xF811;
// 首页为能力导航列表，标题取自 app.string.index_title。
const INDEX_TITLE: string = 'RenderNode Drawing';
const BACK_BUTTON: string = 'Back';
// 首页第一个入口与进入后出现的绘制按钮，用于区分“仍在首页”和“已进入演示页”。
const FIRST_DEMO_TITLE: string = 'Canvas Drawing';
const DRAW_PATH_BUTTON: string = 'Draw Path';
const SECOND_DEMO_TITLE: string = 'Primitives';
const DEMO_TITLES: string[] = [
  'Canvas Drawing',
  'Primitives',
  'Drawing Effects',
  'Canvas Transform',
  'Image Drawing',
  'Text Drawing',
  'Node Tree',
  'Render Properties',
  'Blur Effects',
  'Lifecycle',
  'Capability Matrix',
  'RenderNode Topics'
];
const DEMO_TOTAL: number = 12;
const UI_SETTLE_TIME: number = 1000;
const WAIT_TIMEOUT: number = 15000;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// driver.delayMs 声明了可能抛出的异常，统一封装避免遗漏异常处理。
async function delay(driver: Driver, duration: number): Promise<void> {
  try {
    await driver.delayMs(duration);
  } catch (error) {
    logInfo('delayMs failed: ' + JSON.stringify(error));
  }
}

async function launchAbility(): Promise<boolean> {
  return await launchAbilityUtil(TAG);
}

async function findText(driver: Driver, text: string): Promise<Component | undefined> {
  return await findTextUtil(driver, text, TAG);
}

async function waitForText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  return await waitForTextUtil(driver, text, TAG, timeout);
}

async function countText(driver: Driver, text: string): Promise<number> {
  return await countTextUtil(driver, text, TAG);
}

async function clickText(driver: Driver, text: string): Promise<boolean> {
  return await clickTextUtil(driver, text, TAG);
}

async function ensureIndex(driver: Driver): Promise<boolean> {
  return await ensureIndexUtil(driver, TAG);
}

async function prepareDevice(driver: Driver): Promise<void> {
  return await prepareDeviceUtil(driver, TAG);
}

async function pressHome(driver: Driver): Promise<boolean> {
  return await pressHomeUtil(driver, TAG);
}

// 收集当前屏可见的入口标题，已收集过的跳过。
async function collectVisibleEntries(driver: Driver, found: string[]): Promise<void> {
  for (const title of DEMO_TITLES) {
    if (found.indexOf(title) >= 0) {
      continue;
    }
    if (await findText(driver, title) !== undefined) {
      found.push(title);
    }
  }
}

export default function ndkRenderNodeAbilityTest(): void {
  describe('NdkRenderNodeAbility', () => {
    // 像素层先跑，测试页可能已不在前台；这里先唤醒屏幕并把应用收敛回首页，
    // 让后续入口断言与返回键路径都有确定的起点。
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await prepareDevice(driver);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0001
     * @tc.name      testNdkRenderNodeAbility0001
     * @tc.desc      校验示例应用启动成功，首页标题与第一个能力入口可见。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeAbility0001 begin');
      const driver: Driver = Driver.create();
      expect(await launchAbility()).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, FIRST_DEMO_TITLE) !== undefined).assertTrue();
      logInfo('testNdkRenderNodeAbility0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0002
     * @tc.name      testNdkRenderNodeAbility0002
     * @tc.desc      校验首页完整列出十二项能力入口，名称与实现页面一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeAbility0002 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      expect(DEMO_TITLES.length).assertEqual(DEMO_TOTAL);
      const found: string[] = [];
      await collectVisibleEntries(driver, found);
      // 列表一屏放不下十二项，滚动到底部后再收集一次，两次结果合并才是完整入口集合。
      const list: Component | undefined = await findType(driver, 'List', TAG);
      if (list !== undefined) {
        await list.scrollToBottom();
        await delay(driver, UI_SETTLE_TIME);
      }
      await collectVisibleEntries(driver, found);
      logInfo('visible demo count = ' + found.length.toString());
      expect(found.length).assertEqual(DEMO_TOTAL);
      // 恢复列表位置，避免后续用例找不到前几项入口。
      await scrollListToTop(driver, TAG);
      logInfo('testNdkRenderNodeAbility0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0003
     * @tc.name      testNdkRenderNodeAbility0003
     * @tc.desc      校验点击第一个入口进入绘制演示页，页内出现 Draw Path 按钮与返回按钮。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeAbility0003 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      expect(await clickText(driver, FIRST_DEMO_TITLE)).assertTrue();
      expect(await waitForText(driver, DRAW_PATH_BUTTON, WAIT_TIMEOUT)).assertTrue();
      expect(await findText(driver, BACK_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkRenderNodeAbility0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0004
     * @tc.name      testNdkRenderNodeAbility0004
     * @tc.desc      校验演示页返回后回到首页，首页十二项入口完整保留。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeAbility0004 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      if (await findText(driver, DRAW_PATH_BUTTON) === undefined) {
        expect(await clickText(driver, FIRST_DEMO_TITLE)).assertTrue();
        expect(await waitForText(driver, DRAW_PATH_BUTTON, WAIT_TIMEOUT)).assertTrue();
      }
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
      // 最后一项入口在列表下半部分，滚到底部再确认它仍然存在。
      const list: Component | undefined = await findType(driver, 'List', TAG);
      if (list !== undefined) {
        await list.scrollToBottom();
        await delay(driver, UI_SETTLE_TIME);
      }
      expect(await findText(driver, DEMO_TITLES[DEMO_TOTAL - 1]) !== undefined).assertTrue();
      await scrollListToTop(driver, TAG);
      logInfo('testNdkRenderNodeAbility0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0005
     * @tc.name      testNdkRenderNodeAbility0005
     * @tc.desc      校验第二个入口可独立进入图元演示页，返回按钮可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeAbility0005 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      expect(await clickText(driver, SECOND_DEMO_TITLE)).assertTrue();
      expect(await waitForText(driver, BACK_BUTTON, WAIT_TIMEOUT)).assertTrue();
      expect(await countText(driver, SECOND_DEMO_TITLE) >= 1).assertTrue();
      expect(await clickText(driver, BACK_BUTTON)).assertTrue();
      expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
      logInfo('testNdkRenderNodeAbility0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0006
     * @tc.name      testNdkRenderNodeAbility0006
     * @tc.desc      校验重复启动 EntryAbility 后首页仍然只有一个，入口总数保持为十项。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeAbility0006 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      expect(await launchAbility()).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
      expect(await countText(driver, INDEX_TITLE)).assertEqual(1);
      expect(await countText(driver, FIRST_DEMO_TITLE)).assertEqual(1);
      logInfo('testNdkRenderNodeAbility0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0007
     * @tc.name      testNdkRenderNodeAbility0007
     * @tc.desc      校验应用切到后台后重新拉起，首页标题唯一，首末两个入口均可恢复。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeAbility0007 begin');
      const driver: Driver = Driver.create();
      expect(await ensureIndex(driver)).assertTrue();
      expect(await pressHome(driver)).assertTrue();
      expect(await launchAbility()).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
      expect(await countText(driver, INDEX_TITLE)).assertEqual(1);
      expect(await findText(driver, FIRST_DEMO_TITLE) !== undefined).assertTrue();
      // 末项入口在列表下半部分，滚到底部确认它仍然在，再滚回顶部供后续用例使用。
      const list: Component | undefined = await findType(driver, 'List', TAG);
      if (list !== undefined) {
        await list.scrollToBottom();
        await delay(driver, UI_SETTLE_TIME);
      }
      expect(await findText(driver, DEMO_TITLES[DEMO_TOTAL - 1]) !== undefined).assertTrue();
      await scrollListToTop(driver, TAG);
      logInfo('testNdkRenderNodeAbility0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_ABILITY_0008
     * @tc.name      testNdkRenderNodeAbility0008
     * @tc.desc      校验连续两轮"切后台再拉起"后首页始终唯一，标题与第一个入口不叠加。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeAbility0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeAbility0008 begin');
      const driver: Driver = Driver.create();
      for (let round: number = 0; round < 2; round++) {
        expect(await ensureIndex(driver)).assertTrue();
        expect(await pressHome(driver)).assertTrue();
        expect(await launchAbility()).assertTrue();
        await delay(driver, UI_SETTLE_TIME);
        expect(await waitForText(driver, INDEX_TITLE, WAIT_TIMEOUT)).assertTrue();
        expect(await countText(driver, INDEX_TITLE)).assertEqual(1);
        expect(await countText(driver, FIRST_DEMO_TITLE)).assertEqual(1);
        logInfo('restore round ' + round.toString() + ' ok');
      }
      logInfo('testNdkRenderNodeAbility0008 end');
    })
  })
}
