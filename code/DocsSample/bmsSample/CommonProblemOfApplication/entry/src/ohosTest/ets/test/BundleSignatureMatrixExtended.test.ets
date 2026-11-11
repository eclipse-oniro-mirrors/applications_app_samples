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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME } from './shared/BundleProbe';
import {
  FLAG_APPLICATION,
  FLAG_ABILITY,
  FLAG_EXTENSION,
  FLAG_HAP_MODULE,
  FLAG_SIGNATURE,
  flagsForIndex,
  hasFlag
} from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_BundleSignatureMatrixExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleSignatureMatrixExtendedTest() {
  describe('bundleSignatureMatrixExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0065
     * @tc.name      testBundleSignature0065
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0065 begin');
      const flags: number = flagsForIndex(64);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0066
     * @tc.name      testBundleSignature0066
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0066 begin');
      const flags: number = flagsForIndex(65);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0067
     * @tc.name      testBundleSignature0067
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0067 begin');
      const flags: number = flagsForIndex(66);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0068
     * @tc.name      testBundleSignature0068
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0068 begin');
      const flags: number = flagsForIndex(67);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0069
     * @tc.name      testBundleSignature0069
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0069 begin');
      const flags: number = flagsForIndex(68);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0070
     * @tc.name      testBundleSignature0070
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0070 begin');
      const flags: number = flagsForIndex(69);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0071
     * @tc.name      testBundleSignature0071
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0071 begin');
      const flags: number = flagsForIndex(70);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0072
     * @tc.name      testBundleSignature0072
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0072 begin');
      const flags: number = flagsForIndex(71);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0073
     * @tc.name      testBundleSignature0073
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0073 begin');
      const flags: number = flagsForIndex(72);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0074
     * @tc.name      testBundleSignature0074
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0074 begin');
      const flags: number = flagsForIndex(73);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0075
     * @tc.name      testBundleSignature0075
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0075 begin');
      const flags: number = flagsForIndex(74);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0076
     * @tc.name      testBundleSignature0076
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0076 begin');
      const flags: number = flagsForIndex(75);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0077
     * @tc.name      testBundleSignature0077
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0077 begin');
      const flags: number = flagsForIndex(76);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0078
     * @tc.name      testBundleSignature0078
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0078 begin');
      const flags: number = flagsForIndex(77);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0079
     * @tc.name      testBundleSignature0079
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0079 begin');
      const flags: number = flagsForIndex(78);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0080
     * @tc.name      testBundleSignature0080
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0080 begin');
      const flags: number = flagsForIndex(79);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0081
     * @tc.name      testBundleSignature0081
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0081 begin');
      const flags: number = flagsForIndex(80);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0082
     * @tc.name      testBundleSignature0082
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0082 begin');
      const flags: number = flagsForIndex(81);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0083
     * @tc.name      testBundleSignature0083
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0083 begin');
      const flags: number = flagsForIndex(82);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0084
     * @tc.name      testBundleSignature0084
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0084 begin');
      const flags: number = flagsForIndex(83);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0085
     * @tc.name      testBundleSignature0085
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0085 begin');
      const flags: number = flagsForIndex(84);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0086
     * @tc.name      testBundleSignature0086
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0086 begin');
      const flags: number = flagsForIndex(85);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0087
     * @tc.name      testBundleSignature0087
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0087 begin');
      const flags: number = flagsForIndex(86);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0088
     * @tc.name      testBundleSignature0088
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0088 begin');
      const flags: number = flagsForIndex(87);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0089
     * @tc.name      testBundleSignature0089
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0089 begin');
      const flags: number = flagsForIndex(88);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0090
     * @tc.name      testBundleSignature0090
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0090 begin');
      const flags: number = flagsForIndex(89);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0091
     * @tc.name      testBundleSignature0091
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0091 begin');
      const flags: number = flagsForIndex(90);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0092
     * @tc.name      testBundleSignature0092
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0092 begin');
      const flags: number = flagsForIndex(91);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0093
     * @tc.name      testBundleSignature0093
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0093 begin');
      const flags: number = flagsForIndex(92);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0094
     * @tc.name      testBundleSignature0094
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0094 begin');
      const flags: number = flagsForIndex(93);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0095
     * @tc.name      testBundleSignature0095
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0095 begin');
      const flags: number = flagsForIndex(94);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0096
     * @tc.name      testBundleSignature0096
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0096 begin');
      const flags: number = flagsForIndex(95);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0097
     * @tc.name      testBundleSignature0097
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0097 begin');
      const flags: number = flagsForIndex(96);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0098
     * @tc.name      testBundleSignature0098
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0098 begin');
      const flags: number = flagsForIndex(97);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0099
     * @tc.name      testBundleSignature0099
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0099 begin');
      const flags: number = flagsForIndex(98);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0100
     * @tc.name      testBundleSignature0100
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0100 begin');
      const flags: number = flagsForIndex(99);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0101
     * @tc.name      testBundleSignature0101
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0101 begin');
      const flags: number = flagsForIndex(100);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0102
     * @tc.name      testBundleSignature0102
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0102 begin');
      const flags: number = flagsForIndex(101);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0103
     * @tc.name      testBundleSignature0103
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0103 begin');
      const flags: number = flagsForIndex(102);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0104
     * @tc.name      testBundleSignature0104
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0104 begin');
      const flags: number = flagsForIndex(103);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0105
     * @tc.name      testBundleSignature0105
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0105 begin');
      const flags: number = flagsForIndex(104);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0106
     * @tc.name      testBundleSignature0106
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0106 begin');
      const flags: number = flagsForIndex(105);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0107
     * @tc.name      testBundleSignature0107
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0107 begin');
      const flags: number = flagsForIndex(106);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0108
     * @tc.name      testBundleSignature0108
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0108 begin');
      const flags: number = flagsForIndex(107);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0109
     * @tc.name      testBundleSignature0109
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0109 begin');
      const flags: number = flagsForIndex(108);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0110
     * @tc.name      testBundleSignature0110
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0110 begin');
      const flags: number = flagsForIndex(109);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0111
     * @tc.name      testBundleSignature0111
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0111 begin');
      const flags: number = flagsForIndex(110);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0112
     * @tc.name      testBundleSignature0112
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0112 begin');
      const flags: number = flagsForIndex(111);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0113
     * @tc.name      testBundleSignature0113
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0113 begin');
      const flags: number = flagsForIndex(112);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0114
     * @tc.name      testBundleSignature0114
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0114 begin');
      const flags: number = flagsForIndex(113);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0115
     * @tc.name      testBundleSignature0115
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0115 begin');
      const flags: number = flagsForIndex(114);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0116
     * @tc.name      testBundleSignature0116
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0116 begin');
      const flags: number = flagsForIndex(115);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0117
     * @tc.name      testBundleSignature0117
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0117 begin');
      const flags: number = flagsForIndex(116);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0118
     * @tc.name      testBundleSignature0118
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0118 begin');
      const flags: number = flagsForIndex(117);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0119
     * @tc.name      testBundleSignature0119
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0119 begin');
      const flags: number = flagsForIndex(118);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0120
     * @tc.name      testBundleSignature0120
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0120 begin');
      const flags: number = flagsForIndex(119);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0121
     * @tc.name      testBundleSignature0121
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0121 begin');
      const flags: number = flagsForIndex(120);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0122
     * @tc.name      testBundleSignature0122
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0122 begin');
      const flags: number = flagsForIndex(121);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0123
     * @tc.name      testBundleSignature0123
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0123 begin');
      const flags: number = flagsForIndex(122);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0124
     * @tc.name      testBundleSignature0124
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0124 begin');
      const flags: number = flagsForIndex(123);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0125
     * @tc.name      testBundleSignature0125
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0125 begin');
      const flags: number = flagsForIndex(124);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0126
     * @tc.name      testBundleSignature0126
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0126 begin');
      const flags: number = flagsForIndex(125);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0127
     * @tc.name      testBundleSignature0127
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0127 begin');
      const flags: number = flagsForIndex(126);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0128
     * @tc.name      testBundleSignature0128
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0128 begin');
      const flags: number = flagsForIndex(127);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0128 end');
    })

  })
}
