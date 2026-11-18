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
  querySelf
} from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_Concurrent]';

export default function bundleConcurrentQueryTest() {
  describe('bundleConcurrentQueryTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_CONCURRENT_0100
     * @tc.name testConcurrentFourQueries
     * @tc.desc Verify four concurrent queries all resolve with the same name and versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrentFourQueries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentFourQueries begin');
      const results: bundleManager.BundleInfo[] = await Promise.all([
        querySelf(FLAGS_FOR_APP),
        querySelf(FLAGS_FOR_SIGNATURE),
        querySelf(FLAGS_FOR_FULL),
        querySelf(FLAGS_FOR_APP)
      ]);
      expect(results.length).assertEqual(4);
      const version: number = results[0].versionCode;
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i].name).assertEqual(SELF_BUNDLE_NAME);
        expect(results[i].versionCode).assertEqual(version);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentFourQueries end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_CONCURRENT_0200
     * @tc.name testConcurrentAppAndSignature
     * @tc.desc Verify app-flag and signature-flag concurrent queries agree on name and version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConcurrentAppAndSignature', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentAppAndSignature begin');
      const results: bundleManager.BundleInfo[] = await Promise.all([
        querySelf(FLAGS_FOR_APP),
        querySelf(FLAGS_FOR_SIGNATURE)
      ]);
      expect(results[0].name).assertEqual(SELF_BUNDLE_NAME);
      expect(results[1].name).assertEqual(SELF_BUNDLE_NAME);
      expect(results[0].versionCode).assertEqual(results[1].versionCode);
      expect(results[1].signatureInfo.appId.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentAppAndSignature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_CONCURRENT_0300
     * @tc.name testConcurrentSignatureConsistency
     * @tc.desc Verify two concurrent signature-bearing queries return the same appId and fingerprint
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConcurrentSignatureConsistency', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentSignatureConsistency begin');
      const results: bundleManager.BundleInfo[] = await Promise.all([
        querySelf(FLAGS_FOR_FULL),
        querySelf(FLAGS_FOR_SIGNATURE)
      ]);
      expect(results[0].signatureInfo.appId).assertEqual(results[1].signatureInfo.appId);
      expect(results[0].signatureInfo.fingerprint).assertEqual(results[1].signatureInfo.fingerprint);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcurrentSignatureConsistency end');
    });
  })
}
