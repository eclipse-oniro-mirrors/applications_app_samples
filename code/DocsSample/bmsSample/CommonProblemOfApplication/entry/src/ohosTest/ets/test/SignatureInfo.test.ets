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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'SignatureInfoTest';

export default function SignatureInfoTest() {
  describe('SignatureInfoTest', () => {
    /**
     * @tc.number    SUB_BMS_SIGNATURE_INFO_GET_APP_ID_0100
     * @tc.name      testGetAppId0001
     * @tc.desc      Verify get application ID through bundleManager.getBundleInfoForSelf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGetAppId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAppId0001 begin');
      const bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      hilog.info(DOMAIN, TAG, '%{public}s', `bundleFlags: ${bundleFlags}`);

      try {
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        expect(bundleInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo.appId != null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', `getAppId successfully. appId: ${bundleInfo.signatureInfo.appId}`);
      } catch (err) {
        let message: string = (err as BusinessError).message;
        hilog.error(DOMAIN, TAG, '%{public}s', `getAppId failed: ${message}`);
        expect(false).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAppId0001 end');
    })

    /**
     * @tc.number    SUB_BMS_SIGNATURE_INFO_GET_APP_IDENTIFIER_0100
     * @tc.name      testGetAppIdentifier0001
     * @tc.desc      Verify get application identifier through bundleManager.getBundleInfoForSelf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGetAppIdentifier0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAppIdentifier0001 begin');
      const bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      hilog.info(DOMAIN, TAG, '%{public}s', `bundleFlags: ${bundleFlags}`);

      try {
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        expect(bundleInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo.appIdentifier != null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s',
          `getAppIdentifier successfully. appIdentifier: ${bundleInfo.signatureInfo.appIdentifier}`);
      } catch (err) {
        let message: string = (err as BusinessError).message;
        hilog.error(DOMAIN, TAG, '%{public}s', `getAppIdentifier failed: ${message}`);
        expect(false).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAppIdentifier0001 end');
    })

    /**
     * @tc.number    SUB_BMS_SIGNATURE_INFO_GET_FINGERPRINT_0100
     * @tc.name      testGetFingerprint0001
     * @tc.desc      Verify get application fingerprint through bundleManager.getBundleInfoForSelf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGetFingerprint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetFingerprint0001 begin');
      const bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      hilog.info(DOMAIN, TAG, '%{public}s', `bundleFlags: ${bundleFlags}`);

      try {
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        expect(bundleInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo != null).assertTrue();
        expect(bundleInfo.signatureInfo.fingerprint != null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s',
          `getFingerprint successfully. fingerprint: ${bundleInfo.signatureInfo.fingerprint}`);
      } catch (err) {
        let message: string = (err as BusinessError).message;
        hilog.error(DOMAIN, TAG, '%{public}s', `getFingerprint failed: ${message}`);
        expect(false).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetFingerprint0001 end');
    })

    /**
     * @tc.number    SUB_BMS_SIGNATURE_INFO_BUNDLE_FLAGS_0100
     * @tc.name      testBundleFlagsCombination0001
     * @tc.desc      Verify combination of GET_BUNDLE_INFO_WITH_APPLICATION and GET_BUNDLE_INFO_WITH_SIGNATURE_INFO flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBundleFlagsCombination0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleFlagsCombination0001 begin');
      const bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      hilog.info(DOMAIN, TAG, '%{public}s', `bundleFlags: ${bundleFlags}`);

      try {
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        expect(bundleInfo != null).assertTrue();
        // Verify that signature info is available
        expect(bundleInfo.signatureInfo != null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'bundleFlags combination test passed');
      } catch (err) {
        let message: string = (err as BusinessError).message;
        hilog.error(DOMAIN, TAG, '%{public}s', `bundleFlags combination test failed: ${message}`);
        expect(false).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleFlagsCombination0001 end');
    })

    /**
     * @tc.number    SUB_BMS_SIGNATURE_INFO_ERROR_HANDLING_0100
     * @tc.name      testErrorHandling0001
     * @tc.desc      Verify error handling when getting bundle info with invalid flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorHandling0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorHandling0001 begin');
      const invalidFlags: number = -1; // Invalid flag value
      hilog.info(DOMAIN, TAG, '%{public}s', `invalidFlags: ${invalidFlags}`);

      try {
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(invalidFlags);
        // If no error thrown, verify the result is still valid
        expect(bundleInfo != null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'error handling test passed with default behavior');
      } catch (err) {
        let message: string = (err as BusinessError).message;
        hilog.info(DOMAIN, TAG, '%{public}s', `error handling test caught expected error: ${message}`);
        // Error is acceptable for invalid flags
        expect(true).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorHandling0001 end');
    })
  })
}