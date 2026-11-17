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
const TAG: string = 'InteractionMatrixTest';
const BUNDLE_NAME: string = 'com.samples.chat';
const MODULE_NAME: string = 'entry';
const ABILITY_NAME: string = 'EntryAbility';
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  moduleName: MODULE_NAME,
  abilityName: ABILITY_NAME
};

const TIMEOUT_RENDER: number = 2000;
const TIMEOUT_PAGE: number = 3000;
const TIMEOUT_DATA: number = 8000;
const POLL_INTERVAL: number = 200;
const DELAY_SETTLE: number = 1000;

const ID_CHAT_COMMUNITY: string = 'chatCommunity';
const ID_SEARCH: string = 'search';
const ID_USER_IMAGE: string = 'userImage';
const ID_ADD_BUTTON: string = 'addBtn';
const TAB_LABEL_CHAT: string = '聊天';
const TAB_LABEL_CONTACT: string = '通讯录';
const TAB_LABEL_DISCOVER: string = '发现';
const TAB_LABEL_MINE: string = '我的';
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
    const component: Component = await driver.findComponent(ON.text(text));
    return component;
  } catch (error) {
    return null;
  }
}

async function waitForText(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const component: Component | null = await findByText(driver, text);
    if (component !== null) {
      return true;
    }
    await driver.delayMs(POLL_INTERVAL);
  }
  return false;
}

async function waitForComponentById(driver: Driver, id: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    try {
      await driver.findComponent(ON.id(id));
      return true;
    } catch (error) {
      await driver.delayMs(POLL_INTERVAL);
    }
  }
  return false;
}

async function tapByText(driver: Driver, text: string): Promise<boolean> {
  const ready: boolean = await waitForText(driver, text);
  if (!ready) {
    return false;
  }
  try {
    const component: Component | null = await findByText(driver, text);
    if (component === null) {
      return false;
    }
    await component.click();
    await driver.delayMs(200);
    return true;
  } catch (error) {
    return false;
  }
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

async function openMoments(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_DISCOVER)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  if (!await waitForComponentById(driver, ID_CHAT_COMMUNITY, TIMEOUT_PAGE)) {
    return false;
  }
  try {
    const entry: Component = await driver.findComponent(ON.id(ID_CHAT_COMMUNITY));
    await entry.click();
  } catch (error) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  if (!await waitForText(driver, TITLE_MOMENTS, TIMEOUT_DATA)) {
    return false;
  }
  // 等待首条动态渲染，后续点赞/评论入口才可见；首次加载放宽到 15 秒
  return waitForComponentById(driver, ID_USER_IMAGE, 15000);
}

/** 打开聊天列表顶部添加菜单 */
async function openAddMenu(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_CHAT)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  if (!await waitForComponentById(driver, ID_ADD_BUTTON, TIMEOUT_PAGE)) {
    return false;
  }
  try {
    const addButton: Component = await driver.findComponent(ON.id(ID_ADD_BUTTON));
    await addButton.click();
  } catch (error) {
    return false;
  }
  await driver.delayMs(1000);
  return waitForText(driver, '发起群聊', TIMEOUT_PAGE);
}

/** 点击弹窗外区域收起添加菜单 */
async function dismissAddMenu(driver: Driver): Promise<void> {
  await driver.click(150, 600);
  await driver.delayMs(500);
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
 * 交互补充用例：朋友圈点赞/评论/分享、设置菜单点击、发现页次级入口、列表往返。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function interactionMatrixTest(): void {
  describe('InteractionMatrixTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await restartApp(driver);
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0100
     * @tc.name      moments_like_entry_should_be_visible_001
     * @tc.desc      Verify the moments page renders the like entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moments_like_entry_should_be_visible_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_like_entry_should_be_visible_001, begin');
      await yieldThread();
      const opened: boolean = await openMoments(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_like_entry_should_be_visible_001, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '点赞', 15000);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_like_entry_should_be_visible_001, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_like_entry_should_be_visible_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0200
     * @tc.name      tapping_like_should_keep_moments_page_002
     * @tc.desc      Verify tapping the like entry keeps the moments page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_like_should_keep_moments_page_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_like_should_keep_moments_page_002, begin');
      await yieldThread();
      const opened: boolean = await openMoments(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_like_should_keep_moments_page_002, value:' + check1);
      expect(check1).assertTrue();
      const tapped: boolean = await tapByText(driver, '点赞');
      const check2 = tapped;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_like_should_keep_moments_page_002, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_MOMENTS, TIMEOUT_PAGE);
      const check3 = alive;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_like_should_keep_moments_page_002, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_like_should_keep_moments_page_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0300
     * @tc.name      moments_comment_entry_should_be_visible_003
     * @tc.desc      Verify the moments page renders the comment entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moments_comment_entry_should_be_visible_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_comment_entry_should_be_visible_003, begin');
      await yieldThread();
      const opened: boolean = await openMoments(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_comment_entry_should_be_visible_003, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '评论', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_comment_entry_should_be_visible_003, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_comment_entry_should_be_visible_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0400
     * @tc.name      tapping_comment_should_keep_moments_page_004
     * @tc.desc      Verify tapping the comment entry keeps the moments page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_comment_should_keep_moments_page_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_comment_should_keep_moments_page_004, begin');
      await yieldThread();
      const opened: boolean = await openMoments(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_comment_should_keep_moments_page_004, value:' + check1);
      expect(check1).assertTrue();
      const tapped: boolean = await tapByText(driver, '评论');
      const check2 = tapped;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_comment_should_keep_moments_page_004, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_MOMENTS, TIMEOUT_PAGE);
      const check3 = alive;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_comment_should_keep_moments_page_004, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_comment_should_keep_moments_page_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0500
     * @tc.name      moments_share_entry_should_be_visible_005
     * @tc.desc      Verify the moments page renders the share entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moments_share_entry_should_be_visible_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_share_entry_should_be_visible_005, begin');
      await yieldThread();
      const opened: boolean = await openMoments(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_share_entry_should_be_visible_005, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '分享', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_share_entry_should_be_visible_005, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_share_entry_should_be_visible_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0600
     * @tc.name      setting_album_click_should_keep_page_006
     * @tc.desc      Verify tapping the album entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_album_click_should_keep_page_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_album_click_should_keep_page_006, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_album_click_should_keep_page_006, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '相册');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_album_click_should_keep_page_006, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_album_click_should_keep_page_006, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_album_click_should_keep_page_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0700
     * @tc.name      setting_collection_click_should_keep_page_007
     * @tc.desc      Verify tapping the collection entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_collection_click_should_keep_page_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_collection_click_should_keep_page_007, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_collection_click_should_keep_page_007, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '收藏');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_collection_click_should_keep_page_007, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_collection_click_should_keep_page_007, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_collection_click_should_keep_page_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0800
     * @tc.name      setting_wallet_click_should_keep_page_008
     * @tc.desc      Verify tapping the wallet entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_wallet_click_should_keep_page_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_wallet_click_should_keep_page_008, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_wallet_click_should_keep_page_008, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '钱包');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_wallet_click_should_keep_page_008, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_wallet_click_should_keep_page_008, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_wallet_click_should_keep_page_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_0900
     * @tc.name      setting_card_click_should_keep_page_009
     * @tc.desc      Verify tapping the card entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_card_click_should_keep_page_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_card_click_should_keep_page_009, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_card_click_should_keep_page_009, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '卡包');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_card_click_should_keep_page_009, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_card_click_should_keep_page_009, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_card_click_should_keep_page_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1000
     * @tc.name      setting_expression_click_should_keep_page_010
     * @tc.desc      Verify tapping the expression entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_expression_click_should_keep_page_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_expression_click_should_keep_page_010, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_expression_click_should_keep_page_010, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '表情');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_expression_click_should_keep_page_010, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_expression_click_should_keep_page_010, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_expression_click_should_keep_page_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1100
     * @tc.name      setting_setting_click_should_keep_page_011
     * @tc.desc      Verify tapping the settings entry keeps the profile page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'setting_setting_click_should_keep_page_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_setting_click_should_keep_page_011, begin');
      await yieldThread();
      const opened: boolean = await openSetting(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_setting_click_should_keep_page_011, value:' + check1);
      expect(check1).assertTrue();
      const check2: boolean = await tapByText(driver, '设置');
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_setting_click_should_keep_page_011, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const check3: boolean = await waitForText(driver, TITLE_MINE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_setting_click_should_keep_page_011, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'setting_setting_click_should_keep_page_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1200
     * @tc.name      tapping_scan_entry_should_keep_discover_page_012
     * @tc.desc      Verify tapping the scan entry keeps the discover page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_DISCOVER);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await tapByText(driver, '扫一扫');
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_DISCOVER, TIMEOUT_PAGE);
      const check3 = alive;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_scan_entry_should_keep_discover_page_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1300
     * @tc.name      tapping_shake_entry_should_keep_discover_page_013
     * @tc.desc      Verify tapping the shake entry keeps the discover page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_DISCOVER);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await tapByText(driver, '摇一摇');
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_DISCOVER, TIMEOUT_PAGE);
      const check3 = alive;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_shake_entry_should_keep_discover_page_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1400
     * @tc.name      friends_scroll_should_restore_search_bar_014
     * @tc.desc      Verify scrolling the contact list keeps the search bar and list usable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friends_scroll_should_restore_search_bar_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_scroll_should_restore_search_bar_014, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_CONTACT);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_scroll_should_restore_search_bar_014, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      await driver.swipe(360, 1000, 360, 300, 600);
      await driver.delayMs(800);
      await driver.swipe(360, 300, 360, 1000, 600);
      await driver.delayMs(800);
      const ready: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      const check2 = ready;
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_scroll_should_restore_search_bar_014, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'friends_scroll_should_restore_search_bar_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1500
     * @tc.name      switch_contact_then_discover_should_keep_labels_015
     * @tc.desc      Verify switching contact then discover keeps both tab labels rendered.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'switch_contact_then_discover_should_keep_labels_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_CONTACT);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await tapByText(driver, TAB_LABEL_DISCOVER);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check3: boolean = await waitForText(driver, TAB_LABEL_CONTACT, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, value:' + check3);
      expect(check3).assertTrue();
      const check4: boolean = await waitForText(driver, TAB_LABEL_DISCOVER, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, value:' + check4);
      expect(check4).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_contact_then_discover_should_keep_labels_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1600
     * @tc.name      switch_mine_then_chat_should_restore_search_016
     * @tc.desc      Verify switching to mine and back restores the chat list search bar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'switch_mine_then_chat_should_restore_search_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_mine_then_chat_should_restore_search_016, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_MINE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_mine_then_chat_should_restore_search_016, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const check2: boolean = await tapByText(driver, TAB_LABEL_CHAT);
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_mine_then_chat_should_restore_search_016, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const ready: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      const check3 = ready;
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_mine_then_chat_should_restore_search_016, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'switch_mine_then_chat_should_restore_search_016, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1700
     * @tc.name      tapping_search_bar_should_keep_list_017
     * @tc.desc      Verify tapping the chat search bar keeps the list page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_search_bar_should_keep_list_017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, begin');
      await yieldThread();
      await ensureHome(driver);
      const check1: boolean = await tapByText(driver, TAB_LABEL_CHAT);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, value:' + check1);
      expect(check1).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const ready: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      const check2 = ready;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, value:' + check2);
      expect(check2).assertTrue();
      try {
        const searchBar: Component = await driver.findComponent(ON.id(ID_SEARCH));
        await searchBar.click();
      } catch (error) {
        const check3 = false;
        hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, value:' + check3);
        expect(check3).assertTrue();
      }
      await driver.delayMs(500);
      const alive: boolean = await waitForComponentById(driver, ID_SEARCH, TIMEOUT_PAGE);
      const check4 = alive;
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, value:' + check4);
      expect(check4).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_search_bar_should_keep_list_017, end');
    });
    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1800
     * @tc.name      add_menu_add_friend_should_be_visible_018
     * @tc.desc      Verify the add menu renders the 添加好友 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_add_friend_should_be_visible_018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_add_friend_should_be_visible_018, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_add_friend_should_be_visible_018, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '添加好友', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_add_friend_should_be_visible_018, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_add_friend_should_be_visible_018, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_1900
     * @tc.name      add_menu_group_chat_should_be_visible_019
     * @tc.desc      Verify the add menu renders the 发起群聊 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_group_chat_should_be_visible_019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_group_chat_should_be_visible_019, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_group_chat_should_be_visible_019, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '发起群聊', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_group_chat_should_be_visible_019, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_group_chat_should_be_visible_019, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2000
     * @tc.name      add_menu_scan_should_be_visible_020
     * @tc.desc      Verify the add menu renders the 扫一扫 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_scan_should_be_visible_020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_scan_should_be_visible_020, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_scan_should_be_visible_020, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '扫一扫', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_scan_should_be_visible_020, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_scan_should_be_visible_020, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2100
     * @tc.name      add_menu_payment_should_be_visible_021
     * @tc.desc      Verify the add menu renders the 收付款 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_payment_should_be_visible_021', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_payment_should_be_visible_021, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_payment_should_be_visible_021, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '收付款', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_payment_should_be_visible_021, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_payment_should_be_visible_021, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2200
     * @tc.name      add_menu_lazy_load_should_be_visible_022
     * @tc.desc      Verify the add menu renders the 懒加载 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_lazy_load_should_be_visible_022', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_lazy_load_should_be_visible_022, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_lazy_load_should_be_visible_022, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '懒加载', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_lazy_load_should_be_visible_022, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_lazy_load_should_be_visible_022, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2300
     * @tc.name      add_menu_component_reuse_should_be_visible_023
     * @tc.desc      Verify the add menu renders the 组件复用 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_component_reuse_should_be_visible_023', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_component_reuse_should_be_visible_023, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_component_reuse_should_be_visible_023, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '组件复用', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_component_reuse_should_be_visible_023, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_component_reuse_should_be_visible_023, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2400
     * @tc.name      add_menu_sync_load_should_be_visible_024
     * @tc.desc      Verify the add menu renders the 同步加载 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_sync_load_should_be_visible_024', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_sync_load_should_be_visible_024, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_sync_load_should_be_visible_024, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '同步加载', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_sync_load_should_be_visible_024, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_sync_load_should_be_visible_024, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2500
     * @tc.name      add_menu_layout_opt_should_be_visible_025
     * @tc.desc      Verify the add menu renders the 布局优化 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_layout_opt_should_be_visible_025', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_layout_opt_should_be_visible_025, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_layout_opt_should_be_visible_025, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '布局优化', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_layout_opt_should_be_visible_025, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_layout_opt_should_be_visible_025, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2600
     * @tc.name      add_menu_cache_count_should_be_visible_026
     * @tc.desc      Verify the add menu renders the 缓存数量 entry and can be dismissed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'add_menu_cache_count_should_be_visible_026', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_cache_count_should_be_visible_026, begin');
      await yieldThread();
      const opened: boolean = await openAddMenu(driver);
      const check1 = opened;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_cache_count_should_be_visible_026, value:' + check1);
      expect(check1).assertTrue();
      const visible: boolean = await waitForText(driver, '缓存数量', TIMEOUT_PAGE);
      const check2 = visible;
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_cache_count_should_be_visible_026, value:' + check2);
      expect(check2).assertTrue();
      await dismissAddMenu(driver);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'add_menu_cache_count_should_be_visible_026, end');
    });
    /**
     * @tc.number    SUB_SOLUTION_CHAT_INTERACTION_2700
     * @tc.name      tapping_miniprogram_should_keep_discover_027
     * @tc.desc      Verify tapping the mini program entry keeps the discover page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_miniprogram_should_keep_discover_027', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_miniprogram_should_keep_discover_027, begin');
      await yieldThread();
      await ensureHome(driver);
      const tabbed: boolean = await tapByText(driver, TAB_LABEL_DISCOVER);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_miniprogram_should_keep_discover_027, value:' + tabbed);
      expect(tabbed).assertTrue();
      await driver.delayMs(DELAY_SETTLE);
      const tapped: boolean = await tapByText(driver, '小程序');
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_miniprogram_should_keep_discover_027, value:' + tapped);
      expect(tapped).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, TITLE_DISCOVER, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_miniprogram_should_keep_discover_027, value:' + alive);
      expect(alive).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_miniprogram_should_keep_discover_027, end');
    });

  });
}
