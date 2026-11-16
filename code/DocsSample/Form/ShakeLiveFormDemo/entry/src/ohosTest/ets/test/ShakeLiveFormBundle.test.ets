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

export default function shakeLiveFormBundleTest() {
  describe('ShakeLiveFormBundleTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testShakeBundleIdentity001
     * @tc.number SUB_SHAKE_BUNDLE_001
     * @tc.desc   Verify bundle identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleIdentity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleIdentity001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.name), String('com.example.shakeliveformdemo'));
      expect(info.name).assertEqual('com.example.shakeliveformdemo');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionName), String('1.0.0'));
        expect(info.versionName).assertEqual('1.0.0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.versionCode), String(1000000));
        expect(info.versionCode).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleIdentity001 end');
    })

    /**
     * @tc.name   testShakeBundleApp002
     * @tc.number SUB_SHAKE_BUNDLE_002
     * @tc.desc   Verify app resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleApp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleApp002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
        expect(info.appInfo.iconId > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('com.example.shakeliveformdemo'));
        expect(info.appInfo.name).assertEqual('com.example.shakeliveformdemo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleApp002 end');
    })

    /**
     * @tc.name   testShakeBundleModule003
     * @tc.number SUB_SHAKE_BUNDLE_003
     * @tc.desc   Verify entry module device type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleModule003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleModule003 begin');
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          found = true;
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[i].deviceTypes.includes('phone')));
          expect(info.hapModulesInfo[i].deviceTypes.includes('phone')).assertTrue();
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
      expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleModule003 end');
    })

    /**
     * @tc.name   testShakeBundleAbility004
     * @tc.number SUB_SHAKE_BUNDLE_004
     * @tc.desc   Verify EntryAbility declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleAbility004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleAbility004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleAbility004 end');
    })

    /**
     * @tc.name   testShakeBundleForm005
     * @tc.number SUB_SHAKE_BUNDLE_005
     * @tc.desc   Verify form extension.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleForm005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleForm005 begin');
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const e: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < e.length; j++) {
          if (e[j].name === 'EntryFormAbility') {
            found = true;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
      expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleForm005 end');
    })

    /**
     * @tc.name   testShakeBundleLiveForm006
     * @tc.number SUB_SHAKE_BUNDLE_006
     * @tc.desc   Verify live form extension.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleLiveForm006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleLiveForm006 begin');
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const e: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < e.length; j++) {
          if (e[j].name === 'EntryFormLiveAbility') {
            found = true;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
      expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleLiveForm006 end');
    })

    /**
     * @tc.name   testShakeBundleNoPerm007
     * @tc.number SUB_SHAKE_BUNDLE_007
     * @tc.desc   Verify no requested permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleNoPerm007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleNoPerm007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.reqPermissionDetails.length), String(0));
      expect(info.reqPermissionDetails.length).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.name.length > 0));
        expect(info.name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.versionName.length > 0));
        expect(info.versionName.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleNoPerm007 end');
    })

    /**
     * @tc.name   testShakeBundleMeta008
     * @tc.number SUB_SHAKE_BUNDLE_008
     * @tc.desc   Verify module metadata 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleMeta008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta008 end');
    })

    /**
     * @tc.name   testShakeBundleMeta009
     * @tc.number SUB_SHAKE_BUNDLE_009
     * @tc.desc   Verify module metadata 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleMeta009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta009 end');
    })

    /**
     * @tc.name   testShakeBundleMeta010
     * @tc.number SUB_SHAKE_BUNDLE_010
     * @tc.desc   Verify module metadata 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleMeta010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta010 end');
    })

    /**
     * @tc.name   testShakeBundleMeta011
     * @tc.number SUB_SHAKE_BUNDLE_011
     * @tc.desc   Verify module metadata 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleMeta011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta011 end');
    })

    /**
     * @tc.name   testShakeBundleMeta012
     * @tc.number SUB_SHAKE_BUNDLE_012
     * @tc.desc   Verify module metadata 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBundleMeta012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo.length > 0));
      expect(info.hapModulesInfo.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].name.length > 0));
        expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.hapModulesInfo[0].deviceTypes.length > 0));
        expect(info.hapModulesInfo[0].deviceTypes.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBundleMeta012 end');
    })
  })
}
