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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const BUNDLE_NAME: string = 'com.dlp.api.test';
const ENTRY_ABILITY_NAME: string = 'EntryAbility';
const EXPECTED_VERSION_NAME: string = '1.0.0';
const EXPECTED_VERSION_CODE: number = 1000000;
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function abilityTest() {
  describe('DlpAbilityTest', () => {
    let appContext: common.Context;

    beforeAll(() => {
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testAppContext0001
     * @tc.number SUB_DLP_C_API_ABILITY_0100
     * @tc.desc   Test that the app context and resource manager are available and the app name equals the bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppContext0001 begin');
      expect(appContext !== undefined).assertTrue();
      expect(appContext.resourceManager !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'appName=%{public}s', appContext.applicationInfo.name);
      expect(appContext.applicationInfo.name).assertEqual(BUNDLE_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppContext0001 end');
    })

    /**
     * @tc.name   testBundleInfo0001
     * @tc.number SUB_DLP_C_API_ABILITY_0200
     * @tc.desc   Test that the bundle name and the version of the app itself equal the values configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBundleInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBundleInfo0001 begin');
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual(EXPECTED_VERSION_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bundle=%{public}s version=%{public}s(%{public}d)',
        bundleInfo.name, bundleInfo.versionName, bundleInfo.versionCode);
      expect(bundleInfo.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBundleInfo0001 end');
    })

    /**
     * @tc.name   testNapiExported0001
     * @tc.number SUB_DLP_C_API_ABILITY_0300
     * @tc.desc   Test that the native library libentry.so exports all six DLP C API wrappers as callable functions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiExported0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNapiExported0001 begin');
      expect(testNapi !== undefined).assertTrue();
      expect(typeof testNapi.GetDlpPermissionInfo).assertEqual('function');
      expect(typeof testNapi.GetOriginalFileName).assertEqual('function');
      expect(typeof testNapi.IsInSandbox).assertEqual('function');
      expect(typeof testNapi.SetSandboxAppConfig).assertEqual('function');
      expect(typeof testNapi.GetSandboxAppConfig).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'libentry loaded=%{public}s', typeof testNapi);
      expect(typeof testNapi.CleanSandboxAppConfig).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNapiExported0001 end');
    })

    /**
     * @tc.name   testStartEntryAbility0001
     * @tc.number SUB_DLP_C_API_ABILITY_0400
     * @tc.desc   Test that the entry ability can be started without error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartEntryAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStartEntryAbility0001 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY_NAME
      };
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bundle=%{public}s ability=%{public}s',
        want.bundleName, want.abilityName);
      let isFailed: boolean = false;
      abilityDelegator.startAbility(want, (err: BusinessError) => {
        if (err !== undefined && err !== null && err.code !== 0) {
          isFailed = true;
        }
        expect(isFailed).assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStartEntryAbility0001 end');
        done();
      });
    })
  })
}
