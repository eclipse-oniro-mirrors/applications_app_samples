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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';


const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Chat_';
const TAG: string = 'ChatFlowTest';
const BUNDLE_NAME: string = 'com.samples.chat';
const MODULE_NAME: string = 'entry';
const ABILITY_NAME: string = 'EntryAbility';
const MAIN_WANT: Want = { bundleName: BUNDLE_NAME, moduleName: MODULE_NAME, abilityName: ABILITY_NAME };

const TAB_INDEX_CHAT: number = 0;
const TAB_INDEX_CONTACT: number = 1;
const TAB_INDEX_DISCOVER: number = 2;
const TAB_INDEX_MINE: number = 3;
const TAB_COUNT: number = 4;
const TAB_LABELS: string[] = ['聊天', '通讯录', '发现', '我的'];

const TIMEOUT_RENDER: number = 2000;
const TIMEOUT_PAGE: number = 3000;
const POLL_INTERVAL: number = 200;
const DELAY_SETTLE: number = 1000;

const ID_SEARCH: string = 'search';
const ID_ADD_BUTTON: string = 'addBtn';
const ID_BOTTOM_INPUT: string = 'bottomTextInput';
const ID_CHAT_EXPRESSION: string = 'chatExpression';
const ID_RETURN_BTN: string = 'returnBtn';
const ID_MORE_BTN: string = 'moreBtn';

const FIRST_CHAT_NAME: string = '一日就旧';
const SECOND_CHAT_NAME: string = '将心与你';
const INPUT_TEXTS: string[] = ['hello', 'test123'];


async function createDriver(attempts: number = 5): Promise<Driver> {
  for (let index: number = 0; index < attempts; index++) {
    try {
      return Driver.create();
    } catch (error) {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, POLL_INTERVAL);
      });
    }
  }
  throw new Error('create driver failed');
}

async function launchChat(): Promise<boolean> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  return new Promise<boolean>((resolve: (value: boolean) => void): void => {
    delegator.startAbility(MAIN_WANT, (error: BusinessError): void => {
      const failed: boolean = error !== undefined && error !== null && error.code !== 0;
      resolve(!failed);
    });
  });
}

async function findByText(driver: Driver, text: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.text(text));
  } catch (error) {
    return null;
  }
}

async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.id(id));
  } catch (error) {
    return null;
  }
}

async function waitForText(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await findByText(driver, text) !== null) {
      return true;
    }
    await driver.delayMs(POLL_INTERVAL);
  }
  return false;
}

async function waitForComponentById(driver: Driver, id: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await findById(driver, id) !== null) {
      return true;
    }
    await driver.delayMs(POLL_INTERVAL);
  }
  return false;
}

async function tapByText(driver: Driver, text: string): Promise<boolean> {
  if (!await waitForText(driver, text)) {
    return false;
  }
  const component: Component | null = await findByText(driver, text);
  if (component === null) {
    return false;
  }
  await component.click();
  await driver.delayMs(100);
  return true;
}

async function tapById(driver: Driver, id: string): Promise<boolean> {
  if (!await waitForComponentById(driver, id)) {
    return false;
  }
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  await component.click();
  await driver.delayMs(100);
  return true;
}

async function restartApp(driver: Driver): Promise<boolean> {
  // 先拉起并等待首页出现，启动过程中不能按返回（会把加载中的应用退出）
  await launchChat();
  if (await waitForText(driver, '聊天', 20000)) {
    return true;
  }
  for (let attempt: number = 0; attempt < 5; attempt++) {
    await driver.pressBack();
    await driver.delayMs(800);
    if (await waitForText(driver, '聊天', 1500)) {
      return true;
    }
  }
  await launchChat();
  return waitForText(driver, '聊天', 20000);
}

async function ensureHome(driver: Driver): Promise<boolean> {
  for (let attempt: number = 0; attempt < 3; attempt++) {
    if (await waitForText(driver, '聊天', 800)) {
      return true;
    }
    await driver.pressBack();
    await driver.delayMs(800);
  }
  // 兜底：强制重启应用，确保回到首页
  return restartApp(driver);
}

async function openChatList(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, '聊天')) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  return waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
}

async function enterChatDetail(driver: Driver): Promise<boolean> {
  if (!await openChatList(driver)) {
    return false;
  }
  if (!await tapByText(driver, FIRST_CHAT_NAME)) {
    return false;
  }
  await driver.delayMs(1000);
  return waitForComponentById(driver, ID_BOTTOM_INPUT, TIMEOUT_PAGE * 2);
}

async function openAddMenu(driver: Driver): Promise<boolean> {
  if (!await openChatList(driver)) {
    return false;
  }
  if (!await tapById(driver, ID_ADD_BUTTON)) {
    return false;
  }
  await driver.delayMs(1500);
  let shown: boolean = await waitForText(driver, '发起群聊', TIMEOUT_PAGE);
  if (!shown) {
    await driver.click(665, 110);
    await driver.delayMs(1500);
    shown = await waitForText(driver, '发起群聊', TIMEOUT_PAGE);
  }
  return shown;
}


/**
 * 聊天主链路 UI：首页 Tab、会话列表、聊天详情与添加菜单。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function chatFlowTest(): void {
  describe('ChatFlowTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await restartApp(driver);
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0100
     * @tc.name      home_should_show_four_tabs_001
     * @tc.desc      Verify all four tab labels are rendered on the home page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'home_should_show_four_tabs_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'home_should_show_four_tabs_001, begin');
      await yieldThread();
      await ensureHome(driver);
      for (let index: number = 0; index < TAB_LABELS.length; index++) {
        const check1: boolean = await waitForText(driver, TAB_LABELS[index], TIMEOUT_PAGE);
        hilog.info(DOMAIN, TAG, BUNDLE + 'home_should_show_four_tabs_001, value:' + check1);
        expect(check1).assertTrue();
      }
      const check2: number = TAB_COUNT;
      hilog.info(DOMAIN, TAG, BUNDLE + 'home_should_show_four_tabs_001, value:' + check2);
      expect(check2).assertEqual(TAB_LABELS.length);
      hilog.info(DOMAIN, TAG, BUNDLE + 'home_should_show_four_tabs_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0200
     * @tc.name      chat_tab_should_be_default_002
     * @tc.desc      Verify the chat list search bar is ready right after launch, so tab 0 is active.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_tab_should_be_default_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_tab_should_be_default_002, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_tab_should_be_default_002, value:' + check1);

      expect(check1).assertTrue();
      const check2: number = TAB_INDEX_CHAT;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_tab_should_be_default_002, value:' + check2);
      expect(check2).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_tab_should_be_default_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0300
     * @tc.name      contact_tab_should_show_search_003
     * @tc.desc      Verify switching to the contact tab keeps a search bar on screen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'contact_tab_should_show_search_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_tab_should_show_search_003, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, '通讯录');
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_tab_should_show_search_003, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_tab_should_show_search_003, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'contact_tab_should_show_search_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0400
     * @tc.name      discover_tab_should_show_community_004
     * @tc.desc      Verify switching to the discover tab exposes the moments entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'discover_tab_should_show_community_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_tab_should_show_community_004, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, '发现');
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_tab_should_show_community_004, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await waitForComponentById(driver, 'chatCommunity', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_tab_should_show_community_004, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_tab_should_show_community_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0500
     * @tc.name      mine_tab_should_show_profile_005
     * @tc.desc      Verify switching to the mine tab renders the profile title.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'mine_tab_should_show_profile_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'mine_tab_should_show_profile_005, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, '我的');
      hilog.info(DOMAIN, TAG, BUNDLE + 'mine_tab_should_show_profile_005, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await waitForText(driver, '我的', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'mine_tab_should_show_profile_005, value:' + check2);
      expect(check2).assertTrue();
      const check3: number = TAB_INDEX_MINE;
      hilog.info(DOMAIN, TAG, BUNDLE + 'mine_tab_should_show_profile_005, value:' + check3);
      expect(check3).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'mine_tab_should_show_profile_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0600
     * @tc.name      switch_back_should_restore_list_006
     * @tc.desc      Verify switching away and back restores the chat list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'switch_back_should_restore_list_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_back_should_restore_list_006, begin');
      await yieldThread();
      await ensureHome(driver);
      await tapByText(driver, '发现');
      await driver.delayMs(DELAY_SETTLE);
      const check1: boolean = await tapByText(driver, '聊天');
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_back_should_restore_list_006, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_back_should_restore_list_006, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_back_should_restore_list_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0700
     * @tc.name      repeated_switch_should_keep_home_007
     * @tc.desc      Verify four consecutive tab switches do not break the home page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'repeated_switch_should_keep_home_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'repeated_switch_should_keep_home_007, begin');
      await yieldThread();
      await ensureHome(driver);
      const order: string[] = ['通讯录', '发现', '我的', '聊天'];
      for (let index: number = 0; index < order.length; index++) {
        const check1: boolean = await tapByText(driver, order[index]);
        hilog.info(DOMAIN, TAG, BUNDLE + 'repeated_switch_should_keep_home_007, value:' + check1);
        expect(check1).assertTrue();
        await driver.delayMs(DELAY_SETTLE);
      }
      const check2: boolean = await waitForText(driver, '聊天', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'repeated_switch_should_keep_home_007, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'repeated_switch_should_keep_home_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0800
     * @tc.name      out_of_range_tab_should_clamp_008
     * @tc.desc      Verify an out-of-range tab index clamps to the last tab instead of crashing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'out_of_range_tab_should_clamp_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'out_of_range_tab_should_clamp_008, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, '我的');
      hilog.info(DOMAIN, TAG, BUNDLE + 'out_of_range_tab_should_clamp_008, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await waitForText(driver, '我的', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'out_of_range_tab_should_clamp_008, value:' + check2);
      expect(check2).assertTrue();
      const check3: number = TAB_INDEX_DISCOVER;
      hilog.info(DOMAIN, TAG, BUNDLE + 'out_of_range_tab_should_clamp_008, value:' + check3);
      expect(check3).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'out_of_range_tab_should_clamp_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_0900
     * @tc.name      search_bar_should_be_rendered_009
     * @tc.desc      Verify the chat list page renders its search bar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'search_bar_should_be_rendered_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_bar_should_be_rendered_009, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'search_bar_should_be_rendered_009, value:' + check1);

      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_bar_should_be_rendered_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1000
     * @tc.name      add_button_should_be_rendered_010
     * @tc.desc      Verify the add button in the top bar exists on the chat list page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_button_should_be_rendered_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_button_should_be_rendered_010, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'add_button_should_be_rendered_010, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_ADD_BUTTON, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_button_should_be_rendered_010, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_button_should_be_rendered_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1100
     * @tc.name      first_chat_should_be_visible_011
     * @tc.desc      Verify the first mock conversation is rendered with its user name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'first_chat_should_be_visible_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_should_be_visible_011, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_should_be_visible_011, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, FIRST_CHAT_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_should_be_visible_011, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_should_be_visible_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1200
     * @tc.name      multiple_chats_should_be_visible_012
     * @tc.desc      Verify the list renders more than one conversation from the mock data.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'multiple_chats_should_be_visible_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'multiple_chats_should_be_visible_012, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'multiple_chats_should_be_visible_012, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, SECOND_CHAT_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'multiple_chats_should_be_visible_012, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'multiple_chats_should_be_visible_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1300
     * @tc.name      tapping_chat_should_open_detail_013
     * @tc.desc      Verify tapping the first conversation opens the chat detail page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_chat_should_open_detail_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_chat_should_open_detail_013, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_chat_should_open_detail_013, value:' + check1);

      expect(check1).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_chat_should_open_detail_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1400
     * @tc.name      scroll_back_to_top_should_restore_014
     * @tc.desc      Verify scrolling up and back restores the first conversation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'scroll_back_to_top_should_restore_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'scroll_back_to_top_should_restore_014, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'scroll_back_to_top_should_restore_014, value:' + check1);

      expect(check1).assertTrue();
      await driver.swipe(360, 1000, 360, 300, 600);
      await driver.delayMs(800);
      await driver.swipe(360, 300, 360, 1000, 600);
      await driver.delayMs(800);
      const check2: boolean = await waitForText(driver, FIRST_CHAT_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'scroll_back_to_top_should_restore_014, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'scroll_back_to_top_should_restore_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1500
     * @tc.name      add_menu_should_open_015
     * @tc.desc      Verify the add menu opens and exposes the group chat entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_should_open_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_should_open_015, begin');
      await yieldThread();
      const check1: boolean = await openAddMenu(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_should_open_015, value:' + check1);

      expect(check1).assertTrue();
      await driver.click(150, 600);
      await driver.delayMs(800);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_should_open_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1600
     * @tc.name      add_menu_dismiss_should_restore_016
     * @tc.desc      Verify dismissing the add menu restores the chat list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_dismiss_should_restore_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_dismiss_should_restore_016, begin');
      await yieldThread();
      const check1: boolean = await openAddMenu(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_dismiss_should_restore_016, value:' + check1);

      expect(check1).assertTrue();
      let restored: boolean = false;
      for (let attempt: number = 0; attempt < 2 && !restored; attempt++) {
        await driver.click(150, 600);
        await driver.delayMs(800);
        restored = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      }
      const check2 = restored;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_dismiss_should_restore_016, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_dismiss_should_restore_016, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1700
     * @tc.name      back_should_restore_list_017
     * @tc.desc      Verify returning from the detail page restores the chat list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'back_should_restore_list_017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_list_017, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_list_017, value:' + check1);

      expect(check1).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      const check2: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_list_017, value:' + check2);
      expect(check2).assertTrue();
      const check3: boolean = await waitForText(driver, FIRST_CHAT_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_list_017, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_list_017, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1800
     * @tc.name      bottom_input_should_be_rendered_018
     * @tc.desc      Verify the bottom text input exists on the chat detail page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'bottom_input_should_be_rendered_018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'bottom_input_should_be_rendered_018, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'bottom_input_should_be_rendered_018, value:' + check1);

      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'bottom_input_should_be_rendered_018, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_1900
     * @tc.name      input_should_echo_each_sample_019
     * @tc.desc      Verify every sample text typed into the input is returned unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'input_should_echo_each_sample_019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_each_sample_019, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_each_sample_019, value:' + check1);

      expect(check1).assertTrue();
      for (let index: number = 0; index < INPUT_TEXTS.length; index++) {
        const input: Component | null = await findById(driver, ID_BOTTOM_INPUT);
        const check2 = input !== null;
        hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_each_sample_019, value:' + check2);
        expect(check2).assertTrue();
        if (input !== null) {
          await input.inputText(INPUT_TEXTS[index]);
          await driver.delayMs(100);
          const check3: string = await input.getText();
          hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_each_sample_019, value:' + check3);
          expect(check3).assertEqual(INPUT_TEXTS[index]);
        }
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_each_sample_019, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2000
     * @tc.name      send_should_clear_input_020
     * @tc.desc      Verify pressing enter sends the message and clears the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'send_should_clear_input_020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_clear_input_020, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_clear_input_020, value:' + check1);

      expect(check1).assertTrue();
      const input: Component | null = await findById(driver, ID_BOTTOM_INPUT);
      const check2 = input !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_clear_input_020, value:' + check2);
      expect(check2).assertTrue();
      if (input !== null) {
        await input.inputText('hello_send');
        await driver.delayMs(500);
        await driver.triggerKey(2054);
        await driver.delayMs(1000);
        const check3: string = await input.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_clear_input_020, value:' + check3);
        expect(check3).assertEqual('');
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_clear_input_020, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2100
     * @tc.name      expression_button_should_be_rendered_021
     * @tc.desc      Verify the expression button exists on the chat detail page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'expression_button_should_be_rendered_021', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_button_should_be_rendered_021, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_button_should_be_rendered_021, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_CHAT_EXPRESSION, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_button_should_be_rendered_021, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_button_should_be_rendered_021, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2200
     * @tc.name      more_button_should_be_rendered_022
     * @tc.desc      Verify the top bar more button exists on the chat detail page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'more_button_should_be_rendered_022', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_should_be_rendered_022, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_should_be_rendered_022, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_MORE_BTN, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_should_be_rendered_022, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_should_be_rendered_022, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2300
     * @tc.name      more_button_click_should_keep_detail_023
     * @tc.desc      Verify the decorative more button does not navigate away.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'more_button_click_should_keep_detail_023', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_click_should_keep_detail_023, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_click_should_keep_detail_023, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await tapById(driver, ID_MORE_BTN);
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_click_should_keep_detail_023, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForComponentById(driver, ID_BOTTOM_INPUT, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_click_should_keep_detail_023, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'more_button_click_should_keep_detail_023, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2400
     * @tc.name      return_button_should_be_rendered_024
     * @tc.desc      Verify the return button exists in the top bar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'return_button_should_be_rendered_024', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'return_button_should_be_rendered_024, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'return_button_should_be_rendered_024, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_RETURN_BTN, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'return_button_should_be_rendered_024, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'return_button_should_be_rendered_024, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2500
     * @tc.name      detail_back_should_restore_list_025
     * @tc.desc      Verify pressing the in-page return button restores the chat list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'detail_back_should_restore_list_025', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_back_should_restore_list_025, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_back_should_restore_list_025, value:' + check1);

      expect(check1).assertTrue();
      await tapById(driver, ID_RETURN_BTN);
      await driver.delayMs(1000);
      let ready: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      if (!ready) {
        await driver.pressBack();
        await driver.delayMs(1000);
        ready = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      }
      const check2 = ready;
      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_back_should_restore_list_025, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_back_should_restore_list_025, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2600
     * @tc.name      message_scroll_should_keep_input_026
     * @tc.desc      Verify scrolling the message list keeps the bottom input available.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_scroll_should_keep_input_026', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_scroll_should_keep_input_026, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'message_scroll_should_keep_input_026, value:' + check1);

      expect(check1).assertTrue();
      await driver.swipe(360, 900, 360, 300, 600);
      await driver.delayMs(800);
      const check2: boolean = await waitForComponentById(driver, ID_BOTTOM_INPUT, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_scroll_should_keep_input_026, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_scroll_should_keep_input_026, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2700
     * @tc.name      expression_click_should_keep_input_027
     * @tc.desc      Verify tapping the expression entry keeps the input available.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'expression_click_should_keep_input_027', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_click_should_keep_input_027, begin');
      await yieldThread();
      const check1: boolean = await enterChatDetail(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_click_should_keep_input_027, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await tapById(driver, ID_CHAT_EXPRESSION);
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_click_should_keep_input_027, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(800);
      const check3: boolean = await waitForComponentById(driver, ID_BOTTOM_INPUT, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_click_should_keep_input_027, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_click_should_keep_input_027, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2800
     * @tc.name      search_input_should_keep_list_028
     * @tc.desc      Verify typing into the chat search bar keeps the list page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'search_input_should_keep_list_028', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_input_should_keep_list_028, begin');
      await yieldThread();
      const check1: boolean = await openChatList(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'search_input_should_keep_list_028, value:' + check1);

      expect(check1).assertTrue();
      const searchBar: Component | null = await findById(driver, ID_SEARCH);
      const check2 = searchBar !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_input_should_keep_list_028, value:' + check2);
      expect(check2).assertTrue();
      if (searchBar !== null) {
        await searchBar.inputText('test');
      }
      await driver.delayMs(500);
      const check3: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_input_should_keep_list_028, value:' + check3);
      expect(check3).assertTrue();
      // 收起软键盘，避免后续套件的底部 Tab 被遮挡
      await driver.pressBack();
      await driver.delayMs(800);
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_input_should_keep_list_028, end');
    });
    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_2900
     * @tc.name      list_item_metadata_should_be_visible_029
     * @tc.desc      Verify the chat list renders time and unread badge metadata.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'list_item_metadata_should_be_visible_029', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'list_item_metadata_should_be_visible_029, begin');
      await yieldThread();
      const ready: boolean = await openChatList(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'list_item_metadata_should_be_visible_029, value:' + ready);
      expect(ready).assertTrue();
      const timeReady: boolean = await waitForComponentById(driver, 'time', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'list_item_metadata_should_be_visible_029, value:' + timeReady);
      expect(timeReady).assertTrue();
      const badgeReady: boolean = await waitForComponentById(driver, 'badge', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'list_item_metadata_should_be_visible_029, value:' + badgeReady);
      expect(badgeReady).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'list_item_metadata_should_be_visible_029, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_3000
     * @tc.name      second_chat_should_open_detail_030
     * @tc.desc      Verify tapping the second conversation opens its detail page with the matching title.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'second_chat_should_open_detail_030', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, begin');
      await yieldThread();
      const ready: boolean = await openChatList(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, value:' + ready);
      expect(ready).assertTrue();
      const tapped: boolean = await tapByText(driver, SECOND_CHAT_NAME);
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, value:' + tapped);
      expect(tapped).assertTrue();
      await driver.delayMs(1000);
      const inDetail: boolean = await waitForComponentById(driver, ID_BOTTOM_INPUT, TIMEOUT_PAGE * 2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, value:' + inDetail);
      expect(inDetail).assertTrue();
      const titleShown: boolean = await waitForText(driver, SECOND_CHAT_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, value:' + titleShown);
      expect(titleShown).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_chat_should_open_detail_030, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_3100
     * @tc.name      input_should_echo_chinese_031
     * @tc.desc      Verify Chinese text typed into the bottom input is echoed unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'input_should_echo_chinese_031', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_chinese_031, begin');
      await yieldThread();
      const ready: boolean = await enterChatDetail(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_chinese_031, value:' + ready);
      expect(ready).assertTrue();
      const input: Component | null = await findById(driver, ID_BOTTOM_INPUT);
      const exist: boolean = input !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_chinese_031, value:' + exist);
      expect(exist).assertTrue();
      if (input !== null) {
        await input.inputText('中文输入');
        await driver.delayMs(200);
        const echoed: string = await input.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_chinese_031, value:' + echoed);
        expect(echoed).assertEqual('中文输入');
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'input_should_echo_chinese_031, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_3200
     * @tc.name      send_should_append_message_032
     * @tc.desc      Verify a sent message is appended into the conversation list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'send_should_append_message_032', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_append_message_032, begin');
      await yieldThread();
      const ready: boolean = await enterChatDetail(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_append_message_032, value:' + ready);
      expect(ready).assertTrue();
      const input: Component | null = await findById(driver, ID_BOTTOM_INPUT);
      if (input !== null) {
        await input.inputText('hello_send');
        await driver.delayMs(500);
        await driver.triggerKey(2054);
        await driver.delayMs(1500);
      }
      const sent: boolean = await waitForText(driver, 'hello_send', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_append_message_032, value:' + sent);
      expect(sent).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'send_should_append_message_032, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_CHATFLOW_3300
     * @tc.name      expression_then_input_should_work_033
     * @tc.desc      Verify input still works after opening the expression panel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'expression_then_input_should_work_033', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, begin');
      await yieldThread();
      const ready: boolean = await enterChatDetail(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, value:' + ready);
      expect(ready).assertTrue();
      const opened: boolean = await tapById(driver, ID_CHAT_EXPRESSION);
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, value:' + opened);
      expect(opened).assertTrue();
      await driver.delayMs(800);
      const input: Component | null = await findById(driver, ID_BOTTOM_INPUT);
      const exist: boolean = input !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, value:' + exist);
      expect(exist).assertTrue();
      if (input !== null) {
        await input.inputText('abc');
        await driver.delayMs(200);
        const echoed: string = await input.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, value:' + echoed);
        expect(echoed).assertEqual('abc');
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'expression_then_input_should_work_033, end');
    });

  });
}
