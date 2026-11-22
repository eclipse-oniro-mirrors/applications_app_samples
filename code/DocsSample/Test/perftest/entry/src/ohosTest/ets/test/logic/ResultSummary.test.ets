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
  resultSummary,
  resultValid,
} from '../model/PerfTestLogic';

/** ResultSummaryTest logic checks (32 cases). */
export default function resultSummaryTest(): void {
  describe('ResultSummaryTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0001
     * @tc.name      Perf_ResultSummary_0001
     * @tc.desc      result summary/validity for [0].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ResultSummary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultSummary_0001 begin`);
      logInfo("resultSummary([0]) + ':' + resultValid([0])");
      const actual: string = resultSummary([0]) + ':' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|0|1:true");
      expect(actual).assertEqual("0|0|0|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0002
     * @tc.name      Perf_ResultSummary_0002
     * @tc.desc      result summary/validity for [1,2].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0002 begin`);
      logInfo("resultSummary([1,2]) + ':' + resultValid([1,2])");
      const actual: string = resultSummary([1,2]) + ':' + resultValid([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5|2|1|2:true");
      expect(actual).assertEqual("1.5|2|1|2:true");
      logInfo(`${BUNDLE}ResultSummary_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0003
     * @tc.name      Perf_ResultSummary_0003
     * @tc.desc      result summary/validity for [2,3,5].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0003 begin`);
      logInfo("resultSummary([2,3,5]) + ':' + resultValid([2,3,5])");
      const actual: string = resultSummary([2,3,5]) + ':' + resultValid([2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "3.333333|5|2|3:true");
      expect(actual).assertEqual("3.333333|5|2|3:true");
      logInfo(`${BUNDLE}ResultSummary_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0004
     * @tc.name      Perf_ResultSummary_0004
     * @tc.desc      result summary/validity for [3,5,10,20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0004 begin`);
      logInfo("resultSummary([3,5,10,20]) + ':' + resultValid([3,5,10,20])");
      const actual: string = resultSummary([3,5,10,20]) + ':' + resultValid([3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "9.5|20|3|4:true");
      expect(actual).assertEqual("9.5|20|3|4:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0005
     * @tc.name      Perf_ResultSummary_0005
     * @tc.desc      result summary/validity for [5,10,20,50,100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0005 begin`);
      logInfo("resultSummary([5,10,20,50,100]) + ':' + resultValid([5,10,20,50,100])");
      const actual: string = resultSummary([5,10,20,50,100]) + ':' + resultValid([5,10,20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "37|100|5|5:true");
      expect(actual).assertEqual("37|100|5|5:true");
      logInfo(`${BUNDLE}ResultSummary_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0006
     * @tc.name      Perf_ResultSummary_0006
     * @tc.desc      result summary/validity for [10,20,50,100,1000,30000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0006 begin`);
      logInfo("resultSummary([10,20,50,100,1000,30000]) + ':' + resultValid([10,20,50,100,1000,30000])");
      const actual: string = resultSummary([10,20,50,100,1000,30000]) + ':' + resultValid([10,20,50,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "5196.666667|30000|10|6:true");
      expect(actual).assertEqual("5196.666667|30000|10|6:true");
      logInfo(`${BUNDLE}ResultSummary_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0007
     * @tc.name      Perf_ResultSummary_0007
     * @tc.desc      result summary/validity for [20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0007 begin`);
      logInfo("resultSummary([20]) + ':' + resultValid([20])");
      const actual: string = resultSummary([20]) + ':' + resultValid([20]);
      logInfo('actual=' + String(actual) + ', expected=' + "20|20|20|1:true");
      expect(actual).assertEqual("20|20|20|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0008
     * @tc.name      Perf_ResultSummary_0008
     * @tc.desc      result summary/validity for [50,100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0008 begin`);
      logInfo("resultSummary([50,100]) + ':' + resultValid([50,100])");
      const actual: string = resultSummary([50,100]) + ':' + resultValid([50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "75|100|50|2:true");
      expect(actual).assertEqual("75|100|50|2:true");
      logInfo(`${BUNDLE}ResultSummary_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0009
     * @tc.name      Perf_ResultSummary_0009
     * @tc.desc      result summary/validity for [100,1000,30000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0009 begin`);
      logInfo("resultSummary([100,1000,30000]) + ':' + resultValid([100,1000,30000])");
      const actual: string = resultSummary([100,1000,30000]) + ':' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "10366.666667|30000|100|3:true");
      expect(actual).assertEqual("10366.666667|30000|100|3:true");
      logInfo(`${BUNDLE}ResultSummary_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0010
     * @tc.name      Perf_ResultSummary_0010
     * @tc.desc      result summary/validity for [1000,30000,0,1].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0010 begin`);
      logInfo("resultSummary([1000,30000,0,1]) + ':' + resultValid([1000,30000,0,1])");
      const actual: string = resultSummary([1000,30000,0,1]) + ':' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "7750.25|30000|0|4:true");
      expect(actual).assertEqual("7750.25|30000|0|4:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0011
     * @tc.name      Perf_ResultSummary_0011
     * @tc.desc      result summary/validity for [30000,0,1,2,3].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0011 begin`);
      logInfo("resultSummary([30000,0,1,2,3]) + ':' + resultValid([30000,0,1,2,3])");
      const actual: string = resultSummary([30000,0,1,2,3]) + ':' + resultValid([30000,0,1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "6001.2|30000|0|5:true");
      expect(actual).assertEqual("6001.2|30000|0|5:true");
      logInfo(`${BUNDLE}ResultSummary_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0012
     * @tc.name      Perf_ResultSummary_0012
     * @tc.desc      result summary/validity for [0,1,2,3,5,10].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ResultSummary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultSummary_0012 begin`);
      logInfo("resultSummary([0,1,2,3,5,10]) + ':' + resultValid([0,1,2,3,5,10])");
      const actual: string = resultSummary([0,1,2,3,5,10]) + ':' + resultValid([0,1,2,3,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "3.5|10|0|6:true");
      expect(actual).assertEqual("3.5|10|0|6:true");
      logInfo(`${BUNDLE}ResultSummary_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0013
     * @tc.name      Perf_ResultSummary_0013
     * @tc.desc      result summary/validity for [1].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0013 begin`);
      logInfo("resultSummary([1]) + ':' + resultValid([1])");
      const actual: string = resultSummary([1]) + ':' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|1|1:true");
      expect(actual).assertEqual("1|1|1|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0014
     * @tc.name      Perf_ResultSummary_0014
     * @tc.desc      result summary/validity for [2,3].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0014 begin`);
      logInfo("resultSummary([2,3]) + ':' + resultValid([2,3])");
      const actual: string = resultSummary([2,3]) + ':' + resultValid([2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5|3|2|2:true");
      expect(actual).assertEqual("2.5|3|2|2:true");
      logInfo(`${BUNDLE}ResultSummary_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0015
     * @tc.name      Perf_ResultSummary_0015
     * @tc.desc      result summary/validity for [3,5,10].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0015 begin`);
      logInfo("resultSummary([3,5,10]) + ':' + resultValid([3,5,10])");
      const actual: string = resultSummary([3,5,10]) + ':' + resultValid([3,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6|10|3|3:true");
      expect(actual).assertEqual("6|10|3|3:true");
      logInfo(`${BUNDLE}ResultSummary_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0016
     * @tc.name      Perf_ResultSummary_0016
     * @tc.desc      result summary/validity for [5,10,20,50].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0016 begin`);
      logInfo("resultSummary([5,10,20,50]) + ':' + resultValid([5,10,20,50])");
      const actual: string = resultSummary([5,10,20,50]) + ':' + resultValid([5,10,20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "21.25|50|5|4:true");
      expect(actual).assertEqual("21.25|50|5|4:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0017
     * @tc.name      Perf_ResultSummary_0017
     * @tc.desc      result summary/validity for [10,20,50,100,1000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0017 begin`);
      logInfo("resultSummary([10,20,50,100,1000]) + ':' + resultValid([10,20,50,100,1000])");
      const actual: string = resultSummary([10,20,50,100,1000]) + ':' + resultValid([10,20,50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "236|1000|10|5:true");
      expect(actual).assertEqual("236|1000|10|5:true");
      logInfo(`${BUNDLE}ResultSummary_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0018
     * @tc.name      Perf_ResultSummary_0018
     * @tc.desc      result summary/validity for [20,50,100,1000,30000,0].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_ResultSummary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultSummary_0018 begin`);
      logInfo("resultSummary([20,50,100,1000,30000,0]) + ':' + resultValid([20,50,100,1000,30000,0])");
      const actual: string = resultSummary([20,50,100,1000,30000,0]) + ':' + resultValid([20,50,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "5195|30000|0|6:true");
      expect(actual).assertEqual("5195|30000|0|6:true");
      logInfo(`${BUNDLE}ResultSummary_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0019
     * @tc.name      Perf_ResultSummary_0019
     * @tc.desc      result summary/validity for [50].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0019 begin`);
      logInfo("resultSummary([50]) + ':' + resultValid([50])");
      const actual: string = resultSummary([50]) + ':' + resultValid([50]);
      logInfo('actual=' + String(actual) + ', expected=' + "50|50|50|1:true");
      expect(actual).assertEqual("50|50|50|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0020
     * @tc.name      Perf_ResultSummary_0020
     * @tc.desc      result summary/validity for [100,1000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0020 begin`);
      logInfo("resultSummary([100,1000]) + ':' + resultValid([100,1000])");
      const actual: string = resultSummary([100,1000]) + ':' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "550|1000|100|2:true");
      expect(actual).assertEqual("550|1000|100|2:true");
      logInfo(`${BUNDLE}ResultSummary_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0021
     * @tc.name      Perf_ResultSummary_0021
     * @tc.desc      result summary/validity for [1000,30000,0].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0021 begin`);
      logInfo("resultSummary([1000,30000,0]) + ':' + resultValid([1000,30000,0])");
      const actual: string = resultSummary([1000,30000,0]) + ':' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "10333.333333|30000|0|3:true");
      expect(actual).assertEqual("10333.333333|30000|0|3:true");
      logInfo(`${BUNDLE}ResultSummary_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0022
     * @tc.name      Perf_ResultSummary_0022
     * @tc.desc      result summary/validity for [30000,0,1,2].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0022 begin`);
      logInfo("resultSummary([30000,0,1,2]) + ':' + resultValid([30000,0,1,2])");
      const actual: string = resultSummary([30000,0,1,2]) + ':' + resultValid([30000,0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "7500.75|30000|0|4:true");
      expect(actual).assertEqual("7500.75|30000|0|4:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0023
     * @tc.name      Perf_ResultSummary_0023
     * @tc.desc      result summary/validity for [0,1,2,3,5].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ResultSummary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultSummary_0023 begin`);
      logInfo("resultSummary([0,1,2,3,5]) + ':' + resultValid([0,1,2,3,5])");
      const actual: string = resultSummary([0,1,2,3,5]) + ':' + resultValid([0,1,2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2.2|5|0|5:true");
      expect(actual).assertEqual("2.2|5|0|5:true");
      logInfo(`${BUNDLE}ResultSummary_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0024
     * @tc.name      Perf_ResultSummary_0024
     * @tc.desc      result summary/validity for [1,2,3,5,10,20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0024 begin`);
      logInfo("resultSummary([1,2,3,5,10,20]) + ':' + resultValid([1,2,3,5,10,20])");
      const actual: string = resultSummary([1,2,3,5,10,20]) + ':' + resultValid([1,2,3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "6.833333|20|1|6:true");
      expect(actual).assertEqual("6.833333|20|1|6:true");
      logInfo(`${BUNDLE}ResultSummary_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0025
     * @tc.name      Perf_ResultSummary_0025
     * @tc.desc      result summary/validity for [2].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0025 begin`);
      logInfo("resultSummary([2]) + ':' + resultValid([2])");
      const actual: string = resultSummary([2]) + ':' + resultValid([2]);
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|1:true");
      expect(actual).assertEqual("2|2|2|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0026
     * @tc.name      Perf_ResultSummary_0026
     * @tc.desc      result summary/validity for [3,5].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0026 begin`);
      logInfo("resultSummary([3,5]) + ':' + resultValid([3,5])");
      const actual: string = resultSummary([3,5]) + ':' + resultValid([3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "4|5|3|2:true");
      expect(actual).assertEqual("4|5|3|2:true");
      logInfo(`${BUNDLE}ResultSummary_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0027
     * @tc.name      Perf_ResultSummary_0027
     * @tc.desc      result summary/validity for [5,10,20].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0027 begin`);
      logInfo("resultSummary([5,10,20]) + ':' + resultValid([5,10,20])");
      const actual: string = resultSummary([5,10,20]) + ':' + resultValid([5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "11.666667|20|5|3:true");
      expect(actual).assertEqual("11.666667|20|5|3:true");
      logInfo(`${BUNDLE}ResultSummary_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0028
     * @tc.name      Perf_ResultSummary_0028
     * @tc.desc      result summary/validity for [10,20,50,100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0028 begin`);
      logInfo("resultSummary([10,20,50,100]) + ':' + resultValid([10,20,50,100])");
      const actual: string = resultSummary([10,20,50,100]) + ':' + resultValid([10,20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "45|100|10|4:true");
      expect(actual).assertEqual("45|100|10|4:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0029
     * @tc.name      Perf_ResultSummary_0029
     * @tc.desc      result summary/validity for [20,50,100,1000,30000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0029 begin`);
      logInfo("resultSummary([20,50,100,1000,30000]) + ':' + resultValid([20,50,100,1000,30000])");
      const actual: string = resultSummary([20,50,100,1000,30000]) + ':' + resultValid([20,50,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "6234|30000|20|5:true");
      expect(actual).assertEqual("6234|30000|20|5:true");
      logInfo(`${BUNDLE}ResultSummary_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0030
     * @tc.name      Perf_ResultSummary_0030
     * @tc.desc      result summary/validity for [50,100,1000,30000,0,1].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0030 begin`);
      logInfo("resultSummary([50,100,1000,30000,0,1]) + ':' + resultValid([50,100,1000,30000,0,1])");
      const actual: string = resultSummary([50,100,1000,30000,0,1]) + ':' + resultValid([50,100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "5191.833333|30000|0|6:true");
      expect(actual).assertEqual("5191.833333|30000|0|6:true");
      logInfo(`${BUNDLE}ResultSummary_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0031
     * @tc.name      Perf_ResultSummary_0031
     * @tc.desc      result summary/validity for [100].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0031 begin`);
      logInfo("resultSummary([100]) + ':' + resultValid([100])");
      const actual: string = resultSummary([100]) + ':' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "100|100|100|1:true");
      expect(actual).assertEqual("100|100|100|1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResultSummary_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RESULT_SUMMARY_0032
     * @tc.name      Perf_ResultSummary_0032
     * @tc.desc      result summary/validity for [1000,30000].
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ResultSummary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultSummary_0032 begin`);
      logInfo("resultSummary([1000,30000]) + ':' + resultValid([1000,30000])");
      const actual: string = resultSummary([1000,30000]) + ':' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15500|30000|1000|2:true");
      expect(actual).assertEqual("15500|30000|1000|2:true");
      logInfo(`${BUNDLE}ResultSummary_0032 end`);
    });
  });
}
