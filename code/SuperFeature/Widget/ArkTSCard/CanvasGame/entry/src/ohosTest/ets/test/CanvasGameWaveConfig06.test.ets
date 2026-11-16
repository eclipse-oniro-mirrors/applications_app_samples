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
import { bundleManager } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let info: bundleManager.BundleInfo;

export default function canvasGameWaveConfig06Test() {
  describe('CanvasGameWaveConfig06Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasWaveCfg060001
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0001
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060001 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060002
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0002
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060002 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060003
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0003
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060003 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a: Array<bundleManager.AbilityInfo> = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a[j].exported));
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060003 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060004
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0004
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060004 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060005
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0005
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060005 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060006
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0006
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060006 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060007
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0007
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060007 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a: Array<bundleManager.AbilityInfo> = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a[j].exported));
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060007 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060008
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0008
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060008 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060009
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0009
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060009 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060010
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0010
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060010 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060011
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0011
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060011 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a: Array<bundleManager.AbilityInfo> = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a[j].exported));
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060011 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060012
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0012
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060012 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060013
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0013
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060013 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060014
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0014
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060014 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060015
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0015
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060015 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a: Array<bundleManager.AbilityInfo> = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a[j].exported));
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060015 end');
    })

    /**
     * @tc.name   testCanvasWaveCfg060016
     * @tc.number SUB_CANVAS_WAVE_CFG_06_0016
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveCfg060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveCfg060016 end');
    })
  })
}
