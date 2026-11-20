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
import { Driver, Component } from '@ohos.UiTest';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  SETTLE_UI,
  TAB_INDEX_POSITION,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  clickTabContentIcon,
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  findByText,
  findTabBar,
  sleep,
  switchTab,
  tapMenuOption,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.POSITION;

async function openPositionTab(driver: Driver): Promise<boolean> {
  return await switchTab(driver, UiText.TAB_POSITION, TAB_INDEX_POSITION, UiText.CONTENT_POSITION);
}

async function openStopMenu(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickTabContentIcon(driver, UiText.TAB_POSITION, TAB_INDEX_POSITION,
    UiText.LABEL_ANIMATION_STOP);
  if (!clicked) {
    return false;
  }
  return await waitForText(driver, UiText.STOP_AT_FRAME, TIMEOUT_MENU);
}

async function openPlayMenu(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickTabContentIcon(driver, UiText.TAB_POSITION, TAB_INDEX_POSITION,
    UiText.LABEL_ANIMATION_PLAY);
  if (!clicked) {
    return false;
  }
  return await waitForText(driver, UiText.PLAY_FROM_FRAME, TIMEOUT_MENU);
}

/**
 * Playback position controls of the fourth tab. Both the frame based and the
 * time based variants of goToAndStop and goToAndPlay are exercised, followed by
 * the resize and destroy instance controls.
 */
export default function playbackPositionTest(): void {
  describe('LottiePlaybackPositionTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0100
     * @tc.name positionTabLabels001
     * @tc.desc Verify the position tab renders the stop, play, resize and destroy labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'positionTabLabels_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'positionTabLabels_001 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'positionTabLabels_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.LABEL_ANIMATION_PLAY, TIMEOUT_TEXT);
      Logger.info(TAG, 'positionTabLabels_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.LABEL_RESIZE, TIMEOUT_TEXT);
      Logger.info(TAG, 'positionTabLabels_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_DESTROY_GRUNT, TIMEOUT_TEXT);
      Logger.info(TAG, 'positionTabLabels_001, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'positionTabLabels_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0200
     * @tc.name stopMenuOffersFrameAndTime002
     * @tc.desc Verify the stop menu offers a frame based and a time based destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stopMenuOffersFrameAndTime_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openStopMenu(driver);
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.STOP_AT_TIME, TIMEOUT_MENU);
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'stopMenuOffersFrameAndTime_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0300
     * @tc.name goToFrameAndStop003
     * @tc.desc Verify the animation can be moved to frame 250 and stopped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'goToFrameAndStop_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'goToFrameAndStop_003 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'goToFrameAndStop_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openStopMenu(driver);
      Logger.info(TAG, 'goToFrameAndStop_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.STOP_AT_FRAME);
      Logger.info(TAG, 'goToFrameAndStop_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'goToFrameAndStop_003, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'goToFrameAndStop_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0400
     * @tc.name goToTimeAndStop004
     * @tc.desc Verify the animation can be moved to 5000 milliseconds and stopped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'goToTimeAndStop_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'goToTimeAndStop_004 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'goToTimeAndStop_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openStopMenu(driver);
      Logger.info(TAG, 'goToTimeAndStop_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.STOP_AT_TIME);
      Logger.info(TAG, 'goToTimeAndStop_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'goToTimeAndStop_004, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'goToTimeAndStop_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0500
     * @tc.name playMenuOffersFrameAndTime005
     * @tc.desc Verify the play menu offers a frame based and a time based start point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'playMenuOffersFrameAndTime_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openPlayMenu(driver);
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.PLAY_FROM_TIME, TIMEOUT_MENU);
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'playMenuOffersFrameAndTime_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0600
     * @tc.name goToFrameAndPlay006
     * @tc.desc Verify the animation can start playing from frame 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'goToFrameAndPlay_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'goToFrameAndPlay_006 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'goToFrameAndPlay_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openPlayMenu(driver);
      Logger.info(TAG, 'goToFrameAndPlay_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.PLAY_FROM_FRAME);
      Logger.info(TAG, 'goToFrameAndPlay_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'goToFrameAndPlay_006, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'goToFrameAndPlay_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0700
     * @tc.name goToTimeAndPlay007
     * @tc.desc Verify the animation can start playing from 12000 milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'goToTimeAndPlay_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'goToTimeAndPlay_007 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'goToTimeAndPlay_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openPlayMenu(driver);
      Logger.info(TAG, 'goToTimeAndPlay_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.PLAY_FROM_TIME);
      Logger.info(TAG, 'goToTimeAndPlay_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'goToTimeAndPlay_007, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'goToTimeAndPlay_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0800
     * @tc.name stopMenuClosesAfterChoice008
     * @tc.desc Verify the stop menu closes once a destination has been chosen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stopMenuClosesAfterChoice_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openStopMenu(driver);
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.STOP_AT_FRAME);
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await sleep(SETTLE_UI);
      const menuItem: Component | null = await findByText(driver, UiText.STOP_AT_FRAME);
      const check04: boolean = menuItem === null;
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'stopMenuClosesAfterChoice_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_0900
     * @tc.name resizeControlApplied009
     * @tc.desc Verify the resize control redraws the animation without leaving the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resizeControlApplied_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resizeControlApplied_009 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'resizeControlApplied_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const resized: boolean = await clickTabContentIcon(driver, UiText.TAB_POSITION,
        TAB_INDEX_POSITION, UiText.LABEL_RESIZE);
      const check02: boolean = resized;
      Logger.info(TAG, 'resizeControlApplied_009, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'resizeControlApplied_009, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'resizeControlApplied_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_1000
     * @tc.name destroyInstanceKeepsContent010
     * @tc.desc Verify the instance destroy control leaves the position tab content usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'destroyInstanceKeepsContent_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'destroyInstanceKeepsContent_010 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'destroyInstanceKeepsContent_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const destroyed: boolean = await clickTabContentIcon(driver, UiText.TAB_POSITION,
        TAB_INDEX_POSITION, UiText.LABEL_DESTROY_GRUNT);
      const check02: boolean = destroyed;
      Logger.info(TAG, 'destroyInstanceKeepsContent_010, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'destroyInstanceKeepsContent_010, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_ANIMATION_PLAY, TIMEOUT_TEXT);
      Logger.info(TAG, 'destroyInstanceKeepsContent_010, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'destroyInstanceKeepsContent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_POSITION_1100
     * @tc.name positionTabReentry011
     * @tc.desc Verify the position tab can be left and entered again with its content intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'positionTabReentry_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'positionTabReentry_011 begin');
      const check01: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'positionTabReentry_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await switchTab(driver, UiText.TAB_LISTEN, 4, UiText.CONTENT_LISTEN);
      Logger.info(TAG, 'positionTabReentry_011, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await openPositionTab(driver);
      Logger.info(TAG, 'positionTabReentry_011, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_RESIZE, TIMEOUT_TEXT);
      Logger.info(TAG, 'positionTabReentry_011, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'positionTabReentry_011 end');
    });
  });
}
