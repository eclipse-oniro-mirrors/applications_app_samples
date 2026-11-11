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
const TAG: string = '[Sample_CommonProblem_BundleFingerprintAdvanced]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFingerprintAdvancedTest() {
  describe('bundleFingerprintAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0129
     * @tc.name      testFingerprint0129
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0129 begin');
      const flags: number = flagsForIndex(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0130
     * @tc.name      testFingerprint0130
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0130 begin');
      const flags: number = flagsForIndex(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0131
     * @tc.name      testFingerprint0131
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0131 begin');
      const flags: number = flagsForIndex(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0132
     * @tc.name      testFingerprint0132
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0132 begin');
      const flags: number = flagsForIndex(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0133
     * @tc.name      testFingerprint0133
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0133 begin');
      const flags: number = flagsForIndex(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0134
     * @tc.name      testFingerprint0134
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0134 begin');
      const flags: number = flagsForIndex(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0135
     * @tc.name      testFingerprint0135
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0135 begin');
      const flags: number = flagsForIndex(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0136
     * @tc.name      testFingerprint0136
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0136 begin');
      const flags: number = flagsForIndex(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0137
     * @tc.name      testFingerprint0137
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0137 begin');
      const flags: number = flagsForIndex(136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0138
     * @tc.name      testFingerprint0138
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0138 begin');
      const flags: number = flagsForIndex(137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0139
     * @tc.name      testFingerprint0139
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0139 begin');
      const flags: number = flagsForIndex(138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0140
     * @tc.name      testFingerprint0140
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0140 begin');
      const flags: number = flagsForIndex(139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0141
     * @tc.name      testFingerprint0141
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0141 begin');
      const flags: number = flagsForIndex(140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0142
     * @tc.name      testFingerprint0142
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0142 begin');
      const flags: number = flagsForIndex(141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0143
     * @tc.name      testFingerprint0143
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0143 begin');
      const flags: number = flagsForIndex(142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0144
     * @tc.name      testFingerprint0144
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0144 begin');
      const flags: number = flagsForIndex(143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0145
     * @tc.name      testFingerprint0145
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0145 begin');
      const flags: number = flagsForIndex(144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0146
     * @tc.name      testFingerprint0146
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0146 begin');
      const flags: number = flagsForIndex(145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0147
     * @tc.name      testFingerprint0147
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0147 begin');
      const flags: number = flagsForIndex(146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0148
     * @tc.name      testFingerprint0148
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0148 begin');
      const flags: number = flagsForIndex(147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0149
     * @tc.name      testFingerprint0149
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0149 begin');
      const flags: number = flagsForIndex(148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0150
     * @tc.name      testFingerprint0150
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0150 begin');
      const flags: number = flagsForIndex(149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0151
     * @tc.name      testFingerprint0151
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0151 begin');
      const flags: number = flagsForIndex(150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0152
     * @tc.name      testFingerprint0152
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0152 begin');
      const flags: number = flagsForIndex(151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0153
     * @tc.name      testFingerprint0153
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0153 begin');
      const flags: number = flagsForIndex(152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0154
     * @tc.name      testFingerprint0154
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0154 begin');
      const flags: number = flagsForIndex(153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0155
     * @tc.name      testFingerprint0155
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0155 begin');
      const flags: number = flagsForIndex(154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0156
     * @tc.name      testFingerprint0156
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0156 begin');
      const flags: number = flagsForIndex(155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0157
     * @tc.name      testFingerprint0157
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0157 begin');
      const flags: number = flagsForIndex(156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0158
     * @tc.name      testFingerprint0158
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0158 begin');
      const flags: number = flagsForIndex(157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0159
     * @tc.name      testFingerprint0159
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0159 begin');
      const flags: number = flagsForIndex(158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0160
     * @tc.name      testFingerprint0160
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0160 begin');
      const flags: number = flagsForIndex(159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0161
     * @tc.name      testFingerprint0161
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0161 begin');
      const flags: number = flagsForIndex(160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0162
     * @tc.name      testFingerprint0162
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0162 begin');
      const flags: number = flagsForIndex(161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0163
     * @tc.name      testFingerprint0163
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0163 begin');
      const flags: number = flagsForIndex(162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0164
     * @tc.name      testFingerprint0164
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0164 begin');
      const flags: number = flagsForIndex(163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0165
     * @tc.name      testFingerprint0165
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0165 begin');
      const flags: number = flagsForIndex(164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0166
     * @tc.name      testFingerprint0166
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0166 begin');
      const flags: number = flagsForIndex(165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0167
     * @tc.name      testFingerprint0167
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0167 begin');
      const flags: number = flagsForIndex(166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0168
     * @tc.name      testFingerprint0168
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0168 begin');
      const flags: number = flagsForIndex(167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0169
     * @tc.name      testFingerprint0169
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0169 begin');
      const flags: number = flagsForIndex(168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0170
     * @tc.name      testFingerprint0170
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0170 begin');
      const flags: number = flagsForIndex(169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0171
     * @tc.name      testFingerprint0171
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0171 begin');
      const flags: number = flagsForIndex(170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0172
     * @tc.name      testFingerprint0172
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0172 begin');
      const flags: number = flagsForIndex(171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0173
     * @tc.name      testFingerprint0173
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0173 begin');
      const flags: number = flagsForIndex(172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0174
     * @tc.name      testFingerprint0174
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0174 begin');
      const flags: number = flagsForIndex(173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0175
     * @tc.name      testFingerprint0175
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0175 begin');
      const flags: number = flagsForIndex(174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0176
     * @tc.name      testFingerprint0176
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0176 begin');
      const flags: number = flagsForIndex(175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0177
     * @tc.name      testFingerprint0177
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0177 begin');
      const flags: number = flagsForIndex(176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0178
     * @tc.name      testFingerprint0178
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0178 begin');
      const flags: number = flagsForIndex(177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0179
     * @tc.name      testFingerprint0179
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0179 begin');
      const flags: number = flagsForIndex(178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0180
     * @tc.name      testFingerprint0180
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0180 begin');
      const flags: number = flagsForIndex(179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0181
     * @tc.name      testFingerprint0181
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0181 begin');
      const flags: number = flagsForIndex(180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0182
     * @tc.name      testFingerprint0182
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0182 begin');
      const flags: number = flagsForIndex(181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0183
     * @tc.name      testFingerprint0183
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0183 begin');
      const flags: number = flagsForIndex(182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0184
     * @tc.name      testFingerprint0184
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0184 begin');
      const flags: number = flagsForIndex(183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0185
     * @tc.name      testFingerprint0185
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0185 begin');
      const flags: number = flagsForIndex(184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0186
     * @tc.name      testFingerprint0186
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0186 begin');
      const flags: number = flagsForIndex(185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0187
     * @tc.name      testFingerprint0187
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0187 begin');
      const flags: number = flagsForIndex(186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0188
     * @tc.name      testFingerprint0188
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0188 begin');
      const flags: number = flagsForIndex(187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0189
     * @tc.name      testFingerprint0189
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0189 begin');
      const flags: number = flagsForIndex(188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0190
     * @tc.name      testFingerprint0190
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0190 begin');
      const flags: number = flagsForIndex(189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0191
     * @tc.name      testFingerprint0191
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0191 begin');
      const flags: number = flagsForIndex(190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0192
     * @tc.name      testFingerprint0192
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0192 begin');
      const flags: number = flagsForIndex(191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0192 end');
    })

  })
}
