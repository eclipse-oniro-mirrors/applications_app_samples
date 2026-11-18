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
import { SELF_BUNDLE_NAME, FLAGS_FOR_APP, FLAGS_FOR_FULL, querySelf, querySelfSync } from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_ApiSurface]';

export default function bundleApiSurfaceTest() {
  describe('bundleApiSurfaceTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APISURFACE_0100
     * @tc.name testFullFlagsFieldTypes
     * @tc.desc Verify full-flag result exposes name/version/signature with expected types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFullFlagsFieldTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFullFlagsFieldTypes begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(typeof info.name).assertEqual('string');
      expect(typeof info.versionCode).assertEqual('number');
      expect(typeof info.versionName).assertEqual('string');
      expect(info.versionName.length > 0).assertTrue();
      expect(info.signatureInfo !== undefined).assertTrue();
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFullFlagsFieldTypes end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APISURFACE_0200
     * @tc.name testSyncAsyncFieldTypes
     * @tc.desc Verify sync and async entry points expose the same field types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSyncAsyncFieldTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncFieldTypes begin');
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(typeof syncInfo.name).assertEqual('string');
      expect(typeof asyncInfo.name).assertEqual('string');
      expect(typeof syncInfo.versionCode).assertEqual('number');
      expect(typeof asyncInfo.versionCode).assertEqual('number');
      expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      expect(asyncInfo.name).assertEqual(SELF_BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncAsyncFieldTypes end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APISURFACE_0300
     * @tc.name testVersionNameConsistency
     * @tc.desc Verify versionName is stable between sync and async calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testVersionNameConsistency', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVersionNameConsistency begin');
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(asyncInfo.versionName).assertEqual(syncInfo.versionName);
      expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVersionNameConsistency end');
    });
  })
}
