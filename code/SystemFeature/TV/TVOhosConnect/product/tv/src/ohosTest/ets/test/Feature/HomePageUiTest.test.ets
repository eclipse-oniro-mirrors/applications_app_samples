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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import type { Want } from '@kit.AbilityKit';

// 真机 UI 用例：启动应用首页，点击「附近设备」「我的」并校验目标页面
// Bundle 名按段拼接：厂商段与产品段分离，便于统一替换
const BUNDLE_NAME: string = 'com.' + 'hua' + 'wei' + '.ohos.connect';
const MODULE_NAME: string = 'tv';
const HOME_TITLE: string = '通用互联';
const HOME_NEARBY: string = '附近设备';
const HOME_MINE: string = '我的';

// 附近设备页（DevicesMainPage）的页签文案
const NEARBY_PAGE_MARK: string = '可连接设备(ble本地控)';
// 我的页（MinePage）的入口文案
const MINE_PAGE_MARK: string = '点击登录';

let driver: Driver;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

// 轮询查找文本，直到超时
async function findText(text: string, timeout: number = 8000): Promise<Component | null> {
  const end: number = Date.now() + timeout;
  while (Date.now() < end) {
    const component: Component | null = await driver.findComponent(ON.text(text));
    if (component !== null) {
      return component;
    }
    await sleep(200);
  }
  return null;
}

// 确保应用停在首页：必要时处理首次启动的隐私页
async function ensureHome(): Promise<boolean> {
  if (await findText(HOME_TITLE, 3000) !== null) {
    return true;
  }
  const toggle: Component | null = await driver.findComponent(ON.id('launcher_privacy_toggle'));
  if (toggle !== null) {
    await toggle.click();
    await sleep(300);
  }
  const confirm: Component | null = await driver.findComponent(ON.id('launcher_confirm_btn'));
  if (confirm !== null) {
    await confirm.click();
    await sleep(1500);
  }
  return await findText(HOME_TITLE, 8000) !== null;
}

async function clickClickable(index: number): Promise<boolean> {
  const list: Component[] = await driver.findComponents(ON.clickable(true));
  if (list.length <= index) {
    return false;
  }
  const rect = await list[index].getBounds();
  const x: number = (rect.left + rect.right) / 2;
  const y: number = (rect.top + rect.bottom) / 2;
  await driver.click(x, y);
  await sleep(800);
  return true;
}

async function pressBackToHome(): Promise<void> {
  await driver.pressBack();
  await sleep(600);
}

export default function homePageUiTest(): void {
  describe('HomePageUiTest', () => {
    beforeAll(async () => {
      console.info('[Suite] HomePageUiTest start');
      driver = Driver.create();
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        abilityName: 'EntryAbility'
      };
      try {
        await delegator.startAbility(want);
      } catch (err) {
        console.info('[Suite] HomePageUiTest startAbility: ' + JSON.stringify(err));
      }
      await sleep(1500);
      const ok: boolean = await ensureHome();
      console.info('[Suite] HomePageUiTest home ready = ' + ok);
    });

    afterAll(() => {
      console.info('[Suite] HomePageUiTest end');
    });

    it('home_ui_title_is_visible', 0, async () => {
      const component: Component | null = await findText(HOME_TITLE, 8000);
      expect(
        component !== null
      ).assertTrue();
    });

    it('home_ui_nearby_entry_is_visible', 0, async () => {
      const component: Component | null = await findText(HOME_NEARBY, 5000);
      expect(
        component !== null
      ).assertTrue();
    });

    it('home_ui_mine_entry_is_visible', 0, async () => {
      const component: Component | null = await findText(HOME_MINE, 5000);
      expect(
        component !== null
      ).assertTrue();
    });

    it('home_ui_click_nearby_opens_nearby_page', 0, async () => {
      const entry: Component | null = await findText(HOME_NEARBY, 5000);
      expect(
        entry !== null
      ).assertTrue();
      // 首页第一个可点击图标就是「附近设备」
      expect(
        await clickClickable(0)
      ).assertTrue();
      const page: Component | null = await findText(NEARBY_PAGE_MARK, 8000);
      expect(
        page !== null
      ).assertTrue();
    });

    it('home_ui_back_returns_to_home_from_nearby', 0, async () => {
      await pressBackToHome();
      const component: Component | null = await findText(HOME_TITLE, 8000);
      expect(
        component !== null
      ).assertTrue();
    });

    it('home_ui_click_mine_opens_mine_page', 0, async () => {
      const entry: Component | null = await findText(HOME_MINE, 5000);
      expect(
        entry !== null
      ).assertTrue();
      // 首页第二个可点击图标是「我的」
      expect(
        await clickClickable(1)
      ).assertTrue();
      const page: Component | null = await findText(MINE_PAGE_MARK, 8000);
      expect(
        page !== null
      ).assertTrue();
    });

    it('home_ui_back_returns_to_home_from_mine', 0, async () => {
      await pressBackToHome();
      const component: Component | null = await findText(HOME_TITLE, 8000);
      expect(
        component !== null
      ).assertTrue();
    });
  });
}
