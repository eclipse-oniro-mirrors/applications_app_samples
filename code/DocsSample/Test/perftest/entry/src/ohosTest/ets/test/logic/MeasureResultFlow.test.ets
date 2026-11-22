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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  MeasureResultModel,
} from '../model/PerfTestLogic';

/** MeasureResultFlowTest logic checks (32 cases). */
export default function measureResultFlowTest(): void {
  describe('MeasureResultFlowTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0001
     * @tc.name      Perf_MeasureFlow_0001
     * @tc.desc      measure result for [0].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MeasureFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeasureFlow_0001 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(0);
      logInfo("measure values [0]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|0|1");
      expect(actual).assertEqual("0|0|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0002
     * @tc.name      Perf_MeasureFlow_0002
     * @tc.desc      measure result for [1,-1].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0002 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(1);
      subject.add(-1);
      logInfo("measure values [1,-1]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "0.5|1|0|2");
      expect(actual).assertEqual("0.5|1|0|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0003
     * @tc.name      Perf_MeasureFlow_0003
     * @tc.desc      measure result for [-1,2,3].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0003 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(-1);
      subject.add(2);
      subject.add(3);
      logInfo("measure values [-1,2,3]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "1.666667|3|0|3");
      expect(actual).assertEqual("1.666667|3|0|3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0004
     * @tc.name      Perf_MeasureFlow_0004
     * @tc.desc      measure result for [2,3,4,5].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0004 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(2);
      subject.add(3);
      subject.add(4);
      subject.add(5);
      logInfo("measure values [2,3,4,5]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "3.5|5|2|4");
      expect(actual).assertEqual("3.5|5|2|4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0004 end`);
