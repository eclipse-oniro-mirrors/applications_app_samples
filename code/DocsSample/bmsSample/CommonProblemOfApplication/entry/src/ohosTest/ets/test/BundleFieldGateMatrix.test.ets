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
import { SELF_BUNDLE_NAME, querySelfSync } from './shared/BundleProbe';
import { FLAG_APPLICATION, FLAG_HAP_MODULE, FLAG_SIGNATURE } from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_FieldGate]';

export default function bundleFieldGateMatrixTest() {
  describe('bundleFieldGateMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDGATE_0100
     * @tc.name testApplicationFlagPopulatesAppInfo
     * @tc.desc Verify APPLICATION flag populates appInfo with a positive uid
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testApplicationFlagPopulatesAppInfo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplicationFlagPopulatesAppInfo begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_APPLICATION);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.uid > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplicationFlagPopulatesAppInfo end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDGATE_0200
     * @tc.name testHapModuleFlagPopulatesModules
     * @tc.desc Verify HAP_MODULE flag populates hapModulesInfo with at least one module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testHapModuleFlagPopulatesModules', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHapModuleFlagPopulatesModules begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_HAP_MODULE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.hapModulesInfo !== undefined).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHapModuleFlagPopulatesModules end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDGATE_0300
     * @tc.name testSignatureFlagPopulatesSignatureInfo
     * @tc.desc Verify SIGNATURE flag populates signatureInfo with a non-empty appId
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureFlagPopulatesSignatureInfo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureFlagPopulatesSignatureInfo begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_SIGNATURE);
      expect(info.signatureInfo !== undefined).assertTrue();
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureFlagPopulatesSignatureInfo end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDGATE_0400
     * @tc.name testCombinedFlagsPopulateBoth
     * @tc.desc Verify APPLICATION plus SIGNATURE populates both appInfo and signatureInfo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCombinedFlagsPopulateBoth', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedFlagsPopulateBoth begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_APPLICATION | FLAG_SIGNATURE);
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.signatureInfo !== undefined).assertTrue();
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedFlagsPopulateBoth end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDGATE_0500
     * @tc.name testAllDocumentedFlagsPopulateAll
     * @tc.desc Verify all documented bits populate appInfo, hapModulesInfo and signatureInfo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAllDocumentedFlagsPopulateAll', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllDocumentedFlagsPopulateAll begin');
      const info: bundleManager.BundleInfo = querySelfSync(0x000000FF);
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.hapModulesInfo !== undefined).assertTrue();
      expect(info.signatureInfo !== undefined).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllDocumentedFlagsPopulateAll end');
    });
  })
}
