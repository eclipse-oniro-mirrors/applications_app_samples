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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'ohos.samples.launcher';
const ENTRY_MODULE: string = 'entry';
let bundleInfo: bundleManager.BundleInfo;

export default function bundleContractTest() {
  describe('LauncherBundleContractTest', () => {

    beforeAll(() => {
      const flag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flag);
    })

    /**
     * @tc.name   testBundleIdentity0001
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0100
     * @tc.desc   Test the bundle identity fields configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testSystemAppFlag0002
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0200
     * @tc.desc   Test that the launcher is packaged as a system application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSystemAppFlag0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.debug).assertTrue();
    })

    /**
     * @tc.name   testEntryModule0003
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0300
     * @tc.desc   Test the entry module metadata and supported device types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEntryModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        if (bundleInfo.hapModulesInfo[i].name === ENTRY_MODULE) {
          entryModule = bundleInfo.hapModulesInfo[i];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.deviceTypes.includes('default')).assertTrue();
      expect(entryModule?.deviceTypes.includes('tablet')).assertTrue();
      expect(entryModule?.mainElementName).assertEqual('HomeAbility');
    })

    /**
     * @tc.name   testMainElementDeclared0004
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0400
     * @tc.desc   Test that the entry module declares the HomeAbility main element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainElementDeclared0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        if (bundleInfo.hapModulesInfo[i].name === ENTRY_MODULE) {
          entryModule = bundleInfo.hapModulesInfo[i];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.mainElementName).assertEqual('HomeAbility');
    })

    /**
     * @tc.name   testRequestedPermissions0005
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0500
     * @tc.desc   Test that the launcher declares its system permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestedPermissions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      let foundInstall: boolean = false;
      let foundMission: boolean = false;
      for (let i = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.INSTALL_BUNDLE') {
          foundInstall = true;
        }
        if (name === 'ohos.permission.MANAGE_MISSIONS') {
          foundMission = true;
        }
      }
      expect(foundInstall).assertTrue();
      expect(foundMission).assertTrue();
    })

    /**
     * @tc.name   testInstallTimestamps0006
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0600
     * @tc.desc   Test that install and update timestamps are populated consistently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInstallTimestamps0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.installTime >= 0).assertTrue();
      expect(bundleInfo.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAppCodePath0007
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0700
     * @tc.desc   Test that the application code path and label resource are available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppCodePath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testPermissionDetailsUnique0008
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_0800
     * @tc.desc   Test that requested permission names are unique.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionDetailsUnique0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testEntryInstallationFree0010
     * @tc.number SUB_LAUNCHER_ENTRY_BUNDLE_1000
     * @tc.desc   Test that the entry module is a non-installation-free module.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEntryInstallationFree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        if (bundleInfo.hapModulesInfo[i].name === ENTRY_MODULE) {
          found = true;
          expect(bundleInfo.hapModulesInfo[i].installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

  })
}
