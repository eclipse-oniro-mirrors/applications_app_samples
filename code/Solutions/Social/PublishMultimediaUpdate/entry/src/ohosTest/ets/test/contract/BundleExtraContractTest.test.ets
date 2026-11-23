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
import bundleManager from '@ohos.bundle.bundleManager';
import Logger from '../Logger';
import { ABILITY_NAME, BUNDLE, BUNDLE_NAME, MODULE_NAME, TAG } from '../common/TestConstant';
const FULL_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
/**
 * Application level manifest details.
 * The identity and version of the bundle are covered by the manifest suite;
 * this one reads the application record and the per module ability records,
 * which decide how the entry ability is launched and which devices accept the
 * package.
 */
export default function bundleExtraContractTest() {
  describe('BundleExtraContractTest', () => {
    let full: bundleManager.BundleInfo;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      full = await bundleManager.getBundleInfoForSelf(FULL_FLAGS);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0100
     * @tc.name ApplicationBundleName001
     * @tc.desc Verify application bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationBundleName_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationBundleName_001 begin');
      expect(full.appInfo.name).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'ApplicationBundleName_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0200
     * @tc.name ApplicationEnabled002
     * @tc.desc Verify application enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationEnabled_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationEnabled_002 begin');
      expect(full.appInfo.enabled).assertTrue();
      Logger.info(TAG, 'ApplicationEnabled_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0300
     * @tc.name ApplicationIsNotSystemApp003
     * @tc.desc Verify application is not system app
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationIsNotSystemApp_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationIsNotSystemApp_003 begin');
      expect(full.appInfo.systemApp).assertFalse();
      Logger.info(TAG, 'ApplicationIsNotSystemApp_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0400
     * @tc.name DebugFlagIsBoolean004
     * @tc.desc Verify debug flag is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DebugFlagIsBoolean_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DebugFlagIsBoolean_004 begin');
      const flag: boolean = full.appInfo.debug;
      Logger.info(TAG, 'flag=' + JSON.stringify(flag));
      expect(flag === true || flag === false).assertTrue();
      Logger.info(TAG, 'DebugFlagIsBoolean_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0500
     * @tc.name EntryAbilityCountIsOne005
     * @tc.desc Verify entry ability count is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityCountIsOne_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityCountIsOne_005 begin');
      let count: number = 0;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              count += 1;
            }
          }
        }
      }
      expect(count).assertEqual(1);
      Logger.info(TAG, 'EntryAbilityCountIsOne_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0600
     * @tc.name EntryAbilityExportedFlag006
     * @tc.desc Verify entry ability exported flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityExportedFlag_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityExportedFlag_006 begin');
      let exported: boolean = false;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              exported = abilities[inner].exported;
            }
          }
        }
      }
      Logger.info(TAG, 'exported=' + JSON.stringify(exported));
      expect(exported === true || exported === false).assertTrue();
      Logger.info(TAG, 'EntryAbilityExportedFlag_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0700
     * @tc.name EntryAbilitySupportsDefaultDevice007
     * @tc.desc Verify entry ability supports default device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilitySupportsDefaultDevice_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilitySupportsDefaultDevice_007 begin');
      let declared: boolean = false;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              if (abilities[inner].deviceTypes.indexOf('default') !== -1) {
                declared = true;
              }
            }
          }
        }
      }
      expect(declared).assertTrue();
      Logger.info(TAG, 'EntryAbilitySupportsDefaultDevice_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0800
     * @tc.name ModuleDeviceTypesCoverDefaultAndTablet008
     * @tc.desc Verify the entry module declares both the default and the tablet device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ModuleDeviceTypesCoverDefaultAndTablet_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ModuleDeviceTypesCoverDefaultAndTablet_008 begin');
      let hasDefault: boolean = false;
      let hasTablet: boolean = false;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const types: Array<string> = full.hapModulesInfo[outer].deviceTypes;
          hasDefault = types.indexOf('default') !== -1;
          hasTablet = types.indexOf('tablet') !== -1;
        }
      }
      expect(hasDefault).assertTrue();
      expect(hasTablet).assertTrue();
      Logger.info(TAG, 'ModuleDeviceTypesCoverDefaultAndTablet_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_0900
     * @tc.name ModuleHasAbilities009
     * @tc.desc Verify module has abilities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ModuleHasAbilities_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ModuleHasAbilities_009 begin');
      let abilities: number = 0;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          abilities = full.hapModulesInfo[outer].abilitiesInfo.length;
        }
      }
      const present: boolean = abilities !== 0;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'ModuleHasAbilities_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_1000
     * @tc.name AbilityNamesUnique010
     * @tc.desc Verify ability names unique
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbilityNamesUnique_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AbilityNamesUnique_010 begin');
      const names: Set<string> = new Set<string>();
      let total: number = 0;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          total = abilities.length;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            names.add(abilities[inner].name);
          }
        }
      }
      expect(names.size).assertEqual(total);
      Logger.info(TAG, 'AbilityNamesUnique_010 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_1100
     * @tc.name ApplicationIconDeclared011
     * @tc.desc Verify application icon declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationIconDeclared_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationIconDeclared_011 begin');
      const iconId: number = full.appInfo.iconId;
      const declared: boolean = iconId !== 0;
      Logger.info(TAG, 'declared=' + JSON.stringify(declared));
      expect(declared).assertTrue();
      Logger.info(TAG, 'ApplicationIconDeclared_011 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLEEXTRA_1200
     * @tc.name ApplicationLabelDeclared012
     * @tc.desc Verify application label declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationLabelDeclared_012', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ApplicationLabelDeclared_012 begin');
      const labelId: number = full.appInfo.labelId;
      const declared: boolean = labelId !== 0;
      Logger.info(TAG, 'declared=' + JSON.stringify(declared));
      expect(declared).assertTrue();
      Logger.info(TAG, 'ApplicationLabelDeclared_012 end');
      done();
    });
  });
}
