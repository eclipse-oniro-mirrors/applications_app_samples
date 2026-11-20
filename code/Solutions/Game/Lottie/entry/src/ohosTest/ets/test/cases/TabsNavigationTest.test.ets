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
  TAB_INDEX_CYCLE,
  TAB_INDEX_LISTEN,
  TAB_INDEX_PLAY_PAUSE,
  TAB_INDEX_POSITION,
  TAB_INDEX_THIS,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  findByText,
  findTabBar,
  pageAlive,
  scrollPageToBottom,
  scrollPageToTop,
  sleep,
  switchTab,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.TABS;

/**
 * Navigation contract of the vertical tab host. The five entries map to the
 * two play/pause facades and the cycle, position and listener control groups.
 */
export default function tabsNavigationTest(): void {
  describe('LottieTabsNavigationTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0100
     * @tc.name switchToByNameTab001
     * @tc.desc Verify the first play tab shows the by-name control explanation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'switchToByNameTab_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'switchToByNameTab_001 begin');
      const check01: boolean = await switchTab(driver, UiText.TAB_PLAY_PAUSE, TAB_INDEX_PLAY_PAUSE, UiText.CONTENT_BY_NAME);
      Logger.info(TAG, 'switchToByNameTab_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'switchToByNameTab_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0200
     * @tc.name switchToByThisTab002
     * @tc.desc Verify the second play tab shows the instance control explanation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'switchToByThisTab_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'switchToByThisTab_002 begin');
      const check01: boolean = await switchTab(driver, UiText.TAB_PLAY_PAUSE, TAB_INDEX_THIS, UiText.CONTENT_BY_THIS);
      Logger.info(TAG, 'switchToByThisTab_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'switchToByThisTab_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0300
     * @tc.name activeContentIsExclusive003
     * @tc.desc Verify the by-name explanation is not visible while the cycle tab is active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'activeContentIsExclusive_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'activeContentIsExclusive_003 begin');
      const check01: boolean = await switchTab(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.CONTENT_CYCLE);
      Logger.info(TAG, 'activeContentIsExclusive_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await sleep(SETTLE_UI);
      const previousContent: Component | null = await findByText(driver, UiText.CONTENT_BY_NAME);
      const check02: boolean = previousContent === null;
      Logger.info(TAG, 'activeContentIsExclusive_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'activeContentIsExclusive_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0400
     * @tc.name rapidTabCycling004
     * @tc.desc Verify a full cycle through all five tabs leaves every entry usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rapidTabCycling_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rapidTabCycling_004 begin');
      const check01: boolean = await switchTab(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.CONTENT_CYCLE);
      Logger.info(TAG, 'rapidTabCycling_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await switchTab(driver, UiText.TAB_POSITION, TAB_INDEX_POSITION, UiText.CONTENT_POSITION);
      Logger.info(TAG, 'rapidTabCycling_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await switchTab(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.CONTENT_LISTEN);
      Logger.info(TAG, 'rapidTabCycling_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await switchTab(driver, UiText.TAB_PLAY_PAUSE, TAB_INDEX_PLAY_PAUSE, UiText.CONTENT_BY_NAME);
      Logger.info(TAG, 'rapidTabCycling_004, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = await switchTab(driver, UiText.TAB_PLAY_PAUSE, TAB_INDEX_THIS, UiText.CONTENT_BY_THIS);
      Logger.info(TAG, 'rapidTabCycling_004, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check06: boolean = bar !== null;
      Logger.info(TAG, 'rapidTabCycling_004, check06=' + JSON.stringify(check06));
      expect(check06).assertTrue();
      Logger.info(TAG, 'rapidTabCycling_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0500
     * @tc.name tabBarAccessibleAfterScroll005
     * @tc.desc Verify the tab bar stays reachable after scrolling the page to the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabBarAccessibleAfterScroll_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarAccessibleAfterScroll_005 begin');
      await scrollPageToBottom(driver);
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check01: boolean = bar !== null;
      Logger.info(TAG, 'tabBarAccessibleAfterScroll_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await switchTab(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.CONTENT_CYCLE);
      Logger.info(TAG, 'tabBarAccessibleAfterScroll_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'tabBarAccessibleAfterScroll_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_TABS_0600
     * @tc.name tabBarSurvivesRepeatedSwitch006
     * @tc.desc Verify repeated switching does not remove any tab entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabBarSurvivesRepeatedSwitch_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarSurvivesRepeatedSwitch_006 begin');
      for (let round: number = 0; round < 3; round++) {
        const check01: boolean = await switchTab(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.CONTENT_CYCLE);
        Logger.info(TAG, 'tabBarSurvivesRepeatedSwitch_006, check01=' + JSON.stringify(check01));
        expect(check01).assertTrue();
        const check02: boolean = await switchTab(driver, UiText.TAB_POSITION, TAB_INDEX_POSITION, UiText.CONTENT_POSITION);
        Logger.info(TAG, 'tabBarSurvivesRepeatedSwitch_006, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
      }
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'tabBarSurvivesRepeatedSwitch_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'tabBarSurvivesRepeatedSwitch_006 end');
    });
  });
}
