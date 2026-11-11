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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';

const BUNDLE_NAME = 'com.samples.atomicservicecomponents';
const ABILITY_NAME = 'EntryAbility';
const CATALOG_TITLE = '组件目录（9）';
const JUMP_TITLE = '应用间跳转';
const SHEET_TITLE = '半模态面板';
const PREFS_TITLE = '首选项存储';
const SWIPE_X = 360;
const SWIPE_TOP_Y = 520;
const SWIPE_BOTTOM_Y = 1040;

async function revealText(driver: Driver, texts: string[], maxSwipes: number): Promise<Component | null> {
  const findAny = async (): Promise<Component | null> => {
    for (const text of texts) {
      const found: Component | null = await driver.findComponent(ON.text(text));
      if (found !== null) {
        return found;
      }
    }
    return null;
  };
  let found: Component | null = await findAny();
  for (let i = 0; i < maxSwipes && found === null; i++) {
    await driver.swipe(SWIPE_X, SWIPE_BOTTOM_Y, SWIPE_X, SWIPE_TOP_Y, 1500);
    await driver.delayMs(300);
    found = await findAny();
  }
  return found;
}

/**
 * 首页与新场景页面的 UI 自动化：
 * 验证组件目录数量、三个新场景可进入并渲染关键内容，半模态可打开与关闭。
 */
export default function indexUiTest() {
  describe('indexUiTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      // 先创建 Driver 建立 AAMS 连接，再拉起被测应用，避免 AAMS 报 RET_ERR_CONNECTION_EXIST
      driver = Driver.create();
      const delegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await driver.delayMs(2500);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_INDEXUI_0100
     * @tc.name uiCatalogCount001
     * @tc.desc Verify the home catalog header reports nine components
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_catalogCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const header: Component | null = await driver.findComponent(ON.text(CATALOG_TITLE));
      expect(header !== null).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_INDEXUI_0200
     * @tc.name uiOpenJumpPage002
     * @tc.desc Verify the jump demo card opens and renders its target list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_openJumpPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const card: Component | null = await revealText(driver, [JUMP_TITLE], 4);
      expect(card !== null).assertTrue();
      if (card === null) {
        return;
      }
      await card.click();
      await driver.delayMs(800);
      const target = await driver.findComponent(ON.text('目标应用'));
      expect(target !== null).assertTrue();
      const settings = await driver.findComponent(ON.text('系统设置'));
      expect(settings !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_INDEXUI_0300
     * @tc.name uiOpenAndCloseSheet003
     * @tc.desc Verify the sheet demo opens a half-modal panel and closes it from content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_openAndCloseSheet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const card: Component | null = await revealText(driver, [SHEET_TITLE], 4);
      expect(card !== null).assertTrue();
      if (card === null) {
        return;
      }
      await card.click();
      await driver.delayMs(800);
      const openButton = await driver.findComponent(ON.text('打开半模态'));
      expect(openButton !== null).assertTrue();
      if (openButton === null) {
        return;
      }
      await openButton.click();
      await driver.delayMs(1200);
      const content = await driver.findComponent(ON.text('半模态内容区'));
      expect(content !== null).assertTrue();
      const closeButton = await driver.findComponent(ON.text('关闭半模态'));
      if (closeButton !== null) {
        await closeButton.click();
        await driver.delayMs(800);
      }
      await driver.pressBack();
      await driver.delayMs(500);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_INDEXUI_0400
     * @tc.name uiOpenPrefsPage004
     * @tc.desc Verify the preferences demo writes a value and reports a flushed state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_openPrefsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const card: Component | null = await revealText(driver, [PREFS_TITLE], 4);
      expect(card !== null).assertTrue();
      if (card === null) {
        return;
      }
      await card.click();
      await driver.delayMs(800);
      const writeTitle = await driver.findComponent(ON.text('写入内容'));
      expect(writeTitle !== null).assertTrue();
      const writeButton = await driver.findComponent(ON.text('写入'));
      expect(writeButton !== null).assertTrue();
      if (writeButton === null) {
        return;
      }
      await writeButton.click();
      await driver.delayMs(1200);
      const flushed = await driver.findComponent(ON.text('已写入并 flush 落盘'));
      expect(flushed !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
    });
  });
}
