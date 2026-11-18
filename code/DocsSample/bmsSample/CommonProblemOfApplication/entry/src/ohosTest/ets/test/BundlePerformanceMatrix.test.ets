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
import { SELF_BUNDLE_NAME, FLAGS_FOR_APP, querySelfSync } from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_PerfMatrix]';

export default function bundlePerformanceMatrixTest() {
  describe('bundlePerformanceMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PERF_0100
     * @tc.name testSyncQueryPerf0050
     * @tc.desc Verify 50 sync queries stay within budget with zero mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSyncQueryPerf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0050 begin');
      let mismatch: number = 0;
      const start: number = Date.now();
      for (let i: number = 0; i < 50; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        if (info.name !== SELF_BUNDLE_NAME) {
          mismatch++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `repeat 50 cost=${cost}ms`);
      expect(mismatch).assertEqual(0);
      expect(cost < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0050 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PERF_0200
     * @tc.name testSyncQueryPerf0100
     * @tc.desc Verify 100 sync queries stay within budget with zero mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSyncQueryPerf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0100 begin');
      let mismatch: number = 0;
      const start: number = Date.now();
      for (let i: number = 0; i < 100; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        if (info.name !== SELF_BUNDLE_NAME) {
          mismatch++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `repeat 100 cost=${cost}ms`);
      expect(mismatch).assertEqual(0);
      expect(cost < 8000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0100 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PERF_0300
     * @tc.name testSyncQueryPerf0200
     * @tc.desc Verify 200 sync queries stay within budget with zero mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSyncQueryPerf0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0200 begin');
      let mismatch: number = 0;
      const start: number = Date.now();
      for (let i: number = 0; i < 200; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        if (info.name !== SELF_BUNDLE_NAME) {
          mismatch++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `repeat 200 cost=${cost}ms`);
      expect(mismatch).assertEqual(0);
      expect(cost < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0200 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_PERF_0400
     * @tc.name testSyncQueryPerf0400
     * @tc.desc Verify 400 sync queries stay within budget with zero mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSyncQueryPerf0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0400 begin');
      let mismatch: number = 0;
      const start: number = Date.now();
      for (let i: number = 0; i < 400; i++) {
        const info: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
        if (info.name !== SELF_BUNDLE_NAME) {
          mismatch++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `repeat 400 cost=${cost}ms`);
      expect(mismatch).assertEqual(0);
      expect(cost < 30000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncQueryPerf0400 end');
    });
  })
}
