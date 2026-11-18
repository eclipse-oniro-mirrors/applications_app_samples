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

export default function canvasGameConfigContractTest() {
  describe('CanvasGameConfigContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0001
     * @tc.number SUB_CANVAS_CONFIG_001
     * @tc.desc   Verify module main element and type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0001 begin');
      let m: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          m = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(m !== undefined));
          expect(m !== undefined).assertTrue();
        const mod: bundleManager.HapModuleInfo = m as bundleManager.HapModuleInfo;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mod.name), String('entry'));
        expect(mod.name).assertEqual('entry');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.installationFree));
        expect(mod.installationFree).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0002
     * @tc.number SUB_CANVAS_CONFIG_002
     * @tc.desc   Verify default device type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0002 begin');
      let m: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          m = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((m as bundleManager.HapModuleInfo).deviceTypes.includes('default')));
          expect((m as bundleManager.HapModuleInfo).deviceTypes.includes('default')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((m as bundleManager.HapModuleInfo).deviceTypes.length > 0));
        expect((m as bundleManager.HapModuleInfo).deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0003
     * @tc.number SUB_CANVAS_CONFIG_003
     * @tc.desc   Verify EntryAbility exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0004
     * @tc.number SUB_CANVAS_CONFIG_004
     * @tc.desc   Verify form extension name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0004 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const e: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < e.length; j++) {
          if (e[j].name === 'EntryFormAbility') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(e[j].name.length > 0));
        expect(e[j].name.length > 0).assertTrue();
        }
          }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0005
     * @tc.number SUB_CANVAS_CONFIG_005
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0006
     * @tc.number SUB_CANVAS_CONFIG_006
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0007
     * @tc.number SUB_CANVAS_CONFIG_007
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0008
     * @tc.number SUB_CANVAS_CONFIG_008
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0009
     * @tc.number SUB_CANVAS_CONFIG_009
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ConfigContract_0010
     * @tc.number SUB_CANVAS_CONFIG_010
     * @tc.desc   Verify info.hapModulesInfo.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ConfigContract_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ConfigContract_0010 end');
    })
  })
}
