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
import {
  SELF_BUNDLE_NAME,
  FLAGS_FOR_APP,
  FLAGS_FOR_SIGNATURE,
  FLAGS_FOR_FULL,
  querySelfSync
} from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_FlagStability]';

export default function bundleFlagStabilityMatrixTest() {
  describe('bundleFlagStabilityMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_STAB_0100
     * @tc.name testFlagStabilityApp
     * @tc.desc Verify 20 repeated app-flag queries keep identical name and versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagStabilityApp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilityApp begin');
      let expectedVersion: number = -1;
      for (let i: number = 0; i < 20; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        if (expectedVersion < 0) {
          expectedVersion = info.versionCode;
        } else {
          expect(info.versionCode).assertEqual(expectedVersion);
        }
      }
      expect(expectedVersion > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilityApp end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_STAB_0200
     * @tc.name testFlagStabilitySignature
     * @tc.desc Verify 20 repeated signature-flag queries keep identical name and versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagStabilitySignature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilitySignature begin');
      let expectedVersion: number = -1;
      for (let i: number = 0; i < 20; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_SIGNATURE);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        if (expectedVersion < 0) {
          expectedVersion = info.versionCode;
        } else {
          expect(info.versionCode).assertEqual(expectedVersion);
        }
      }
      expect(expectedVersion > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilitySignature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_STAB_0300
     * @tc.name testFlagStabilityFull
     * @tc.desc Verify 30 repeated full-flag queries keep identical name and versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagStabilityFull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilityFull begin');
      let expectedVersion: number = -1;
      for (let i: number = 0; i < 30; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_FULL);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        if (expectedVersion < 0) {
          expectedVersion = info.versionCode;
        } else {
          expect(info.versionCode).assertEqual(expectedVersion);
        }
      }
      expect(expectedVersion > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagStabilityFull end');
    });
  })
}
