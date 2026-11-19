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
let bundleInfo: bundleManager.BundleInfo;

export default function movingPhotoPlusBundleTest() {
  describe('MovingPhotoPlusBundleTest', () => {
    beforeAll(() => { const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY; bundleInfo = bundleManager.getBundleInfoForSelfSync(flags); })

    /**
     * @tc.name   testMpPlusBundle0001
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0001
     * @tc.desc   Inspect moving photo bundle module 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 1 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0002
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0002
     * @tc.desc   Inspect moving photo bundle module 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 2 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0003
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0003
     * @tc.desc   Inspect moving photo bundle module 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 3 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0004
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0004
     * @tc.desc   Inspect moving photo bundle module 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 4 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0005
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0005
     * @tc.desc   Inspect moving photo bundle module 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 5 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0006
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0006
     * @tc.desc   Inspect moving photo bundle module 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 6 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0007
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0007
     * @tc.desc   Inspect moving photo bundle module 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 7 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0008
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0008
     * @tc.desc   Inspect moving photo bundle module 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 8 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0009
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0009
     * @tc.desc   Inspect moving photo bundle module 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 9 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0010
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0010
     * @tc.desc   Inspect moving photo bundle module 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 10 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0011
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0011
     * @tc.desc   Inspect moving photo bundle module 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 11 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0012
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0012
     * @tc.desc   Inspect moving photo bundle module 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 12 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0013
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0013
     * @tc.desc   Inspect moving photo bundle module 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 13 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0014
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0014
     * @tc.desc   Inspect moving photo bundle module 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 14 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0015
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0015
     * @tc.desc   Inspect moving photo bundle module 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 15 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0016
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0016
     * @tc.desc   Inspect moving photo bundle module 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 16 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0017
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0017
     * @tc.desc   Inspect moving photo bundle module 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 17 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0018
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0018
     * @tc.desc   Inspect moving photo bundle module 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 18 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0019
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0019
     * @tc.desc   Inspect moving photo bundle module 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 19 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0020
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0020
     * @tc.desc   Inspect moving photo bundle module 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 20 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0021
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0021
     * @tc.desc   Inspect moving photo bundle module 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 21 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0022
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0022
     * @tc.desc   Inspect moving photo bundle module 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 22 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0023
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0023
     * @tc.desc   Inspect moving photo bundle module 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 23 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0024
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0024
     * @tc.desc   Inspect moving photo bundle module 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 24 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0025
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0025
     * @tc.desc   Inspect moving photo bundle module 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 25 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0026
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0026
     * @tc.desc   Inspect moving photo bundle module 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 26 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0027
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0027
     * @tc.desc   Inspect moving photo bundle module 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 27 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0028
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0028
     * @tc.desc   Inspect moving photo bundle module 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 28 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0029
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0029
     * @tc.desc   Inspect moving photo bundle module 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 29 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0030
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0030
     * @tc.desc   Inspect moving photo bundle module 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 30 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0031
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0031
     * @tc.desc   Inspect moving photo bundle module 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 31 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0032
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0032
     * @tc.desc   Inspect moving photo bundle module 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 32 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0033
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0033
     * @tc.desc   Inspect moving photo bundle module 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 33 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0034
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0034
     * @tc.desc   Inspect moving photo bundle module 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 34 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0035
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0035
     * @tc.desc   Inspect moving photo bundle module 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 35 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0036
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0036
     * @tc.desc   Inspect moving photo bundle module 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 36 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0037
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0037
     * @tc.desc   Inspect moving photo bundle module 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 37 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0038
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0038
     * @tc.desc   Inspect moving photo bundle module 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 38 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0039
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0039
     * @tc.desc   Inspect moving photo bundle module 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 39 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0040
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0040
     * @tc.desc   Inspect moving photo bundle module 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 40 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0041
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0041
     * @tc.desc   Inspect moving photo bundle module 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 41 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0042
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0042
     * @tc.desc   Inspect moving photo bundle module 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 42 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0043
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0043
     * @tc.desc   Inspect moving photo bundle module 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 43 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0044
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0044
     * @tc.desc   Inspect moving photo bundle module 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 44 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0045
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0045
     * @tc.desc   Inspect moving photo bundle module 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 45 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0046
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0046
     * @tc.desc   Inspect moving photo bundle module 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 46 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0047
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0047
     * @tc.desc   Inspect moving photo bundle module 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 47 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0048
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0048
     * @tc.desc   Inspect moving photo bundle module 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 48 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0049
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0049
     * @tc.desc   Inspect moving photo bundle module 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 49 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0050
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0050
     * @tc.desc   Inspect moving photo bundle module 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 50 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0051
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0051
     * @tc.desc   Inspect moving photo bundle module 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 51 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0052
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0052
     * @tc.desc   Inspect moving photo bundle module 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 52 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0053
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0053
     * @tc.desc   Inspect moving photo bundle module 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 53 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0054
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0054
     * @tc.desc   Inspect moving photo bundle module 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 54 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0055
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0055
     * @tc.desc   Inspect moving photo bundle module 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 55 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0056
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0056
     * @tc.desc   Inspect moving photo bundle module 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 56 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0057
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0057
     * @tc.desc   Inspect moving photo bundle module 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 57 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0058
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0058
     * @tc.desc   Inspect moving photo bundle module 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 58 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0059
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0059
     * @tc.desc   Inspect moving photo bundle module 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 59 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundle0060
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_0060
     * @tc.desc   Inspect moving photo bundle module 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.movingphotoviewsample');
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 60 % bundleInfo.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
    })
  })
}
