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
const FIFTY_THOUSAND: number = 50000;
const HUNDRED_THOUSAND: number = 100000;
const BUDGET_50K_MS: number = 15000;
const BUDGET_100K_MS: number = 30000;

export default function perfThroughputTest(): void {
  describe('PerfThroughputTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_THROUGHPUT_0100
     * @tc.name      testFiftyThousandInit0001
     * @tc.desc      Fifty thousand init calls stay inside the throughput budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFiftyThousandInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyThousandInit0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < FIFTY_THOUSAND; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < BUDGET_50K_MS).assertTrue();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyThousandInit0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_THROUGHPUT_0200
     * @tc.name      testHundredThousandInit0002
     * @tc.desc      One hundred thousand init calls stay inside the throughput budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHundredThousandInit0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHundredThousandInit0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < HUNDRED_THOUSAND; i++) {
        opManager.init();
      }
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'elapsed=' + elapsed.toString());
      expect(elapsed < BUDGET_100K_MS).assertTrue();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHundredThousandInit0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_THROUGHPUT_0300
     * @tc.name      testThroughputKeepsState0003
     * @tc.desc      After mixed bulk init/print traffic the singleton remains initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testThroughputKeepsState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThroughputKeepsState0003 begin');
      for (let i: number = 0; i < FIFTY_THOUSAND; i++) {
        opManager.init();
        if (i % 100 === 0) {
          opManager.print();
        }
      }
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThroughputKeepsState0003 end');
    })

  })
}
