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
import bundleManager from '@ohos.bundle.bundleManager';
let info: bundleManager.BundleInfo;

export default function wlanConfigContractTest() {
  describe('WlanConfigContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanConfigIdentity0001
     * @tc.number SUB_WLAN_CONFIG_0001
     * @tc.desc   Verify Wlan application identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.wlan'); expect(info.appInfo.name).assertEqual('ohos.samples.wlan'); expect(info.versionName).assertEqual('1.0.0');
    })

    /**
     * @tc.name   testWlanConfigVersion0002
     * @tc.number SUB_WLAN_CONFIG_0002
     * @tc.desc   Verify version code and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigVersion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.versionCode).assertEqual(1000000); expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigModule0003
     * @tc.number SUB_WLAN_CONFIG_0003
     * @tc.desc   Verify entry module type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let module: bundleManager.HapModuleInfo | undefined = undefined; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { if (info.hapModulesInfo[i].name === 'entry') { module = info.hapModulesInfo[i]; } } expect(module !== undefined).assertTrue(); const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo; expect(mod.name).assertEqual('entry'); expect(mod.installationFree).assertFalse();
    })

    /**
     * @tc.name   testWlanConfigDeviceTypes0004
     * @tc.number SUB_WLAN_CONFIG_0004
     * @tc.desc   Verify supported device types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigDeviceTypes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let module: bundleManager.HapModuleInfo | undefined = undefined; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { if (info.hapModulesInfo[i].name === 'entry') { module = info.hapModulesInfo[i]; } } expect(module !== undefined).assertTrue(); const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo; expect(mod.deviceTypes.includes('default')).assertTrue(); expect(mod.deviceTypes.includes('tablet')).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigPermission0005
     * @tc.number SUB_WLAN_CONFIG_0005
     * @tc.desc   Verify requested permission GET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigPermission0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>(); for (let index: number = 0; index < info.reqPermissionDetails.length; index++) { names.add(info.reqPermissionDetails[index].name); expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue(); } expect(names.has('ohos.permission.GET_WIFI_INFO')).assertTrue(); expect(names.size >= 4).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigPermission0006
     * @tc.number SUB_WLAN_CONFIG_0006
     * @tc.desc   Verify requested permission SET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigPermission0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>(); for (let index: number = 0; index < info.reqPermissionDetails.length; index++) { names.add(info.reqPermissionDetails[index].name); expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue(); } expect(names.has('ohos.permission.SET_WIFI_INFO')).assertTrue(); expect(names.size >= 4).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigPermission0007
     * @tc.number SUB_WLAN_CONFIG_0007
     * @tc.desc   Verify requested permission LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigPermission0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>(); for (let index: number = 0; index < info.reqPermissionDetails.length; index++) { names.add(info.reqPermissionDetails[index].name); expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue(); } expect(names.has('ohos.permission.LOCATION')).assertTrue(); expect(names.size >= 4).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigPermission0008
     * @tc.number SUB_WLAN_CONFIG_0008
     * @tc.desc   Verify requested permission APPROXIMATELY_LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigPermission0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>(); for (let index: number = 0; index < info.reqPermissionDetails.length; index++) { names.add(info.reqPermissionDetails[index].name); expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue(); } expect(names.has('ohos.permission.APPROXIMATELY_LOCATION')).assertTrue(); expect(names.size >= 4).assertTrue();
    })

    /**
     * @tc.name   testWlanConfigPermissionCount0009
     * @tc.number SUB_WLAN_CONFIG_0009
     * @tc.desc   Verify permission count and scenes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanConfigPermissionCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 4).assertTrue(); for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { expect(info.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue(); expect(info.reqPermissionDetails[i].usedScene.when.length > 0).assertTrue(); }
    })
  })
}
