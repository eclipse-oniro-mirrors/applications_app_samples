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
const TAG: string = '[Sample_CommonProblem_BundleSignatureMatrixCore]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleSignatureMatrixCoreTest() {
  describe('bundleSignatureMatrixCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0001
     * @tc.name      testBundleSignature0001
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0001 begin');
      const flags: number = flagsForIndex(0);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0002
     * @tc.name      testBundleSignature0002
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0002 begin');
      const flags: number = flagsForIndex(1);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0003
     * @tc.name      testBundleSignature0003
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0003 begin');
      const flags: number = flagsForIndex(2);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0004
     * @tc.name      testBundleSignature0004
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0004 begin');
      const flags: number = flagsForIndex(3);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0005
     * @tc.name      testBundleSignature0005
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0005 begin');
      const flags: number = flagsForIndex(4);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0006
     * @tc.name      testBundleSignature0006
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0006 begin');
      const flags: number = flagsForIndex(5);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0007
     * @tc.name      testBundleSignature0007
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0007 begin');
      const flags: number = flagsForIndex(6);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0008
     * @tc.name      testBundleSignature0008
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0008 begin');
      const flags: number = flagsForIndex(7);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0009
     * @tc.name      testBundleSignature0009
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0009 begin');
      const flags: number = flagsForIndex(8);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0010
     * @tc.name      testBundleSignature0010
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0010 begin');
      const flags: number = flagsForIndex(9);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0011
     * @tc.name      testBundleSignature0011
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0011 begin');
      const flags: number = flagsForIndex(10);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0012
     * @tc.name      testBundleSignature0012
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0012 begin');
      const flags: number = flagsForIndex(11);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0013
     * @tc.name      testBundleSignature0013
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0013 begin');
      const flags: number = flagsForIndex(12);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0014
     * @tc.name      testBundleSignature0014
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0014 begin');
      const flags: number = flagsForIndex(13);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0015
     * @tc.name      testBundleSignature0015
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0015 begin');
      const flags: number = flagsForIndex(14);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0016
     * @tc.name      testBundleSignature0016
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0016 begin');
      const flags: number = flagsForIndex(15);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0017
     * @tc.name      testBundleSignature0017
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0017 begin');
      const flags: number = flagsForIndex(16);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0018
     * @tc.name      testBundleSignature0018
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0018 begin');
      const flags: number = flagsForIndex(17);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0019
     * @tc.name      testBundleSignature0019
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0019 begin');
      const flags: number = flagsForIndex(18);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0020
     * @tc.name      testBundleSignature0020
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0020 begin');
      const flags: number = flagsForIndex(19);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0021
     * @tc.name      testBundleSignature0021
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0021 begin');
      const flags: number = flagsForIndex(20);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0022
     * @tc.name      testBundleSignature0022
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0022 begin');
      const flags: number = flagsForIndex(21);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0023
     * @tc.name      testBundleSignature0023
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0023 begin');
      const flags: number = flagsForIndex(22);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0024
     * @tc.name      testBundleSignature0024
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0024 begin');
      const flags: number = flagsForIndex(23);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0025
     * @tc.name      testBundleSignature0025
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0025 begin');
      const flags: number = flagsForIndex(24);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0026
     * @tc.name      testBundleSignature0026
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0026 begin');
      const flags: number = flagsForIndex(25);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0027
     * @tc.name      testBundleSignature0027
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0027 begin');
      const flags: number = flagsForIndex(26);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0028
     * @tc.name      testBundleSignature0028
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0028 begin');
      const flags: number = flagsForIndex(27);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0029
     * @tc.name      testBundleSignature0029
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0029 begin');
      const flags: number = flagsForIndex(28);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0030
     * @tc.name      testBundleSignature0030
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0030 begin');
      const flags: number = flagsForIndex(29);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0031
     * @tc.name      testBundleSignature0031
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0031 begin');
      const flags: number = flagsForIndex(30);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0032
     * @tc.name      testBundleSignature0032
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0032 begin');
      const flags: number = flagsForIndex(31);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0033
     * @tc.name      testBundleSignature0033
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0033 begin');
      const flags: number = flagsForIndex(32);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0034
     * @tc.name      testBundleSignature0034
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0034 begin');
      const flags: number = flagsForIndex(33);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0035
     * @tc.name      testBundleSignature0035
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0035 begin');
      const flags: number = flagsForIndex(34);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0036
     * @tc.name      testBundleSignature0036
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0036 begin');
      const flags: number = flagsForIndex(35);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0037
     * @tc.name      testBundleSignature0037
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0037 begin');
      const flags: number = flagsForIndex(36);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0038
     * @tc.name      testBundleSignature0038
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0038 begin');
      const flags: number = flagsForIndex(37);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0039
     * @tc.name      testBundleSignature0039
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0039 begin');
      const flags: number = flagsForIndex(38);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0040
     * @tc.name      testBundleSignature0040
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0040 begin');
      const flags: number = flagsForIndex(39);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0041
     * @tc.name      testBundleSignature0041
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0041 begin');
      const flags: number = flagsForIndex(40);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0042
     * @tc.name      testBundleSignature0042
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0042 begin');
      const flags: number = flagsForIndex(41);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0043
     * @tc.name      testBundleSignature0043
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0043 begin');
      const flags: number = flagsForIndex(42);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0044
     * @tc.name      testBundleSignature0044
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0044 begin');
      const flags: number = flagsForIndex(43);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0045
     * @tc.name      testBundleSignature0045
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0045 begin');
      const flags: number = flagsForIndex(44);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0046
     * @tc.name      testBundleSignature0046
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0046 begin');
      const flags: number = flagsForIndex(45);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0047
     * @tc.name      testBundleSignature0047
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0047 begin');
      const flags: number = flagsForIndex(46);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0048
     * @tc.name      testBundleSignature0048
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0048 begin');
      const flags: number = flagsForIndex(47);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0049
     * @tc.name      testBundleSignature0049
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0049 begin');
      const flags: number = flagsForIndex(48);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0050
     * @tc.name      testBundleSignature0050
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0050 begin');
      const flags: number = flagsForIndex(49);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0051
     * @tc.name      testBundleSignature0051
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0051 begin');
      const flags: number = flagsForIndex(50);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0052
     * @tc.name      testBundleSignature0052
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0052 begin');
      const flags: number = flagsForIndex(51);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0053
     * @tc.name      testBundleSignature0053
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0053 begin');
      const flags: number = flagsForIndex(52);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0054
     * @tc.name      testBundleSignature0054
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0054 begin');
      const flags: number = flagsForIndex(53);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0055
     * @tc.name      testBundleSignature0055
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0055 begin');
      const flags: number = flagsForIndex(54);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0056
     * @tc.name      testBundleSignature0056
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0056 begin');
      const flags: number = flagsForIndex(55);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0057
     * @tc.name      testBundleSignature0057
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0057 begin');
      const flags: number = flagsForIndex(56);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0058
     * @tc.name      testBundleSignature0058
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0058 begin');
      const flags: number = flagsForIndex(57);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0059
     * @tc.name      testBundleSignature0059
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0059 begin');
      const flags: number = flagsForIndex(58);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0060
     * @tc.name      testBundleSignature0060
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0060 begin');
      const flags: number = flagsForIndex(59);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0061
     * @tc.name      testBundleSignature0061
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0061 begin');
      const flags: number = flagsForIndex(60);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0062
     * @tc.name      testBundleSignature0062
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0062 begin');
      const flags: number = flagsForIndex(61);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0063
     * @tc.name      testBundleSignature0063
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0063 begin');
      const flags: number = flagsForIndex(62);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0064
     * @tc.name      testBundleSignature0064
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0064 begin');
      const flags: number = flagsForIndex(63);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0064 end');
    })

  })
}
