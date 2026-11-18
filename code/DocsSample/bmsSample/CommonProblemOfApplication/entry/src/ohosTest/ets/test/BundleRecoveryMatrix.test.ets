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
  querySelf,
  querySelfSync,
  queryByNamePromise,
  isKnownBusinessCode
} from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_Recovery]';

export default function bundleRecoveryMatrixTest() {
  describe('bundleRecoveryMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_RECOVERY_0100
     * @tc.name error_then_success
     * @tc.desc Verify successful query after one failed lookup
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('error_then_success', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'error_then_success begin');
      let rejected: boolean = false;
      try {
        await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_APP);
      } catch (e) {
        rejected = true;
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      expect(rejected).assertTrue();
      const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'error_then_success end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_RECOVERY_0200
     * @tc.name repeated_errors_then_success
     * @tc.desc Verify successful query after repeated failed lookups
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('repeated_errors_then_success', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'repeated_errors_then_success begin');
      for (let i: number = 0; i < 3; i++) {
        try {
          await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_APP);
          expect(false).assertTrue();
        } catch (e) {
          const err: BusinessError = e as BusinessError;
          expect(err.code === ERR_BUNDLE_NOT_FOUND || err.code === ERR_PERMISSION_DENIED).assertTrue();
        }
      }
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'repeated_errors_then_success end');
    });
  })
}
