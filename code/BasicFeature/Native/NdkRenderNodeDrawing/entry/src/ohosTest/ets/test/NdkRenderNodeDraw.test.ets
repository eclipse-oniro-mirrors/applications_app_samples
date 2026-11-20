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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  clickText as clickTextUtil,
  countText as countTextUtil,
  enterPage as enterPageUtil,
  ensureIndex as ensureIndexUtil,
  findText as findTextUtil,
  launchAbility as launchAbilityUtil
} from './UiDriverUtil';

const TAG: string = '[Sample_NdkRenderNodeDrawTest]';
const DOMAIN: number = 0xF811;
const DEMO_ENTRY: string = 'Canvas Drawing';
const PATH_BUTTON: string = 'Draw Path';
const TEXT_BUTTON: string = 'Draw Text';
const IMAGE_BUTTON: string = 'Draw Image';
const UI_SETTLE_TIME: number = 1000;

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

async function countText(driver: Driver, text: string): Promise<number> {
  return await countTextUtil(driver, text, TAG);
}

async function clickButton(driver: Driver, text: string): Promise<boolean> {
  return await clickTextUtil(driver, text, TAG);
}

/**
 * 绘制相关用例需要先通过首页导航进入绘制演示页。
 */
async function ensureDrawPage(driver: Driver): Promise<boolean> {
  if (await findText(driver, PATH_BUTTON) !== undefined) {
    return true;
  }
  return await enterPageUtil(driver, DEMO_ENTRY, PATH_BUTTON, TAG);
}

/**
 * 绘制后页面仍需保持可用：三个绘制按钮都在，且没有产生重复页面。
 */
async function isPageAlive(driver: Driver): Promise<boolean> {
  const buttonCount: number = await countText(driver, PATH_BUTTON);
  logInfo('Draw Path component count = ' + buttonCount.toString());
  if (buttonCount !== 1) {
    return false;
  }
  if (await findText(driver, TEXT_BUTTON) === undefined) {
    return false;
  }
  if (await findText(driver, IMAGE_BUTTON) === undefined) {
    return false;
  }
  return true;
}

export default function ndkRenderNodeDrawTest(): void {
  describe('NdkRenderNodeDraw', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0001
     * @tc.name      testNdkRenderNodeDraw0001
     * @tc.desc      校验点击 Draw Path 按钮后页面保持可用，按钮行没有被绘制操作破坏。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDraw0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeDraw0001 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0002
     * @tc.name      testNdkRenderNodeDraw0002
     * @tc.desc      校验点击 Draw Text 按钮后页面保持可用，按钮行没有被绘制操作破坏。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDraw0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeDraw0002 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, TEXT_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0003
     * @tc.name      testNdkRenderNodeDraw0003
     * @tc.desc      校验点击 Draw Image 按钮后页面保持可用，图片绘制失败不会导致页面异常。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDraw0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeDraw0003 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, IMAGE_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0004
     * @tc.name      testNdkRenderNodeDraw0004
     * @tc.desc      校验依次点击路径、文本、图片三个按钮，每一步绘制后页面都保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDraw0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeDraw0004 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      expect(await clickButton(driver, TEXT_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      expect(await clickButton(driver, IMAGE_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0005
     * @tc.name      testNdkRenderNodeDraw0005
     * @tc.desc      校验连续两次点击 Draw Path 按钮，重复绘制后页面保持可用且不产生重复页面。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDraw0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeDraw0005 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0006
     * @tc.name      testNdkRenderNodeDraw0006
     * @tc.desc      校验绘制类型在图片与路径之间来回切换，多次切换后页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDraw0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeDraw0006 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await clickButton(driver, IMAGE_BUTTON)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await clickButton(driver, IMAGE_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      logInfo('testNdkRenderNodeDraw0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DRAW_0007
     * @tc.name      testNdkRenderNodeDraw0007
     * @tc.desc      校验重新启动应用后再次进入绘制页并点击 Draw Path 按钮，绘制功能仍然可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDraw0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeDraw0007 begin');
      const driver: Driver = Driver.create();
      expect(await ensureDrawPage(driver)).assertTrue();
      expect(await launchAbility()).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      // 重新拉起后应用会恢复到离开时的页面，先逐级回到首页再重新进入绘制页。
      expect(await ensureIndexUtil(driver, TAG)).assertTrue();
      expect(await enterPageUtil(driver, DEMO_ENTRY, PATH_BUTTON, TAG)).assertTrue();
      expect(await clickButton(driver, PATH_BUTTON)).assertTrue();
      expect(await isPageAlive(driver)).assertTrue();
      expect(await countText(driver, PATH_BUTTON)).assertEqual(1);
      logInfo('testNdkRenderNodeDraw0007 end');
    })
  })
}
