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
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0005
     * @tc.name      Perf_MeasureFlow_0005
     * @tc.desc      measure result for [3,4,5,6,7].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0005 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(3);
      subject.add(4);
      subject.add(5);
      subject.add(6);
      subject.add(7);
      logInfo("measure values [3,4,5,6,7]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "5|7|3|5");
      expect(actual).assertEqual("5|7|3|5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0006
     * @tc.name      Perf_MeasureFlow_0006
     * @tc.desc      measure result for [4,5,6,7,8,9].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0006 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(4);
      subject.add(5);
      subject.add(6);
      subject.add(7);
      subject.add(8);
      subject.add(9);
      logInfo("measure values [4,5,6,7,8,9]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "6.5|9|4|6");
      expect(actual).assertEqual("6.5|9|4|6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0007
     * @tc.name      Perf_MeasureFlow_0007
     * @tc.desc      measure result for [5].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0007 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(5);
      logInfo("measure values [5]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "5|5|5|1");
      expect(actual).assertEqual("5|5|5|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0008
     * @tc.name      Perf_MeasureFlow_0008
     * @tc.desc      measure result for [6,7].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0008 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(6);
      subject.add(7);
      logInfo("measure values [6,7]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "6.5|7|6|2");
      expect(actual).assertEqual("6.5|7|6|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0009
     * @tc.name      Perf_MeasureFlow_0009
     * @tc.desc      measure result for [7,8,9].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0009 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(7);
      subject.add(8);
      subject.add(9);
      logInfo("measure values [7,8,9]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "8|9|7|3");
      expect(actual).assertEqual("8|9|7|3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0010
     * @tc.name      Perf_MeasureFlow_0010
     * @tc.desc      measure result for [8,9,10,11].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0010 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(8);
      subject.add(9);
      subject.add(10);
      subject.add(11);
      logInfo("measure values [8,9,10,11]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "9.5|11|8|4");
      expect(actual).assertEqual("9.5|11|8|4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0011
     * @tc.name      Perf_MeasureFlow_0011
     * @tc.desc      measure result for [9,10,11,12,13].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0011 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(9);
      subject.add(10);
      subject.add(11);
      subject.add(12);
      subject.add(13);
      logInfo("measure values [9,10,11,12,13]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "11|13|9|5");
      expect(actual).assertEqual("11|13|9|5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0012
     * @tc.name      Perf_MeasureFlow_0012
     * @tc.desc      measure result for [10,11,12,13,14,15].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MeasureFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeasureFlow_0012 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(10);
      subject.add(11);
      subject.add(12);
      subject.add(13);
      subject.add(14);
      subject.add(15);
      logInfo("measure values [10,11,12,13,14,15]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "12.5|15|10|6");
      expect(actual).assertEqual("12.5|15|10|6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0013
     * @tc.name      Perf_MeasureFlow_0013
     * @tc.desc      measure result for [11].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0013 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(11);
      logInfo("measure values [11]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "11|11|11|1");
      expect(actual).assertEqual("11|11|11|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0014
     * @tc.name      Perf_MeasureFlow_0014
     * @tc.desc      measure result for [12,13].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0014 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(12);
      subject.add(13);
      logInfo("measure values [12,13]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "12.5|13|12|2");
      expect(actual).assertEqual("12.5|13|12|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0015
     * @tc.name      Perf_MeasureFlow_0015
     * @tc.desc      measure result for [13,14,15].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0015 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(13);
      subject.add(14);
      subject.add(15);
      logInfo("measure values [13,14,15]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "14|15|13|3");
      expect(actual).assertEqual("14|15|13|3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0016
     * @tc.name      Perf_MeasureFlow_0016
     * @tc.desc      measure result for [14,15,16,20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0016 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(14);
      subject.add(15);
      subject.add(16);
      subject.add(20);
      logInfo("measure values [14,15,16,20]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "16.25|20|14|4");
      expect(actual).assertEqual("16.25|20|14|4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0017
     * @tc.name      Perf_MeasureFlow_0017
     * @tc.desc      measure result for [15,16,20,24,25].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0017 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(15);
      subject.add(16);
      subject.add(20);
      subject.add(24);
      subject.add(25);
      logInfo("measure values [15,16,20,24,25]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "20|25|15|5");
      expect(actual).assertEqual("20|25|15|5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0018
     * @tc.name      Perf_MeasureFlow_0018
     * @tc.desc      measure result for [16,20,24,25,30,32].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_MeasureFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MeasureFlow_0018 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(16);
      subject.add(20);
      subject.add(24);
      subject.add(25);
      subject.add(30);
      subject.add(32);
      logInfo("measure values [16,20,24,25,30,32]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "24.5|32|16|6");
      expect(actual).assertEqual("24.5|32|16|6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0019
     * @tc.name      Perf_MeasureFlow_0019
     * @tc.desc      measure result for [20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0019 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(20);
      logInfo("measure values [20]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "20|20|20|1");
      expect(actual).assertEqual("20|20|20|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0020
     * @tc.name      Perf_MeasureFlow_0020
     * @tc.desc      measure result for [24,25].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0020 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(24);
      subject.add(25);
      logInfo("measure values [24,25]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "24.5|25|24|2");
      expect(actual).assertEqual("24.5|25|24|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0021
     * @tc.name      Perf_MeasureFlow_0021
     * @tc.desc      measure result for [25,30,32].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0021 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(25);
      subject.add(30);
      subject.add(32);
      logInfo("measure values [25,30,32]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "29|32|25|3");
      expect(actual).assertEqual("29|32|25|3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0022
     * @tc.name      Perf_MeasureFlow_0022
     * @tc.desc      measure result for [30,32,40,45].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0022 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(30);
      subject.add(32);
      subject.add(40);
      subject.add(45);
      logInfo("measure values [30,32,40,45]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "36.75|45|30|4");
      expect(actual).assertEqual("36.75|45|30|4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0023
     * @tc.name      Perf_MeasureFlow_0023
     * @tc.desc      measure result for [32,40,45,50,60].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MeasureFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeasureFlow_0023 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(32);
      subject.add(40);
      subject.add(45);
      subject.add(50);
      subject.add(60);
      logInfo("measure values [32,40,45,50,60]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "45.4|60|32|5");
      expect(actual).assertEqual("45.4|60|32|5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0024
     * @tc.name      Perf_MeasureFlow_0024
     * @tc.desc      measure result for [40,45,50,60,64,70].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0024 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(40);
      subject.add(45);
      subject.add(50);
      subject.add(60);
      subject.add(64);
      subject.add(70);
      logInfo("measure values [40,45,50,60,64,70]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "54.833333|70|40|6");
      expect(actual).assertEqual("54.833333|70|40|6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0025
     * @tc.name      Perf_MeasureFlow_0025
     * @tc.desc      measure result for [45].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0025 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(45);
      logInfo("measure values [45]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "45|45|45|1");
      expect(actual).assertEqual("45|45|45|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0026
     * @tc.name      Perf_MeasureFlow_0026
     * @tc.desc      measure result for [50,60].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0026 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(50);
      subject.add(60);
      logInfo("measure values [50,60]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "55|60|50|2");
      expect(actual).assertEqual("55|60|50|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0027
     * @tc.name      Perf_MeasureFlow_0027
     * @tc.desc      measure result for [60,64,70].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0027 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(60);
      subject.add(64);
      subject.add(70);
      logInfo("measure values [60,64,70]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "64.666667|70|60|3");
      expect(actual).assertEqual("64.666667|70|60|3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0028
     * @tc.name      Perf_MeasureFlow_0028
     * @tc.desc      measure result for [64,70,80,90].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0028 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(64);
      subject.add(70);
      subject.add(80);
      subject.add(90);
      logInfo("measure values [64,70,80,90]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "76|90|64|4");
      expect(actual).assertEqual("76|90|64|4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0029
     * @tc.name      Perf_MeasureFlow_0029
     * @tc.desc      measure result for [70,80,90,99,100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0029 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(70);
      subject.add(80);
      subject.add(90);
      subject.add(99);
      subject.add(100);
      logInfo("measure values [70,80,90,99,100]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "87.8|100|70|5");
      expect(actual).assertEqual("87.8|100|70|5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0030
     * @tc.name      Perf_MeasureFlow_0030
     * @tc.desc      measure result for [80,90,99,100,120,150].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0030 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(80);
      subject.add(90);
      subject.add(99);
      subject.add(100);
      subject.add(120);
      subject.add(150);
      logInfo("measure values [80,90,99,100,120,150]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "106.5|150|80|6");
      expect(actual).assertEqual("106.5|150|80|6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0031
     * @tc.name      Perf_MeasureFlow_0031
     * @tc.desc      measure result for [90].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0031 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(90);
      logInfo("measure values [90]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "90|90|90|1");
      expect(actual).assertEqual("90|90|90|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MEASURE_FLOW_0032
     * @tc.name      Perf_MeasureFlow_0032
     * @tc.desc      measure result for [99,100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MeasureFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeasureFlow_0032 begin`);
      const subject: MeasureResultModel = new MeasureResultModel();
      subject.add(99);
      subject.add(100);
      logInfo("measure values [99,100]");
      const actual: string = subject.summary();
      logInfo('actual=' + String(actual) + ', expected=' + "99.5|100|99|2");
      expect(actual).assertEqual("99.5|100|99|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeasureFlow_0032 end`);
    });
  });
}
