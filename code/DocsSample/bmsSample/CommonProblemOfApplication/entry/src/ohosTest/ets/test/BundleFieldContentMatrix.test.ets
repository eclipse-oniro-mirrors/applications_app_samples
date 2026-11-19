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
import { querySelfSync } from './shared/BundleProbe';
import { FLAG_APPLICATION, FLAG_HAP_MODULE, FLAG_SIGNATURE } from './shared/FlagMatrix';
import { isUpperHex } from './shared/BundleOracle';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_FieldContent]';

export default function bundleFieldContentMatrixTest() {
  describe('bundleFieldContentMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDCONTENT_0100
     * @tc.name testApplicationFieldContent
     * @tc.desc Verify APPLICATION exposes appInfo with positive uid and accessTokenId
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testApplicationFieldContent', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplicationFieldContent begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_APPLICATION);
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      expect(info.appInfo.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplicationFieldContent end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDCONTENT_0200
     * @tc.name testHapModuleFieldContent
     * @tc.desc Verify HAP_MODULE exposes at least one module with a non-empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testHapModuleFieldContent', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHapModuleFieldContent begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_HAP_MODULE);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHapModuleFieldContent end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FIELDCONTENT_0300
     * @tc.name testSignatureFieldContent
     * @tc.desc Verify SIGNATURE exposes a 64-char upper-hex fingerprint and non-empty appId
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureFieldContent', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureFieldContent begin');
      const info: bundleManager.BundleInfo = querySelfSync(FLAG_SIGNATURE);
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      expect(isUpperHex(info.signatureInfo.fingerprint)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureFieldContent end');
    });
  })
}
