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

export default function wlanBundleSceneTest() {
  describe('WlanBundleSceneTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   ohos.samples.wlan_BundleScene_0001
     * @tc.number SUB_WLAN_BUNDLE_SCENE_0001
     * @tc.desc   Verify permission scene for GET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleScene_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0001 begin');
      let found: boolean = false;
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          const item: bundleManager.PermissionDef = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.GET_WIFI_INFO') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.abilities.includes('MainAbility')));
        expect(item.usedScene.abilities.includes('MainAbility')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.when.length > 0));
        expect(item.usedScene.when.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.reason.length > 0));
        expect(item.reason.length > 0).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleScene_0002
     * @tc.number SUB_WLAN_BUNDLE_SCENE_0002
     * @tc.desc   Verify permission scene for SET_WIFI_INFO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleScene_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0002 begin');
      let found: boolean = false;
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          const item: bundleManager.PermissionDef = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.SET_WIFI_INFO') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.abilities.includes('MainAbility')));
        expect(item.usedScene.abilities.includes('MainAbility')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.when.length > 0));
        expect(item.usedScene.when.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.reason.length > 0));
        expect(item.reason.length > 0).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleScene_0003
     * @tc.number SUB_WLAN_BUNDLE_SCENE_0003
     * @tc.desc   Verify permission scene for LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleScene_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0003 begin');
      let found: boolean = false;
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          const item: bundleManager.PermissionDef = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.LOCATION') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.abilities.includes('MainAbility')));
        expect(item.usedScene.abilities.includes('MainAbility')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.when.length > 0));
        expect(item.usedScene.when.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.reason.length > 0));
        expect(item.reason.length > 0).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleScene_0004
     * @tc.number SUB_WLAN_BUNDLE_SCENE_0004
     * @tc.desc   Verify permission scene for APPROXIMATELY_LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleScene_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0004 begin');
      let found: boolean = false;
        for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
          const item: bundleManager.PermissionDef = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.APPROXIMATELY_LOCATION') {
          found = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.abilities.includes('MainAbility')));
        expect(item.usedScene.abilities.includes('MainAbility')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.usedScene.when.length > 0));
        expect(item.usedScene.when.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.reason.length > 0));
        expect(item.reason.length > 0).assertTrue();
        }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
          expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleScene_0004 end');
    })
  })
}
