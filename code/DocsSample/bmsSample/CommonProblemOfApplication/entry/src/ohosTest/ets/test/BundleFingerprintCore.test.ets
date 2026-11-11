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
const TAG: string = '[Sample_CommonProblem_BundleFingerprintCore]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFingerprintCoreTest() {
  describe('bundleFingerprintCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0001
     * @tc.name      testFingerprint0001
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0001 begin');
      const flags: number = flagsForIndex(0);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0002
     * @tc.name      testFingerprint0002
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0002 begin');
      const flags: number = flagsForIndex(1);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0003
     * @tc.name      testFingerprint0003
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0003 begin');
      const flags: number = flagsForIndex(2);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0004
     * @tc.name      testFingerprint0004
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0004 begin');
      const flags: number = flagsForIndex(3);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0005
     * @tc.name      testFingerprint0005
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0005 begin');
      const flags: number = flagsForIndex(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0006
     * @tc.name      testFingerprint0006
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0006 begin');
      const flags: number = flagsForIndex(5);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0007
     * @tc.name      testFingerprint0007
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0007 begin');
      const flags: number = flagsForIndex(6);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0008
     * @tc.name      testFingerprint0008
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0008 begin');
      const flags: number = flagsForIndex(7);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0009
     * @tc.name      testFingerprint0009
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0009 begin');
      const flags: number = flagsForIndex(8);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0010
     * @tc.name      testFingerprint0010
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0010 begin');
      const flags: number = flagsForIndex(9);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0011
     * @tc.name      testFingerprint0011
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0011 begin');
      const flags: number = flagsForIndex(10);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0012
     * @tc.name      testFingerprint0012
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0012 begin');
      const flags: number = flagsForIndex(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0013
     * @tc.name      testFingerprint0013
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0013 begin');
      const flags: number = flagsForIndex(12);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0014
     * @tc.name      testFingerprint0014
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0014 begin');
      const flags: number = flagsForIndex(13);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0015
     * @tc.name      testFingerprint0015
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0015 begin');
      const flags: number = flagsForIndex(14);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0016
     * @tc.name      testFingerprint0016
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0016 begin');
      const flags: number = flagsForIndex(15);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0017
     * @tc.name      testFingerprint0017
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0017 begin');
      const flags: number = flagsForIndex(16);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0018
     * @tc.name      testFingerprint0018
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0018 begin');
      const flags: number = flagsForIndex(17);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0019
     * @tc.name      testFingerprint0019
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0019 begin');
      const flags: number = flagsForIndex(18);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0020
     * @tc.name      testFingerprint0020
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0020 begin');
      const flags: number = flagsForIndex(19);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0021
     * @tc.name      testFingerprint0021
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0021 begin');
      const flags: number = flagsForIndex(20);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0022
     * @tc.name      testFingerprint0022
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0022 begin');
      const flags: number = flagsForIndex(21);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0023
     * @tc.name      testFingerprint0023
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0023 begin');
      const flags: number = flagsForIndex(22);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0024
     * @tc.name      testFingerprint0024
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0024 begin');
      const flags: number = flagsForIndex(23);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0025
     * @tc.name      testFingerprint0025
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0025 begin');
      const flags: number = flagsForIndex(24);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0026
     * @tc.name      testFingerprint0026
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0026 begin');
      const flags: number = flagsForIndex(25);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0027
     * @tc.name      testFingerprint0027
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0027 begin');
      const flags: number = flagsForIndex(26);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0028
     * @tc.name      testFingerprint0028
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0028 begin');
      const flags: number = flagsForIndex(27);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0029
     * @tc.name      testFingerprint0029
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0029 begin');
      const flags: number = flagsForIndex(28);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0030
     * @tc.name      testFingerprint0030
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0030 begin');
      const flags: number = flagsForIndex(29);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0031
     * @tc.name      testFingerprint0031
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0031 begin');
      const flags: number = flagsForIndex(30);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0032
     * @tc.name      testFingerprint0032
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0032 begin');
      const flags: number = flagsForIndex(31);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0033
     * @tc.name      testFingerprint0033
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0033 begin');
      const flags: number = flagsForIndex(32);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0034
     * @tc.name      testFingerprint0034
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0034 begin');
      const flags: number = flagsForIndex(33);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0035
     * @tc.name      testFingerprint0035
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0035 begin');
      const flags: number = flagsForIndex(34);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0036
     * @tc.name      testFingerprint0036
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0036 begin');
      const flags: number = flagsForIndex(35);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0037
     * @tc.name      testFingerprint0037
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0037 begin');
      const flags: number = flagsForIndex(36);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0038
     * @tc.name      testFingerprint0038
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0038 begin');
      const flags: number = flagsForIndex(37);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0039
     * @tc.name      testFingerprint0039
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0039 begin');
      const flags: number = flagsForIndex(38);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0040
     * @tc.name      testFingerprint0040
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0040 begin');
      const flags: number = flagsForIndex(39);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0041
     * @tc.name      testFingerprint0041
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0041 begin');
      const flags: number = flagsForIndex(40);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0042
     * @tc.name      testFingerprint0042
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0042 begin');
      const flags: number = flagsForIndex(41);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0043
     * @tc.name      testFingerprint0043
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0043 begin');
      const flags: number = flagsForIndex(42);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0044
     * @tc.name      testFingerprint0044
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0044 begin');
      const flags: number = flagsForIndex(43);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0045
     * @tc.name      testFingerprint0045
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0045 begin');
      const flags: number = flagsForIndex(44);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0046
     * @tc.name      testFingerprint0046
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0046 begin');
      const flags: number = flagsForIndex(45);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0047
     * @tc.name      testFingerprint0047
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0047 begin');
      const flags: number = flagsForIndex(46);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0048
     * @tc.name      testFingerprint0048
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0048 begin');
      const flags: number = flagsForIndex(47);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0049
     * @tc.name      testFingerprint0049
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0049 begin');
      const flags: number = flagsForIndex(48);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0050
     * @tc.name      testFingerprint0050
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0050 begin');
      const flags: number = flagsForIndex(49);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0051
     * @tc.name      testFingerprint0051
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0051 begin');
      const flags: number = flagsForIndex(50);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0052
     * @tc.name      testFingerprint0052
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0052 begin');
      const flags: number = flagsForIndex(51);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0053
     * @tc.name      testFingerprint0053
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0053 begin');
      const flags: number = flagsForIndex(52);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0054
     * @tc.name      testFingerprint0054
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0054 begin');
      const flags: number = flagsForIndex(53);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0055
     * @tc.name      testFingerprint0055
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0055 begin');
      const flags: number = flagsForIndex(54);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0056
     * @tc.name      testFingerprint0056
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0056 begin');
      const flags: number = flagsForIndex(55);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0057
     * @tc.name      testFingerprint0057
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0057 begin');
      const flags: number = flagsForIndex(56);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0058
     * @tc.name      testFingerprint0058
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0058 begin');
      const flags: number = flagsForIndex(57);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0059
     * @tc.name      testFingerprint0059
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0059 begin');
      const flags: number = flagsForIndex(58);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0060
     * @tc.name      testFingerprint0060
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0060 begin');
      const flags: number = flagsForIndex(59);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0061
     * @tc.name      testFingerprint0061
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0061 begin');
      const flags: number = flagsForIndex(60);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0062
     * @tc.name      testFingerprint0062
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0062 begin');
      const flags: number = flagsForIndex(61);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0063
     * @tc.name      testFingerprint0063
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0063 begin');
      const flags: number = flagsForIndex(62);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0064
     * @tc.name      testFingerprint0064
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0064 begin');
      const flags: number = flagsForIndex(63);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0064 end');
    })

  })
}
