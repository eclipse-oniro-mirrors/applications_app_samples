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

export default function movingPhotoPlusConfigTest() {
  describe('MovingPhotoPlusConfigTest', () => {
    beforeAll(() => { const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY; bundleInfo = bundleManager.getBundleInfoForSelfSync(flags); })

    /**
     * @tc.name   testMpPlusConfig0001
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0001
     * @tc.desc   Inspect moving photo entry configuration 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0002
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0002
     * @tc.desc   Inspect moving photo entry configuration 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0003
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0003
     * @tc.desc   Inspect moving photo entry configuration 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0004
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0004
     * @tc.desc   Inspect moving photo entry configuration 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0005
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0005
     * @tc.desc   Inspect moving photo entry configuration 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0006
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0006
     * @tc.desc   Inspect moving photo entry configuration 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0007
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0007
     * @tc.desc   Inspect moving photo entry configuration 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0008
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0008
     * @tc.desc   Inspect moving photo entry configuration 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0009
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0009
     * @tc.desc   Inspect moving photo entry configuration 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0010
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0010
     * @tc.desc   Inspect moving photo entry configuration 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0011
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0011
     * @tc.desc   Inspect moving photo entry configuration 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0012
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0012
     * @tc.desc   Inspect moving photo entry configuration 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0013
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0013
     * @tc.desc   Inspect moving photo entry configuration 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0014
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0014
     * @tc.desc   Inspect moving photo entry configuration 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0015
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0015
     * @tc.desc   Inspect moving photo entry configuration 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0016
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0016
     * @tc.desc   Inspect moving photo entry configuration 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0017
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0017
     * @tc.desc   Inspect moving photo entry configuration 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0018
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0018
     * @tc.desc   Inspect moving photo entry configuration 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0019
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0019
     * @tc.desc   Inspect moving photo entry configuration 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0020
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0020
     * @tc.desc   Inspect moving photo entry configuration 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0021
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0021
     * @tc.desc   Inspect moving photo entry configuration 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0022
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0022
     * @tc.desc   Inspect moving photo entry configuration 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0023
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0023
     * @tc.desc   Inspect moving photo entry configuration 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0024
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0024
     * @tc.desc   Inspect moving photo entry configuration 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0025
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0025
     * @tc.desc   Inspect moving photo entry configuration 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0026
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0026
     * @tc.desc   Inspect moving photo entry configuration 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0027
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0027
     * @tc.desc   Inspect moving photo entry configuration 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0028
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0028
     * @tc.desc   Inspect moving photo entry configuration 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0029
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0029
     * @tc.desc   Inspect moving photo entry configuration 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0030
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0030
     * @tc.desc   Inspect moving photo entry configuration 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0031
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0031
     * @tc.desc   Inspect moving photo entry configuration 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0032
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0032
     * @tc.desc   Inspect moving photo entry configuration 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0033
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0033
     * @tc.desc   Inspect moving photo entry configuration 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0034
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0034
     * @tc.desc   Inspect moving photo entry configuration 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0035
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0035
     * @tc.desc   Inspect moving photo entry configuration 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0036
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0036
     * @tc.desc   Inspect moving photo entry configuration 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0037
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0037
     * @tc.desc   Inspect moving photo entry configuration 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0038
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0038
     * @tc.desc   Inspect moving photo entry configuration 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0039
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0039
     * @tc.desc   Inspect moving photo entry configuration 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0040
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0040
     * @tc.desc   Inspect moving photo entry configuration 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0041
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0041
     * @tc.desc   Inspect moving photo entry configuration 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0042
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0042
     * @tc.desc   Inspect moving photo entry configuration 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0043
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0043
     * @tc.desc   Inspect moving photo entry configuration 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0044
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0044
     * @tc.desc   Inspect moving photo entry configuration 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0045
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0045
     * @tc.desc   Inspect moving photo entry configuration 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0046
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0046
     * @tc.desc   Inspect moving photo entry configuration 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0047
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0047
     * @tc.desc   Inspect moving photo entry configuration 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0048
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0048
     * @tc.desc   Inspect moving photo entry configuration 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0049
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0049
     * @tc.desc   Inspect moving photo entry configuration 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0050
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0050
     * @tc.desc   Inspect moving photo entry configuration 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0051
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0051
     * @tc.desc   Inspect moving photo entry configuration 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0052
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0052
     * @tc.desc   Inspect moving photo entry configuration 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0053
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0053
     * @tc.desc   Inspect moving photo entry configuration 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0054
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0054
     * @tc.desc   Inspect moving photo entry configuration 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0055
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0055
     * @tc.desc   Inspect moving photo entry configuration 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0056
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0056
     * @tc.desc   Inspect moving photo entry configuration 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0057
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0057
     * @tc.desc   Inspect moving photo entry configuration 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0058
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0058
     * @tc.desc   Inspect moving photo entry configuration 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testMpPlusConfig0059
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0059
     * @tc.desc   Inspect moving photo entry configuration 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testMpPlusConfig0060
     * @tc.number MOVING_PHOTO_PLUS_CONFIG_0060
     * @tc.desc   Inspect moving photo entry configuration 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusConfig0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryModule: bundleManager.HapModuleInfo | undefined = undefined;
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        if (bundleInfo.hapModulesInfo[index].name === 'entry') {
          entryModule = bundleInfo.hapModulesInfo[index];
        }
      }
      expect(entryModule !== undefined).assertTrue();
      expect(entryModule?.type).assertEqual('entry');
      expect(entryModule?.mainElementName).assertEqual('EntryAbility');
      expect(entryModule?.installationFree).assertFalse();
      expect((entryModule?.abilitiesInfo.length ?? 0) > 0).assertTrue();
      expect((entryModule?.extensionAbilitiesInfo.length ?? 0) > 0).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
