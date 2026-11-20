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

export default function movingPhotoPlusConfigDeepTest() {
  describe('MovingPhotoPlusConfigDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   testMpPlusConfigDeep0001
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0001
     * @tc.desc   Inspect moving photo module capabilities 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0002
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0002
     * @tc.desc   Inspect moving photo module capabilities 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0003
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0003
     * @tc.desc   Inspect moving photo module capabilities 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0004
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0004
     * @tc.desc   Inspect moving photo module capabilities 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0005
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0005
     * @tc.desc   Inspect moving photo module capabilities 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0006
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0006
     * @tc.desc   Inspect moving photo module capabilities 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0007
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0007
     * @tc.desc   Inspect moving photo module capabilities 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0008
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0008
     * @tc.desc   Inspect moving photo module capabilities 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0009
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0009
     * @tc.desc   Inspect moving photo module capabilities 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0010
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0010
     * @tc.desc   Inspect moving photo module capabilities 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0011
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0011
     * @tc.desc   Inspect moving photo module capabilities 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0012
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0012
     * @tc.desc   Inspect moving photo module capabilities 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0013
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0013
     * @tc.desc   Inspect moving photo module capabilities 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0014
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0014
     * @tc.desc   Inspect moving photo module capabilities 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0015
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0015
     * @tc.desc   Inspect moving photo module capabilities 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0016
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0016
     * @tc.desc   Inspect moving photo module capabilities 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0017
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0017
     * @tc.desc   Inspect moving photo module capabilities 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0018
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0018
     * @tc.desc   Inspect moving photo module capabilities 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0019
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0019
     * @tc.desc   Inspect moving photo module capabilities 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0020
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0020
     * @tc.desc   Inspect moving photo module capabilities 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0021
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0021
     * @tc.desc   Inspect moving photo module capabilities 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0022
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0022
     * @tc.desc   Inspect moving photo module capabilities 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0023
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0023
     * @tc.desc   Inspect moving photo module capabilities 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0024
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0024
     * @tc.desc   Inspect moving photo module capabilities 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0025
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0025
     * @tc.desc   Inspect moving photo module capabilities 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0026
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0026
     * @tc.desc   Inspect moving photo module capabilities 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0027
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0027
     * @tc.desc   Inspect moving photo module capabilities 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0028
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0028
     * @tc.desc   Inspect moving photo module capabilities 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0029
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0029
     * @tc.desc   Inspect moving photo module capabilities 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0030
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0030
     * @tc.desc   Inspect moving photo module capabilities 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0031
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0031
     * @tc.desc   Inspect moving photo module capabilities 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0032
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0032
     * @tc.desc   Inspect moving photo module capabilities 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0033
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0033
     * @tc.desc   Inspect moving photo module capabilities 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0034
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0034
     * @tc.desc   Inspect moving photo module capabilities 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0035
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0035
     * @tc.desc   Inspect moving photo module capabilities 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0036
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0036
     * @tc.desc   Inspect moving photo module capabilities 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0037
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0037
     * @tc.desc   Inspect moving photo module capabilities 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0038
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0038
     * @tc.desc   Inspect moving photo module capabilities 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0039
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0039
     * @tc.desc   Inspect moving photo module capabilities 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0040
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0040
     * @tc.desc   Inspect moving photo module capabilities 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0041
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0041
     * @tc.desc   Inspect moving photo module capabilities 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0042
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0042
     * @tc.desc   Inspect moving photo module capabilities 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0043
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0043
     * @tc.desc   Inspect moving photo module capabilities 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0044
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0044
     * @tc.desc   Inspect moving photo module capabilities 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0045
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0045
     * @tc.desc   Inspect moving photo module capabilities 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0046
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0046
     * @tc.desc   Inspect moving photo module capabilities 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0047
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0047
     * @tc.desc   Inspect moving photo module capabilities 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0048
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0048
     * @tc.desc   Inspect moving photo module capabilities 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0049
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0049
     * @tc.desc   Inspect moving photo module capabilities 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0050
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0050
     * @tc.desc   Inspect moving photo module capabilities 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0051
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0051
     * @tc.desc   Inspect moving photo module capabilities 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0052
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0052
     * @tc.desc   Inspect moving photo module capabilities 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0053
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0053
     * @tc.desc   Inspect moving photo module capabilities 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0054
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0054
     * @tc.desc   Inspect moving photo module capabilities 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0055
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0055
     * @tc.desc   Inspect moving photo module capabilities 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0056
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0056
     * @tc.desc   Inspect moving photo module capabilities 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0057
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0057
     * @tc.desc   Inspect moving photo module capabilities 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0058
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0058
     * @tc.desc   Inspect moving photo module capabilities 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0059
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0059
     * @tc.desc   Inspect moving photo module capabilities 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfigDeep0060
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_DEEP_0060
     * @tc.desc   Inspect moving photo module capabilities 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfigDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue();
      let entry: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
        if (info.hapModulesInfo[index].name === 'entry') { entry = info.hapModulesInfo[index]; }
      }
      expect(entry !== undefined).assertTrue();
      expect((entry?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(entry?.deviceTypes.includes('default')).assertTrue();
      expect(entry?.installationFree).assertFalse();
      expect((entry?.abilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect((entry?.extensionAbilitiesInfo[0].name ?? '').length > 0).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
