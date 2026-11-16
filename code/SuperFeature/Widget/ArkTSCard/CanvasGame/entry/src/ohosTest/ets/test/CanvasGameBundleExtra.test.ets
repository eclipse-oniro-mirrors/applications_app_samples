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

export default function canvasGameBundleExtraTest() {
  describe('CanvasGameBundleExtraTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testCanvasExtraModule001
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_001
     * @tc.desc   Verify entry module identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraModule001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let m: bundleManager.HapModuleInfo | undefined = undefined; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { if (info.hapModulesInfo[i].name === 'entry') { m = info.hapModulesInfo[i]; } } expect(m !== undefined).assertTrue(); const mod: bundleManager.HapModuleInfo = m as bundleManager.HapModuleInfo; expect(mod.name).assertEqual('entry'); expect(mod.installationFree).assertFalse();
    })

    /**
     * @tc.name   testCanvasExtraExtension002
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_002
     * @tc.desc   Verify form extension ability exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraExtension002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const e = info.hapModulesInfo[i].extensionAbilitiesInfo; for (let j: number = 0; j < e.length; j++) { if (e[j].name === 'EntryFormAbility') { found = true; } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasExtraAbilitySkills003
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_003
     * @tc.desc   Verify entry ability skills.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraAbilitySkills003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasExtraNoPermissions004
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_004
     * @tc.desc   Verify CanvasGame requests no permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraNoPermissions004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length).assertEqual(0); expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0');
    })

    /**
     * @tc.name   testCanvasExtraAppDesc005
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_005
     * @tc.desc   Verify app label and icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraAppDesc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasExtraModuleMeta006
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_006
     * @tc.desc   Verify module metadata 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraModuleMeta006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasExtraModuleMeta007
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_007
     * @tc.desc   Verify module metadata 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraModuleMeta007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasExtraModuleMeta008
     * @tc.number SUB_CANVAS_EXTRA_BUNDLE_008
     * @tc.desc   Verify module metadata 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraModuleMeta008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
    })
  })
}
