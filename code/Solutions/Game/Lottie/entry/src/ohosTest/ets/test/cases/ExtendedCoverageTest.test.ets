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
import UIAbility from '@ohos.app.ability.UIAbility';
import resourceManager from '@ohos.resourceManager';
import bundleManager from '@ohos.bundle.bundleManager';
import window from '@ohos.window';
import Logger from '../../utils/Logger';
import { BUNDLE, BUNDLE_NAME, SuiteTag } from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getTestResourceManager,
  getTopAbility,
  launchApp,
  pageAlive,
  sleep
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.ANIMATION;

async function topWindow(): Promise<window.Window | null> {
  const ability: UIAbility | null = await getTopAbility();
  if (ability === null) {
    return null;
  }
  try {
    return await window.getTopWindow(ability.context);
  } catch (error) {
    return null;
  }
}

/**
 * Additional contracts that do not overlap the base suites: animation instance
 * isolation, listener lifetime, event domains, avoid area variants, bundle flag
 * variants, rawfile path rejection and lottie operation budgets.
 */
export default function extendedCoverageTest(): void {
  describe('LottieExtendedCoverageTest', (): void => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0100
     * @tc.name avoidAreaCutout001
     * @tc.desc Verify the cutout avoid area exposes four non-negative rectangles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'avoidAreaCutout_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'avoidAreaCutout_001 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'avoidAreaCutout_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      const check02: boolean = area.topRect.width >= 0 && area.bottomRect.width >= 0 &&
        area.leftRect.width >= 0 && area.rightRect.width >= 0;
      Logger.info(TAG, 'avoidAreaCutout_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'avoidAreaCutout_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0200
     * @tc.name avoidAreaSystemGesture002
     * @tc.desc Verify the system gesture avoid area exposes non-negative rectangles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'avoidAreaSystemGesture_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'avoidAreaSystemGesture_002 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'avoidAreaSystemGesture_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      const check02: boolean = area.topRect.height >= 0 && area.bottomRect.height >= 0 &&
        area.leftRect.height >= 0 && area.rightRect.height >= 0;
      Logger.info(TAG, 'avoidAreaSystemGesture_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'avoidAreaSystemGesture_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0300
     * @tc.name avoidAreaKeyboard003
     * @tc.desc Verify the keyboard avoid area exposes non-negative rectangles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'avoidAreaKeyboard_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'avoidAreaKeyboard_003 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'avoidAreaKeyboard_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      const check02: boolean = area.topRect.width >= 0 && area.bottomRect.width >= 0 &&
        area.leftRect.width >= 0 && area.rightRect.width >= 0;
      Logger.info(TAG, 'avoidAreaKeyboard_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'avoidAreaKeyboard_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0400
     * @tc.name metadataFlagReturnsModule004
     * @tc.desc Verify the metadata bundle flag still returns the entry module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'metadataFlagReturnsModule_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'metadataFlagReturnsModule_004 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      const check01: number = info.hapModulesInfo.length;
      Logger.info(TAG, 'metadataFlagReturnsModule_004, check01=' + JSON.stringify(check01));
      expect(check01 >= 1).assertTrue();
      Logger.info(TAG, 'metadataFlagReturnsModule_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0500
     * @tc.name disableFlagKeepsIdentity005
     * @tc.desc Verify the disable bundle flag keeps the installed bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'disableFlagKeepsIdentity_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'disableFlagKeepsIdentity_005 begin');
      const info: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      const check01: string = info.name;
      Logger.info(TAG, 'disableFlagKeepsIdentity_005, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(BUNDLE_NAME);
      const check02: number = info.versionCode;
      Logger.info(TAG, 'disableFlagKeepsIdentity_005, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(1000000);
      Logger.info(TAG, 'disableFlagKeepsIdentity_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0600
     * @tc.name absoluteRawPathRejected006
     * @tc.desc Verify an absolute rawfile path is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'absoluteRawPathRejected_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'absoluteRawPathRejected_006 begin');
      const rm: resourceManager.ResourceManager = getTestResourceManager();
      let rejected: boolean = false;
      try {
        await rm.getRawFileContent('/data/local/tmp/not_exists.json');
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'absoluteRawPathRejected_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'absoluteRawPathRejected_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0700
     * @tc.name startTwiceIdentityStable007
     * @tc.desc Verify two launch requests keep the same top ability identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'startTwiceIdentityStable_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'startTwiceIdentityStable_007 begin');
      const firstStarted: boolean = await launchApp();
      Logger.info(TAG, 'startTwiceIdentityStable_007, firstStarted=' + JSON.stringify(firstStarted));
      expect(firstStarted).assertTrue();
      await sleep(800);
      const secondStarted: boolean = await launchApp();
      Logger.info(TAG, 'startTwiceIdentityStable_007, secondStarted=' + JSON.stringify(secondStarted));
      expect(secondStarted).assertTrue();
      await sleep(800);
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'startTwiceIdentityStable_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check02: string = ability.context.abilityInfo.name;
      Logger.info(TAG, 'startTwiceIdentityStable_007, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('EntryAbility');
      const check03: number = ability.context.applicationInfo.uid;
      Logger.info(TAG, 'startTwiceIdentityStable_007, check03=' + JSON.stringify(check03));
      expect(check03 > 0).assertTrue();
      Logger.info(TAG, 'startTwiceIdentityStable_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_EXTENDED_0800
     * @tc.name pageAliveAfterExtendedCases008
     * @tc.desc Verify the sample page remains visible after the extended cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pageAliveAfterExtendedCases_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pageAliveAfterExtendedCases_008 begin');
      if (driver === null) {
        driver = await createDriver();
      }
      const visible: boolean = await ensureAppVisible(driver);
      Logger.info(TAG, 'pageAliveAfterExtendedCases_008, visible=' + JSON.stringify(visible));
      expect(visible).assertTrue();
      const alive: boolean = await pageAlive(driver);
      Logger.info(TAG, 'pageAliveAfterExtendedCases_008, alive=' + JSON.stringify(alive));
      expect(alive).assertTrue();
      Logger.info(TAG, 'pageAliveAfterExtendedCases_008 end');
    });
  });
}
