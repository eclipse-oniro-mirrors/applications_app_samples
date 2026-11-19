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
export default function launcherBundleDeep2Test() {
  describe('LauncherBundleDeep2Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   testBundleDeep20001
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0001
     * @tc.desc   Test Launcher bundle deep2 case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20002
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0002
     * @tc.desc   Test Launcher bundle deep2 case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20003
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0003
     * @tc.desc   Test Launcher bundle deep2 case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20004
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0004
     * @tc.desc   Test Launcher bundle deep2 case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20005
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0005
     * @tc.desc   Test Launcher bundle deep2 case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20006
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0006
     * @tc.desc   Test Launcher bundle deep2 case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20007
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0007
     * @tc.desc   Test Launcher bundle deep2 case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20008
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0008
     * @tc.desc   Test Launcher bundle deep2 case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20009
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0009
     * @tc.desc   Test Launcher bundle deep2 case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20010
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0010
     * @tc.desc   Test Launcher bundle deep2 case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20011
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0011
     * @tc.desc   Test Launcher bundle deep2 case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20012
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0012
     * @tc.desc   Test Launcher bundle deep2 case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20013
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0013
     * @tc.desc   Test Launcher bundle deep2 case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20014
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0014
     * @tc.desc   Test Launcher bundle deep2 case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20015
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0015
     * @tc.desc   Test Launcher bundle deep2 case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20016
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0016
     * @tc.desc   Test Launcher bundle deep2 case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20017
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0017
     * @tc.desc   Test Launcher bundle deep2 case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20018
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0018
     * @tc.desc   Test Launcher bundle deep2 case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20019
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0019
     * @tc.desc   Test Launcher bundle deep2 case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20020
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0020
     * @tc.desc   Test Launcher bundle deep2 case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20021
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0021
     * @tc.desc   Test Launcher bundle deep2 case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20022
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0022
     * @tc.desc   Test Launcher bundle deep2 case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20023
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0023
     * @tc.desc   Test Launcher bundle deep2 case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20024
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0024
     * @tc.desc   Test Launcher bundle deep2 case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20025
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0025
     * @tc.desc   Test Launcher bundle deep2 case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20026
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0026
     * @tc.desc   Test Launcher bundle deep2 case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20027
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0027
     * @tc.desc   Test Launcher bundle deep2 case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20028
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0028
     * @tc.desc   Test Launcher bundle deep2 case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20029
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0029
     * @tc.desc   Test Launcher bundle deep2 case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20030
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0030
     * @tc.desc   Test Launcher bundle deep2 case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20031
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0031
     * @tc.desc   Test Launcher bundle deep2 case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20032
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0032
     * @tc.desc   Test Launcher bundle deep2 case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20033
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0033
     * @tc.desc   Test Launcher bundle deep2 case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20034
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0034
     * @tc.desc   Test Launcher bundle deep2 case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20035
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0035
     * @tc.desc   Test Launcher bundle deep2 case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20036
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0036
     * @tc.desc   Test Launcher bundle deep2 case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20037
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0037
     * @tc.desc   Test Launcher bundle deep2 case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20038
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0038
     * @tc.desc   Test Launcher bundle deep2 case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20039
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0039
     * @tc.desc   Test Launcher bundle deep2 case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20040
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0040
     * @tc.desc   Test Launcher bundle deep2 case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20041
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0041
     * @tc.desc   Test Launcher bundle deep2 case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20042
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0042
     * @tc.desc   Test Launcher bundle deep2 case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20043
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0043
     * @tc.desc   Test Launcher bundle deep2 case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20044
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0044
     * @tc.desc   Test Launcher bundle deep2 case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20045
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0045
     * @tc.desc   Test Launcher bundle deep2 case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20046
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0046
     * @tc.desc   Test Launcher bundle deep2 case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20047
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0047
     * @tc.desc   Test Launcher bundle deep2 case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20048
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0048
     * @tc.desc   Test Launcher bundle deep2 case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20049
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0049
     * @tc.desc   Test Launcher bundle deep2 case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep20050
     * @tc.number SUB_LAUNCHER_BUNDLE_DEEP2_0050
     * @tc.desc   Test Launcher bundle deep2 case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.vendor).assertEqual('samples');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.appInfo.systemApp).assertTrue();
    })
  })
}
