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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { keepMainThreadResponsive } from './MainThreadYield';

const EXPANDED_BUNDLE_NAME: string = 'com.sample.demonstration';
const EXPANDED_ENTRY_ABILITY: string = 'EntryAbility';
const EXPANDED_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;

export default function bundleIdentityExpandedMatrixTest(): void {
  describe('BundleIdentityExpandedMatrixTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let baseline: bundleManager.BundleInfo;

    beforeAll((): void => {
      baseline = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1000
     * @tc.name bundleIdentityExpanded000
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded000', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1100
     * @tc.name bundleIdentityExpanded001
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded001', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1200
     * @tc.name bundleIdentityExpanded002
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded002', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1300
     * @tc.name bundleIdentityExpanded003
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded003', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1400
     * @tc.name bundleIdentityExpanded004
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded004', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1500
     * @tc.name bundleIdentityExpanded005
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded005', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1600
     * @tc.name bundleIdentityExpanded006
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded006', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1700
     * @tc.name bundleIdentityExpanded007
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded007', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1800
     * @tc.name bundleIdentityExpanded008
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded008', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_1900
     * @tc.name bundleIdentityExpanded009
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded009', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2000
     * @tc.name bundleIdentityExpanded010
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded010', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2100
     * @tc.name bundleIdentityExpanded011
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded011', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2200
     * @tc.name bundleIdentityExpanded012
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded012', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2300
     * @tc.name bundleIdentityExpanded013
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded013', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2400
     * @tc.name bundleIdentityExpanded014
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded014', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2500
     * @tc.name bundleIdentityExpanded015
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded015', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2600
     * @tc.name bundleIdentityExpanded016
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 16
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded016', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2700
     * @tc.name bundleIdentityExpanded017
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 17
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded017', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2800
     * @tc.name bundleIdentityExpanded018
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded018', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_2900
     * @tc.name bundleIdentityExpanded019
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded019', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3000
     * @tc.name bundleIdentityExpanded020
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded020', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3100
     * @tc.name bundleIdentityExpanded021
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 21
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded021', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3200
     * @tc.name bundleIdentityExpanded022
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 22
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded022', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3300
     * @tc.name bundleIdentityExpanded023
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 23
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded023', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3400
     * @tc.name bundleIdentityExpanded024
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 24
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded024', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3500
     * @tc.name bundleIdentityExpanded025
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded025', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3600
     * @tc.name bundleIdentityExpanded026
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 26
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded026', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3700
     * @tc.name bundleIdentityExpanded027
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 27
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded027', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3800
     * @tc.name bundleIdentityExpanded028
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 28
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded028', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_3900
     * @tc.name bundleIdentityExpanded029
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 29
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded029', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4000
     * @tc.name bundleIdentityExpanded030
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 30
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded030', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4100
     * @tc.name bundleIdentityExpanded031
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded031', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4200
     * @tc.name bundleIdentityExpanded032
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 32
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded032', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4300
     * @tc.name bundleIdentityExpanded033
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 33
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded033', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4400
     * @tc.name bundleIdentityExpanded034
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 34
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded034', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4500
     * @tc.name bundleIdentityExpanded035
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 35
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded035', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4600
     * @tc.name bundleIdentityExpanded036
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 36
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded036', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4700
     * @tc.name bundleIdentityExpanded037
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 37
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded037', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4800
     * @tc.name bundleIdentityExpanded038
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 38
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded038', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_4900
     * @tc.name bundleIdentityExpanded039
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded039', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5000
     * @tc.name bundleIdentityExpanded040
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 40
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded040', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5100
     * @tc.name bundleIdentityExpanded041
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 41
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded041', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5200
     * @tc.name bundleIdentityExpanded042
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 42
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded042', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5300
     * @tc.name bundleIdentityExpanded043
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 43
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded043', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5400
     * @tc.name bundleIdentityExpanded044
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 44
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded044', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5500
     * @tc.name bundleIdentityExpanded045
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 45
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded045', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5600
     * @tc.name bundleIdentityExpanded046
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 46
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded046', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5700
     * @tc.name bundleIdentityExpanded047
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 47
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded047', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5800
     * @tc.name bundleIdentityExpanded048
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 48
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded048', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_5900
     * @tc.name bundleIdentityExpanded049
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 49
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded049', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6000
     * @tc.name bundleIdentityExpanded050
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 50
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded050', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6100
     * @tc.name bundleIdentityExpanded051
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 51
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded051', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6200
     * @tc.name bundleIdentityExpanded052
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 52
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded052', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6300
     * @tc.name bundleIdentityExpanded053
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 53
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded053', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6400
     * @tc.name bundleIdentityExpanded054
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 54
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded054', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6500
     * @tc.name bundleIdentityExpanded055
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 55
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded055', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6600
     * @tc.name bundleIdentityExpanded056
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 56
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded056', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6700
     * @tc.name bundleIdentityExpanded057
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 57
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded057', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6800
     * @tc.name bundleIdentityExpanded058
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 58
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded058', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_6900
     * @tc.name bundleIdentityExpanded059
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 59
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded059', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7000
     * @tc.name bundleIdentityExpanded060
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 60
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded060', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7100
     * @tc.name bundleIdentityExpanded061
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 61
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded061', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7200
     * @tc.name bundleIdentityExpanded062
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 62
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded062', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7300
     * @tc.name bundleIdentityExpanded063
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded063', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7400
     * @tc.name bundleIdentityExpanded064
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded064', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7500
     * @tc.name bundleIdentityExpanded065
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 65
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded065', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7600
     * @tc.name bundleIdentityExpanded066
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 66
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded066', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7700
     * @tc.name bundleIdentityExpanded067
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 67
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded067', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7800
     * @tc.name bundleIdentityExpanded068
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 68
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded068', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.name).assertEqual(info.name);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_7900
     * @tc.name bundleIdentityExpanded069
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 69
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded069', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8000
     * @tc.name bundleIdentityExpanded070
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 70
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded070', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8100
     * @tc.name bundleIdentityExpanded071
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 71
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded071', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8200
     * @tc.name bundleIdentityExpanded072
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 72
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded072', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(typeof info.appInfo.uid).assertEqual('number');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8300
     * @tc.name bundleIdentityExpanded073
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 73
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded073', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8400
     * @tc.name bundleIdentityExpanded074
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 74
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded074', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8500
     * @tc.name bundleIdentityExpanded075
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 75
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded075', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8600
     * @tc.name bundleIdentityExpanded076
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 76
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded076', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8700
     * @tc.name bundleIdentityExpanded077
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 77
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded077', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8800
     * @tc.name bundleIdentityExpanded078
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 78
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded078', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_EXPANDED_8900
     * @tc.name bundleIdentityExpanded079
     * @tc.desc Verify a stable bundle identity/module slice for expanded case 79
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleIdentityExpanded079', 0, (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      const again: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(EXPANDED_FLAGS);
      expect(again.name).assertEqual(info.name);
      expect(again.appIndex).assertEqual(info.appIndex);
      expect(again.versionCode).assertEqual(info.versionCode);
      expect(info.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual(info.hapModulesInfo[0].name);
      expect(info.name).assertEqual(EXPANDED_BUNDLE_NAME);
      expect(info.appIndex).assertEqual(0);
      expect(info.versionCode >= 1).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

  });
}
