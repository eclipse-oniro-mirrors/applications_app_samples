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
import UIAbility from '@ohos.app.ability.UIAbility';
import resourceManager from '@ohos.resourceManager';
import Logger from '../../utils/Logger';
import {
  ABILITY_NAME,
  BUNDLE,
  BUNDLE_NAME,
  ID_DESTROY_ANIMATION,
  ID_PAUSE,
  ID_PLAY,
  ID_PLAY_ORDER,
  ID_SELECT_ANIMATION,
  ID_SPEED,
  ID_START_PLAY,
  ID_SUSPEND,
  MODULE_NAME,
  SETTLE_UI,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  getTopAbility,
  launchApp,
  pageAlive,
  selectAnimation,
  sleep,
  tapById,
  tapMenuOption,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.ABILITY;

/**
 * Baseline smoke suite for the Lottie sample. It follows the reference sample
 * order (launch, choose an asset, play controls, destroy) and extends it with
 * assertions on the resolved ability identity and context.
 */
export default function abilityTest(): void {
  describe('ActsAbilityTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0100
     * @tc.name startAbilityWithExplicitWant001
     * @tc.desc Verify the entry ability can be started with an explicit want
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'startAbilityWithExplicitWant_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'startAbilityWithExplicitWant_001 begin');
      const started: boolean = await launchApp();
      const check01: boolean = started;
      Logger.info(TAG, 'startAbilityWithExplicitWant_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await sleep(1500);
      const visible: boolean = await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
      const check02: boolean = visible;
      Logger.info(TAG, 'startAbilityWithExplicitWant_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'startAbilityWithExplicitWant_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0200
     * @tc.name topAbilityIdentity002
     * @tc.desc Verify the top ability reports the bundle, module and ability identity of this sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'topAbilityIdentity_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topAbilityIdentity_002 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'topAbilityIdentity_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check02: string = ability.context.abilityInfo.bundleName;
      Logger.info(TAG, 'topAbilityIdentity_002, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(BUNDLE_NAME);
      const check03: string = ability.context.abilityInfo.moduleName;
      Logger.info(TAG, 'topAbilityIdentity_002, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(MODULE_NAME);
      const check04: string = ability.context.abilityInfo.name;
      Logger.info(TAG, 'topAbilityIdentity_002, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(ABILITY_NAME);
      Logger.info(TAG, 'topAbilityIdentity_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0300
     * @tc.name abilityContextResourceManager003
     * @tc.desc Verify the ability context exposes a usable resource manager and configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityContextResourceManager_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityContextResourceManager_003 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityContextResourceManager_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const manager: resourceManager.ResourceManager = ability.context.resourceManager;
      const check02: boolean = manager !== null && manager !== undefined;
      Logger.info(TAG, 'abilityContextResourceManager_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const configuration: resourceManager.Configuration = await manager.getConfiguration();
      const check03: boolean = configuration.locale.length > 0;
      Logger.info(TAG, 'abilityContextResourceManager_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const direction: number = configuration.direction;
      const check04: boolean = direction === 0 || direction === 1;
      Logger.info(TAG, 'abilityContextResourceManager_003, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'abilityContextResourceManager_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0400
     * @tc.name selectGruntAsset004
     * @tc.desc Verify choosing the grunt asset updates the selector text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'selectGruntAsset_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'selectGruntAsset_004 begin');
      const visible: boolean = await ensureAppVisible(driver);
      const check01: boolean = visible;
      Logger.info(TAG, 'selectGruntAsset_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const selected: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      const check02: boolean = selected;
      Logger.info(TAG, 'selectGruntAsset_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'selectGruntAsset_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0500
     * @tc.name destroyThenSelectYear005
     * @tc.desc Verify destroying the current animation and choosing the year asset recovers the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'destroyThenSelectYear_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'destroyThenSelectYear_005 begin');
      const destroyed: boolean = await tapById(driver, ID_DESTROY_ANIMATION);
      const check01: boolean = destroyed;
      Logger.info(TAG, 'destroyThenSelectYear_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      await sleep(SETTLE_UI);
      const selected: boolean = await selectAnimation(driver, UiText.MENU_YEAR, UiText.YEAR);
      const check02: boolean = selected;
      Logger.info(TAG, 'destroyThenSelectYear_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const alive: boolean = await pageAlive(driver);
      const check03: boolean = alive;
      Logger.info(TAG, 'destroyThenSelectYear_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'destroyThenSelectYear_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0600
     * @tc.name speedAndDirectionMenus006
     * @tc.desc Verify the speed and direction popup menus can be applied to the running animation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'speedAndDirectionMenus_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'speedAndDirectionMenus_006 begin');
      const speedOpened: boolean = await tapById(driver, ID_SPEED);
      const check01: boolean = speedOpened;
      Logger.info(TAG, 'speedAndDirectionMenus_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.SPEED_THREE, TIMEOUT_MENU);
      Logger.info(TAG, 'speedAndDirectionMenus_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const speedApplied: boolean = await tapMenuOption(driver, UiText.SPEED_THREE);
      const check03: boolean = speedApplied;
      Logger.info(TAG, 'speedAndDirectionMenus_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const orderOpened: boolean = await tapById(driver, ID_PLAY_ORDER);
      const check04: boolean = orderOpened;
      Logger.info(TAG, 'speedAndDirectionMenus_006, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = await waitForText(driver, UiText.DIRECTION_REVERSE, TIMEOUT_MENU);
      Logger.info(TAG, 'speedAndDirectionMenus_006, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const directionApplied: boolean = await tapMenuOption(driver, UiText.DIRECTION_REVERSE);
      const check06: boolean = directionApplied;
      Logger.info(TAG, 'speedAndDirectionMenus_006, check06=' + JSON.stringify(check06));
      expect(check06).assertTrue();
      const alive: boolean = await pageAlive(driver);
      const check07: boolean = alive;
      Logger.info(TAG, 'speedAndDirectionMenus_006, check07=' + JSON.stringify(check07));
      expect(check07).assertTrue();
      Logger.info(TAG, 'speedAndDirectionMenus_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ABILITY_0700
     * @tc.name smokeEndState007
     * @tc.desc Verify the selector still offers both assets after the smoke flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'smokeEndState_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'smokeEndState_007 begin');
      const visible: boolean = await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
      const check01: boolean = visible;
      Logger.info(TAG, 'smokeEndState_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const opened: boolean = await tapById(driver, ID_SELECT_ANIMATION);
      const check02: boolean = opened && await waitForText(driver, UiText.MENU_GRUNT, TIMEOUT_MENU);
      Logger.info(TAG, 'smokeEndState_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const yearItem: boolean = await waitForText(driver, UiText.MENU_YEAR, TIMEOUT_MENU);
      const check03: boolean = yearItem;
      Logger.info(TAG, 'smokeEndState_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      Logger.info(TAG, 'smokeEndState_007 end');
    });
  });
}
