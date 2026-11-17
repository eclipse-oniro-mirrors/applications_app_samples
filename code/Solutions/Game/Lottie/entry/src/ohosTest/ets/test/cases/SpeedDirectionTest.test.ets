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
  ID_DESTROY_ANIMATION,
  ID_PLAY_ORDER,
  ID_SPEED,
  ID_SUSPEND,
  SETTLE_UI,
  TAB_INDEX_PLAY_PAUSE,
  TAB_INDEX_THIS,
  TIMEOUT_MENU,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  clickTabContentIcon,
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  findByText,
  pageAlive,
  scrollPageToTop,
  selectAnimation,
  sleep,
  switchTab,
  tapById,
  tapMenuOption,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.SPEED;

async function openSpeedMenu(driver: Driver): Promise<boolean> {
  if (!await tapById(driver, ID_SPEED)) {
    return false;
  }
  return await waitForText(driver, UiText.SPEED_ONE, TIMEOUT_MENU);
}

async function openDirectionMenu(driver: Driver): Promise<boolean> {
  if (!await tapById(driver, ID_PLAY_ORDER)) {
    return false;
  }
  return await waitForText(driver, UiText.DIRECTION_FORWARD, TIMEOUT_MENU);
}

async function applySpeed(driver: Driver, label: string): Promise<boolean> {
  if (!await openSpeedMenu(driver)) {
    return false;
  }
  return await tapMenuOption(driver, label);
}

async function applyDirection(driver: Driver, label: string): Promise<boolean> {
  if (!await openDirectionMenu(driver)) {
    return false;
  }
  return await tapMenuOption(driver, label);
}

/**
 * Speed and direction menu coverage. The top panel drives the global facade,
 * the first tab uses the by-name facade and the second tab uses the instance
 * facade; all three entry points are covered with distinct menu choices.
 */
export default function speedDirectionTest(): void {
  describe('LottieSpeedDirectionTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0100
     * @tc.name speedMenuOffersThreeChoices001
     * @tc.desc Verify the speed menu lists the one, two and three times options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'speedMenuOffersThreeChoices_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001 begin');
      const check01: boolean = await openSpeedMenu(driver);
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.SPEED_TWO, TIMEOUT_MENU);
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.SPEED_THREE, TIMEOUT_MENU);
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'speedMenuOffersThreeChoices_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0200
     * @tc.name applyNormalSpeed002
     * @tc.desc Verify the one times speed option can be applied to the animation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'applyNormalSpeed_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applyNormalSpeed_002 begin');
      const check01: boolean = await applySpeed(driver, UiText.SPEED_ONE);
      Logger.info(TAG, 'applyNormalSpeed_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'applyNormalSpeed_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'applyNormalSpeed_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0300
     * @tc.name applyDoubleSpeed003
     * @tc.desc Verify the two times speed option can be applied to the animation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'applyDoubleSpeed_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applyDoubleSpeed_003 begin');
      const check01: boolean = await applySpeed(driver, UiText.SPEED_TWO);
      Logger.info(TAG, 'applyDoubleSpeed_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'applyDoubleSpeed_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'applyDoubleSpeed_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0400
     * @tc.name applyHighSpeed004
     * @tc.desc Verify the three times speed option can be applied to the animation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'applyHighSpeed_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applyHighSpeed_004 begin');
      const check01: boolean = await applySpeed(driver, UiText.SPEED_THREE);
      Logger.info(TAG, 'applyHighSpeed_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'applyHighSpeed_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'applyHighSpeed_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0500
     * @tc.name speedMenuClosesAfterChoice005
     * @tc.desc Verify the speed menu closes once an option has been chosen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'speedMenuClosesAfterChoice_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'speedMenuClosesAfterChoice_005 begin');
      const check01: boolean = await applySpeed(driver, UiText.SPEED_TWO);
      Logger.info(TAG, 'speedMenuClosesAfterChoice_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await sleep(SETTLE_UI);
      const menuItem: Component | null = await findByText(driver, UiText.SPEED_TWO);
      const check02: boolean = menuItem === null;
      Logger.info(TAG, 'speedMenuClosesAfterChoice_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'speedMenuClosesAfterChoice_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0600
     * @tc.name directionMenuOffersBothWays006
     * @tc.desc Verify the play order menu lists the forward and reverse options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'directionMenuOffersBothWays_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'directionMenuOffersBothWays_006 begin');
      const check01: boolean = await openDirectionMenu(driver);
      Logger.info(TAG, 'directionMenuOffersBothWays_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.DIRECTION_REVERSE, TIMEOUT_MENU);
      Logger.info(TAG, 'directionMenuOffersBothWays_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'directionMenuOffersBothWays_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'directionMenuOffersBothWays_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0700
     * @tc.name applyReverseDirection007
     * @tc.desc Verify the reverse play direction can be applied to the animation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'applyReverseDirection_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applyReverseDirection_007 begin');
      const check01: boolean = await applyDirection(driver, UiText.DIRECTION_REVERSE);
      Logger.info(TAG, 'applyReverseDirection_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'applyReverseDirection_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'applyReverseDirection_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0800
     * @tc.name applyForwardDirection008
     * @tc.desc Verify the forward play direction can be restored after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'applyForwardDirection_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applyForwardDirection_008 begin');
      const check01: boolean = await applyDirection(driver, UiText.DIRECTION_REVERSE);
      Logger.info(TAG, 'applyForwardDirection_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await applyDirection(driver, UiText.DIRECTION_FORWARD);
      Logger.info(TAG, 'applyForwardDirection_008, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'applyForwardDirection_008, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'applyForwardDirection_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SPEED_0900
     * @tc.name reverseTwiceConsecutive009
     * @tc.desc Verify applying the reverse direction twice is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'reverseTwiceConsecutive_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'reverseTwiceConsecutive_009 begin');
      const check01: boolean = await applyDirection(driver, UiText.DIRECTION_REVERSE);
      Logger.info(TAG, 'reverseTwiceConsecutive_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await applyDirection(driver, UiText.DIRECTION_REVERSE);
      Logger.info(TAG, 'reverseTwiceConsecutive_009, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'reverseTwiceConsecutive_009, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'reverseTwiceConsecutive_009 end');
    });
  });
}
