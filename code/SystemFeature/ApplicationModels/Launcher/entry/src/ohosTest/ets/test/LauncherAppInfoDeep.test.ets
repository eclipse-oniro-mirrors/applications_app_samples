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
export default function launcherAppInfoDeepTest() {
  describe('LauncherAppInfoDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testAppInfoDeep0001
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0001
     * @tc.desc   Test Launcher app info deep case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0002
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0002
     * @tc.desc   Test Launcher app info deep case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0003
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0003
     * @tc.desc   Test Launcher app info deep case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0004
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0004
     * @tc.desc   Test Launcher app info deep case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0005
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0005
     * @tc.desc   Test Launcher app info deep case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0006
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0006
     * @tc.desc   Test Launcher app info deep case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0007
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0007
     * @tc.desc   Test Launcher app info deep case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0008
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0008
     * @tc.desc   Test Launcher app info deep case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0009
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0009
     * @tc.desc   Test Launcher app info deep case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0010
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0010
     * @tc.desc   Test Launcher app info deep case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0011
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0011
     * @tc.desc   Test Launcher app info deep case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0012
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0012
     * @tc.desc   Test Launcher app info deep case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0013
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0013
     * @tc.desc   Test Launcher app info deep case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0014
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0014
     * @tc.desc   Test Launcher app info deep case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0015
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0015
     * @tc.desc   Test Launcher app info deep case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0016
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0016
     * @tc.desc   Test Launcher app info deep case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0017
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0017
     * @tc.desc   Test Launcher app info deep case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0018
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0018
     * @tc.desc   Test Launcher app info deep case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0019
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0019
     * @tc.desc   Test Launcher app info deep case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0020
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0020
     * @tc.desc   Test Launcher app info deep case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0021
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0021
     * @tc.desc   Test Launcher app info deep case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0022
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0022
     * @tc.desc   Test Launcher app info deep case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0023
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0023
     * @tc.desc   Test Launcher app info deep case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0024
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0024
     * @tc.desc   Test Launcher app info deep case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0025
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0025
     * @tc.desc   Test Launcher app info deep case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0026
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0026
     * @tc.desc   Test Launcher app info deep case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0027
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0027
     * @tc.desc   Test Launcher app info deep case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0028
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0028
     * @tc.desc   Test Launcher app info deep case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0029
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0029
     * @tc.desc   Test Launcher app info deep case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0030
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0030
     * @tc.desc   Test Launcher app info deep case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0031
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0031
     * @tc.desc   Test Launcher app info deep case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0032
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0032
     * @tc.desc   Test Launcher app info deep case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0033
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0033
     * @tc.desc   Test Launcher app info deep case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0034
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0034
     * @tc.desc   Test Launcher app info deep case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0035
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0035
     * @tc.desc   Test Launcher app info deep case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0036
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0036
     * @tc.desc   Test Launcher app info deep case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0037
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0037
     * @tc.desc   Test Launcher app info deep case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0038
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0038
     * @tc.desc   Test Launcher app info deep case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0039
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0039
     * @tc.desc   Test Launcher app info deep case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })

    /**
     * @tc.name   testAppInfoDeep0040
     * @tc.number SUB_LAUNCHER_APP_INFO_DEEP_0040
     * @tc.desc   Test Launcher app info deep case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppInfoDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
      expect(info.appInfo.debug).assertTrue();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
    })
  })
}
