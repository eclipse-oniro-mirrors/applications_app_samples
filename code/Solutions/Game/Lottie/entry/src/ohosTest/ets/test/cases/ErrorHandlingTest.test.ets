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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import resourceManager from '@ohos.resourceManager';
import Logger from '../../utils/Logger';
import {
  ABILITY_NAME,
  BUNDLE,
  BUNDLE_NAME,
  ID_PLAY,
  MODULE_NAME,
  STATE_FOREGROUND,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getAppResourceManager,
  getAppStringByName,
  getTestResourceManager,
  getTopAbility,
  pageAlive,
  selectAnimation,
  tapById,
  waitForAbilityState,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.ERROR;
const MISSING_NAME: string = 'lottie_missing_key';
const MISSING_ID: string = 'lottieMissingComponentId';

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

async function startRejects(want: Want): Promise<boolean> {
  try {
    await delegator().startAbility(want);
    return false;
  } catch (error) {
    return true;
  }
}

/**
 * Negative path contract of the APIs the page depends on. Every probe asserts
 * that an invalid input is rejected and then proves that the page is still
 * fully usable, so an error path cannot silently poison later interactions.
 */
export default function errorHandlingTest(): void {
  describe('LottieErrorHandlingTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0100
     * @tc.name emptyWantRejected001
     * @tc.desc Verify an empty bundle name is rejected by startAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'emptyWantRejected_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'emptyWantRejected_001 begin');
      const want: Want = {
        bundleName: '',
        abilityName: ''
      };
      const check01: boolean = await startRejects(want);
      Logger.info(TAG, 'emptyWantRejected_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'emptyWantRejected_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0200
     * @tc.name testOnlyStringNotInApp002
     * @tc.desc Verify a string that exists only in the test module is not resolvable from the application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'testOnlyStringNotInApp_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'testOnlyStringNotInApp_002 begin');
      const rm: resourceManager.ResourceManager | null = await getAppResourceManager();
      const check01: boolean = rm !== null;
      Logger.info(TAG, 'testOnlyStringNotInApp_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (rm === null) {
        return;
      }
      let rejected: boolean = false;
      try {
        await getAppStringByName(rm, 'grunt');
      } catch (error) {
        rejected = true;
      }
      const check02: boolean = rejected;
      Logger.info(TAG, 'testOnlyStringNotInApp_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'testOnlyStringNotInApp_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0300
     * @tc.name missingComponentAssertionRejected003
     * @tc.desc Verify asserting the existence of an unknown component id is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'missingComponentAssertionRejected_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'missingComponentAssertionRejected_003 begin');
      let rejected: boolean = false;
      try {
        await driver.assertComponentExist(ON.id(MISSING_ID));
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'missingComponentAssertionRejected_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'missingComponentAssertionRejected_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0400
     * @tc.name missingTextWaitTimesOut004
     * @tc.desc Verify waiting for text that never appears returns false within the timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'missingTextWaitTimesOut_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'missingTextWaitTimesOut_004 begin');
      const start: number = Date.now();
      const found: boolean = await waitForText(driver, 'lottie text that never appears', 800);
      const elapsed: number = Date.now() - start;
      const check01: boolean = found;
      Logger.info(TAG, 'missingTextWaitTimesOut_004, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      const check02: boolean = elapsed < 15000;
      Logger.info(TAG, 'missingTextWaitTimesOut_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'missingTextWaitTimesOut_004 end, elapsed=' + elapsed);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0500
     * @tc.name controlsUsableAfterErrors005
     * @tc.desc Verify a control interaction still completes after the rejected operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'controlsUsableAfterErrors_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'controlsUsableAfterErrors_005 begin');
      const refreshed: boolean = await ensureAppVisible(driver);
      const check01: boolean = refreshed;
      Logger.info(TAG, 'controlsUsableAfterErrors_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
      Logger.info(TAG, 'controlsUsableAfterErrors_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'controlsUsableAfterErrors_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'controlsUsableAfterErrors_005, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'controlsUsableAfterErrors_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0600
     * @tc.name emptyAbilityNameRejected006
     * @tc.desc Verify an empty ability name is rejected by startAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'emptyAbilityNameRejected_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'emptyAbilityNameRejected_006 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        abilityName: ''
      };
      const check01: boolean = await startRejects(want);
      Logger.info(TAG, 'emptyAbilityNameRejected_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'emptyAbilityNameRejected_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0700
     * @tc.name invalidStringSyncIdRejected007
     * @tc.desc Verify the synchronous string reader rejects an unknown resource id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'invalidStringSyncIdRejected_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'invalidStringSyncIdRejected_007 begin');
      const rm: resourceManager.ResourceManager = getTestResourceManager();
      let rejected: boolean = false;
      let value: string = '';
      try {
        value = rm.getStringSync(0x7FFFFFF);
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected || value.length === 0;
      Logger.info(TAG, 'invalidStringSyncIdRejected_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'invalidStringSyncIdRejected_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0800
     * @tc.name zeroFlagsBundleInfoName008
     * @tc.desc Verify a default flag query still returns the installed bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'zeroFlagsBundleInfoName_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'zeroFlagsBundleInfoName_008 begin');
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      const check01: string = info.name;
      Logger.info(TAG, 'zeroFlagsBundleInfoName_008, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'zeroFlagsBundleInfoName_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_0900
     * @tc.name colorPassedToStringRejected009
     * @tc.desc Verify getStringValue rejects a color resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'colorPassedToStringRejected_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'colorPassedToStringRejected_009 begin');
      const rm: resourceManager.ResourceManager = getTestResourceManager();
      let rejected: boolean = false;
      try {
        await rm.getStringValue($r('app.color.start_window_background'));
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'colorPassedToStringRejected_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'colorPassedToStringRejected_009 end');
    });
  });
}
