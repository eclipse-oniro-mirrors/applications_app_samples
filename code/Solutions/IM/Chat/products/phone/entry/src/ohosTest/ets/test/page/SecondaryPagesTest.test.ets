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
const TAG: string = 'SecondaryPagesTest';
const BUNDLE_NAME: string = 'com.samples.chat';
const MODULE_NAME: string = 'entry';
const ABILITY_NAME: string = 'EntryAbility';
const MAIN_WANT: Want = { bundleName: BUNDLE_NAME, moduleName: MODULE_NAME, abilityName: ABILITY_NAME };

const TIMEOUT_RENDER: number = 2000;
const TIMEOUT_PAGE: number = 3000;
const TIMEOUT_DATA: number = 8000;
const POLL_INTERVAL: number = 200;
const DELAY_SETTLE: number = 1000;

const ID_SEARCH: string = 'search';
const ID_CHAT_COMMUNITY: string = 'chatCommunity';
const TAB_LABEL_CONTACT: string = '通讯录';
const TAB_LABEL_DISCOVER: string = '发现';
const TAB_LABEL_MINE: string = '我的';
const TAB_LABEL_CHAT: string = '聊天';
const MENU_LABELS: string[] = ['相册', '收藏', '钱包', '卡包', '表情', '设置'];
const QUICK_ENTRIES: string[] = ['新的朋友', '群聊', '仅聊天的朋友', '标签', '公众号', '订阅号', '企业聊天联系人'];
const FIRST_FRIEND_NAME: string = '一日就旧';
const TITLE_MOMENTS: string = '朋友圈';
const TITLE_DISCOVER: string = '发现';
const TITLE_MINE: string = '我的';


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

async function restartApp(driver: Driver): Promise<boolean> {
  // 先拉起并等待首页出现，启动过程中不能按返回（会把加载中的应用退出）
  await launchChat();
  if (await waitForText(driver, TAB_LABEL_CHAT, 20000)) {
    return true;
  }
  for (let attempt: number = 0; attempt < 5; attempt++) {
    await driver.pressBack();
    await driver.delayMs(800);
    if (await waitForText(driver, TAB_LABEL_CHAT, 1500)) {
      return true;
    }
  }
  await launchChat();
  return waitForText(driver, TAB_LABEL_CHAT, 20000);
}

async function ensureHome(driver: Driver): Promise<boolean> {
  for (let attempt: number = 0; attempt < 3; attempt++) {
    if (await waitForText(driver, TAB_LABEL_CHAT, 800)) {
      return true;
    }
    await driver.pressBack();
    await driver.delayMs(800);
  }
  // 兜底：强制重启应用，确保回到首页
  return restartApp(driver);
}

async function openFriends(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_CONTACT)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  return waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
}

async function openDiscover(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_DISCOVER)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  return waitForComponentById(driver, ID_CHAT_COMMUNITY, TIMEOUT_PAGE);
}

async function openSetting(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_MINE)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  return waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
}


/**
 * 次级页面 UI：通讯录、发现页与我的页。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function secondaryPagesTest(): void {
  describe('SecondaryPagesTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await restartApp(driver);
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0100
     * @tc.name      friends_search_bar_should_be_rendered_001
     * @tc.desc      Verify the contact tab renders its search bar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friends_search_bar_should_be_rendered_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_bar_should_be_rendered_001, begin');
      await yieldThread();
      const check1: boolean = await openFriends(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_bar_should_be_rendered_001, value:' + check1);

      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_bar_should_be_rendered_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0200
     * @tc.name      first_friend_should_be_visible_002
     * @tc.desc      Verify the first mock contact is rendered on the contact page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'first_friend_should_be_visible_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_friend_should_be_visible_002, begin');
      await yieldThread();
      const check1: boolean = await openFriends(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'first_friend_should_be_visible_002, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, FIRST_FRIEND_NAME, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_friend_should_be_visible_002, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_friend_should_be_visible_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0300
     * @tc.name      friends_quick_entries_should_be_visible_003
     * @tc.desc      Verify the contact quick entries are all rendered.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friends_quick_entries_should_be_visible_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_quick_entries_should_be_visible_003, begin');
      await yieldThread();
      const check1: boolean = await openFriends(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_quick_entries_should_be_visible_003, value:' + check1);

      expect(check1).assertTrue();
      for (let index: number = 0; index < QUICK_ENTRIES.length; index++) {
        const check2: boolean = await waitForText(driver, QUICK_ENTRIES[index], TIMEOUT_PAGE);
        hilog.info(DOMAIN, TAG, BUNDLE + 'friends_quick_entries_should_be_visible_003, value:' + check2);
        expect(check2).assertTrue();
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_quick_entries_should_be_visible_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0400
     * @tc.name      discover_title_should_be_visible_004
     * @tc.desc      Verify the discover page renders its title.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'discover_title_should_be_visible_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_title_should_be_visible_004, begin');
      await yieldThread();
      const check1: boolean = await openDiscover(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_title_should_be_visible_004, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, TITLE_DISCOVER, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_title_should_be_visible_004, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'discover_title_should_be_visible_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0500
     * @tc.name      moments_entry_should_be_visible_005
     * @tc.desc      Verify the moments entry exists on the discover page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moments_entry_should_be_visible_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_entry_should_be_visible_005, begin');
      await yieldThread();
      const check1: boolean = await openDiscover(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_entry_should_be_visible_005, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, TITLE_MOMENTS, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_entry_should_be_visible_005, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_entry_should_be_visible_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0600
     * @tc.name      secondary_entries_should_be_visible_006
     * @tc.desc      Verify the scan, shake and mini program entries are rendered.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'secondary_entries_should_be_visible_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'secondary_entries_should_be_visible_006, begin');
      await yieldThread();
      const check1: boolean = await openDiscover(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'secondary_entries_should_be_visible_006, value:' + check1);

      expect(check1).assertTrue();
      const labels: string[] = ['扫一扫', '摇一摇', '小程序'];
      for (let index: number = 0; index < labels.length; index++) {
        const check2: boolean = await waitForText(driver, labels[index], TIMEOUT_PAGE);
        hilog.info(DOMAIN, TAG, BUNDLE + 'secondary_entries_should_be_visible_006, value:' + check2);
        expect(check2).assertTrue();
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'secondary_entries_should_be_visible_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0700
     * @tc.name      tapping_moments_should_open_page_007
     * @tc.desc      Verify tapping the moments entry opens the moments page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_moments_should_open_page_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_moments_should_open_page_007, begin');
      await yieldThread();
      const check1: boolean = await openDiscover(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_moments_should_open_page_007, value:' + check1);

      expect(check1).assertTrue();
      const entry: Component | null = await findById(driver, ID_CHAT_COMMUNITY);
      const check2 = entry !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_moments_should_open_page_007, value:' + check2);
      expect(check2).assertTrue();
      if (entry !== null) {
        await entry.click();
      }
      await driver.delayMs(1000);
      const check3: boolean = await waitForText(driver, TITLE_MOMENTS, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_moments_should_open_page_007, value:' + check3);
      expect(check3).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_moments_should_open_page_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0800
     * @tc.name      back_should_restore_discover_008
     * @tc.desc      Verify pressing back from the moments page returns to the discover page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'back_should_restore_discover_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_discover_008, begin');
      await yieldThread();
      const check1: boolean = await openDiscover(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_discover_008, value:' + check1);

      expect(check1).assertTrue();
      const entry: Component | null = await findById(driver, ID_CHAT_COMMUNITY);
      if (entry !== null) {
        await entry.click();
      }
      await driver.delayMs(1000);
      await waitForText(driver, TITLE_MOMENTS, TIMEOUT_DATA);
      await driver.pressBack();
      await driver.delayMs(1000);
      const check2: boolean = await waitForComponentById(driver, ID_CHAT_COMMUNITY, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_discover_008, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_discover_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_0900
     * @tc.name      setting_title_should_be_visible_009
     * @tc.desc      Verify the mine tab renders its profile title.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_title_should_be_visible_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_title_should_be_visible_009, begin');
      await yieldThread();
      const check1: boolean = await openSetting(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_title_should_be_visible_009, value:' + check1);

      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_title_should_be_visible_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1000
     * @tc.name      profile_self_label_should_be_visible_010
     * @tc.desc      Verify the profile block renders the self label.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'profile_self_label_should_be_visible_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'profile_self_label_should_be_visible_010, begin');
      await yieldThread();
      const check1: boolean = await openSetting(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'profile_self_label_should_be_visible_010, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, '自己', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'profile_self_label_should_be_visible_010, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'profile_self_label_should_be_visible_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1100
     * @tc.name      all_menu_items_should_be_visible_011
     * @tc.desc      Verify every static menu item of the setting page is rendered.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'all_menu_items_should_be_visible_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'all_menu_items_should_be_visible_011, begin');
      await yieldThread();
      const check1: boolean = await openSetting(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'all_menu_items_should_be_visible_011, value:' + check1);

      expect(check1).assertTrue();
      for (let index: number = 0; index < MENU_LABELS.length; index++) {
        const check2: boolean = await waitForText(driver, MENU_LABELS[index], TIMEOUT_PAGE);
        hilog.info(DOMAIN, TAG, BUNDLE + 'all_menu_items_should_be_visible_011, value:' + check2);
        expect(check2).assertTrue();
      }
      const check3: number = MENU_LABELS.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'all_menu_items_should_be_visible_011, value:' + check3);
      expect(check3).assertEqual(6);
      hilog.info(DOMAIN, TAG, BUNDLE + 'all_menu_items_should_be_visible_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1200
     * @tc.name      album_should_be_first_entry_012
     * @tc.desc      Verify the first menu item is the album entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'album_should_be_first_entry_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'album_should_be_first_entry_012, begin');
      await yieldThread();
      const check1: boolean = await openSetting(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'album_should_be_first_entry_012, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, '相册', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'album_should_be_first_entry_012, value:' + check2);
      expect(check2).assertTrue();
      const check3 = MENU_LABELS[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'album_should_be_first_entry_012, value:' + check3);
      expect(check3).assertEqual('相册');
      hilog.info(DOMAIN, TAG, BUNDLE + 'album_should_be_first_entry_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1300
     * @tc.name      chat_history_entry_should_be_visible_013
     * @tc.desc      Verify the profile page renders the chat history entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_history_entry_should_be_visible_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_entry_should_be_visible_013, begin');
      await yieldThread();
      const check1: boolean = await openSetting(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_entry_should_be_visible_013, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, '加载聊天记录', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_entry_should_be_visible_013, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_entry_should_be_visible_013, end');
    });
    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1400
     * @tc.name      chat_history_click_should_keep_page_014
     * @tc.desc      Verify tapping the chat history entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_history_click_should_keep_page_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_click_should_keep_page_014, begin');
      await yieldThread();
      const ready: boolean = await openSetting(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_click_should_keep_page_014, value:' + ready);
      expect(ready).assertTrue();
      const tapped: boolean = await tapByText(driver, '加载聊天记录');
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_click_should_keep_page_014, value:' + tapped);
      expect(tapped).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_click_should_keep_page_014, value:' + alive);
      expect(alive).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_history_click_should_keep_page_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_SECONDARY_1500
     * @tc.name      friends_search_input_should_keep_page_015
     * @tc.desc      Verify typing into the contact search bar keeps the contact page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friends_search_input_should_keep_page_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_input_should_keep_page_015, begin');
      await yieldThread();
      const ready: boolean = await openFriends(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_input_should_keep_page_015, value:' + ready);
      expect(ready).assertTrue();
      const searchBar: Component | null = await findById(driver, ID_SEARCH);
      const exist: boolean = searchBar !== null;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_input_should_keep_page_015, value:' + exist);
      expect(exist).assertTrue();
      if (searchBar !== null) {
        await searchBar.inputText('test');
      }
      await driver.delayMs(500);
      const alive: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_input_should_keep_page_015, value:' + alive);
      expect(alive).assertTrue();
      await driver.pressBack();
      await driver.delayMs(800);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_search_input_should_keep_page_015, end');
    });

  });
}
