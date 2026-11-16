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

export default function canvasGameWaveConfig06Test() {
  describe('CanvasGameWaveConfig06Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasWaveCfg060001
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0001
     * @tc.desc   Wave config case 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasWaveCfg060002
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0002
     * @tc.desc   Wave config case 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060003
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0003
     * @tc.desc   Wave config case 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060004
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0004
     * @tc.desc   Wave config case 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasWaveCfg060005
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0005
     * @tc.desc   Wave config case 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasWaveCfg060006
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0006
     * @tc.desc   Wave config case 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060007
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0007
     * @tc.desc   Wave config case 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060008
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0008
     * @tc.desc   Wave config case 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasWaveCfg060009
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0009
     * @tc.desc   Wave config case 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasWaveCfg060010
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0010
     * @tc.desc   Wave config case 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060011
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0011
     * @tc.desc   Wave config case 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060012
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0012
     * @tc.desc   Wave config case 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testCanvasWaveCfg060013
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0013
     * @tc.desc   Wave config case 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue(); expect(info.appInfo.iconId > 0).assertTrue(); expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
    })

    /**
     * @tc.name   testCanvasWaveCfg060014
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0014
     * @tc.desc   Wave config case 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.hapModulesInfo.length > 0).assertTrue(); expect(info.hapModulesInfo[0].name.length > 0).assertTrue(); expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060015
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0015
     * @tc.desc   Wave config case 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false; for (let i: number = 0; i < info.hapModulesInfo.length; i++) { const a = info.hapModulesInfo[i].abilitiesInfo; for (let j: number = 0; j < a.length; j++) { if (a[j].name === 'EntryAbility') { found = true; expect(a[j].exported).assertTrue(); } } } expect(found).assertTrue();
    })

    /**
     * @tc.name   testCanvasWaveCfg060016
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0016
     * @tc.desc   Wave config case 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.samples.canvasgame'); expect(info.versionName).assertEqual('1.0.0'); expect(info.versionCode).assertEqual(1000000);
    })
  })
}
