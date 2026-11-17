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
import { Driver, Component, ON } from '@ohos.UiTest';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  ID_DESTROY_ANIMATION,
  ID_PLAY,
  ID_SELECT_ANIMATION,
  SETTLE_UI,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  findByText,
  findById,
  pageAlive,
  selectAnimation,
  sleep,
  tapById,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.SELECT;

async function openMenu(driver: Driver): Promise<boolean> {
  const opened: boolean = await tapById(driver, ID_SELECT_ANIMATION);
  if (!opened) {
    return false;
  }
  return await waitForText(driver, UiText.MENU_GRUNT, TIMEOUT_MENU);
}

/**
 * Animation asset selection. The selector writes the chosen name into the
 * bound Text, so the observable contract of this area is the visible text
 * transition and the disappearance of the popup after a choice.
 */
export default function animationSelectTest(): void {
  describe('LottieAnimationSelectTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0100
     * @tc.name roundTripBetweenAssets001
     * @tc.desc Verify switching grunt to year and back to grunt keeps both directions usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'roundTripBetweenAssets_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'roundTripBetweenAssets_001 begin');
      const check01: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'roundTripBetweenAssets_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await selectAnimation(driver, UiText.MENU_YEAR, UiText.YEAR);
      Logger.info(TAG, 'roundTripBetweenAssets_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'roundTripBetweenAssets_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'roundTripBetweenAssets_001, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'roundTripBetweenAssets_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0200
     * @tc.name reselectSameAssetKeepsPage002
     * @tc.desc Verify selecting the same asset twice leaves the page usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'reselectSameAssetKeepsPage_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'reselectSameAssetKeepsPage_002 begin');
      const check01: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'reselectSameAssetKeepsPage_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'reselectSameAssetKeepsPage_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'reselectSameAssetKeepsPage_002, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'reselectSameAssetKeepsPage_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0300
     * @tc.name menuClosesAfterChoice003
     * @tc.desc Verify the selector popup closes once an entry has been chosen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'menuClosesAfterChoice_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'menuClosesAfterChoice_003 begin');
      const check01: boolean = await selectAnimation(driver, UiText.MENU_YEAR, UiText.YEAR);
      Logger.info(TAG, 'menuClosesAfterChoice_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await sleep(SETTLE_UI);
      const stillOpen: Component | null = await findByText(driver, UiText.MENU_YEAR);
      const check02: boolean = stillOpen === null;
      Logger.info(TAG, 'menuClosesAfterChoice_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'menuClosesAfterChoice_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0400
     * @tc.name gruntAssetSupportsPlayToggle004
     * @tc.desc Verify the grunt asset responds to the top play control after selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'gruntAssetSupportsPlayToggle_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004 begin');
      const check01: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'gruntAssetSupportsPlayToggle_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0500
     * @tc.name yearAssetKeepsControlsResponsive005
     * @tc.desc Verify the year asset leaves the top controls responsive after switching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'yearAssetKeepsControlsResponsive_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'yearAssetKeepsControlsResponsive_005 begin');
      const check01: boolean = await selectAnimation(driver, UiText.MENU_YEAR, UiText.YEAR);
      Logger.info(TAG, 'yearAssetKeepsControlsResponsive_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'yearAssetKeepsControlsResponsive_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'yearAssetKeepsControlsResponsive_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'yearAssetKeepsControlsResponsive_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0600
     * @tc.name backKeyDismissesMenu006
     * @tc.desc Verify the back key dismisses an open selector popup without leaving the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'backKeyDismissesMenu_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'backKeyDismissesMenu_006 begin');
      const opened: boolean = await openMenu(driver);
      const check01: boolean = opened;
      Logger.info(TAG, 'backKeyDismissesMenu_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const closed: Component | null = await findByText(driver, UiText.MENU_GRUNT);
      const check02: boolean = closed === null;
      Logger.info(TAG, 'backKeyDismissesMenu_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'backKeyDismissesMenu_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'backKeyDismissesMenu_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0700
     * @tc.name menuReopensRepeatedly007
     * @tc.desc Verify the selector popup can be opened again after a dismissal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'menuReopensRepeatedly_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'menuReopensRepeatedly_007 begin');
      const check01: boolean = await openMenu(driver);
      Logger.info(TAG, 'menuReopensRepeatedly_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const check02: boolean = await openMenu(driver);
      Logger.info(TAG, 'menuReopensRepeatedly_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.MENU_YEAR, TIMEOUT_MENU);
      Logger.info(TAG, 'menuReopensRepeatedly_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      Logger.info(TAG, 'menuReopensRepeatedly_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0800
     * @tc.name selectorAnchorStillValid008
     * @tc.desc Verify the selector anchor keeps its id after repeated asset changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'selectorAnchorStillValid_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'selectorAnchorStillValid_008 begin');
      for (let round: number = 0; round < 2; round++) {
        const check01: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
        Logger.info(TAG, 'selectorAnchorStillValid_008, check01=' + JSON.stringify(check01));
        expect(check01).assertTrue();
        const check02: boolean = await selectAnimation(driver, UiText.MENU_YEAR, UiText.YEAR);
        Logger.info(TAG, 'selectorAnchorStillValid_008, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
      }
      const selector: Component | null = await findById(driver, ID_SELECT_ANIMATION);
      const check03: boolean = selector !== null;
      Logger.info(TAG, 'selectorAnchorStillValid_008, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'selectorAnchorStillValid_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SELECT_0900
     * @tc.name menuEntryCount009
     * @tc.desc Verify the selector popup renders exactly one entry per supported asset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'menuEntryCount_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'menuEntryCount_009 begin');
      const check01: boolean = await openMenu(driver);
      Logger.info(TAG, 'menuEntryCount_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const gruntEntries: Array<Component> = await driver.findComponents(ON.text(UiText.MENU_GRUNT).clickable(true));
      const yearEntries: Array<Component> = await driver.findComponents(ON.text(UiText.MENU_YEAR).clickable(true));
      const check02: number = gruntEntries.length;
      Logger.info(TAG, 'menuEntryCount_009, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(1);
      const check03: number = yearEntries.length;
      Logger.info(TAG, 'menuEntryCount_009, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(1);
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'menuEntryCount_009, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'menuEntryCount_009 end');
    });
  });
}
