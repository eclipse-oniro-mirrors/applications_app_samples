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
const TAG: string = '[Sample_CommonProblem_BundleFingerprintExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFingerprintExtendedTest() {
  describe('bundleFingerprintExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0065
     * @tc.name      testFingerprint0065
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0065 begin');
      const flags: number = flagsForIndex(64);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0066
     * @tc.name      testFingerprint0066
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0066 begin');
      const flags: number = flagsForIndex(65);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0067
     * @tc.name      testFingerprint0067
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0067 begin');
      const flags: number = flagsForIndex(66);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0068
     * @tc.name      testFingerprint0068
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0068 begin');
      const flags: number = flagsForIndex(67);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0069
     * @tc.name      testFingerprint0069
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0069 begin');
      const flags: number = flagsForIndex(68);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0070
     * @tc.name      testFingerprint0070
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0070 begin');
      const flags: number = flagsForIndex(69);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0071
     * @tc.name      testFingerprint0071
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0071 begin');
      const flags: number = flagsForIndex(70);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0072
     * @tc.name      testFingerprint0072
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0072 begin');
      const flags: number = flagsForIndex(71);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0073
     * @tc.name      testFingerprint0073
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0073 begin');
      const flags: number = flagsForIndex(72);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0074
     * @tc.name      testFingerprint0074
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0074 begin');
      const flags: number = flagsForIndex(73);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0075
     * @tc.name      testFingerprint0075
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0075 begin');
      const flags: number = flagsForIndex(74);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0076
     * @tc.name      testFingerprint0076
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0076 begin');
      const flags: number = flagsForIndex(75);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0077
     * @tc.name      testFingerprint0077
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0077 begin');
      const flags: number = flagsForIndex(76);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0078
     * @tc.name      testFingerprint0078
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0078 begin');
      const flags: number = flagsForIndex(77);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0079
     * @tc.name      testFingerprint0079
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0079 begin');
      const flags: number = flagsForIndex(78);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0080
     * @tc.name      testFingerprint0080
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0080 begin');
      const flags: number = flagsForIndex(79);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0081
     * @tc.name      testFingerprint0081
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0081 begin');
      const flags: number = flagsForIndex(80);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0082
     * @tc.name      testFingerprint0082
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0082 begin');
      const flags: number = flagsForIndex(81);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0083
     * @tc.name      testFingerprint0083
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0083 begin');
      const flags: number = flagsForIndex(82);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0084
     * @tc.name      testFingerprint0084
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0084 begin');
      const flags: number = flagsForIndex(83);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0085
     * @tc.name      testFingerprint0085
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0085 begin');
      const flags: number = flagsForIndex(84);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0086
     * @tc.name      testFingerprint0086
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0086 begin');
      const flags: number = flagsForIndex(85);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0087
     * @tc.name      testFingerprint0087
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0087 begin');
      const flags: number = flagsForIndex(86);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0088
     * @tc.name      testFingerprint0088
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0088 begin');
      const flags: number = flagsForIndex(87);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0089
     * @tc.name      testFingerprint0089
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0089 begin');
      const flags: number = flagsForIndex(88);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0090
     * @tc.name      testFingerprint0090
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0090 begin');
      const flags: number = flagsForIndex(89);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0091
     * @tc.name      testFingerprint0091
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0091 begin');
      const flags: number = flagsForIndex(90);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0092
     * @tc.name      testFingerprint0092
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0092 begin');
      const flags: number = flagsForIndex(91);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0093
     * @tc.name      testFingerprint0093
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0093 begin');
      const flags: number = flagsForIndex(92);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0094
     * @tc.name      testFingerprint0094
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0094 begin');
      const flags: number = flagsForIndex(93);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0095
     * @tc.name      testFingerprint0095
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0095 begin');
      const flags: number = flagsForIndex(94);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0096
     * @tc.name      testFingerprint0096
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0096 begin');
      const flags: number = flagsForIndex(95);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0097
     * @tc.name      testFingerprint0097
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0097 begin');
      const flags: number = flagsForIndex(96);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0098
     * @tc.name      testFingerprint0098
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0098 begin');
      const flags: number = flagsForIndex(97);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0099
     * @tc.name      testFingerprint0099
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0099 begin');
      const flags: number = flagsForIndex(98);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0100
     * @tc.name      testFingerprint0100
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0100 begin');
      const flags: number = flagsForIndex(99);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0101
     * @tc.name      testFingerprint0101
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0101 begin');
      const flags: number = flagsForIndex(100);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0102
     * @tc.name      testFingerprint0102
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0102 begin');
      const flags: number = flagsForIndex(101);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0103
     * @tc.name      testFingerprint0103
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0103 begin');
      const flags: number = flagsForIndex(102);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0104
     * @tc.name      testFingerprint0104
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0104 begin');
      const flags: number = flagsForIndex(103);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0105
     * @tc.name      testFingerprint0105
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0105 begin');
      const flags: number = flagsForIndex(104);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0106
     * @tc.name      testFingerprint0106
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0106 begin');
      const flags: number = flagsForIndex(105);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0107
     * @tc.name      testFingerprint0107
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0107 begin');
      const flags: number = flagsForIndex(106);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0108
     * @tc.name      testFingerprint0108
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0108 begin');
      const flags: number = flagsForIndex(107);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0109
     * @tc.name      testFingerprint0109
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0109 begin');
      const flags: number = flagsForIndex(108);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0110
     * @tc.name      testFingerprint0110
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0110 begin');
      const flags: number = flagsForIndex(109);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0111
     * @tc.name      testFingerprint0111
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0111 begin');
      const flags: number = flagsForIndex(110);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0112
     * @tc.name      testFingerprint0112
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0112 begin');
      const flags: number = flagsForIndex(111);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0113
     * @tc.name      testFingerprint0113
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0113 begin');
      const flags: number = flagsForIndex(112);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0114
     * @tc.name      testFingerprint0114
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0114 begin');
      const flags: number = flagsForIndex(113);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0115
     * @tc.name      testFingerprint0115
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0115 begin');
      const flags: number = flagsForIndex(114);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0116
     * @tc.name      testFingerprint0116
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0116 begin');
      const flags: number = flagsForIndex(115);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0117
     * @tc.name      testFingerprint0117
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0117 begin');
      const flags: number = flagsForIndex(116);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0118
     * @tc.name      testFingerprint0118
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0118 begin');
      const flags: number = flagsForIndex(117);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0119
     * @tc.name      testFingerprint0119
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0119 begin');
      const flags: number = flagsForIndex(118);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0120
     * @tc.name      testFingerprint0120
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0120 begin');
      const flags: number = flagsForIndex(119);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0121
     * @tc.name      testFingerprint0121
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0121 begin');
      const flags: number = flagsForIndex(120);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0122
     * @tc.name      testFingerprint0122
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0122 begin');
      const flags: number = flagsForIndex(121);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0123
     * @tc.name      testFingerprint0123
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0123 begin');
      const flags: number = flagsForIndex(122);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0124
     * @tc.name      testFingerprint0124
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0124 begin');
      const flags: number = flagsForIndex(123);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0125
     * @tc.name      testFingerprint0125
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0125 begin');
      const flags: number = flagsForIndex(124);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0126
     * @tc.name      testFingerprint0126
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0126 begin');
      const flags: number = flagsForIndex(125);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0127
     * @tc.name      testFingerprint0127
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0127 begin');
      const flags: number = flagsForIndex(126);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0128
     * @tc.name      testFingerprint0128
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0128 begin');
      const flags: number = flagsForIndex(127);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(64);
        expect(/^[0-9A-F]+$/.test(fingerprint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0128 end');
    })

  })
}
