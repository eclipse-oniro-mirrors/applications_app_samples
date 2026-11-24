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
import { yieldToEventLoop } from '../common/TestYield';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { ABILITY_NAME, BUNDLE, BUNDLE_NAME, LEGAL_ABILITY_STATES, MODULE_NAME, SETTLE_PAGE, STATE_FOREGROUND, TAG } from '../common/TestConstant';
import { createDriver, ensureAppVisible, getTopAbility, launchApp, pageAlive, sleep } from '../common/UiFlowHelper';
import { Driver } from '@ohos.UiTest';
/**
 * Lifecycle and context contract of the entry ability.
 * The page reads no persistent state, so the ability contract is limited to its
 * identity, its foreground state and the directories handed to the ArkUI page.
 */
export default function abilityLifecycleTest() {
  describe('AbilityLifecycleTest', () => {
    let driver: Driver;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      driver = await createDriver();
      await launchApp();
      await sleep(SETTLE_PAGE);
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0100
     * @tc.name LaunchSucceeds001
     * @tc.desc Verify launch succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LaunchSucceeds_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'LaunchSucceeds_001 begin');
      const launched: boolean = await launchApp();
      expect(launched).assertTrue();
      Logger.info(TAG, 'LaunchSucceeds_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0200
     * @tc.name TopAbilityAvailable002
     * @tc.desc Verify top ability available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TopAbilityAvailable_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TopAbilityAvailable_002 begin');
      const ability: UIAbility | null = await getTopAbility();
      const present: boolean = ability !== null;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'TopAbilityAvailable_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0300
     * @tc.name ContextBundleMatches003
     * @tc.desc Verify context bundle matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextBundleMatches_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ContextBundleMatches_003 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      }
      Logger.info(TAG, 'ContextBundleMatches_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0400
     * @tc.name ContextAbilityName004
     * @tc.desc Verify context ability name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextAbilityName_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ContextAbilityName_004 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        expect(ability.context.abilityInfo.name).assertEqual(ABILITY_NAME);
      }
      Logger.info(TAG, 'ContextAbilityName_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0500
     * @tc.name ContextModuleName005
     * @tc.desc Verify context module name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextModuleName_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ContextModuleName_005 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        expect(ability.context.abilityInfo.moduleName).assertEqual(MODULE_NAME);
      }
      Logger.info(TAG, 'ContextModuleName_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0600
     * @tc.name StateIsForeground006
     * @tc.desc Verify state is foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StateIsForeground_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'StateIsForeground_006 begin');
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const state: number = delegator.getAbilityState(ability);
        expect(state).assertEqual(STATE_FOREGROUND);
      }
      Logger.info(TAG, 'StateIsForeground_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0700
     * @tc.name StateWithinLegalRange007
     * @tc.desc Verify state within legal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StateWithinLegalRange_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'StateWithinLegalRange_007 begin');
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const state: number = delegator.getAbilityState(ability);
        const legal: boolean = LEGAL_ABILITY_STATES.indexOf(state) !== -1;
        Logger.info(TAG, 'legal=' + JSON.stringify(legal));
        expect(legal).assertTrue();
      }
      Logger.info(TAG, 'StateWithinLegalRange_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0800
     * @tc.name ContextDirectoriesAvailable008
     * @tc.desc Verify context directories available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextDirectoriesAvailable_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ContextDirectoriesAvailable_008 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const filesDir: string = ability.context.filesDir;
        const cacheDir: string = ability.context.cacheDir;
        const codeDir: string = ability.context.bundleCodeDir;
        let emptyCount: number = 0;
        if (filesDir.length === 0) {
          emptyCount += 1;
        }
        if (cacheDir.length === 0) {
          emptyCount += 1;
        }
        if (codeDir.length === 0) {
          emptyCount += 1;
        }
        Logger.info(TAG, 'emptyCount=' + emptyCount);
        expect(emptyCount).assertEqual(0);
      }
      Logger.info(TAG, 'ContextDirectoriesAvailable_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_0900
     * @tc.name ResourceManagerAvailable009
     * @tc.desc Verify resource manager available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResourceManagerAvailable_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ResourceManagerAvailable_009 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const present: boolean = ability.context.resourceManager !== null;
        Logger.info(TAG, 'present=' + JSON.stringify(present));
        expect(present).assertTrue();
      }
      Logger.info(TAG, 'ResourceManagerAvailable_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1000
     * @tc.name ApplicationInfoMatches010
     * @tc.desc Verify application info matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationInfoMatches_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationInfoMatches_010 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        expect(ability.context.abilityInfo.applicationInfo.name).assertEqual(BUNDLE_NAME);
      }
      Logger.info(TAG, 'ApplicationInfoMatches_010 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1100
     * @tc.name AppContextAvailable011
     * @tc.desc Verify app context available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppContextAvailable_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AppContextAvailable_011 begin');
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const present: boolean = appContext !== null;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'AppContextAvailable_011 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1200
     * @tc.name RelaunchKeepsForeground012
     * @tc.desc Verify relaunch keeps foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RelaunchKeepsForeground_012', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RelaunchKeepsForeground_012 begin');
      await launchApp();
      await sleep(SETTLE_PAGE);
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const state: number = delegator.getAbilityState(ability);
        expect(state).assertEqual(STATE_FOREGROUND);
      }
      Logger.info(TAG, 'RelaunchKeepsForeground_012 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1300
     * @tc.name RelaunchKeepsPage013
     * @tc.desc Verify relaunch keeps page, as covered by the ability lifecycle test suite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RelaunchKeepsPage_013', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RelaunchKeepsPage_013 begin');
      await launchApp();
      await sleep(SETTLE_PAGE);
      const alive: boolean = await pageAlive(driver);
      expect(alive).assertTrue();
      Logger.info(TAG, 'RelaunchKeepsPage_013 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1400
     * @tc.name SameAbilityAcrossQueries014
     * @tc.desc Verify same ability across queries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameAbilityAcrossQueries_014', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SameAbilityAcrossQueries_014 begin');
      const first: UIAbility | null = await getTopAbility();
      const second: UIAbility | null = await getTopAbility();
      if (first !== null && second !== null) {
        expect(first.context.abilityInfo.bundleName).assertEqual(second.context.abilityInfo.bundleName);
      }
      Logger.info(TAG, 'SameAbilityAcrossQueries_014 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1500
     * @tc.name ThreeLaunchesStable015
     * @tc.desc Verify three launches stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeLaunchesStable_015', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ThreeLaunchesStable_015 begin');
      let failures: number = 0;
      for (let round: number = 0; round < 3; round++) {
        const launched: boolean = await launchApp();
        if (!launched) {
          failures += 1;
        }
        await sleep(500);
      }
      expect(failures).assertEqual(0);
      Logger.info(TAG, 'ThreeLaunchesStable_015 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1600
     * @tc.name PageAliveAfterLifecycle016
     * @tc.desc Verify page alive after lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PageAliveAfterLifecycle_016', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PageAliveAfterLifecycle_016 begin');
      await sleep(SETTLE_PAGE);
      const alive: boolean = await pageAlive(driver);
      expect(alive).assertTrue();
      Logger.info(TAG, 'PageAliveAfterLifecycle_016 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_1700
     * @tc.name DelegatorArgsMatchBundle017
     * @tc.desc Verify delegator args match bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DelegatorArgsMatchBundle_017', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DelegatorArgsMatchBundle_017 begin');
      const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
      expect(args.bundleName).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'DelegatorArgsMatchBundle_017 end');
      done();
    });
  });
}
