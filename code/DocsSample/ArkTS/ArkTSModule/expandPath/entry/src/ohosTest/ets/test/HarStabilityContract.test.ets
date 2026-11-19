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
import * as har from 'expandPathHar';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPath_Stability]';
const REPEAT: number = 1000;
const TIME_BUDGET_MS: number = 5000;

export default function harStabilityContractTest() {
  describe('harStabilityContractTest', () => {
    /**
     * @tc.number    SUB_EXPAND_STABILITY_0100
     * @tc.name      testRepeatedExportReads
     * @tc.desc      Verify 1000 repeated reads keep the exported value stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testRepeatedExportReads', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedExportReads begin');
      let last: string = '';
      for (let i: number = 0; i < REPEAT; i++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedExportReads end');
    });

    /**
     * @tc.number    SUB_EXPAND_STABILITY_0200
     * @tc.name      testRepeatedAggregationBuild
     * @tc.desc      Verify repeated aggregation of exports stays correct within a time budget
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testRepeatedAggregationBuild', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedAggregationBuild begin');
      const start: number = Date.now();
      let total: number = 0;
      for (let i: number = 0; i < REPEAT; i++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(REPEAT * 5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < TIME_BUDGET_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedAggregationBuild end');
    });

    /**
     * @tc.number    SUB_EXPAND_STABILITY_0300
     * @tc.name      testExportValueNeverChanges
     * @tc.desc      Verify the aggregated export values remain identical across rounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testExportValueNeverChanges', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportValueNeverChanges begin');
      let reference: string = '';
      for (let round: number = 0; round < 100; round++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        for (let i: number = 0; i < values.length; i++) {
          if (round === 0 && i === 0) {
            reference = values[i];
          }
          expect(values[i]).assertEqual(reference);
        }
      }
      expect(reference).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportValueNeverChanges end');
    });
  });
}
