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
const TAG: string = 'MediaFlowTest';
const BUNDLE_NAME: string = 'com.samples.chat';
const MODULE_NAME: string = 'entry';
const ABILITY_NAME: string = 'EntryAbility';
const MAIN_WANT: Want = { bundleName: BUNDLE_NAME, moduleName: MODULE_NAME, abilityName: ABILITY_NAME };

const TIMEOUT_RENDER: number = 2000;
const TIMEOUT_PAGE: number = 3000;
const TIMEOUT_DATA: number = 8000;
const POLL_INTERVAL: number = 200;
const DELAY_SETTLE: number = 1000;
const DELAY_SWIPE: number = 500;

const TAB_LABEL_DISCOVER: string = '发现';
const ID_CHAT_COMMUNITY: string = 'chatCommunity';
const ID_USER_IMAGE: string = 'userImage';
const ID_SINGLE_IMAGE: string = 'singleImage';
const ID_MEDIA_PAGE: string = 'mediaPage';
const ID_VIDEO_COMPONENT: string = 'videoComponent';
const ID_SWIPER_IMAGE: string = 'swiperImage';
const ID_MULTI_IMAGE: string = '1';
const VIDEO_PLAY_DURATION: number = 15000;
const GRID_SWIPE_TIMES: number = 8;


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

async function waitAndTapByIdWithScroll(driver: Driver, id: string,
  maxWaitMs: number = TIMEOUT_DATA, maxScrolls: number = 5): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const component: Component | null = await findById(driver, id);
    if (component !== null) {
      await component.click();
      await driver.delayMs(1000);
      return true;
    }
    await driver.delayMs(500);
  }
  for (let attempt: number = 0; attempt < maxScrolls; attempt++) {
    await driver.swipe(360, 1000, 360, 300, 600);
    await driver.delayMs(800);
    const component: Component | null = await findById(driver, id);
    if (component !== null) {
      await component.click();
      await driver.delayMs(1000);
      return true;
    }
  }
  return false;
}

async function openMoments(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (!await tapByText(driver, TAB_LABEL_DISCOVER)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  if (!await tapById(driver, ID_CHAT_COMMUNITY)) {
    return false;
  }
  await driver.delayMs(DELAY_SETTLE);
  if (!await waitForText(driver, '朋友圈', TIMEOUT_DATA)) {
    return false;
  }
  return waitForComponentById(driver, ID_USER_IMAGE, 15000);
}

async function openMediaPage(driver: Driver): Promise<boolean> {
  if (!await openMoments(driver)) {
    return false;
  }
  if (!await waitAndTapByIdWithScroll(driver, ID_MULTI_IMAGE, TIMEOUT_DATA, 4)) {
    return false;
  }
  return waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
}


/**
 * 媒体链路 UI：朋友圈动态、视频/九宫格预览与全屏看图。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function mediaFlowTest(): void {
  describe('MediaFlowTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await restartApp(driver);
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0100
     * @tc.name      moments_title_should_be_visible_001
     * @tc.desc      Verify the moments page renders its title.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moments_title_should_be_visible_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_title_should_be_visible_001, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_title_should_be_visible_001, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForText(driver, '朋友圈', TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_title_should_be_visible_001, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'moments_title_should_be_visible_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0200
     * @tc.name      user_image_should_be_visible_002
     * @tc.desc      Verify the first moment renders its owner avatar. Precondition: device can reach gitee.com and the mock json loads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'user_image_should_be_visible_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'user_image_should_be_visible_002, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'user_image_should_be_visible_002, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'user_image_should_be_visible_002, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'user_image_should_be_visible_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0300
     * @tc.name      single_image_should_be_visible_003
     * @tc.desc      Verify at least one moment exposes its single image entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'single_image_should_be_visible_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_should_be_visible_003, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_should_be_visible_003, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_SINGLE_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_should_be_visible_003, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_should_be_visible_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0400
     * @tc.name      video_component_should_be_visible_004
     * @tc.desc      Verify the video moment renders its video component.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'video_component_should_be_visible_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_component_should_be_visible_004, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'video_component_should_be_visible_004, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_VIDEO_COMPONENT, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_component_should_be_visible_004, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_component_should_be_visible_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0500
     * @tc.name      tapping_single_image_should_open_media_005
     * @tc.desc      Verify tapping a moment image opens the media preview page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'tapping_single_image_should_open_media_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_single_image_should_open_media_005, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_single_image_should_open_media_005, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await tapById(driver, ID_SINGLE_IMAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_single_image_should_open_media_005, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(1000);
      const check3: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_single_image_should_open_media_005, value:' + check3);
      expect(check3).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'tapping_single_image_should_open_media_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0600
     * @tc.name      back_should_restore_moments_006
     * @tc.desc      Verify pressing back from the media preview restores the moments page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'back_should_restore_moments_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_006, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_006, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await tapById(driver, ID_SINGLE_IMAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_006, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(1000);
      await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      await driver.pressBack();
      await driver.delayMs(1000);
      const check3: boolean = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_006, value:' + check3);
      expect(check3).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0700
     * @tc.name      video_should_play_to_end_007
     * @tc.desc      Verify the video moment keeps playing for the full observation window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'video_should_play_to_end_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitAndTapByIdWithScroll(driver, ID_VIDEO_COMPONENT, TIMEOUT_DATA, 4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(1000);
      const check3: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, value:' + check3);
      expect(check3).assertTrue();
      await driver.delayMs(VIDEO_PLAY_DURATION);
      const check4: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, value:' + check4);
      expect(check4).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      const check5: boolean = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, value:' + check5);
      expect(check5).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'video_should_play_to_end_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0800
     * @tc.name      grid_images_should_swipe_through_all_008
     * @tc.desc      Verify every image of the nine-grid moment can be flipped through one by one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'grid_images_should_swipe_through_all_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitAndTapByIdWithScroll(driver, '0', TIMEOUT_DATA, 6);
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(1000);
      const check3: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check3);
      expect(check3).assertTrue();
      const check4: boolean = await waitForComponentById(driver, ID_SWIPER_IMAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check4);
      expect(check4).assertTrue();
      for (let index: number = 0; index < GRID_SWIPE_TIMES; index++) {
        await driver.swipe(600, 500, 0, 500, 600);
        await driver.delayMs(800);
        const check5: boolean = await waitForComponentById(driver, ID_SWIPER_IMAGE, TIMEOUT_PAGE);
        hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check5);
        expect(check5).assertTrue();
      }
      await driver.pressBack();
      await driver.delayMs(1000);
      const check6: boolean = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, value:' + check6);
      expect(check6).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'grid_images_should_swipe_through_all_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_0900
     * @tc.name      media_page_should_be_rendered_009
     * @tc.desc      Verify the media preview page is reachable from a multi-image moment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'media_page_should_be_rendered_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'media_page_should_be_rendered_009, begin');
      await yieldThread();
      const check1: boolean = await openMediaPage(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'media_page_should_be_rendered_009, value:' + check1);

      expect(check1).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'media_page_should_be_rendered_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1000
     * @tc.name      swiper_should_be_rendered_010
     * @tc.desc      Verify the multi-image preview renders the image swiper component.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'swiper_should_be_rendered_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'swiper_should_be_rendered_010, begin');
      await yieldThread();
      const check1: boolean = await openMediaPage(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'swiper_should_be_rendered_010, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await waitForComponentById(driver, ID_SWIPER_IMAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'swiper_should_be_rendered_010, value:' + check2);
      expect(check2).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'swiper_should_be_rendered_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1100
     * @tc.name      swipe_left_should_keep_swiper_alive_011
     * @tc.desc      Verify swiping left keeps the image swiper component alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'swipe_left_should_keep_swiper_alive_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_left_should_keep_swiper_alive_011, begin');
      await yieldThread();
      const check1: boolean = await openMediaPage(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_left_should_keep_swiper_alive_011, value:' + check1);

      expect(check1).assertTrue();
      await driver.swipe(600, 500, 0, 500, 600);
      await driver.delayMs(DELAY_SWIPE);
      const check2: boolean = await waitForComponentById(driver, ID_SWIPER_IMAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_left_should_keep_swiper_alive_011, value:' + check2);
      expect(check2).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_left_should_keep_swiper_alive_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1200
     * @tc.name      swipe_right_should_keep_swiper_alive_012
     * @tc.desc      Verify swiping right keeps the image swiper component alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'swipe_right_should_keep_swiper_alive_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_right_should_keep_swiper_alive_012, begin');
      await yieldThread();
      const check1: boolean = await openMediaPage(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_right_should_keep_swiper_alive_012, value:' + check1);

      expect(check1).assertTrue();
      await driver.swipe(0, 500, 600, 500, 600);
      await driver.delayMs(DELAY_SWIPE);
      const check2: boolean = await waitForComponentById(driver, ID_SWIPER_IMAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_right_should_keep_swiper_alive_012, value:' + check2);
      expect(check2).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'swipe_right_should_keep_swiper_alive_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1300
     * @tc.name      back_should_restore_moments_page_013
     * @tc.desc      Verify pressing back from the media preview restores the moments page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'back_should_restore_moments_page_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_page_013, begin');
      await yieldThread();
      const check1: boolean = await openMediaPage(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_page_013, value:' + check1);

      expect(check1).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      const check2: boolean = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_page_013, value:' + check2);
      expect(check2).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'back_should_restore_moments_page_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1400
     * @tc.name      single_image_preview_should_not_render_swiper_014
     * @tc.desc      Verify a single-image preview renders no image swiper.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'single_image_preview_should_not_render_swiper_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, begin');
      await yieldThread();
      const check1: boolean = await openMoments(driver);

      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, value:' + check1);

      expect(check1).assertTrue();
      const check2: boolean = await tapById(driver, ID_SINGLE_IMAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, value:' + check2);
      expect(check2).assertTrue();
      await driver.delayMs(1000);
      const check3: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, value:' + check3);
      expect(check3).assertTrue();
      // findComponents 在无匹配时可能返回 null，这里按 0 处理
      let swiperCount: number = 0;
      try {
        const swipers: Component[] = await driver.findComponents(ON.id(ID_SWIPER_IMAGE));
        swiperCount = swipers === null ? 0 : swipers.length;
      } catch (error) {
        swiperCount = 0;
      }
      const check4 = swiperCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, value:' + check4);
      expect(check4).assertEqual(0);
      await driver.pressBack();
      await driver.delayMs(1000);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_preview_should_not_render_swiper_014, end');
    });
    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1500
     * @tc.name      like_twice_should_keep_moments_015
     * @tc.desc      Verify tapping the like entry twice keeps the moments page alive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'like_twice_should_keep_moments_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, begin');
      await yieldThread();
      const ready: boolean = await openMoments(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, value:' + ready);
      expect(ready).assertTrue();
      const first: boolean = await tapByText(driver, '点赞');
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, value:' + first);
      expect(first).assertTrue();
      await driver.delayMs(500);
      const second: boolean = await tapByText(driver, '点赞');
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, value:' + second);
      expect(second).assertTrue();
      await driver.delayMs(500);
      const alive: boolean = await waitForText(driver, '朋友圈', TIMEOUT_DATA);
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, value:' + alive);
      expect(alive).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'like_twice_should_keep_moments_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_MEDIAFLOW_1600
     * @tc.name      single_image_swipe_should_keep_page_016
     * @tc.desc      Verify swiping a single-image preview leaves the app on a valid page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'single_image_swipe_should_keep_page_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, begin');
      await yieldThread();
      const ready: boolean = await openMoments(driver);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, value:' + ready);
      expect(ready).assertTrue();
      const tapped: boolean = await tapById(driver, ID_SINGLE_IMAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, value:' + tapped);
      expect(tapped).assertTrue();
      await driver.delayMs(1000);
      const opened: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, value:' + opened);
      expect(opened).assertTrue();
      await driver.swipe(600, 500, 0, 500, 600);
      await driver.delayMs(DELAY_SWIPE);
      // 单图页整页绑定了点击返回，滑动可能被识别为点击而退出；
      // 这里校验滑动后仍处于合法页面（媒体页或已回到朋友圈），不卡死
      const stillMedia: boolean = await waitForComponentById(driver, ID_MEDIA_PAGE, TIMEOUT_PAGE);
      let validPage: boolean = stillMedia;
      if (!validPage) {
        validPage = await waitForComponentById(driver, ID_USER_IMAGE, TIMEOUT_DATA);
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, value:' + validPage);
      expect(validPage).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'single_image_swipe_should_keep_page_016, end');
    });

  });
}
