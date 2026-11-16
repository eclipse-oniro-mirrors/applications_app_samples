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

export default function canvasGameBundleContractTest() {
  describe('CanvasGameBundleContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   testCanvasBundleIdentity001
     * @tc.number SUB_CANVAS_BUNDLE_001
     * @tc.desc   Verify CanvasGame bundle identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleIdentity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasBundleApp002
     * @tc.number SUB_CANVAS_BUNDLE_002
     * @tc.desc   Verify application label and icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleApp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasBundleModule003
     * @tc.number SUB_CANVAS_BUNDLE_003
     * @tc.desc   Verify entry module device types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModule003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { if (info.hapModulesInfo[i].name === 'entry') { found = true; expect(info.hapModulesInfo[i].deviceTypes.includes('default')).assertTrue(); } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleAbility004
     * @tc.number SUB_CANVAS_BUNDLE_004
     * @tc.desc   Verify EntryAbility declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleAbility004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleForm005
     * @tc.number SUB_CANVAS_BUNDLE_005
     * @tc.desc   Verify form extension ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleForm005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const e = info.hapModulesInfo[i].extensionAbilitiesInfo; for (let j: number = 0; j < e.length; j++) { if (e[j].name === 'EntryFormAbility') { found = true; expect(e[j].name).assertEqual('EntryFormAbility'); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleModuleInfo006
     * @tc.number SUB_CANVAS_BUNDLE_006
     * @tc.desc   Verify module metadata 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModuleInfo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleModuleInfo007
     * @tc.number SUB_CANVAS_BUNDLE_007
     * @tc.desc   Verify module metadata 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModuleInfo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleModuleInfo008
     * @tc.number SUB_CANVAS_BUNDLE_008
     * @tc.desc   Verify module metadata 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModuleInfo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleModuleInfo009
     * @tc.number SUB_CANVAS_BUNDLE_009
     * @tc.desc   Verify module metadata 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModuleInfo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasBundleModuleInfo010
     * @tc.number SUB_CANVAS_BUNDLE_010
     * @tc.desc   Verify module metadata 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBundleModuleInfo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })
  })
}
