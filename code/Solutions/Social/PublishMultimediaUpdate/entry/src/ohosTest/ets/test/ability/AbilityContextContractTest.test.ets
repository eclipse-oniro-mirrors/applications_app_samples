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
import { Driver } from '@ohos.UiTest';
import Logger from '../Logger';
import { BUNDLE, BUNDLE_NAME, SETTLE_PAGE, TAG } from '../common/TestConstant';
import { ensureAppVisible, getTopAbility, launchApp, sleep } from '../common/UiFlowHelper';
/**
 * Directories and identity handed to the ArkUI page.
 * The page itself keeps no files, but the ability context is the object every
 * page uses for resources and storage; a context that reports an empty or
 * relative directory would break any future persistence without failing the UI.
 */
export default function abilityContextContractTest() {
  describe('AbilityContextContractTest', () => {
    let ability: UIAbility | null = null;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      const driver: Driver = Driver.create();
      await launchApp();
      await sleep(SETTLE_PAGE);
      await ensureAppVisible(driver);
      ability = await getTopAbility();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0100
     * @tc.name TempDirAvailable001
     * @tc.desc Verify temp dir available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TempDirAvailable_001', 0, (): void => {
      Logger.info(TAG, 'TempDirAvailable_001 begin');
      if (ability !== null) {
        const dir: string = ability.context.tempDir;
        const usable: boolean = dir.length !== 0 && dir.startsWith('/');
        Logger.info(TAG, 'usable=' + JSON.stringify(usable));
        expect(usable).assertTrue();
      }
      Logger.info(TAG, 'TempDirAvailable_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0200
     * @tc.name ContextDirectoriesUsable002
     * @tc.desc Verify context directories usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextDirectoriesUsable_002', 0, (): void => {
      Logger.info(TAG, 'ContextDirectoriesUsable_002 begin');
      if (ability !== null) {
        const tempDir: string = ability.context.tempDir;
        const databaseDir: string = ability.context.databaseDir;
        const preferencesDir: string = ability.context.preferencesDir;
        const resourceDir: string = ability.context.resourceDir;
        let unusable: number = 0;
        if (tempDir.length === 0) {
          unusable += 1;
        }
        if (databaseDir.length === 0) {
          unusable += 1;
        }
        if (preferencesDir.length === 0) {
          unusable += 1;
        }
        Logger.info(TAG, 'temp=' + tempDir.length + ', database=' + databaseDir.length +
          ', preferences=' + preferencesDir.length + ', resource=' + resourceDir.length);
        Logger.info(TAG, 'unusable=' + unusable);
        expect(unusable).assertEqual(0);
      }
      Logger.info(TAG, 'ContextDirectoriesUsable_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0300
     * @tc.name FilesAndTempDiffer003
     * @tc.desc Verify files and temp differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FilesAndTempDiffer_003', 0, (): void => {
      Logger.info(TAG, 'FilesAndTempDiffer_003 begin');
      if (ability !== null) {
        const files: string = ability.context.filesDir;
        const temp: string = ability.context.tempDir;
        const distinct: boolean = files !== temp;
        Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
        expect(distinct).assertTrue();
      }
      Logger.info(TAG, 'FilesAndTempDiffer_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0400
     * @tc.name ContextDirsStable004
     * @tc.desc Verify context dirs stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ContextDirsStable_004', 0, (): void => {
      Logger.info(TAG, 'ContextDirsStable_004 begin');
      if (ability !== null) {
        const first: string = ability.context.filesDir;
        const second: string = ability.context.filesDir;
        expect(first).assertEqual(second);
      }
      Logger.info(TAG, 'ContextDirsStable_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0500
     * @tc.name ApplicationInfoBundleName005
     * @tc.desc Verify application info bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ApplicationInfoBundleName_005', 0, (): void => {
      Logger.info(TAG, 'ApplicationInfoBundleName_005 begin');
      if (ability !== null) {
        expect(ability.context.applicationInfo.name).assertEqual(BUNDLE_NAME);
      }
      Logger.info(TAG, 'ApplicationInfoBundleName_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0600
     * @tc.name AppContextDirsMatch006
     * @tc.desc Verify app context dirs match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppContextDirsMatch_006', 0, (): void => {
      Logger.info(TAG, 'AppContextDirsMatch_006 begin');
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      if (ability !== null) {
        const appFiles: string = appContext.filesDir;
        const abilityFiles: string = ability.context.filesDir;
        const appScoped: boolean = appFiles.indexOf('/haps/') === -1;
        Logger.info(TAG, 'appScoped=' + appScoped);
        expect(appScoped).assertTrue();
        const moduleScoped: boolean = abilityFiles.indexOf('/haps/') !== -1;
        Logger.info(TAG, 'moduleScoped=' + moduleScoped);
        expect(moduleScoped).assertTrue();
      }
      Logger.info(TAG, 'AppContextDirsMatch_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0700
     * @tc.name AppContextCacheDirPresent007
     * @tc.desc Verify app context cache dir present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppContextCacheDirPresent_007', 0, (): void => {
      Logger.info(TAG, 'AppContextCacheDirPresent_007 begin');
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const present: boolean = appContext.cacheDir.length !== 0;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'AppContextCacheDirPresent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0800
     * @tc.name AreaValueIsNumber008
     * @tc.desc Verify area value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AreaValueIsNumber_008', 0, (): void => {
      Logger.info(TAG, 'AreaValueIsNumber_008 begin');
      if (ability !== null) {
        const area: number = ability.context.area;
        const numeric: boolean = area === Math.floor(area);
        Logger.info(TAG, 'numeric=' + JSON.stringify(numeric));
        expect(numeric).assertTrue();
      }
      Logger.info(TAG, 'AreaValueIsNumber_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_CONTEXT_0900
     * @tc.name BundleCodeDirPresent009
     * @tc.desc Verify bundle code dir present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BundleCodeDirPresent_009', 0, (): void => {
      Logger.info(TAG, 'BundleCodeDirPresent_009 begin');
      if (ability !== null) {
        const dir: string = ability.context.bundleCodeDir;
        const present: boolean = dir.length !== 0;
        Logger.info(TAG, 'present=' + JSON.stringify(present));
        expect(present).assertTrue();
      }
      Logger.info(TAG, 'BundleCodeDirPresent_009 end');
    });
  });
}
