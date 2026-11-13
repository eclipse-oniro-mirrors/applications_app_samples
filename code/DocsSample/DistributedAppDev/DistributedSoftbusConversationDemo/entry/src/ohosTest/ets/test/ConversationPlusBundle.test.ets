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

export default function conversationPlusBundleTest() {
  describe('ConversationPlusBundleTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testSoftbusPlusBundle0001
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0001
     * @tc.desc   Inspect conversation bundle module 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 1 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0002
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0002
     * @tc.desc   Inspect conversation bundle module 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 2 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0003
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0003
     * @tc.desc   Inspect conversation bundle module 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 3 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0004
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0004
     * @tc.desc   Inspect conversation bundle module 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 4 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0005
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0005
     * @tc.desc   Inspect conversation bundle module 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 5 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0006
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0006
     * @tc.desc   Inspect conversation bundle module 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 6 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0007
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0007
     * @tc.desc   Inspect conversation bundle module 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 7 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0008
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0008
     * @tc.desc   Inspect conversation bundle module 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 8 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0009
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0009
     * @tc.desc   Inspect conversation bundle module 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 9 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0010
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0010
     * @tc.desc   Inspect conversation bundle module 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 10 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0011
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0011
     * @tc.desc   Inspect conversation bundle module 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 11 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0012
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0012
     * @tc.desc   Inspect conversation bundle module 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 12 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0013
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0013
     * @tc.desc   Inspect conversation bundle module 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 13 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0014
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0014
     * @tc.desc   Inspect conversation bundle module 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 14 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0015
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0015
     * @tc.desc   Inspect conversation bundle module 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 15 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0016
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0016
     * @tc.desc   Inspect conversation bundle module 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 16 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0017
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0017
     * @tc.desc   Inspect conversation bundle module 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 17 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0018
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0018
     * @tc.desc   Inspect conversation bundle module 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 18 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0019
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0019
     * @tc.desc   Inspect conversation bundle module 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 19 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0020
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0020
     * @tc.desc   Inspect conversation bundle module 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 20 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0021
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0021
     * @tc.desc   Inspect conversation bundle module 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 21 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0022
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0022
     * @tc.desc   Inspect conversation bundle module 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 22 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0023
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0023
     * @tc.desc   Inspect conversation bundle module 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 23 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0024
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0024
     * @tc.desc   Inspect conversation bundle module 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 24 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0025
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0025
     * @tc.desc   Inspect conversation bundle module 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 25 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0026
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0026
     * @tc.desc   Inspect conversation bundle module 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 26 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0027
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0027
     * @tc.desc   Inspect conversation bundle module 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 27 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0028
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0028
     * @tc.desc   Inspect conversation bundle module 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 28 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0029
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0029
     * @tc.desc   Inspect conversation bundle module 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 29 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0030
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0030
     * @tc.desc   Inspect conversation bundle module 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 30 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0031
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0031
     * @tc.desc   Inspect conversation bundle module 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 31 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0032
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0032
     * @tc.desc   Inspect conversation bundle module 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 32 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0033
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0033
     * @tc.desc   Inspect conversation bundle module 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 33 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0034
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0034
     * @tc.desc   Inspect conversation bundle module 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 34 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0035
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0035
     * @tc.desc   Inspect conversation bundle module 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 35 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0036
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0036
     * @tc.desc   Inspect conversation bundle module 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 36 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0037
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0037
     * @tc.desc   Inspect conversation bundle module 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 37 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0038
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0038
     * @tc.desc   Inspect conversation bundle module 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 38 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0039
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0039
     * @tc.desc   Inspect conversation bundle module 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 39 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0040
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0040
     * @tc.desc   Inspect conversation bundle module 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 40 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0041
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0041
     * @tc.desc   Inspect conversation bundle module 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 41 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0042
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0042
     * @tc.desc   Inspect conversation bundle module 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 42 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0043
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0043
     * @tc.desc   Inspect conversation bundle module 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 43 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0044
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0044
     * @tc.desc   Inspect conversation bundle module 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 44 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0045
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0045
     * @tc.desc   Inspect conversation bundle module 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 45 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0046
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0046
     * @tc.desc   Inspect conversation bundle module 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 46 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0047
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0047
     * @tc.desc   Inspect conversation bundle module 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 47 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0048
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0048
     * @tc.desc   Inspect conversation bundle module 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 48 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0049
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0049
     * @tc.desc   Inspect conversation bundle module 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 49 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0050
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0050
     * @tc.desc   Inspect conversation bundle module 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 50 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0051
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0051
     * @tc.desc   Inspect conversation bundle module 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 51 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0052
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0052
     * @tc.desc   Inspect conversation bundle module 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 52 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0053
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0053
     * @tc.desc   Inspect conversation bundle module 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 53 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0054
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0054
     * @tc.desc   Inspect conversation bundle module 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 54 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0055
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0055
     * @tc.desc   Inspect conversation bundle module 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 55 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0056
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0056
     * @tc.desc   Inspect conversation bundle module 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 56 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0057
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0057
     * @tc.desc   Inspect conversation bundle module 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 57 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0058
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0058
     * @tc.desc   Inspect conversation bundle module 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 58 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0059
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0059
     * @tc.desc   Inspect conversation bundle module 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 59 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusBundle0060
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_0060
     * @tc.desc   Inspect conversation bundle module 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleIndex: number = 60 % info.hapModulesInfo.length;
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[moduleIndex];
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(module.abilitiesInfo.length > 0).assertTrue();
    })
  })
}
