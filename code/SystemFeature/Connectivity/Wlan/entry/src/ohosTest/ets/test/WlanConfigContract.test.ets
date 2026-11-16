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

export default function wlanConfigContractTest() {
  describe('WlanConfigContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0001
     * @tc.number SUB_WLAN_CONFIG_0001
     * @tc.desc   Verify Wlan application identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('ohos.samples.wlan'));
      expect(info.name).assertEqual('ohos.samples.wlan');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('ohos.samples.wlan'));
        expect(info.appInfo.name).assertEqual('ohos.samples.wlan');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0002
     * @tc.number SUB_WLAN_CONFIG_0002
     * @tc.desc   Verify version code and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
      expect(info.versionCode).assertEqual(1000000);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
        expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0003
     * @tc.number SUB_WLAN_CONFIG_0003
     * @tc.desc   Verify entry module type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0003 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(module !== undefined));
          expect(module !== undefined).assertTrue();
        const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mod.name), String('entry'));
        expect(mod.name).assertEqual('entry');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.installationFree));
        expect(mod.installationFree).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0004
     * @tc.number SUB_WLAN_CONFIG_0004
     * @tc.desc   Verify supported device types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0004 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(module !== undefined));
          expect(module !== undefined).assertTrue();
        const mod: bundleManager.HapModuleInfo = module as bundleManager.HapModuleInfo;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.deviceTypes.includes('default')));
        expect(mod.deviceTypes.includes('default')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(mod.deviceTypes.includes('tablet')));
        expect(mod.deviceTypes.includes('tablet')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0005
     * @tc.number SUB_WLAN_CONFIG_0005
     * @tc.desc   Verify requested permission GET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0005 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[index].reason.length > 0));
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.GET_WIFI_INFO')));
          expect(names.has('ohos.permission.GET_WIFI_INFO')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.size >= 4));
        expect(names.size >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0006
     * @tc.number SUB_WLAN_CONFIG_0006
     * @tc.desc   Verify requested permission SET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0006 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[index].reason.length > 0));
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.SET_WIFI_INFO')));
          expect(names.has('ohos.permission.SET_WIFI_INFO')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.size >= 4));
        expect(names.size >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0007
     * @tc.number SUB_WLAN_CONFIG_0007
     * @tc.desc   Verify requested permission LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0007 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[index].reason.length > 0));
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.LOCATION')));
          expect(names.has('ohos.permission.LOCATION')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.size >= 4));
        expect(names.size >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0008
     * @tc.number SUB_WLAN_CONFIG_0008
     * @tc.desc   Verify requested permission APPROXIMATELY_LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0008 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[index].reason.length > 0));
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.APPROXIMATELY_LOCATION')));
          expect(names.has('ohos.permission.APPROXIMATELY_LOCATION')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.size >= 4));
        expect(names.size >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ConfigContract_0009
     * @tc.number SUB_WLAN_CONFIG_0009
     * @tc.desc   Verify permission count and scenes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ConfigContract_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
      expect(info.reqPermissionDetails.length >= 4).assertTrue();
        for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[i].usedScene.abilities.length > 0));
          expect(info.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[i].usedScene.when.length > 0));
        expect(info.reqPermissionDetails[i].usedScene.when.length > 0).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ConfigContract_0009 end');
    })
  })
}
