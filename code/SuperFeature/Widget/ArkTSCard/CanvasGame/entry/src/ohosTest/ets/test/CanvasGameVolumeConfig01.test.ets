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

export default function canvasGameVolumeConfig01Test() {
  describe('CanvasGameVolumeConfig01Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY); })

    /**
     * @tc.name   testCanvasVolCfg010001
     * @tc.number SUB_CANVAS_VOL_CFG_01_0001
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.labelId > 0).assertTrue();');
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.iconId > 0).assertTrue();');
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.name).assertEqual(\'com.samples.canvasgame\');');
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010001 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010002
     * @tc.number SUB_CANVAS_VOL_CFG_01_0002
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].name.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010002 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010003
     * @tc.number SUB_CANVAS_VOL_CFG_01_0003
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010003 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a[j].exported).assertTrue();');
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(found).assertTrue();');
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010003 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010004
     * @tc.number SUB_CANVAS_VOL_CFG_01_0004
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.name).assertEqual(\'com.samples.canvasgame\');');
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionName).assertEqual(\'1.0.0\');');
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionCode).assertEqual(1000000);');
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010004 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010005
     * @tc.number SUB_CANVAS_VOL_CFG_01_0005
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.labelId > 0).assertTrue();');
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.iconId > 0).assertTrue();');
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.name).assertEqual(\'com.samples.canvasgame\');');
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010005 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010006
     * @tc.number SUB_CANVAS_VOL_CFG_01_0006
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].name.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010006 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010007
     * @tc.number SUB_CANVAS_VOL_CFG_01_0007
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010007 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a[j].exported).assertTrue();');
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(found).assertTrue();');
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010007 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010008
     * @tc.number SUB_CANVAS_VOL_CFG_01_0008
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.name).assertEqual(\'com.samples.canvasgame\');');
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionName).assertEqual(\'1.0.0\');');
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionCode).assertEqual(1000000);');
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010008 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010009
     * @tc.number SUB_CANVAS_VOL_CFG_01_0009
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.labelId > 0).assertTrue();');
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.iconId > 0).assertTrue();');
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.name).assertEqual(\'com.samples.canvasgame\');');
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010009 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010010
     * @tc.number SUB_CANVAS_VOL_CFG_01_0010
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].name.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010010 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010011
     * @tc.number SUB_CANVAS_VOL_CFG_01_0011
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010011 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a[j].exported).assertTrue();');
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(found).assertTrue();');
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010011 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010012
     * @tc.number SUB_CANVAS_VOL_CFG_01_0012
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.name).assertEqual(\'com.samples.canvasgame\');');
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionName).assertEqual(\'1.0.0\');');
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionCode).assertEqual(1000000);');
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010012 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010013
     * @tc.number SUB_CANVAS_VOL_CFG_01_0013
     * @tc.desc   Verify info.appInfo.labelId is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.labelId > 0).assertTrue();');
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.iconId > 0).assertTrue();');
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.appInfo.name).assertEqual(\'com.samples.canvasgame\');');
        expect(info.appInfo.name).assertEqual('com.samples.canvasgame');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010013 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010014
     * @tc.number SUB_CANVAS_VOL_CFG_01_0014
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo.length > 0).assertTrue();');
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].name.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();');
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010014 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010015
     * @tc.number SUB_CANVAS_VOL_CFG_01_0015
     * @tc.desc   Verify a[j].exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010015 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a = info.hapModulesInfo[i].abilitiesInfo;
        for (let j: number = 0; j < a.length; j++) {
          if (a[j].name === 'EntryAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a[j].exported).assertTrue();');
        expect(a[j].exported).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(found).assertTrue();');
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010015 end');
    })

    /**
     * @tc.name   testCanvasVolCfg010016
     * @tc.number SUB_CANVAS_VOL_CFG_01_0016
     * @tc.desc   Verify info.name equals \'com.samples.canvasgame\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolCfg010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.name).assertEqual(\'com.samples.canvasgame\');');
      expect(info.name).assertEqual('com.samples.canvasgame');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionName).assertEqual(\'1.0.0\');');
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.versionCode).assertEqual(1000000);');
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolCfg010016 end');
    })
  })
}
