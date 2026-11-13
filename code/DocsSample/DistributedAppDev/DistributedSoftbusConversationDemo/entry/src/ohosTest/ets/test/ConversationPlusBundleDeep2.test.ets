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

export default function conversationPlusBundleDeep2Test() {
  describe('ConversationPlusBundleDeep2Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20001
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0001
     * @tc.desc   Inspect conversation module details 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20002
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0002
     * @tc.desc   Inspect conversation module details 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20003
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0003
     * @tc.desc   Inspect conversation module details 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20004
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0004
     * @tc.desc   Inspect conversation module details 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20005
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0005
     * @tc.desc   Inspect conversation module details 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20006
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0006
     * @tc.desc   Inspect conversation module details 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20007
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0007
     * @tc.desc   Inspect conversation module details 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20008
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0008
     * @tc.desc   Inspect conversation module details 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20009
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0009
     * @tc.desc   Inspect conversation module details 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20010
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0010
     * @tc.desc   Inspect conversation module details 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20011
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0011
     * @tc.desc   Inspect conversation module details 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20012
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0012
     * @tc.desc   Inspect conversation module details 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20013
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0013
     * @tc.desc   Inspect conversation module details 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20014
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0014
     * @tc.desc   Inspect conversation module details 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20015
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0015
     * @tc.desc   Inspect conversation module details 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20016
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0016
     * @tc.desc   Inspect conversation module details 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20017
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0017
     * @tc.desc   Inspect conversation module details 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20018
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0018
     * @tc.desc   Inspect conversation module details 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20019
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0019
     * @tc.desc   Inspect conversation module details 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20020
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0020
     * @tc.desc   Inspect conversation module details 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20021
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0021
     * @tc.desc   Inspect conversation module details 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20022
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0022
     * @tc.desc   Inspect conversation module details 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20023
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0023
     * @tc.desc   Inspect conversation module details 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20024
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0024
     * @tc.desc   Inspect conversation module details 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20025
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0025
     * @tc.desc   Inspect conversation module details 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20026
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0026
     * @tc.desc   Inspect conversation module details 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20027
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0027
     * @tc.desc   Inspect conversation module details 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20028
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0028
     * @tc.desc   Inspect conversation module details 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20029
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0029
     * @tc.desc   Inspect conversation module details 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20030
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0030
     * @tc.desc   Inspect conversation module details 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20031
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0031
     * @tc.desc   Inspect conversation module details 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20032
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0032
     * @tc.desc   Inspect conversation module details 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20033
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0033
     * @tc.desc   Inspect conversation module details 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20034
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0034
     * @tc.desc   Inspect conversation module details 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20035
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0035
     * @tc.desc   Inspect conversation module details 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20036
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0036
     * @tc.desc   Inspect conversation module details 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20037
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0037
     * @tc.desc   Inspect conversation module details 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20038
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0038
     * @tc.desc   Inspect conversation module details 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20039
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0039
     * @tc.desc   Inspect conversation module details 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20040
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0040
     * @tc.desc   Inspect conversation module details 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20041
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0041
     * @tc.desc   Inspect conversation module details 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20042
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0042
     * @tc.desc   Inspect conversation module details 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20043
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0043
     * @tc.desc   Inspect conversation module details 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20044
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0044
     * @tc.desc   Inspect conversation module details 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20045
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0045
     * @tc.desc   Inspect conversation module details 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20046
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0046
     * @tc.desc   Inspect conversation module details 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20047
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0047
     * @tc.desc   Inspect conversation module details 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20048
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0048
     * @tc.desc   Inspect conversation module details 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20049
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0049
     * @tc.desc   Inspect conversation module details 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20050
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0050
     * @tc.desc   Inspect conversation module details 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20051
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0051
     * @tc.desc   Inspect conversation module details 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20052
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0052
     * @tc.desc   Inspect conversation module details 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20053
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0053
     * @tc.desc   Inspect conversation module details 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20054
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0054
     * @tc.desc   Inspect conversation module details 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20055
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0055
     * @tc.desc   Inspect conversation module details 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20056
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0056
     * @tc.desc   Inspect conversation module details 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20057
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0057
     * @tc.desc   Inspect conversation module details 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20058
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0058
     * @tc.desc   Inspect conversation module details 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20059
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0059
     * @tc.desc   Inspect conversation module details 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusBundleDeep20060
     * @tc.number SUB_SOFTBUS_PLUS_BUNDLE_DEEP2_0060
     * @tc.desc   Inspect conversation module details 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBundleDeep20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      const module: bundleManager.HapModuleInfo = entry as bundleManager.HapModuleInfo;
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.extensionAbilitiesInfo.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
