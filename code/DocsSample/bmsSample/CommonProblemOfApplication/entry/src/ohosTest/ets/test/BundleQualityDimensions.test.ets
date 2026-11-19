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
import { BusinessError } from '@kit.BasicServicesKit';
import { paceTurn } from './shared/TestPace';
import {
  SELF_BUNDLE_NAME,
  NON_EXIST_BUNDLE_NAME,
  ERR_BUNDLE_NOT_FOUND,
  ERR_PERMISSION_DENIED,
  FLAGS_FOR_APP,
  querySelfSync,
  queryByNamePromise,
  isKnownBusinessCode
} from './shared/BundleProbe';
import { FLAG_APPLICATION, FLAG_SIGNATURE, flagsForIndex, hasFlag } from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_BundleQuality]';

export default function bundleQualityTest() {
  describe('bundleQualityTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_QUALITY_PERF_0100
     * @tc.name sync_query_perf
     * @tc.desc Verify 200 sync queries stay within budget with zero mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sync_query_perf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sync_query_perf begin');
      let mismatch: number = 0;
      const start: number = Date.now();
      for (let i: number = 0; i < 200; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        if (info.name !== SELF_BUNDLE_NAME) {
          mismatch++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `sync 200 cost=${cost}ms`);
      expect(mismatch).assertEqual(0);
      expect(cost < 20000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'sync_query_perf end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_QUALITY_STAB_0100
     * @tc.name sync_query_stability
     * @tc.desc Verify 30 sync queries keep identical name and versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sync_query_stability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sync_query_stability begin');
      let expectedVersion: number = -1;
      for (let i: number = 0; i < 30; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        if (expectedVersion < 0) {
          expectedVersion = info.versionCode;
        } else {
          expect(info.versionCode).assertEqual(expectedVersion);
        }
      }
      expect(expectedVersion > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'sync_query_stability end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_QUALITY_ROBUST_0100
     * @tc.name missing_bundle_rejects
     * @tc.desc Verify non-existent bundle query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('missing_bundle_rejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'missing_bundle_rejects begin');
      try {
        await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(err.code === ERR_BUNDLE_NOT_FOUND || err.code === ERR_PERMISSION_DENIED).assertTrue();
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'missing_bundle_rejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_QUALITY_COMPAT_0100
     * @tc.name flag_bit_compatibility
     * @tc.desc Verify flag bit relationships and flagsForIndex boundary mapping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('flag_bit_compatibility', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'flag_bit_compatibility begin');
      expect(hasFlag(FLAGS_FOR_APP, FLAG_APPLICATION)).assertTrue();
      expect(hasFlag(flagsForIndex(0), FLAG_APPLICATION)).assertFalse();
      expect(hasFlag(flagsForIndex(1), FLAG_APPLICATION)).assertTrue();
      expect(hasFlag(flagsForIndex(255), FLAG_SIGNATURE)).assertTrue();
      expect(flagsForIndex(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'flag_bit_compatibility end');
    });
  })
}
