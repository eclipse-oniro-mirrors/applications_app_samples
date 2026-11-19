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
let info: bundleManager.BundleInfo;

export default function launcherPlusBundleDeepTest() {
  describe('LauncherPlusBundleDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testLauncherPlusBundleDeep0001
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0001
     * @tc.desc   Inspect launcher permission entry 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 1 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0002
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0002
     * @tc.desc   Inspect launcher permission entry 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 2 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0003
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0003
     * @tc.desc   Inspect launcher permission entry 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 3 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0004
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0004
     * @tc.desc   Inspect launcher permission entry 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 4 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0005
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0005
     * @tc.desc   Inspect launcher permission entry 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 5 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0006
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0006
     * @tc.desc   Inspect launcher permission entry 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 6 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0007
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0007
     * @tc.desc   Inspect launcher permission entry 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 7 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0008
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0008
     * @tc.desc   Inspect launcher permission entry 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 8 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0009
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0009
     * @tc.desc   Inspect launcher permission entry 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 9 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0010
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0010
     * @tc.desc   Inspect launcher permission entry 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 10 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0011
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0011
     * @tc.desc   Inspect launcher permission entry 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 11 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0012
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0012
     * @tc.desc   Inspect launcher permission entry 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 12 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0013
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0013
     * @tc.desc   Inspect launcher permission entry 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 13 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0014
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0014
     * @tc.desc   Inspect launcher permission entry 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 14 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0015
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0015
     * @tc.desc   Inspect launcher permission entry 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 15 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0016
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0016
     * @tc.desc   Inspect launcher permission entry 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 16 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0017
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0017
     * @tc.desc   Inspect launcher permission entry 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 17 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0018
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0018
     * @tc.desc   Inspect launcher permission entry 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 18 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0019
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0019
     * @tc.desc   Inspect launcher permission entry 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 19 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0020
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0020
     * @tc.desc   Inspect launcher permission entry 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 20 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0021
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0021
     * @tc.desc   Inspect launcher permission entry 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 21 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0022
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0022
     * @tc.desc   Inspect launcher permission entry 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 22 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0023
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0023
     * @tc.desc   Inspect launcher permission entry 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 23 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0024
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0024
     * @tc.desc   Inspect launcher permission entry 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 24 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0025
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0025
     * @tc.desc   Inspect launcher permission entry 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 25 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0026
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0026
     * @tc.desc   Inspect launcher permission entry 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 26 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0027
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0027
     * @tc.desc   Inspect launcher permission entry 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 27 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0028
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0028
     * @tc.desc   Inspect launcher permission entry 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 28 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0029
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0029
     * @tc.desc   Inspect launcher permission entry 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 29 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0030
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0030
     * @tc.desc   Inspect launcher permission entry 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 30 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0031
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0031
     * @tc.desc   Inspect launcher permission entry 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 31 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0032
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0032
     * @tc.desc   Inspect launcher permission entry 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 32 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0033
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0033
     * @tc.desc   Inspect launcher permission entry 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 33 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0034
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0034
     * @tc.desc   Inspect launcher permission entry 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 34 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0035
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0035
     * @tc.desc   Inspect launcher permission entry 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 35 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0036
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0036
     * @tc.desc   Inspect launcher permission entry 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 36 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0037
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0037
     * @tc.desc   Inspect launcher permission entry 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 37 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0038
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0038
     * @tc.desc   Inspect launcher permission entry 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 38 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0039
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0039
     * @tc.desc   Inspect launcher permission entry 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 39 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0040
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0040
     * @tc.desc   Inspect launcher permission entry 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 40 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0041
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0041
     * @tc.desc   Inspect launcher permission entry 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 41 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0042
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0042
     * @tc.desc   Inspect launcher permission entry 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 42 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0043
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0043
     * @tc.desc   Inspect launcher permission entry 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 43 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0044
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0044
     * @tc.desc   Inspect launcher permission entry 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 44 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0045
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0045
     * @tc.desc   Inspect launcher permission entry 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 45 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0046
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0046
     * @tc.desc   Inspect launcher permission entry 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 46 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0047
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0047
     * @tc.desc   Inspect launcher permission entry 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 47 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0048
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0048
     * @tc.desc   Inspect launcher permission entry 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 48 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0049
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0049
     * @tc.desc   Inspect launcher permission entry 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 49 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0050
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0050
     * @tc.desc   Inspect launcher permission entry 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 50 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0051
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0051
     * @tc.desc   Inspect launcher permission entry 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 51 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0052
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0052
     * @tc.desc   Inspect launcher permission entry 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 52 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0053
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0053
     * @tc.desc   Inspect launcher permission entry 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 53 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0054
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0054
     * @tc.desc   Inspect launcher permission entry 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 54 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0055
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0055
     * @tc.desc   Inspect launcher permission entry 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 55 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0056
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0056
     * @tc.desc   Inspect launcher permission entry 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 56 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0057
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0057
     * @tc.desc   Inspect launcher permission entry 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 57 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0058
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0058
     * @tc.desc   Inspect launcher permission entry 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 58 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0059
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0059
     * @tc.desc   Inspect launcher permission entry 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 59 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusBundleDeep0060
     * @tc.number SUB_LAUNCHER_PLUS_BUNDLE_DEEP_0060
     * @tc.desc   Inspect launcher permission entry 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBundleDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const permissionIndex: number = 60 % info.reqPermissionDetails.length;
      expect(info.reqPermissionDetails[permissionIndex].name.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].reason.length > 0).assertTrue();
      expect(info.reqPermissionDetails[permissionIndex].usedScene.abilities.length > 0).assertTrue();
    })
  })
}
