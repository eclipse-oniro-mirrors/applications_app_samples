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

export default function canvasGameVolumeConfig01Test() {
  describe('CanvasGameVolumeConfig01Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasVolCfg010001
     * @tc.number SUB_CANVAS_VOL_CFG_01_0001
     * @tc.desc   Config volume case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg010002
     * @tc.number SUB_CANVAS_VOL_CFG_01_0002
     * @tc.desc   Config volume case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010003
     * @tc.number SUB_CANVAS_VOL_CFG_01_0003
     * @tc.desc   Config volume case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010004
     * @tc.number SUB_CANVAS_VOL_CFG_01_0004
     * @tc.desc   Config volume case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg010005
     * @tc.number SUB_CANVAS_VOL_CFG_01_0005
     * @tc.desc   Config volume case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg010006
     * @tc.number SUB_CANVAS_VOL_CFG_01_0006
     * @tc.desc   Config volume case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010007
     * @tc.number SUB_CANVAS_VOL_CFG_01_0007
     * @tc.desc   Config volume case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010008
     * @tc.number SUB_CANVAS_VOL_CFG_01_0008
     * @tc.desc   Config volume case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg010009
     * @tc.number SUB_CANVAS_VOL_CFG_01_0009
     * @tc.desc   Config volume case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg010010
     * @tc.number SUB_CANVAS_VOL_CFG_01_0010
     * @tc.desc   Config volume case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010011
     * @tc.number SUB_CANVAS_VOL_CFG_01_0011
     * @tc.desc   Config volume case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010012
     * @tc.number SUB_CANVAS_VOL_CFG_01_0012
     * @tc.desc   Config volume case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasVolCfg010013
     * @tc.number SUB_CANVAS_VOL_CFG_01_0013
     * @tc.desc   Config volume case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasVolCfg010014
     * @tc.number SUB_CANVAS_VOL_CFG_01_0014
     * @tc.desc   Config volume case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010015
     * @tc.number SUB_CANVAS_VOL_CFG_01_0015
     * @tc.desc   Config volume case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolCfg010016
     * @tc.number SUB_CANVAS_VOL_CFG_01_0016
     * @tc.desc   Config volume case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })
  })
}
