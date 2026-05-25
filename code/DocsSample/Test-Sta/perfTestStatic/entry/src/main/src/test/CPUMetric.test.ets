'use static';
/**
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
// [Start CPUMetric_sta_sample]
import { describe, expect, it, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { PerfMeasureResult, PerfMetric, PerfTest, PerfTestStrategy } from '@ohos.test.PerfTest';
import { Callback } from '@ohos.base';
import { Utils } from '../../ets/utils/Utils.ets';

export default function PerfTestTest(): void {
  describe('PerfTestTest2', (): void => {
    it('testExample1', 0, async (): Promise<void> => {
      // [Start metricsDefine_sta_sample]
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_USAGE];
      // [End metricsDefine_sta_sample]
      // [Start callbackDefine_sta_sample]
      let actionCode: Callback<Callback<boolean>> = (finish: Callback<boolean>) => {
        Utils.calculateTest();
        finish(true);
      };
      // [End callbackDefine_sta_sample]
      // [Start resetCodeDefine_sta_sample]
      let resetCode: Callback<Callback<boolean>> = (finish: Callback<boolean>) => {
        Utils.reset();
        finish(true);
      };
      // [End resetCodeDefine_sta_sample]
      // [Start strategyDefine_sta_sample]
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        bundleName: 'com.samples.test.perftest.static',
        iterations: 10,
        timeout: 20000
      };
      // [End strategyDefine_sta_sample]
      try {
        // [Start startTest_sta_sample]
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        await perfTest.run();
        // [End startTest_sta_sample]
        // [Start getResult_sta_sample]
        let res1: PerfMeasureResult = perfTest.getMeasureResult(PerfMetric.DURATION);
        let res2: PerfMeasureResult = perfTest.getMeasureResult(PerfMetric.CPU_USAGE);
        // [End getResult_sta_sample]
        // [Start exit_sta_sample]
        perfTest.destroy();
        // [End exit_sta_sample]
        expect(res1.average).assertLessOrEqual(1000);
        expect(res2.average).assertLessOrEqual(30);
      } catch (error) {
        expect(false).assertTrue();
      }
    })
  })
}

// [End CPUMetric_sta_sample]
