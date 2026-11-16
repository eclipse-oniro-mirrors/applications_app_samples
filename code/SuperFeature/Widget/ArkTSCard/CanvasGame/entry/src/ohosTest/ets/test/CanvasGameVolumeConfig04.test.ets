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

export default function canvasGameVolumeConfig04Test() {
  describe('CanvasGameVolumeConfig04Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasVolCfg040001
     * @tc.number SUB_CANVAS_VOL_CFG_04_0001
     * @tc.desc   Config volume case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg040002
     * @tc.number SUB_CANVAS_VOL_CFG_04_0002
     * @tc.desc   Config volume case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040003
     * @tc.number SUB_CANVAS_VOL_CFG_04_0003
     * @tc.desc   Config volume case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040004
     * @tc.number SUB_CANVAS_VOL_CFG_04_0004
     * @tc.desc   Config volume case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg040005
     * @tc.number SUB_CANVAS_VOL_CFG_04_0005
     * @tc.desc   Config volume case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg040006
     * @tc.number SUB_CANVAS_VOL_CFG_04_0006
     * @tc.desc   Config volume case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040007
     * @tc.number SUB_CANVAS_VOL_CFG_04_0007
     * @tc.desc   Config volume case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040008
     * @tc.number SUB_CANVAS_VOL_CFG_04_0008
     * @tc.desc   Config volume case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg040009
     * @tc.number SUB_CANVAS_VOL_CFG_04_0009
     * @tc.desc   Config volume case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg040010
     * @tc.number SUB_CANVAS_VOL_CFG_04_0010
     * @tc.desc   Config volume case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040011
     * @tc.number SUB_CANVAS_VOL_CFG_04_0011
     * @tc.desc   Config volume case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040012
     * @tc.number SUB_CANVAS_VOL_CFG_04_0012
     * @tc.desc   Config volume case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg040013
     * @tc.number SUB_CANVAS_VOL_CFG_04_0013
     * @tc.desc   Config volume case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg040014
     * @tc.number SUB_CANVAS_VOL_CFG_04_0014
     * @tc.desc   Config volume case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040015
     * @tc.number SUB_CANVAS_VOL_CFG_04_0015
     * @tc.desc   Config volume case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg040016
     * @tc.number SUB_CANVAS_VOL_CFG_04_0016
     * @tc.desc   Config volume case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })
  })
}
