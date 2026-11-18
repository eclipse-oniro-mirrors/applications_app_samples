/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager as opManager } from 'servicemanagerhar/src/main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const SMALL_TIMES: number = 1000;
const MEDIUM_TIMES: number = 5000;
const LARGE_TIMES: number = 20000;
const SMALL_BUDGET_MS: number = 1000;
const MEDIUM_BUDGET_MS: number = 2500;
const LARGE_BUDGET_MS: number = 6000;

export default function perfScalingTest(): void {
  describe('PerfScalingTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_SCALE_0100
     * @tc.name      testThousandInitBudget0001
     * @tc.desc      One thousand init calls stay well inside the small budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testThousandInitBudget0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThousandInitBudget0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < SMALL_TIMES; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < SMALL_BUDGET_MS).assertTrue();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThousandInitBudget0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_SCALE_0200
     * @tc.name      testFiveThousandInitBudget0002
     * @tc.desc      Five thousand init calls stay inside the medium budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFiveThousandInitBudget0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiveThousandInitBudget0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < MEDIUM_TIMES; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < MEDIUM_BUDGET_MS).assertTrue();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiveThousandInitBudget0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_SCALE_0300
     * @tc.name      testTwentyThousandInitBudget0003
     * @tc.desc      Twenty thousand init calls stay inside the large budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTwentyThousandInitBudget0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwentyThousandInitBudget0003 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < LARGE_TIMES; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < LARGE_BUDGET_MS).assertTrue();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwentyThousandInitBudget0003 end');
    })

  })
}
