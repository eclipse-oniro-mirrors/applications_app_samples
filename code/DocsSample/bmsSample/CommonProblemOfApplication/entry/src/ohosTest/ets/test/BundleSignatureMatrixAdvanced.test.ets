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
const TAG: string = '[Sample_CommonProblem_BundleSignatureMatrixAdvanced]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleSignatureMatrixAdvancedTest() {
  describe('bundleSignatureMatrixAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0129
     * @tc.name      testBundleSignature0129
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0129 begin');
      const flags: number = flagsForIndex(128);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0130
     * @tc.name      testBundleSignature0130
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0130 begin');
      const flags: number = flagsForIndex(129);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0131
     * @tc.name      testBundleSignature0131
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0131 begin');
      const flags: number = flagsForIndex(130);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0132
     * @tc.name      testBundleSignature0132
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0132 begin');
      const flags: number = flagsForIndex(131);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0133
     * @tc.name      testBundleSignature0133
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0133 begin');
      const flags: number = flagsForIndex(132);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0134
     * @tc.name      testBundleSignature0134
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0134 begin');
      const flags: number = flagsForIndex(133);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0135
     * @tc.name      testBundleSignature0135
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0135 begin');
      const flags: number = flagsForIndex(134);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0136
     * @tc.name      testBundleSignature0136
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0136 begin');
      const flags: number = flagsForIndex(135);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0137
     * @tc.name      testBundleSignature0137
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0137 begin');
      const flags: number = flagsForIndex(136);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0138
     * @tc.name      testBundleSignature0138
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0138 begin');
      const flags: number = flagsForIndex(137);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0139
     * @tc.name      testBundleSignature0139
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0139 begin');
      const flags: number = flagsForIndex(138);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0140
     * @tc.name      testBundleSignature0140
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0140 begin');
      const flags: number = flagsForIndex(139);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0141
     * @tc.name      testBundleSignature0141
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0141 begin');
      const flags: number = flagsForIndex(140);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0142
     * @tc.name      testBundleSignature0142
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0142 begin');
      const flags: number = flagsForIndex(141);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0143
     * @tc.name      testBundleSignature0143
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0143 begin');
      const flags: number = flagsForIndex(142);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0144
     * @tc.name      testBundleSignature0144
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0144 begin');
      const flags: number = flagsForIndex(143);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0145
     * @tc.name      testBundleSignature0145
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0145 begin');
      const flags: number = flagsForIndex(144);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0146
     * @tc.name      testBundleSignature0146
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0146 begin');
      const flags: number = flagsForIndex(145);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0147
     * @tc.name      testBundleSignature0147
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0147 begin');
      const flags: number = flagsForIndex(146);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0148
     * @tc.name      testBundleSignature0148
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0148 begin');
      const flags: number = flagsForIndex(147);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0149
     * @tc.name      testBundleSignature0149
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0149 begin');
      const flags: number = flagsForIndex(148);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0150
     * @tc.name      testBundleSignature0150
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0150 begin');
      const flags: number = flagsForIndex(149);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0151
     * @tc.name      testBundleSignature0151
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0151 begin');
      const flags: number = flagsForIndex(150);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0152
     * @tc.name      testBundleSignature0152
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0152 begin');
      const flags: number = flagsForIndex(151);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0153
     * @tc.name      testBundleSignature0153
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0153 begin');
      const flags: number = flagsForIndex(152);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0154
     * @tc.name      testBundleSignature0154
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0154 begin');
      const flags: number = flagsForIndex(153);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0155
     * @tc.name      testBundleSignature0155
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0155 begin');
      const flags: number = flagsForIndex(154);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0156
     * @tc.name      testBundleSignature0156
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0156 begin');
      const flags: number = flagsForIndex(155);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0157
     * @tc.name      testBundleSignature0157
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0157 begin');
      const flags: number = flagsForIndex(156);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0158
     * @tc.name      testBundleSignature0158
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0158 begin');
      const flags: number = flagsForIndex(157);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0159
     * @tc.name      testBundleSignature0159
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0159 begin');
      const flags: number = flagsForIndex(158);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0160
     * @tc.name      testBundleSignature0160
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0160 begin');
      const flags: number = flagsForIndex(159);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0161
     * @tc.name      testBundleSignature0161
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0161 begin');
      const flags: number = flagsForIndex(160);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0162
     * @tc.name      testBundleSignature0162
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0162 begin');
      const flags: number = flagsForIndex(161);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0163
     * @tc.name      testBundleSignature0163
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0163 begin');
      const flags: number = flagsForIndex(162);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0164
     * @tc.name      testBundleSignature0164
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0164 begin');
      const flags: number = flagsForIndex(163);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0165
     * @tc.name      testBundleSignature0165
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0165 begin');
      const flags: number = flagsForIndex(164);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0166
     * @tc.name      testBundleSignature0166
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0166 begin');
      const flags: number = flagsForIndex(165);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0167
     * @tc.name      testBundleSignature0167
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0167 begin');
      const flags: number = flagsForIndex(166);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0168
     * @tc.name      testBundleSignature0168
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0168 begin');
      const flags: number = flagsForIndex(167);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0169
     * @tc.name      testBundleSignature0169
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0169 begin');
      const flags: number = flagsForIndex(168);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0170
     * @tc.name      testBundleSignature0170
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0170 begin');
      const flags: number = flagsForIndex(169);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0171
     * @tc.name      testBundleSignature0171
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0171 begin');
      const flags: number = flagsForIndex(170);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0172
     * @tc.name      testBundleSignature0172
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0172 begin');
      const flags: number = flagsForIndex(171);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0173
     * @tc.name      testBundleSignature0173
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0173 begin');
      const flags: number = flagsForIndex(172);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0174
     * @tc.name      testBundleSignature0174
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0174 begin');
      const flags: number = flagsForIndex(173);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0175
     * @tc.name      testBundleSignature0175
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0175 begin');
      const flags: number = flagsForIndex(174);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0176
     * @tc.name      testBundleSignature0176
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0176 begin');
      const flags: number = flagsForIndex(175);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0177
     * @tc.name      testBundleSignature0177
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0177 begin');
      const flags: number = flagsForIndex(176);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0178
     * @tc.name      testBundleSignature0178
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0178 begin');
      const flags: number = flagsForIndex(177);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0179
     * @tc.name      testBundleSignature0179
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0179 begin');
      const flags: number = flagsForIndex(178);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0180
     * @tc.name      testBundleSignature0180
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0180 begin');
      const flags: number = flagsForIndex(179);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0181
     * @tc.name      testBundleSignature0181
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0181 begin');
      const flags: number = flagsForIndex(180);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0182
     * @tc.name      testBundleSignature0182
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0182 begin');
      const flags: number = flagsForIndex(181);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0183
     * @tc.name      testBundleSignature0183
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0183 begin');
      const flags: number = flagsForIndex(182);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0184
     * @tc.name      testBundleSignature0184
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0184 begin');
      const flags: number = flagsForIndex(183);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0185
     * @tc.name      testBundleSignature0185
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0185 begin');
      const flags: number = flagsForIndex(184);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0186
     * @tc.name      testBundleSignature0186
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0186 begin');
      const flags: number = flagsForIndex(185);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0187
     * @tc.name      testBundleSignature0187
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0187 begin');
      const flags: number = flagsForIndex(186);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0188
     * @tc.name      testBundleSignature0188
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0188 begin');
      const flags: number = flagsForIndex(187);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0189
     * @tc.name      testBundleSignature0189
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0189 begin');
      const flags: number = flagsForIndex(188);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0190
     * @tc.name      testBundleSignature0190
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0190 begin');
      const flags: number = flagsForIndex(189);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0191
     * @tc.name      testBundleSignature0191
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0191 begin');
      const flags: number = flagsForIndex(190);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0192
     * @tc.name      testBundleSignature0192
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0192 begin');
      const flags: number = flagsForIndex(191);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0192 end');
    })

  })
}
