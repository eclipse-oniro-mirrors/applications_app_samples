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
  querySelf,
  querySelfSync
} from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_Parity]';

export default function bundleInterleaveMatrixTest() {
  describe('bundleInterleaveMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PARITY_0100
     * @tc.name testSyncAsyncParityApp
     * @tc.desc Verify sync and async query with application flag return identical name and version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSyncAsyncParityApp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParityApp begin');
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      expect(asyncInfo.versionName).assertEqual(syncInfo.versionName);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParityApp end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PARITY_0200
     * @tc.name testSyncAsyncParitySignature
     * @tc.desc Verify sync and async query with signature flag return identical name and version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSyncAsyncParitySignature', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParitySignature begin');
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_SIGNATURE);
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      expect(asyncInfo.versionName).assertEqual(syncInfo.versionName);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParitySignature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PARITY_0300
     * @tc.name testSyncAsyncParityFull
     * @tc.desc Verify sync and async query with full flags return identical name and version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSyncAsyncParityFull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParityFull begin');
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_FULL);
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      expect(asyncInfo.versionName).assertEqual(syncInfo.versionName);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncParityFull end');
    });
  })
}
