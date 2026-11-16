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

export default function wlanBundleMiscTest() {
  describe('WlanBundleMiscTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanMiscBundleDesc0001
     * @tc.number SUB_WLAN_MISC_BUNDLE_0001
     * @tc.desc   Verify entry module description and main element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscBundleDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundleDesc0001 begin');
      const module = info.hapModulesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module.description.length > 0).assertTrue();');
      expect(module.description.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module.mainElementName).assertEqual(\'MainAbility\');');
      expect(module.mainElementName).assertEqual('MainAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(module.name).assertEqual(\'entry\');');
      expect(module.name).assertEqual('entry');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundleDesc0001 end');
    })

    /**
     * @tc.name   testWlanMiscBundleAbility0002
     * @tc.number SUB_WLAN_MISC_BUNDLE_0002
     * @tc.desc   Verify EntryAbility skill count and export.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscBundleAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundleAbility0002 begin');
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.skills.length).assertEqual(1);');
      expect(ability.skills.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.exported).assertTrue();');
      expect(ability.exported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.name).assertEqual(\'EntryAbility\');');
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundleAbility0002 end');
    })

    /**
     * @tc.name   testWlanMiscBundlePerm0003
     * @tc.number SUB_WLAN_MISC_BUNDLE_0003
     * @tc.desc   Verify permission count and first permission name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscBundlePerm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundlePerm0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails.length >= 4).assertTrue();');
      expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[0].name.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[0].name.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[info.reqPermissionDetails.length - 1].reason.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[info.reqPermissionDetails.length - 1].reason.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscBundlePerm0003 end');
    })
  })
}
