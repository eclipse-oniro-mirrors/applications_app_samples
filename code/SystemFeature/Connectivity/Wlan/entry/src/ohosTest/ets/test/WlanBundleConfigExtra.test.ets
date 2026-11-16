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
import { hilog } from '@kit.PerformanceAnalysisKit';
import bundleManager from '@ohos.bundle.bundleManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let info: bundleManager.BundleInfo;

export default function wlanBundleConfigExtraTest() {
  describe('WlanBundleConfigExtraTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanBundleModuleDesc0001
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0001
     * @tc.desc   Verify entry module description is populated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleModuleDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleDesc0001 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
          }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module !== undefined).assertTrue();');
      expect(module !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect((module?.description.length ?? 0) > 0).assertTrue();');
      expect((module?.description.length ?? 0) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module?.name).assertEqual(\'entry\');');
      expect(module?.name).assertEqual('entry');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleDesc0001 end');
    })

    /**
     * @tc.name   testWlanBundleModuleMain0002
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0002
     * @tc.desc   Verify entry module main element name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleModuleMain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleMain0002 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
          }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module?.mainElementName).assertEqual(\'MainAbility\');');
      expect(module?.mainElementName).assertEqual('MainAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect((module?.deviceTypes.length ?? 0) >= 2).assertTrue();');
      expect((module?.deviceTypes.length ?? 0) >= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleMain0002 end');
    })

    /**
     * @tc.name   testWlanBundleAbilityLabel0003
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0003
     * @tc.desc   Verify EntryAbility label and icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAbilityLabel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityLabel0003 begin');
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.name).assertEqual(\'EntryAbility\');');
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.labelId > 0).assertTrue();');
      expect(ability.labelId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.iconId > 0).assertTrue();');
      expect(ability.iconId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityLabel0003 end');
    })

    /**
     * @tc.name   testWlanBundleAbilityExport0004
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0004
     * @tc.desc   Verify EntryAbility export flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAbilityExport0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityExport0004 begin');
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.exported).assertTrue();');
      expect(ability.exported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.name.length > 0).assertTrue();');
      expect(ability.name.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.description.length > 0).assertTrue();');
      expect(ability.description.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityExport0004 end');
    })

    /**
     * @tc.name   testWlanBundleAppResources0005
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0005
     * @tc.desc   Verify application label and icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAppResources0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAppResources0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.labelId > 0).assertTrue();');
      expect(info.appInfo.labelId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.iconId > 0).assertTrue();');
      expect(info.appInfo.iconId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.name).assertEqual(\'ohos.samples.wlan\');');
      expect(info.appInfo.name).assertEqual('ohos.samples.wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAppResources0005 end');
    })

    /**
     * @tc.name   testWlanBundlePermissionFirst0006
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0006
     * @tc.desc   Verify first permission entry has a scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermissionFirst0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionFirst0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails.length > 0).assertTrue();');
      expect(info.reqPermissionDetails.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[0].usedScene.abilities.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[0].usedScene.abilities.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[0].reason.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[0].reason.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionFirst0006 end');
    })

    /**
     * @tc.name   testWlanBundlePermissionLast0007
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0007
     * @tc.desc   Verify last permission entry has a scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermissionLast0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionLast0007 begin');
      const last: number = info.reqPermissionDetails.length - 1;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(last >= 0).assertTrue();');
      expect(last >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[last].usedScene.abilities.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[last].usedScene.abilities.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[last].reason.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[last].reason.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionLast0007 end');
    })

    /**
     * @tc.name   testWlanBundlePermissionUnique0008
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0008
     * @tc.desc   Verify permission names are unique.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermissionUnique0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionUnique0008 begin');
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        names.add(info.reqPermissionDetails[i].name);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(names.size).assertEqual(info.reqPermissionDetails.length);');
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(names.size >= 4).assertTrue();');
      expect(names.size >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermissionUnique0008 end');
    })

    /**
     * @tc.name   testWlanBundleModuleCount0009
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0009
     * @tc.desc   Verify the number of installed HAP modules.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleModuleCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleCount0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].name.length > 0).assertTrue();');
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();');
      expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleModuleCount0009 end');
    })

    /**
     * @tc.name   testWlanBundleAbilityCount0010
     * @tc.number SUB_WLAN_BUNDLE_EXTRA_0010
     * @tc.desc   Verify the entry module declares an ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAbilityCount0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityCount0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].abilitiesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo[0].abilitiesInfo.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual(\'EntryAbility\');');
      expect(info.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].installationFree).assertFalse();');
      expect(info.hapModulesInfo[0].installationFree).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbilityCount0010 end');
    })
  })
}
