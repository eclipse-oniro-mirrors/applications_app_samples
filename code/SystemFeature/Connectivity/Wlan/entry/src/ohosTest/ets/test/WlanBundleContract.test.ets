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

export default function wlanBundleContractTest() {
  describe('WlanBundleContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanBundleIdentity0001
     * @tc.number SUB_WLAN_BUNDLE_0001
     * @tc.desc   Verify Wlan bundle identity fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleIdentity0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('ohos.samples.wlan'));
      expect(info.name).assertEqual('ohos.samples.wlan');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleIdentity0001 end');
    })

    /**
     * @tc.name   testWlanBundleEntryModule0002
     * @tc.number SUB_WLAN_BUNDLE_0002
     * @tc.desc   Verify entry module device types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleEntryModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleEntryModule0002 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          if (info.hapModulesInfo[i].name === 'entry') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[i].deviceTypes.includes('default')));
        expect(info.hapModulesInfo[i].deviceTypes.includes('default')).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleEntryModule0002 end');
    })

    /**
     * @tc.name   testWlanBundleAbility0003
     * @tc.number SUB_WLAN_BUNDLE_0003
     * @tc.desc   Verify EntryAbility declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbility0003 begin');
      let found: boolean = false;
        for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
          const a = info.hapModulesInfo[i].abilitiesInfo;
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAbility0003 end');
    })

    /**
     * @tc.name   testWlanBundleAppResource0004
     * @tc.number SUB_WLAN_BUNDLE_0004
     * @tc.desc   Verify application label and icon resource IDs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundleAppResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAppResource0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('ohos.samples.wlan'));
        expect(info.appInfo.name).assertEqual('ohos.samples.wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundleAppResource0004 end');
    })

    /**
     * @tc.name   testWlanBundlePermission0005
     * @tc.number SUB_WLAN_BUNDLE_0005
     * @tc.desc   Verify permission GET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermission0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0005 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.GET_WIFI_INFO')));
          expect(names.has('ohos.permission.GET_WIFI_INFO')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
        expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0005 end');
    })

    /**
     * @tc.name   testWlanBundlePermission0006
     * @tc.number SUB_WLAN_BUNDLE_0006
     * @tc.desc   Verify permission SET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermission0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0006 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.SET_WIFI_INFO')));
          expect(names.has('ohos.permission.SET_WIFI_INFO')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
        expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0006 end');
    })

    /**
     * @tc.name   testWlanBundlePermission0007
     * @tc.number SUB_WLAN_BUNDLE_0007
     * @tc.desc   Verify permission LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermission0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0007 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.LOCATION')));
          expect(names.has('ohos.permission.LOCATION')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
        expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0007 end');
    })

    /**
     * @tc.name   testWlanBundlePermission0008
     * @tc.number SUB_WLAN_BUNDLE_0008
     * @tc.desc   Verify permission APPROXIMATELY_LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanBundlePermission0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0008 begin');
      const names: Set<string> = new Set<string>();
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          names.add(info.reqPermissionDetails[index].name);
        }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(names.has('ohos.permission.APPROXIMATELY_LOCATION')));
          expect(names.has('ohos.permission.APPROXIMATELY_LOCATION')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
        expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanBundlePermission0008 end');
    })
  })
}
