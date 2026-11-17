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
import { Driver } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import Logger from '../../utils/Logger';
import {
  ABILITY_NAME,
  BUNDLE,
  BUNDLE_NAME,
  LEGAL_ABILITY_STATES,
  MODULE_NAME,
  POLL_INTERVAL,
  SETTLE_PAGE,
  SETTLE_UI,
  STATE_BACKGROUND,
  STATE_FOREGROUND,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getTopAbility,
  isLegalAbilityState,
  launchApp,
  pageAlive,
  sleep,
  waitForAbilityState,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.LIFECYCLE;

interface AbilityIdentity {
  bundleName: string;
  moduleName: string;
  abilityName: string;
  uid: number;
}

async function identityOf(ability: UIAbility): Promise<AbilityIdentity> {
  const identity: AbilityIdentity = {
    bundleName: ability.context.abilityInfo.bundleName,
    moduleName: ability.context.abilityInfo.moduleName,
    abilityName: ability.context.abilityInfo.name,
    uid: ability.context.applicationInfo.uid
  };
  return identity;
}

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

async function restoreForeground(driver: Driver): Promise<boolean> {
  await launchApp();
  await sleep(SETTLE_PAGE);
  return await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
}

/**
 * Lifecycle contract of the entry ability as observed through the delegator.
 * The transitions are asserted one step at a time so a failure points at the
 * exact transition instead of at an opaque "state changed" check.
 */
export default function abilityLifecycleTest(): void {
  describe('LottieAbilityLifecycleTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0100
     * @tc.name launchReportsNoError001
     * @tc.desc Verify launching the entry ability with an explicit want reports no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'launchReportsNoError_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'launchReportsNoError_001 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        abilityName: ABILITY_NAME
      };
      let errorCode: number = -1;
      await new Promise<void>((resolve: () => void): void => {
        delegator().startAbility(want, (error: BusinessError): void => {
          errorCode = (error === undefined || error === null) ? 0 : error.code;
          resolve();
        });
      });
      const check01: number = errorCode;
      Logger.info(TAG, 'launchReportsNoError_001, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(0);
      Logger.info(TAG, 'launchReportsNoError_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0200
     * @tc.name topAbilityEntersForeground002
     * @tc.desc Verify the top ability reaches the foreground state after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'topAbilityEntersForeground_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topAbilityEntersForeground_002 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'topAbilityEntersForeground_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const foreground: boolean = await waitForAbilityState(ability, STATE_FOREGROUND, TIMEOUT_TEXT);
      const check02: boolean = foreground;
      Logger.info(TAG, 'topAbilityEntersForeground_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'topAbilityEntersForeground_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0300
     * @tc.name backgroundTransition003
     * @tc.desc Verify the ability reaches the background state when moved back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'backgroundTransition_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'backgroundTransition_003 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'backgroundTransition_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      await delegator().doAbilityBackground(ability);
      const background: boolean = await waitForAbilityState(ability, STATE_BACKGROUND, TIMEOUT_TEXT);
      const check02: boolean = background;
      Logger.info(TAG, 'backgroundTransition_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const restored: boolean = await restoreForeground(driver);
      const check03: boolean = restored;
      Logger.info(TAG, 'backgroundTransition_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'backgroundTransition_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0400
     * @tc.name foregroundTransition004
     * @tc.desc Verify the ability returns to the foreground state after being moved back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'foregroundTransition_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'foregroundTransition_004 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'foregroundTransition_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      await delegator().doAbilityBackground(ability);
      await waitForAbilityState(ability, STATE_BACKGROUND, TIMEOUT_TEXT);
      await launchApp();
      await sleep(SETTLE_PAGE);
      const foreground: boolean = await waitForAbilityState(ability, STATE_FOREGROUND, TIMEOUT_TEXT);
      const check02: boolean = foreground;
      Logger.info(TAG, 'foregroundTransition_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'foregroundTransition_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0500
     * @tc.name twoLifecycleCycles005
     * @tc.desc Verify two consecutive background and foreground cycles both complete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'twoLifecycleCycles_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'twoLifecycleCycles_005 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'twoLifecycleCycles_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      for (let cycle: number = 0; cycle < 2; cycle++) {
        await delegator().doAbilityBackground(ability);
        const check02: boolean = await waitForAbilityState(ability, STATE_BACKGROUND, TIMEOUT_TEXT);
        Logger.info(TAG, 'twoLifecycleCycles_005, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
        await launchApp();
        await sleep(SETTLE_PAGE);
        const check03: boolean = await waitForAbilityState(ability, STATE_FOREGROUND, TIMEOUT_TEXT);
        Logger.info(TAG, 'twoLifecycleCycles_005, check03=' + JSON.stringify(check03));
        expect(check03).assertTrue();
        await sleep(SETTLE_UI);
      }
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'twoLifecycleCycles_005, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'twoLifecycleCycles_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0600
     * @tc.name identityStableAcrossCycle006
     * @tc.desc Verify bundle, module, ability and uid stay unchanged across a background cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'identityStableAcrossCycle_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'identityStableAcrossCycle_006 begin');
      const before: UIAbility | null = await getTopAbility();
      const check01: boolean = before !== null;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (before === null) {
        return;
      }
      const beforeIdentity: AbilityIdentity = await identityOf(before);
      await delegator().doAbilityBackground(before);
      await waitForAbilityState(before, STATE_BACKGROUND, TIMEOUT_TEXT);
      await launchApp();
      await sleep(SETTLE_PAGE);
      await waitForAbilityState(before, STATE_FOREGROUND, TIMEOUT_TEXT);
      const after: UIAbility | null = await getTopAbility();
      const check02: boolean = after !== null;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      if (after === null) {
        return;
      }
      const afterIdentity: AbilityIdentity = await identityOf(after);
      const check03: string = afterIdentity.bundleName;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(beforeIdentity.bundleName);
      const check04: string = afterIdentity.moduleName;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(beforeIdentity.moduleName);
      const check05: string = afterIdentity.abilityName;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check05=' + JSON.stringify(check05));
      expect(check05).assertEqual(beforeIdentity.abilityName);
      const check06: number = afterIdentity.uid;
      Logger.info(TAG, 'identityStableAcrossCycle_006, check06=' + JSON.stringify(check06));
      expect(check06).assertEqual(beforeIdentity.uid);
      Logger.info(TAG, 'identityStableAcrossCycle_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0700
     * @tc.name foregroundWhenAlreadyForeground007
     * @tc.desc Verify requesting foreground on a foreground ability is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'foregroundWhenAlreadyForeground_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'foregroundWhenAlreadyForeground_007 begin');
      await ensureAppVisible(driver);
      await sleep(SETTLE_UI);
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'foregroundWhenAlreadyForeground_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      let rejected: boolean = false;
      try {
        await delegator().doAbilityForeground(ability);
      } catch (error) {
        rejected = true;
      }
      const state: number = delegator().getAbilityState(ability);
      const check02: boolean = isLegalAbilityState(state);
      Logger.info(TAG, 'foregroundWhenAlreadyForeground_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: number = state;
      Logger.info(TAG, 'foregroundWhenAlreadyForeground_007, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(STATE_FOREGROUND);
      Logger.info(TAG, 'foregroundWhenAlreadyForeground_007 end, rejected=' + rejected);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0800
     * @tc.name relaunchKeepsPageVisible008
     * @tc.desc Verify a relaunch request brings the sample page back to the foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'relaunchKeepsPageVisible_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'relaunchKeepsPageVisible_008 begin');
      const started: boolean = await ensureAppVisible(driver);
      Logger.info(TAG, 'relaunchKeepsPageVisible_008, started=' + JSON.stringify(started));
      expect(started).assertTrue();
      await sleep(SETTLE_PAGE);
      const check02: boolean = await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
      Logger.info(TAG, 'relaunchKeepsPageVisible_008, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'relaunchKeepsPageVisible_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_0900
     * @tc.name unknownAbilityRejected009
     * @tc.desc Verify starting a non-existent ability is rejected with an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'unknownAbilityRejected_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'unknownAbilityRejected_009 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        abilityName: 'UnknownAbility'
      };
      let rejected: boolean = false;
      try {
        await delegator().startAbility(want);
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'unknownAbilityRejected_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'unknownAbilityRejected_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_1000
     * @tc.name unknownBundleRejected010
     * @tc.desc Verify starting an ability of an unknown bundle is rejected with an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'unknownBundleRejected_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'unknownBundleRejected_010 begin');
      const want: Want = {
        bundleName: 'ohos.samples.lottie.unknown',
        moduleName: MODULE_NAME,
        abilityName: ABILITY_NAME
      };
      let rejected: boolean = false;
      try {
        await delegator().startAbility(want);
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'unknownBundleRejected_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'unknownBundleRejected_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_1100
     * @tc.name delegatorArgumentsExposed011
     * @tc.desc Verify the delegator exposes the test bundle name and the parameters object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'delegatorArgumentsExposed_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'delegatorArgumentsExposed_011 begin');
      const args: abilityDelegatorRegistry.AbilityDelegatorArgs =
        abilityDelegatorRegistry.getArguments();
      const check01: string = args.bundleName;
      Logger.info(TAG, 'delegatorArgumentsExposed_011, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(BUNDLE_NAME);
      const check02: boolean = args.parameters !== null && args.parameters !== undefined;
      Logger.info(TAG, 'delegatorArgumentsExposed_011, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = args.testCaseNames !== undefined;
      Logger.info(TAG, 'delegatorArgumentsExposed_011, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'delegatorArgumentsExposed_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_1200
     * @tc.name stateSamplesStayLegal012
     * @tc.desc Verify every sampled delegator state belongs to the documented lifecycle set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stateSamplesStayLegal_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stateSamplesStayLegal_012 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'stateSamplesStayLegal_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      for (let sample: number = 0; sample < 5; sample++) {
        const state: number = delegator().getAbilityState(ability);
        const check02: boolean = LEGAL_ABILITY_STATES.indexOf(state) >= 0;
        Logger.info(TAG, 'stateSamplesStayLegal_012, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
        await sleep(POLL_INTERVAL);
      }
      Logger.info(TAG, 'stateSamplesStayLegal_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_1300
     * @tc.name pageVisibleAfterCycles013
     * @tc.desc Verify the sample page is still rendered after all lifecycle transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pageVisibleAfterCycles_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pageVisibleAfterCycles_013 begin');
      const visible: boolean = await ensureAppVisible(driver);
      const check01: boolean = visible;
      Logger.info(TAG, 'pageVisibleAfterCycles_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'pageVisibleAfterCycles_013, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'pageVisibleAfterCycles_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LIFECYCLE_1400
     * @tc.name identityMatchesManifest014
     * @tc.desc Verify the runtime identity of the top ability equals the manifest declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'identityMatchesManifest_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'identityMatchesManifest_014 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'identityMatchesManifest_014, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const identity: AbilityIdentity = await identityOf(ability);
      const check02: string = identity.bundleName;
      Logger.info(TAG, 'identityMatchesManifest_014, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(BUNDLE_NAME);
      const check03: string = identity.moduleName;
      Logger.info(TAG, 'identityMatchesManifest_014, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(MODULE_NAME);
      const check04: string = identity.abilityName;
      Logger.info(TAG, 'identityMatchesManifest_014, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(ABILITY_NAME);
      const check05: boolean = identity.uid > 0;
      Logger.info(TAG, 'identityMatchesManifest_014, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'identityMatchesManifest_014 end');
    });
  });
}
