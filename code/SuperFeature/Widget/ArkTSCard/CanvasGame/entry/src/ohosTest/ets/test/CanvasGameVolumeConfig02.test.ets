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

export default function canvasGameVolumeConfig02Test() {
  describe('CanvasGameVolumeConfig02Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasVolCfg020001
     * @tc.number SUB_CANVAS_VOL_CFG_02_0001
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020001 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020002
     * @tc.number SUB_CANVAS_VOL_CFG_02_0002
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020002 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020003
     * @tc.number SUB_CANVAS_VOL_CFG_02_0003
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020003 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020004
     * @tc.number SUB_CANVAS_VOL_CFG_02_0004
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020004 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020005
     * @tc.number SUB_CANVAS_VOL_CFG_02_0005
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020005 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020006
     * @tc.number SUB_CANVAS_VOL_CFG_02_0006
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020006 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020007
     * @tc.number SUB_CANVAS_VOL_CFG_02_0007
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020007 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020008
     * @tc.number SUB_CANVAS_VOL_CFG_02_0008
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020008 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020009
     * @tc.number SUB_CANVAS_VOL_CFG_02_0009
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020009 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020010
     * @tc.number SUB_CANVAS_VOL_CFG_02_0010
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020010 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020011
     * @tc.number SUB_CANVAS_VOL_CFG_02_0011
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020011 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020012
     * @tc.number SUB_CANVAS_VOL_CFG_02_0012
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020012 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020013
     * @tc.number SUB_CANVAS_VOL_CFG_02_0013
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.samples.canvasgame'));
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020013 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020014
     * @tc.number SUB_CANVAS_VOL_CFG_02_0014
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020014 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020015
     * @tc.number SUB_CANVAS_VOL_CFG_02_0015
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020015 end');
    })

    /**
     * @tc.name   testCanvasVolCfg020016
     * @tc.number SUB_CANVAS_VOL_CFG_02_0016
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.samples.canvasgame'));
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg020016 end');
    })
  })
}
