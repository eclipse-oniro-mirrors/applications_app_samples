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
const TAG: string = '[Sample_CommonProblem_BundleFingerprintTail]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFingerprintTailTest() {
  describe('bundleFingerprintTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0193
     * @tc.name      testFingerprint0193
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0193 begin');
      const flags: number = flagsForIndex(192);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0194
     * @tc.name      testFingerprint0194
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0194 begin');
      const flags: number = flagsForIndex(193);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0195
     * @tc.name      testFingerprint0195
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0195 begin');
      const flags: number = flagsForIndex(194);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0196
     * @tc.name      testFingerprint0196
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0196 begin');
      const flags: number = flagsForIndex(195);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0197
     * @tc.name      testFingerprint0197
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0197 begin');
      const flags: number = flagsForIndex(196);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0198
     * @tc.name      testFingerprint0198
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0198 begin');
      const flags: number = flagsForIndex(197);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0199
     * @tc.name      testFingerprint0199
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0199 begin');
      const flags: number = flagsForIndex(198);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0200
     * @tc.name      testFingerprint0200
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0200 begin');
      const flags: number = flagsForIndex(199);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0201
     * @tc.name      testFingerprint0201
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0201 begin');
      const flags: number = flagsForIndex(200);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0202
     * @tc.name      testFingerprint0202
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0202 begin');
      const flags: number = flagsForIndex(201);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0203
     * @tc.name      testFingerprint0203
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0203 begin');
      const flags: number = flagsForIndex(202);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0204
     * @tc.name      testFingerprint0204
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0204 begin');
      const flags: number = flagsForIndex(203);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0205
     * @tc.name      testFingerprint0205
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0205 begin');
      const flags: number = flagsForIndex(204);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0206
     * @tc.name      testFingerprint0206
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0206 begin');
      const flags: number = flagsForIndex(205);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0207
     * @tc.name      testFingerprint0207
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0207 begin');
      const flags: number = flagsForIndex(206);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0208
     * @tc.name      testFingerprint0208
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0208 begin');
      const flags: number = flagsForIndex(207);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0209
     * @tc.name      testFingerprint0209
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0209 begin');
      const flags: number = flagsForIndex(208);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0210
     * @tc.name      testFingerprint0210
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0210 begin');
      const flags: number = flagsForIndex(209);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0211
     * @tc.name      testFingerprint0211
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0211 begin');
      const flags: number = flagsForIndex(210);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0212
     * @tc.name      testFingerprint0212
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0212 begin');
      const flags: number = flagsForIndex(211);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0213
     * @tc.name      testFingerprint0213
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0213 begin');
      const flags: number = flagsForIndex(212);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0214
     * @tc.name      testFingerprint0214
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0214 begin');
      const flags: number = flagsForIndex(213);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0215
     * @tc.name      testFingerprint0215
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0215 begin');
      const flags: number = flagsForIndex(214);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0216
     * @tc.name      testFingerprint0216
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0216 begin');
      const flags: number = flagsForIndex(215);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0217
     * @tc.name      testFingerprint0217
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0217 begin');
      const flags: number = flagsForIndex(216);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0218
     * @tc.name      testFingerprint0218
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0218 begin');
      const flags: number = flagsForIndex(217);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0219
     * @tc.name      testFingerprint0219
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0219 begin');
      const flags: number = flagsForIndex(218);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0220
     * @tc.name      testFingerprint0220
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0220 begin');
      const flags: number = flagsForIndex(219);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0221
     * @tc.name      testFingerprint0221
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0221 begin');
      const flags: number = flagsForIndex(220);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0222
     * @tc.name      testFingerprint0222
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0222 begin');
      const flags: number = flagsForIndex(221);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0223
     * @tc.name      testFingerprint0223
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0223 begin');
      const flags: number = flagsForIndex(222);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0224
     * @tc.name      testFingerprint0224
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0224 begin');
      const flags: number = flagsForIndex(223);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0225
     * @tc.name      testFingerprint0225
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0225 begin');
      const flags: number = flagsForIndex(224);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0226
     * @tc.name      testFingerprint0226
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0226 begin');
      const flags: number = flagsForIndex(225);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0227
     * @tc.name      testFingerprint0227
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0227 begin');
      const flags: number = flagsForIndex(226);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0228
     * @tc.name      testFingerprint0228
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0228 begin');
      const flags: number = flagsForIndex(227);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0229
     * @tc.name      testFingerprint0229
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0229 begin');
      const flags: number = flagsForIndex(228);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0230
     * @tc.name      testFingerprint0230
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0230 begin');
      const flags: number = flagsForIndex(229);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0231
     * @tc.name      testFingerprint0231
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0231 begin');
      const flags: number = flagsForIndex(230);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0232
     * @tc.name      testFingerprint0232
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0232 begin');
      const flags: number = flagsForIndex(231);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0233
     * @tc.name      testFingerprint0233
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0233 begin');
      const flags: number = flagsForIndex(232);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0234
     * @tc.name      testFingerprint0234
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0234 begin');
      const flags: number = flagsForIndex(233);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0235
     * @tc.name      testFingerprint0235
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0235 begin');
      const flags: number = flagsForIndex(234);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0236
     * @tc.name      testFingerprint0236
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0236 begin');
      const flags: number = flagsForIndex(235);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0237
     * @tc.name      testFingerprint0237
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0237 begin');
      const flags: number = flagsForIndex(236);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0238
     * @tc.name      testFingerprint0238
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0238 begin');
      const flags: number = flagsForIndex(237);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0239
     * @tc.name      testFingerprint0239
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0239 begin');
      const flags: number = flagsForIndex(238);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0240
     * @tc.name      testFingerprint0240
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0240 begin');
      const flags: number = flagsForIndex(239);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0241
     * @tc.name      testFingerprint0241
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0241 begin');
      const flags: number = flagsForIndex(240);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0242
     * @tc.name      testFingerprint0242
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0242 begin');
      const flags: number = flagsForIndex(241);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0243
     * @tc.name      testFingerprint0243
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0243 begin');
      const flags: number = flagsForIndex(242);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0244
     * @tc.name      testFingerprint0244
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0244 begin');
      const flags: number = flagsForIndex(243);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0245
     * @tc.name      testFingerprint0245
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0245 begin');
      const flags: number = flagsForIndex(244);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0246
     * @tc.name      testFingerprint0246
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0246 begin');
      const flags: number = flagsForIndex(245);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0247
     * @tc.name      testFingerprint0247
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0247 begin');
      const flags: number = flagsForIndex(246);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0248
     * @tc.name      testFingerprint0248
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0248 begin');
      const flags: number = flagsForIndex(247);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0249
     * @tc.name      testFingerprint0249
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0249 begin');
      const flags: number = flagsForIndex(248);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0250
     * @tc.name      testFingerprint0250
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0250 begin');
      const flags: number = flagsForIndex(249);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0251
     * @tc.name      testFingerprint0251
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0251 begin');
      const flags: number = flagsForIndex(250);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0252
     * @tc.name      testFingerprint0252
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0252 begin');
      const flags: number = flagsForIndex(251);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0253
     * @tc.name      testFingerprint0253
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0253 begin');
      const flags: number = flagsForIndex(252);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0254
     * @tc.name      testFingerprint0254
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0254 begin');
      const flags: number = flagsForIndex(253);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0255
     * @tc.name      testFingerprint0255
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0255 begin');
      const flags: number = flagsForIndex(254);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FINGERPRINT_0256
     * @tc.name      testFingerprint0256
     * @tc.desc      Verify bundleFingerprint with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFingerprint0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0256 begin');
      const flags: number = flagsForIndex(255);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFingerprint0256 end');
    })

  })
}
