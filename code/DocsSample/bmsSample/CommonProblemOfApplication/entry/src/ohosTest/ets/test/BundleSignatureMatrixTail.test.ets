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
const TAG: string = '[Sample_CommonProblem_BundleSignatureMatrixTail]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleSignatureMatrixTailTest() {
  describe('bundleSignatureMatrixTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0193
     * @tc.name      testBundleSignature0193
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0193 begin');
      const flags: number = flagsForIndex(192);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0194
     * @tc.name      testBundleSignature0194
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0194 begin');
      const flags: number = flagsForIndex(193);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0195
     * @tc.name      testBundleSignature0195
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0195 begin');
      const flags: number = flagsForIndex(194);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0196
     * @tc.name      testBundleSignature0196
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0196 begin');
      const flags: number = flagsForIndex(195);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0197
     * @tc.name      testBundleSignature0197
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0197 begin');
      const flags: number = flagsForIndex(196);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0198
     * @tc.name      testBundleSignature0198
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0198 begin');
      const flags: number = flagsForIndex(197);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0199
     * @tc.name      testBundleSignature0199
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0199 begin');
      const flags: number = flagsForIndex(198);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0200
     * @tc.name      testBundleSignature0200
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0200 begin');
      const flags: number = flagsForIndex(199);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0201
     * @tc.name      testBundleSignature0201
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0201 begin');
      const flags: number = flagsForIndex(200);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0202
     * @tc.name      testBundleSignature0202
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0202 begin');
      const flags: number = flagsForIndex(201);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0203
     * @tc.name      testBundleSignature0203
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0203 begin');
      const flags: number = flagsForIndex(202);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0204
     * @tc.name      testBundleSignature0204
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0204 begin');
      const flags: number = flagsForIndex(203);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0205
     * @tc.name      testBundleSignature0205
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0205 begin');
      const flags: number = flagsForIndex(204);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0206
     * @tc.name      testBundleSignature0206
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0206 begin');
      const flags: number = flagsForIndex(205);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0207
     * @tc.name      testBundleSignature0207
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0207 begin');
      const flags: number = flagsForIndex(206);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0208
     * @tc.name      testBundleSignature0208
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0208 begin');
      const flags: number = flagsForIndex(207);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0209
     * @tc.name      testBundleSignature0209
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0209 begin');
      const flags: number = flagsForIndex(208);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0210
     * @tc.name      testBundleSignature0210
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0210 begin');
      const flags: number = flagsForIndex(209);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0211
     * @tc.name      testBundleSignature0211
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0211 begin');
      const flags: number = flagsForIndex(210);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0212
     * @tc.name      testBundleSignature0212
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0212 begin');
      const flags: number = flagsForIndex(211);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0213
     * @tc.name      testBundleSignature0213
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0213 begin');
      const flags: number = flagsForIndex(212);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0214
     * @tc.name      testBundleSignature0214
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0214 begin');
      const flags: number = flagsForIndex(213);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0215
     * @tc.name      testBundleSignature0215
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0215 begin');
      const flags: number = flagsForIndex(214);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0216
     * @tc.name      testBundleSignature0216
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0216 begin');
      const flags: number = flagsForIndex(215);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0217
     * @tc.name      testBundleSignature0217
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0217 begin');
      const flags: number = flagsForIndex(216);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0218
     * @tc.name      testBundleSignature0218
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0218 begin');
      const flags: number = flagsForIndex(217);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0219
     * @tc.name      testBundleSignature0219
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0219 begin');
      const flags: number = flagsForIndex(218);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0220
     * @tc.name      testBundleSignature0220
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0220 begin');
      const flags: number = flagsForIndex(219);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0221
     * @tc.name      testBundleSignature0221
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0221 begin');
      const flags: number = flagsForIndex(220);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0222
     * @tc.name      testBundleSignature0222
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0222 begin');
      const flags: number = flagsForIndex(221);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0223
     * @tc.name      testBundleSignature0223
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0223 begin');
      const flags: number = flagsForIndex(222);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0224
     * @tc.name      testBundleSignature0224
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0224 begin');
      const flags: number = flagsForIndex(223);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0225
     * @tc.name      testBundleSignature0225
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0225 begin');
      const flags: number = flagsForIndex(224);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0226
     * @tc.name      testBundleSignature0226
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0226 begin');
      const flags: number = flagsForIndex(225);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0227
     * @tc.name      testBundleSignature0227
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0227 begin');
      const flags: number = flagsForIndex(226);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0228
     * @tc.name      testBundleSignature0228
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0228 begin');
      const flags: number = flagsForIndex(227);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0229
     * @tc.name      testBundleSignature0229
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0229 begin');
      const flags: number = flagsForIndex(228);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0230
     * @tc.name      testBundleSignature0230
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0230 begin');
      const flags: number = flagsForIndex(229);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0231
     * @tc.name      testBundleSignature0231
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0231 begin');
      const flags: number = flagsForIndex(230);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0232
     * @tc.name      testBundleSignature0232
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0232 begin');
      const flags: number = flagsForIndex(231);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0233
     * @tc.name      testBundleSignature0233
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0233 begin');
      const flags: number = flagsForIndex(232);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0234
     * @tc.name      testBundleSignature0234
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0234 begin');
      const flags: number = flagsForIndex(233);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0235
     * @tc.name      testBundleSignature0235
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0235 begin');
      const flags: number = flagsForIndex(234);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0236
     * @tc.name      testBundleSignature0236
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0236 begin');
      const flags: number = flagsForIndex(235);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0237
     * @tc.name      testBundleSignature0237
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0237 begin');
      const flags: number = flagsForIndex(236);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0238
     * @tc.name      testBundleSignature0238
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0238 begin');
      const flags: number = flagsForIndex(237);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0239
     * @tc.name      testBundleSignature0239
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0239 begin');
      const flags: number = flagsForIndex(238);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0240
     * @tc.name      testBundleSignature0240
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0240 begin');
      const flags: number = flagsForIndex(239);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0241
     * @tc.name      testBundleSignature0241
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0241 begin');
      const flags: number = flagsForIndex(240);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0242
     * @tc.name      testBundleSignature0242
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0242 begin');
      const flags: number = flagsForIndex(241);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0243
     * @tc.name      testBundleSignature0243
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0243 begin');
      const flags: number = flagsForIndex(242);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0244
     * @tc.name      testBundleSignature0244
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0244 begin');
      const flags: number = flagsForIndex(243);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0245
     * @tc.name      testBundleSignature0245
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0245 begin');
      const flags: number = flagsForIndex(244);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0246
     * @tc.name      testBundleSignature0246
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0246 begin');
      const flags: number = flagsForIndex(245);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0247
     * @tc.name      testBundleSignature0247
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0247 begin');
      const flags: number = flagsForIndex(246);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0248
     * @tc.name      testBundleSignature0248
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0248 begin');
      const flags: number = flagsForIndex(247);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0249
     * @tc.name      testBundleSignature0249
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0249 begin');
      const flags: number = flagsForIndex(248);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0250
     * @tc.name      testBundleSignature0250
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0250 begin');
      const flags: number = flagsForIndex(249);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0251
     * @tc.name      testBundleSignature0251
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0251 begin');
      const flags: number = flagsForIndex(250);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0252
     * @tc.name      testBundleSignature0252
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0252 begin');
      const flags: number = flagsForIndex(251);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0253
     * @tc.name      testBundleSignature0253
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0253 begin');
      const flags: number = flagsForIndex(252);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0254
     * @tc.name      testBundleSignature0254
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0254 begin');
      const flags: number = flagsForIndex(253);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0255
     * @tc.name      testBundleSignature0255
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0255 begin');
      const flags: number = flagsForIndex(254);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_SIGNATURE_0256
     * @tc.name      testBundleSignature0256
     * @tc.desc      Verify bundleSignatureMatrix with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleSignature0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0256 begin');
      const flags: number = flagsForIndex(255);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        expect(info.signatureInfo.appId.length).assertLarger(0);
        expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleSignature0256 end');
    })

  })
}
