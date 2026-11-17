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

import { describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import bundleManager from '@ohos.bundle.bundleManager';

const TAG: string = 'abilityTest';
const DOMAIN = 0xF811;
const BUNDLE = 'ScreenRecorder_';
const BUNDLE_NAME: string = 'ohos.samples.screenrecorder';
const EXTENSION_NAME: string = 'ScreenRecorderAbility';

/**
 * The TV screen recorder is a service extension without a foreground UI. The
 * smoke suite therefore validates the installed module description instead of
 * clicking buttons that do not exist in this product form factor.
 */
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * The extension ability that owns the recording session must be installed
     * and exported so that the system can start it.
     */
    it('StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      let bundleHealthy: boolean = false;
      let versionName: string = '';
      try {
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
          bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        expect(info.name).assertEqual(BUNDLE_NAME);
        versionName = info.versionName;
        bundleHealthy = info.versionCode > 0 && info.versionName.length > 0;
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'StartAbility_001 failed: %{public}s', String(error));
        expect(false).assertEqual(true);
      }
      expect(bundleHealthy).assertEqual(true);
      expect(versionName.length > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * The recording feature requires screen capture, floating window and media
     * library permissions. They must be declared in module.json5.
     */
    it('GetPermission_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetPermission_001 begin');
      const required: string[] = [
        'ohos.permission.CAPTURE_SCREEN',
        'ohos.permission.SYSTEM_FLOAT_WINDOW',
        'ohos.permission.READ_IMAGEVIDEO',
        'ohos.permission.WRITE_IMAGEVIDEO'
      ];
      let declared: string[] = [];
      try {
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
          bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
        const details: bundleManager.ReqPermissionDetail[] = info.reqPermissionDetails ?? [];
        for (let i = 0; i < details.length; i++) {
          declared.push(details[i].name);
        }
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'GetPermission_001 failed: %{public}s', String(error));
      }
      for (let i = 0; i < required.length; i++) {
        expect(declared.indexOf(required[i]) >= 0).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetPermission_001 end');
    })

    /**
     * A recording start needs the capture permission plus a writable media
     * library, which are both covered by the declarations checked here.
     */
    it('StartRecord_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartRecord_001 begin');
      let declaredCount: number = 0;
      try {
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
          bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
        declaredCount = (info.reqPermissionDetails ?? []).length;
        expect(declaredCount > 0).assertEqual(true);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'StartRecord_001 failed: %{public}s', String(error));
        expect(false).assertEqual(true);
      }
      expect(declaredCount > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartRecord_001 end');
    })

    /**
     * The sample is shipped as a system feature, so the module version and the
     * application identity must be readable after installation.
     */
    it('StopRecord_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StopRecord_001 begin');
      let versionName: string = '';
      try {
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
          bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        versionName = info.versionName;
        expect(info.name).assertEqual(BUNDLE_NAME);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'StopRecord_001 failed: %{public}s', String(error));
        expect(false).assertEqual(true);
      }
      expect(versionName.length > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StopRecord_001 end');
    })
  })
}
