/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common, Want } from '@kit.AbilityKit';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';

const BUNDLE_NAME: string = 'com.samples.reasonable_using_system_interfaces';
const ENTRY_ABILITY_NAME: string = 'EntryAbility';
const EXPECTED_VERSION_NAME: string = '1.0.0';
const EXPECTED_VERSION_CODE: number = 1000000;

export default function abilityTest(): void {
  describe('EntryAbilityTest', (): void => {
    let appContext: common.Context;

    beforeAll((): void => {
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    });

    /**
     * @tc.name   testAppContext0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_ABILITY_0100
     * @tc.desc   Test that the app context and resource manager are available and the app name equals the bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testAppContext0001';
      InterfaceTestLog.begin(name, `bundleName=${BUNDLE_NAME}`);
      InterfaceTestLog.flag(name, 'contextAvailable expected=true', appContext !== undefined);
      expect(appContext !== undefined).assertTrue();
      InterfaceTestLog.flag(name, 'resourceManagerAvailable expected=true', appContext.resourceManager !== undefined);
      expect(appContext.resourceManager !== undefined).assertTrue();
      InterfaceTestLog.value(name, 'applicationName', BUNDLE_NAME, appContext.applicationInfo.name);
      expect(appContext.applicationInfo.name).assertEqual(BUNDLE_NAME);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testBundleInfo0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_ABILITY_0200
     * @tc.desc   Test that the bundle name of the app itself equals the value configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBundleInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testBundleInfo0001';
      InterfaceTestLog.begin(name, 'bundleFlag=GET_BUNDLE_INFO_DEFAULT');
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      InterfaceTestLog.value(name, 'bundleName', BUNDLE_NAME, bundleInfo.name);
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testBundleVersion0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_ABILITY_0300
     * @tc.desc   Test that versionName and versionCode equal the values configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBundleVersion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testBundleVersion0001';
      InterfaceTestLog.begin(name, 'bundleFlag=GET_BUNDLE_INFO_DEFAULT');
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      InterfaceTestLog.value(name, 'versionName', EXPECTED_VERSION_NAME, bundleInfo.versionName);
      expect(bundleInfo.versionName).assertEqual(EXPECTED_VERSION_NAME);
      InterfaceTestLog.number(name, 'versionCode', EXPECTED_VERSION_CODE, bundleInfo.versionCode);
      expect(bundleInfo.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testStartEntryAbility0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_ABILITY_0400
     * @tc.desc   Test that the entry ability can be started without error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartEntryAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const name: string = 'testStartEntryAbility0001';
      InterfaceTestLog.begin(name, `bundleName=${BUNDLE_NAME},abilityName=${ENTRY_ABILITY_NAME}`);
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY_NAME
      };
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let isStarted: boolean = false;
      await abilityDelegator.startAbility(want);
      isStarted = true;
      InterfaceTestLog.flag(name, 'abilityStarted expected=true', isStarted);
      expect(isStarted).assertTrue();
      InterfaceTestLog.end(name);
    });
  });
}
