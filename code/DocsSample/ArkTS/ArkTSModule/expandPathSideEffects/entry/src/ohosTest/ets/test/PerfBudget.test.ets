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
const BULK_INIT_TIMES: number = 10000;
const BULK_PRINT_TIMES: number = 200;
const INIT_BUDGET_MS: number = 3000;
const PRINT_BUDGET_MS: number = 5000;

export default function perfBudgetTest(): void {
  describe('PerfBudgetTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_0100
     * @tc.name      testBulkInitUnderBudget0001
     * @tc.desc      Ten thousand init() calls on an initialized singleton stay within the time budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBulkInitUnderBudget0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkInitUnderBudget0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < BULK_INIT_TIMES; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < INIT_BUDGET_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkInitUnderBudget0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_0200
     * @tc.name      testBulkPrintUnderBudget0002
     * @tc.desc      Repeated print() calls complete within a loose upper bound
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBulkPrintUnderBudget0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkPrintUnderBudget0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < BULK_PRINT_TIMES; i++) {
        opManager.print();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < PRINT_BUDGET_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkPrintUnderBudget0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_0300
     * @tc.name      testAverageInitUnderBudget0003
     * @tc.desc      The average cost of one init() call stays below one millisecond
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAverageInitUnderBudget0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAverageInitUnderBudget0003 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < BULK_INIT_TIMES; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      const average: number = elapsed / BULK_INIT_TIMES;
      hilog.info(DOMAIN, TAG, '%{public}s', 'average=' + average.toString());
      expect(average < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAverageInitUnderBudget0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PERF_0400
     * @tc.name      testBulkInitKeepsState0004
     * @tc.desc      After a bulk init loop the singleton is still initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBulkInitKeepsState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkInitKeepsState0004 begin');
      for (let i: number = 0; i < BULK_INIT_TIMES; i++) {
        opManager.init();
      }
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkInitKeepsState0004 end');
    })

  })
}
