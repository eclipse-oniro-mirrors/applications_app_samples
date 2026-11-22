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
  strategyValid,
  iterationsValid,
  timeoutValid,
  average,
  maximum,
  minimum,
  resultSummary,
  resultValid,
  utilsNumAfter,
} from '../model/PerfTestLogic';

/** StrategyResultBoundaryMatrixTest logic checks (450 cases). */
export default function strategyResultBoundaryMatrixTest(): void {
  describe('StrategyResultBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0001
     * @tc.name      Perf_StrategyResultMatrix_0001
     * @tc.desc      strategy/result matrix 0 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0001 begin`);
      logInfo("strategy/result matrix 0");
      const actual: string = utilsNumAfter(1, 0) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0], 1, 999, "", false) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0|true|false|false|0|0|0|1|true");
      expect(actual).assertEqual("0|true|false|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0002
     * @tc.name      Perf_StrategyResultMatrix_0002
     * @tc.desc      strategy/result matrix 1 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0002 begin`);
      logInfo("strategy/result matrix 1");
      const actual: string = utilsNumAfter(2, 11) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([3], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "22|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("22|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0003
     * @tc.name      Perf_StrategyResultMatrix_0003
     * @tc.desc      strategy/result matrix 2 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0003 begin`);
      logInfo("strategy/result matrix 2");
      const actual: string = utilsNumAfter(3, 22) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "66|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("66|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0004
     * @tc.name      Perf_StrategyResultMatrix_0004
     * @tc.desc      strategy/result matrix 3 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0004 begin`);
      logInfo("strategy/result matrix 3");
      const actual: string = utilsNumAfter(4, 33) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 4], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "132|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("132|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0005
     * @tc.name      Perf_StrategyResultMatrix_0005
     * @tc.desc      strategy/result matrix 4 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0005 begin`);
      logInfo("strategy/result matrix 4");
      const actual: string = utilsNumAfter(5, 44) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 4], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "220|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("220|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0006
     * @tc.name      Perf_StrategyResultMatrix_0006
     * @tc.desc      strategy/result matrix 5 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0006 begin`);
      logInfo("strategy/result matrix 5");
      const actual: string = utilsNumAfter(6, 55) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 5], 6, 60001, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "330|true|false|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("330|true|false|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0007
     * @tc.name      Perf_StrategyResultMatrix_0007
     * @tc.desc      strategy/result matrix 6 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0007 begin`);
      logInfo("strategy/result matrix 6");
      const actual: string = utilsNumAfter(7, 66) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 5], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "462|true|false|false|15000|30000|0|2|true");
      expect(actual).assertEqual("462|true|false|false|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0008
     * @tc.name      Perf_StrategyResultMatrix_0008
     * @tc.desc      strategy/result matrix 7 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0008 begin`);
      logInfo("strategy/result matrix 7");
      const actual: string = utilsNumAfter(8, 77) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 4, 5], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "616|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("616|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0009
     * @tc.name      Perf_StrategyResultMatrix_0009
     * @tc.desc      strategy/result matrix 8 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0009 begin`);
      logInfo("strategy/result matrix 8");
      const actual: string = utilsNumAfter(9, 88) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 4, 5], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "792|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("792|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0010
     * @tc.name      Perf_StrategyResultMatrix_0010
     * @tc.desc      strategy/result matrix 9 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0010 begin`);
      logInfo("strategy/result matrix 9");
      const actual: string = utilsNumAfter(1, 99) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([6], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "99|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("99|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0011
     * @tc.name      Perf_StrategyResultMatrix_0011
     * @tc.desc      strategy/result matrix 10 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0011 begin`);
      logInfo("strategy/result matrix 10");
      const actual: string = utilsNumAfter(2, 110) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 6], 2, 60000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "220|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("220|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0012
     * @tc.name      Perf_StrategyResultMatrix_0012
     * @tc.desc      strategy/result matrix 11 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0012 begin`);
      logInfo("strategy/result matrix 11");
      const actual: string = utilsNumAfter(3, 121) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 6], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "363|true|false|false|550|1000|100|2|true");
      expect(actual).assertEqual("363|true|false|false|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0013
     * @tc.name      Perf_StrategyResultMatrix_0013
     * @tc.desc      strategy/result matrix 12 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0013 begin`);
      logInfo("strategy/result matrix 12");
      const actual: string = utilsNumAfter(4, 132) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 4, 6], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "528|true|false|false|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("528|true|false|false|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0014
     * @tc.name      Perf_StrategyResultMatrix_0014
     * @tc.desc      strategy/result matrix 13 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0014 begin`);
      logInfo("strategy/result matrix 13");
      const actual: string = utilsNumAfter(5, 143) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 4, 6], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "715|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("715|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0015
     * @tc.name      Perf_StrategyResultMatrix_0015
     * @tc.desc      strategy/result matrix 14 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0015 begin`);
      logInfo("strategy/result matrix 14");
      const actual: string = utilsNumAfter(6, 154) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 5, 6], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "924|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("924|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0016
     * @tc.name      Perf_StrategyResultMatrix_0016
     * @tc.desc      strategy/result matrix 15 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0016 begin`);
      logInfo("strategy/result matrix 15");
      const actual: string = utilsNumAfter(7, 165) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 5, 6], 7, 50000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1155|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("1155|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0017
     * @tc.name      Perf_StrategyResultMatrix_0017
     * @tc.desc      strategy/result matrix 16 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0017 begin`);
      logInfo("strategy/result matrix 16");
      const actual: string = utilsNumAfter(8, 176) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 4, 5, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "1408|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("1408|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0018
     * @tc.name      Perf_StrategyResultMatrix_0018
     * @tc.desc      strategy/result matrix 17 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0018 begin`);
      logInfo("strategy/result matrix 17");
      const actual: string = utilsNumAfter(9, 187) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 4, 5, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1683|true|false|false|370|1000|10|3|true");
      expect(actual).assertEqual("1683|true|false|false|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0019
     * @tc.name      Perf_StrategyResultMatrix_0019
     * @tc.desc      strategy/result matrix 18 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0019 begin`);
      logInfo("strategy/result matrix 18");
      const actual: string = utilsNumAfter(1, 198) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 6], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "198|true|false|false|7775|30000|0|4|true");
      expect(actual).assertEqual("198|true|false|false|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0020
     * @tc.name      Perf_StrategyResultMatrix_0020
     * @tc.desc      strategy/result matrix 19 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0020 begin`);
      logInfo("strategy/result matrix 19");
      const actual: string = utilsNumAfter(2, 209) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "418|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("418|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0021
     * @tc.name      Perf_StrategyResultMatrix_0021
     * @tc.desc      strategy/result matrix 20 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0021 begin`);
      logInfo("strategy/result matrix 20");
      const actual: string = utilsNumAfter(3, 220) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 7], 3, 30000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "660|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("660|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0022
     * @tc.name      Perf_StrategyResultMatrix_0022
     * @tc.desc      strategy/result matrix 21 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0022 begin`);
      logInfo("strategy/result matrix 21");
      const actual: string = utilsNumAfter(4, 231) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 4, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "924|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("924|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0023
     * @tc.name      Perf_StrategyResultMatrix_0023
     * @tc.desc      strategy/result matrix 22 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0023 begin`);
      logInfo("strategy/result matrix 22");
      const actual: string = utilsNumAfter(5, 242) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 4, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "1210|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("1210|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0024
     * @tc.name      Perf_StrategyResultMatrix_0024
     * @tc.desc      strategy/result matrix 23 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0024 begin`);
      logInfo("strategy/result matrix 23");
      const actual: string = utilsNumAfter(6, 253) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 5, 7], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1518|true|false|false|278.75|1000|5|4|true");
      expect(actual).assertEqual("1518|true|false|false|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0025
     * @tc.name      Perf_StrategyResultMatrix_0025
     * @tc.desc      strategy/result matrix 24 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0025 begin`);
      logInfo("strategy/result matrix 24");
      const actual: string = utilsNumAfter(7, 264) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 5, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "1848|true|false|false|6222|30000|0|5|true");
      expect(actual).assertEqual("1848|true|false|false|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0026
     * @tc.name      Perf_StrategyResultMatrix_0026
     * @tc.desc      strategy/result matrix 25 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0026 begin`);
      logInfo("strategy/result matrix 25");
      const actual: string = utilsNumAfter(8, 275) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([4, 5, 7], 8, 1000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2200|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("2200|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0027
     * @tc.name      Perf_StrategyResultMatrix_0027
     * @tc.desc      strategy/result matrix 26 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0027 begin`);
      logInfo("strategy/result matrix 26");
      const actual: string = utilsNumAfter(9, 286) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 4, 5, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "2574|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("2574|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0028
     * @tc.name      Perf_StrategyResultMatrix_0028
     * @tc.desc      strategy/result matrix 27 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0028 begin`);
      logInfo("strategy/result matrix 27");
      const actual: string = utilsNumAfter(1, 297) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 4, 5, 7], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "297|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("297|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0029
     * @tc.name      Perf_StrategyResultMatrix_0029
     * @tc.desc      strategy/result matrix 28 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0029 begin`);
      logInfo("strategy/result matrix 28");
      const actual: string = utilsNumAfter(2, 308) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 6, 7], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "616|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("616|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0030
     * @tc.name      Perf_StrategyResultMatrix_0030
     * @tc.desc      strategy/result matrix 29 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0030 begin`);
      logInfo("strategy/result matrix 29");
      const actual: string = utilsNumAfter(3, 319) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 6, 7], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "957|true|false|false|223.2|1000|1|5|true");
      expect(actual).assertEqual("957|true|false|false|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0031
     * @tc.name      Perf_StrategyResultMatrix_0031
     * @tc.desc      strategy/result matrix 30 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0031 begin`);
      logInfo("strategy/result matrix 30");
      const actual: string = utilsNumAfter(4, 330) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 4, 6, 7], 4, 999, "", false) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "1320|true|false|false|5|5|5|1|true");
      expect(actual).assertEqual("1320|true|false|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0032
     * @tc.name      Perf_StrategyResultMatrix_0032
     * @tc.desc      strategy/result matrix 31 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0032 begin`);
      logInfo("strategy/result matrix 31");
      const actual: string = utilsNumAfter(5, 341) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 4, 6, 7], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "1705|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("1705|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0033
     * @tc.name      Perf_StrategyResultMatrix_0033
     * @tc.desc      strategy/result matrix 32 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0033 begin`);
      logInfo("strategy/result matrix 32");
      const actual: string = utilsNumAfter(6, 352) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 5, 6, 7], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "2112|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("2112|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0034
     * @tc.name      Perf_StrategyResultMatrix_0034
     * @tc.desc      strategy/result matrix 33 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0034 begin`);
      logInfo("strategy/result matrix 33");
      const actual: string = utilsNumAfter(7, 363) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 5, 6, 7], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2541|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("2541|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0035
     * @tc.name      Perf_StrategyResultMatrix_0035
     * @tc.desc      strategy/result matrix 34 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0035 begin`);
      logInfo("strategy/result matrix 34");
      const actual: string = utilsNumAfter(8, 374) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 5, 6, 7], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "2992|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("2992|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0036
     * @tc.name      Perf_StrategyResultMatrix_0036
     * @tc.desc      strategy/result matrix 35 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0036 begin`);
      logInfo("strategy/result matrix 35");
      const actual: string = utilsNumAfter(9, 385) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 4, 5, 6, 7], 9, 60001, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "3465|true|false|false|0|0|0|1|true");
      expect(actual).assertEqual("3465|true|false|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0037
     * @tc.name      Perf_StrategyResultMatrix_0037
     * @tc.desc      strategy/result matrix 36 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0037 begin`);
      logInfo("strategy/result matrix 36");
      const actual: string = utilsNumAfter(1, 396) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 4, 5, 6, 7], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "396|true|false|false|3|5|1|2|true");
      expect(actual).assertEqual("396|true|false|false|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0038
     * @tc.name      Perf_StrategyResultMatrix_0038
     * @tc.desc      strategy/result matrix 37 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0038 begin`);
      logInfo("strategy/result matrix 37");
      const actual: string = utilsNumAfter(2, 407) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "814|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("814|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0039
     * @tc.name      Perf_StrategyResultMatrix_0039
     * @tc.desc      strategy/result matrix 38 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0039 begin`);
      logInfo("strategy/result matrix 38");
      const actual: string = utilsNumAfter(3, 418) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1254|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("1254|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0040
     * @tc.name      Perf_StrategyResultMatrix_0040
     * @tc.desc      strategy/result matrix 39 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0040 begin`);
      logInfo("strategy/result matrix 39");
      const actual: string = utilsNumAfter(4, 429) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 4, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1716|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("1716|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0041
     * @tc.name      Perf_StrategyResultMatrix_0041
     * @tc.desc      strategy/result matrix 40 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0041 begin`);
      logInfo("strategy/result matrix 40");
      const actual: string = utilsNumAfter(5, 440) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 4, 8], 5, 60000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "2200|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("2200|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0042
     * @tc.name      Perf_StrategyResultMatrix_0042
     * @tc.desc      strategy/result matrix 41 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0042 begin`);
      logInfo("strategy/result matrix 41");
      const actual: string = utilsNumAfter(6, 451) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([5, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "2706|true|false|false|15000|30000|0|2|true");
      expect(actual).assertEqual("2706|true|false|false|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0043
     * @tc.name      Perf_StrategyResultMatrix_0043
     * @tc.desc      strategy/result matrix 42 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0043 begin`);
      logInfo("strategy/result matrix 42");
      const actual: string = utilsNumAfter(7, 462) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 5, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "3234|true|false|false|2|5|0|3|true");
      expect(actual).assertEqual("3234|true|false|false|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0044
     * @tc.name      Perf_StrategyResultMatrix_0044
     * @tc.desc      strategy/result matrix 43 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0044 begin`);
      logInfo("strategy/result matrix 43");
      const actual: string = utilsNumAfter(8, 473) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 5, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3784|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("3784|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0045
     * @tc.name      Perf_StrategyResultMatrix_0045
     * @tc.desc      strategy/result matrix 44 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0045 begin`);
      logInfo("strategy/result matrix 44");
      const actual: string = utilsNumAfter(9, 484) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 4, 5, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4356|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("4356|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0046
     * @tc.name      Perf_StrategyResultMatrix_0046
     * @tc.desc      strategy/result matrix 45 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0046 begin`);
      logInfo("strategy/result matrix 45");
      const actual: string = utilsNumAfter(1, 495) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 4, 5, 8], 1, 50000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "495|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("495|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0047
     * @tc.name      Perf_StrategyResultMatrix_0047
     * @tc.desc      strategy/result matrix 46 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0047 begin`);
      logInfo("strategy/result matrix 46");
      const actual: string = utilsNumAfter(2, 506) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 6, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1012|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("1012|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0048
     * @tc.name      Perf_StrategyResultMatrix_0048
     * @tc.desc      strategy/result matrix 47 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0048 begin`);
      logInfo("strategy/result matrix 47");
      const actual: string = utilsNumAfter(3, 517) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 6, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "1551|true|false|false|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("1551|true|false|false|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0049
     * @tc.name      Perf_StrategyResultMatrix_0049
     * @tc.desc      strategy/result matrix 48 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0049 begin`);
      logInfo("strategy/result matrix 48");
      const actual: string = utilsNumAfter(4, 528) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 4, 6, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2112|true|false|false|7501.5|30000|0|4|true");
      expect(actual).assertEqual("2112|true|false|false|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0050
     * @tc.name      Perf_StrategyResultMatrix_0050
     * @tc.desc      strategy/result matrix 49 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0050 begin`);
      logInfo("strategy/result matrix 49");
      const actual: string = utilsNumAfter(5, 539) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 4, 6, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2695|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("2695|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0051
     * @tc.name      Perf_StrategyResultMatrix_0051
     * @tc.desc      strategy/result matrix 50 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0051 begin`);
      logInfo("strategy/result matrix 50");
      const actual: string = utilsNumAfter(6, 550) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 4, 6, 8], 6, 30000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "3300|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("3300|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0052
     * @tc.name      Perf_StrategyResultMatrix_0052
     * @tc.desc      strategy/result matrix 51 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0052 begin`);
      logInfo("strategy/result matrix 51");
      const actual: string = utilsNumAfter(7, 561) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 5, 6, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "3927|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("3927|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0053
     * @tc.name      Perf_StrategyResultMatrix_0053
     * @tc.desc      strategy/result matrix 52 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0053 begin`);
      logInfo("strategy/result matrix 52");
      const actual: string = utilsNumAfter(8, 572) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 5, 6, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4576|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("4576|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0054
     * @tc.name      Perf_StrategyResultMatrix_0054
     * @tc.desc      strategy/result matrix 53 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0054 begin`);
      logInfo("strategy/result matrix 53");
      const actual: string = utilsNumAfter(9, 583) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 4, 5, 6, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "5247|true|false|false|7775|30000|0|4|true");
      expect(actual).assertEqual("5247|true|false|false|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0055
     * @tc.name      Perf_StrategyResultMatrix_0055
     * @tc.desc      strategy/result matrix 54 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0055 begin`);
      logInfo("strategy/result matrix 54");
      const actual: string = utilsNumAfter(1, 594) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 4, 5, 6, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "594|true|false|false|6201.2|30000|0|5|true");
      expect(actual).assertEqual("594|true|false|false|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0056
     * @tc.name      Perf_StrategyResultMatrix_0056
     * @tc.desc      strategy/result matrix 55 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0056 begin`);
      logInfo("strategy/result matrix 55");
      const actual: string = utilsNumAfter(2, 605) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 7, 8], 2, 1000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1210|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("1210|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0057
     * @tc.name      Perf_StrategyResultMatrix_0057
     * @tc.desc      strategy/result matrix 56 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0057 begin`);
      logInfo("strategy/result matrix 56");
      const actual: string = utilsNumAfter(3, 616) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1848|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("1848|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0058
     * @tc.name      Perf_StrategyResultMatrix_0058
     * @tc.desc      strategy/result matrix 57 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0058 begin`);
      logInfo("strategy/result matrix 57");
      const actual: string = utilsNumAfter(4, 627) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([4, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "2508|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("2508|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0059
     * @tc.name      Perf_StrategyResultMatrix_0059
     * @tc.desc      strategy/result matrix 58 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0059 begin`);
      logInfo("strategy/result matrix 58");
      const actual: string = utilsNumAfter(5, 638) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 4, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3190|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("3190|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0060
     * @tc.name      Perf_StrategyResultMatrix_0060
     * @tc.desc      strategy/result matrix 59 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0060 begin`);
      logInfo("strategy/result matrix 59");
      const actual: string = utilsNumAfter(6, 649) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 4, 7, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "3894|true|false|false|6222|30000|0|5|true");
      expect(actual).assertEqual("3894|true|false|false|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0061
     * @tc.name      Perf_StrategyResultMatrix_0061
     * @tc.desc      strategy/result matrix 60 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0061 begin`);
      logInfo("strategy/result matrix 60");
      const actual: string = utilsNumAfter(7, 660) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 5, 7, 8], 7, 999, "", false) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "4620|true|false|false|100|100|100|1|true");
      expect(actual).assertEqual("4620|true|false|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0062
     * @tc.name      Perf_StrategyResultMatrix_0062
     * @tc.desc      strategy/result matrix 61 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0062 begin`);
      logInfo("strategy/result matrix 61");
      const actual: string = utilsNumAfter(8, 671) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 5, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "5368|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("5368|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0063
     * @tc.name      Perf_StrategyResultMatrix_0063
     * @tc.desc      strategy/result matrix 62 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0063 begin`);
      logInfo("strategy/result matrix 62");
      const actual: string = utilsNumAfter(9, 682) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 4, 5, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "6138|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("6138|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0064
     * @tc.name      Perf_StrategyResultMatrix_0064
     * @tc.desc      strategy/result matrix 63 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0064 begin`);
      logInfo("strategy/result matrix 63");
      const actual: string = utilsNumAfter(1, 693) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 4, 5, 7, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "693|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("693|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0065
     * @tc.name      Perf_StrategyResultMatrix_0065
     * @tc.desc      strategy/result matrix 64 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0065 begin`);
      logInfo("strategy/result matrix 64");
      const actual: string = utilsNumAfter(2, 704) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 6, 7, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1408|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("1408|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0066
     * @tc.name      Perf_StrategyResultMatrix_0066
     * @tc.desc      strategy/result matrix 65 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0066 begin`);
      logInfo("strategy/result matrix 65");
      const actual: string = utilsNumAfter(3, 715) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 6, 7, 8], 3, 60001, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2145|true|false|false|5|5|5|1|true");
      expect(actual).assertEqual("2145|true|false|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0067
     * @tc.name      Perf_StrategyResultMatrix_0067
     * @tc.desc      strategy/result matrix 66 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0067 begin`);
      logInfo("strategy/result matrix 66");
      const actual: string = utilsNumAfter(4, 726) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 6, 7, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2904|true|false|false|55|100|10|2|true");
      expect(actual).assertEqual("2904|true|false|false|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0068
     * @tc.name      Perf_StrategyResultMatrix_0068
     * @tc.desc      strategy/result matrix 67 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0068 begin`);
      logInfo("strategy/result matrix 67");
      const actual: string = utilsNumAfter(5, 737) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 4, 6, 7, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3685|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("3685|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0069
     * @tc.name      Perf_StrategyResultMatrix_0069
     * @tc.desc      strategy/result matrix 68 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0069 begin`);
      logInfo("strategy/result matrix 68");
      const actual: string = utilsNumAfter(6, 748) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 4, 6, 7, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "4488|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("4488|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0070
     * @tc.name      Perf_StrategyResultMatrix_0070
     * @tc.desc      strategy/result matrix 69 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0070 begin`);
      logInfo("strategy/result matrix 69");
      const actual: string = utilsNumAfter(7, 759) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 5, 6, 7, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "5313|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("5313|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0071
     * @tc.name      Perf_StrategyResultMatrix_0071
     * @tc.desc      strategy/result matrix 70 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0071 begin`);
      logInfo("strategy/result matrix 70");
      const actual: string = utilsNumAfter(8, 770) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 5, 6, 7, 8], 8, 60000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "6160|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("6160|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0072
     * @tc.name      Perf_StrategyResultMatrix_0072
     * @tc.desc      strategy/result matrix 71 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0072 begin`);
      logInfo("strategy/result matrix 71");
      const actual: string = utilsNumAfter(9, 781) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 4, 5, 6, 7, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "7029|true|false|false|3|5|1|2|true");
      expect(actual).assertEqual("7029|true|false|false|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0073
     * @tc.name      Perf_StrategyResultMatrix_0073
     * @tc.desc      strategy/result matrix 72 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0073 begin`);
      logInfo("strategy/result matrix 72");
      const actual: string = utilsNumAfter(1, 792) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 4, 5, 6, 7, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "792|true|false|false|38.333333|100|5|3|true");
      expect(actual).assertEqual("792|true|false|false|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0074
     * @tc.name      Perf_StrategyResultMatrix_0074
     * @tc.desc      strategy/result matrix 73 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0074 begin`);
      logInfo("strategy/result matrix 73");
      const actual: string = utilsNumAfter(2, 803) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1606|true|true|false|7777.5|30000|10|4|true");
      expect(actual).assertEqual("1606|true|true|false|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0075
     * @tc.name      Perf_StrategyResultMatrix_0075
     * @tc.desc      strategy/result matrix 74 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0075 begin`);
      logInfo("strategy/result matrix 74");
      const actual: string = utilsNumAfter(3, 814) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2442|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("2442|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0076
     * @tc.name      Perf_StrategyResultMatrix_0076
     * @tc.desc      strategy/result matrix 75 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0076 begin`);
      logInfo("strategy/result matrix 75");
      const actual: string = utilsNumAfter(4, 825) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3], 4, 50000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3300|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("3300|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0077
     * @tc.name      Perf_StrategyResultMatrix_0077
     * @tc.desc      strategy/result matrix 76 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0077 begin`);
      logInfo("strategy/result matrix 76");
      const actual: string = utilsNumAfter(5, 836) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 4], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "4180|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("4180|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0078
     * @tc.name      Perf_StrategyResultMatrix_0078
     * @tc.desc      strategy/result matrix 77 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0078 begin`);
      logInfo("strategy/result matrix 77");
      const actual: string = utilsNumAfter(6, 847) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 4], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "5082|true|false|false|2|5|0|3|true");
      expect(actual).assertEqual("5082|true|false|false|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0079
     * @tc.name      Perf_StrategyResultMatrix_0079
     * @tc.desc      strategy/result matrix 78 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0079 begin`);
      logInfo("strategy/result matrix 78");
      const actual: string = utilsNumAfter(7, 858) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 5], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "6006|true|false|false|29|100|1|4|true");
      expect(actual).assertEqual("6006|true|false|false|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0080
     * @tc.name      Perf_StrategyResultMatrix_0080
     * @tc.desc      strategy/result matrix 79 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0080 begin`);
      logInfo("strategy/result matrix 79");
      const actual: string = utilsNumAfter(8, 869) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 5], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "6952|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("6952|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0081
     * @tc.name      Perf_StrategyResultMatrix_0081
     * @tc.desc      strategy/result matrix 80 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0081 begin`);
      logInfo("strategy/result matrix 80");
      const actual: string = utilsNumAfter(9, 880) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 4, 5], 9, 30000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7920|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("7920|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0082
     * @tc.name      Perf_StrategyResultMatrix_0082
     * @tc.desc      strategy/result matrix 81 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0082 begin`);
      logInfo("strategy/result matrix 81");
      const actual: string = utilsNumAfter(1, 891) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 4, 5], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "891|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("891|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0083
     * @tc.name      Perf_StrategyResultMatrix_0083
     * @tc.desc      strategy/result matrix 82 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0083 begin`);
      logInfo("strategy/result matrix 82");
      const actual: string = utilsNumAfter(2, 902) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 4, 5], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "1804|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("1804|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0084
     * @tc.name      Perf_StrategyResultMatrix_0084
     * @tc.desc      strategy/result matrix 83 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0084 begin`);
      logInfo("strategy/result matrix 83");
      const actual: string = utilsNumAfter(3, 913) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 6], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2739|true|false|false|7501.5|30000|0|4|true");
      expect(actual).assertEqual("2739|true|false|false|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0085
     * @tc.name      Perf_StrategyResultMatrix_0085
     * @tc.desc      strategy/result matrix 84 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0085 begin`);
      logInfo("strategy/result matrix 84");
      const actual: string = utilsNumAfter(4, 924) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 6], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3696|true|false|false|23.2|100|0|5|true");
      expect(actual).assertEqual("3696|true|false|false|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0086
     * @tc.name      Perf_StrategyResultMatrix_0086
     * @tc.desc      strategy/result matrix 85 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0086 begin`);
      logInfo("strategy/result matrix 85");
      const actual: string = utilsNumAfter(5, 935) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 4, 6], 5, 1000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "4675|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("4675|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0087
     * @tc.name      Perf_StrategyResultMatrix_0087
     * @tc.desc      strategy/result matrix 86 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0087 begin`);
      logInfo("strategy/result matrix 86");
      const actual: string = utilsNumAfter(6, 946) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 4, 6], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "5676|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("5676|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0088
     * @tc.name      Perf_StrategyResultMatrix_0088
     * @tc.desc      strategy/result matrix 87 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0088 begin`);
      logInfo("strategy/result matrix 87");
      const actual: string = utilsNumAfter(7, 957) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 5, 6], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "6699|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("6699|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0089
     * @tc.name      Perf_StrategyResultMatrix_0089
     * @tc.desc      strategy/result matrix 88 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0089 begin`);
      logInfo("strategy/result matrix 88");
      const actual: string = utilsNumAfter(8, 968) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 5, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "7744|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("7744|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0090
     * @tc.name      Perf_StrategyResultMatrix_0090
     * @tc.desc      strategy/result matrix 89 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0090 begin`);
      logInfo("strategy/result matrix 89");
      const actual: string = utilsNumAfter(9, 979) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([4, 5, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "8811|true|false|false|6201.2|30000|0|5|true");
      expect(actual).assertEqual("8811|true|false|false|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0091
     * @tc.name      Perf_StrategyResultMatrix_0091
     * @tc.desc      strategy/result matrix 90 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0091 begin`);
      logInfo("strategy/result matrix 90");
      const actual: string = utilsNumAfter(1, 990) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 4, 5, 6], 1, 999, "", false) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "990|true|false|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("990|true|false|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0092
     * @tc.name      Perf_StrategyResultMatrix_0092
     * @tc.desc      strategy/result matrix 91 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0092 begin`);
      logInfo("strategy/result matrix 91");
      const actual: string = utilsNumAfter(2, 1001) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 4, 5, 6], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2002|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("2002|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0093
     * @tc.name      Perf_StrategyResultMatrix_0093
     * @tc.desc      strategy/result matrix 92 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0093 begin`);
      logInfo("strategy/result matrix 92");
      const actual: string = utilsNumAfter(3, 1012) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "3036|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("3036|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0094
     * @tc.name      Perf_StrategyResultMatrix_0094
     * @tc.desc      strategy/result matrix 93 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0094 begin`);
      logInfo("strategy/result matrix 93");
      const actual: string = utilsNumAfter(4, 1023) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4092|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("4092|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0095
     * @tc.name      Perf_StrategyResultMatrix_0095
     * @tc.desc      strategy/result matrix 94 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0095 begin`);
      logInfo("strategy/result matrix 94");
      const actual: string = utilsNumAfter(5, 1034) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 4, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "5170|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("5170|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0096
     * @tc.name      Perf_StrategyResultMatrix_0096
     * @tc.desc      strategy/result matrix 95 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0096 begin`);
      logInfo("strategy/result matrix 95");
      const actual: string = utilsNumAfter(6, 1045) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 4, 7], 6, 60001, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "6270|true|false|false|100|100|100|1|true");
      expect(actual).assertEqual("6270|true|false|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0097
     * @tc.name      Perf_StrategyResultMatrix_0097
     * @tc.desc      strategy/result matrix 96 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0097 begin`);
      logInfo("strategy/result matrix 96");
      const actual: string = utilsNumAfter(7, 1056) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 5, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "7392|true|false|false|15500|30000|1000|2|true");
      expect(actual).assertEqual("7392|true|false|false|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0098
     * @tc.name      Perf_StrategyResultMatrix_0098
     * @tc.desc      strategy/result matrix 97 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0098 begin`);
      logInfo("strategy/result matrix 97");
      const actual: string = utilsNumAfter(8, 1067) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 5, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "8536|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("8536|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0099
     * @tc.name      Perf_StrategyResultMatrix_0099
     * @tc.desc      strategy/result matrix 98 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0099 begin`);
      logInfo("strategy/result matrix 98");
      const actual: string = utilsNumAfter(9, 1078) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 5, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "9702|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("9702|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0100
     * @tc.name      Perf_StrategyResultMatrix_0100
     * @tc.desc      strategy/result matrix 99 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0100 begin`);
      logInfo("strategy/result matrix 99");
      const actual: string = utilsNumAfter(1, 1089) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 4, 5, 7], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1089|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("1089|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0101
     * @tc.name      Perf_StrategyResultMatrix_0101
     * @tc.desc      strategy/result matrix 100 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0101 begin`);
      logInfo("strategy/result matrix 100");
      const actual: string = utilsNumAfter(2, 1100) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 4, 5, 7], 2, 60000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2200|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("2200|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0102
     * @tc.name      Perf_StrategyResultMatrix_0102
     * @tc.desc      strategy/result matrix 101 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0102 begin`);
      logInfo("strategy/result matrix 101");
      const actual: string = utilsNumAfter(3, 1111) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 6, 7], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3333|true|false|false|55|100|10|2|true");
      expect(actual).assertEqual("3333|true|false|false|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0103
     * @tc.name      Perf_StrategyResultMatrix_0103
     * @tc.desc      strategy/result matrix 102 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0103 begin`);
      logInfo("strategy/result matrix 102");
      const actual: string = utilsNumAfter(4, 1122) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 6, 7], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4488|true|false|false|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("4488|true|false|false|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0104
     * @tc.name      Perf_StrategyResultMatrix_0104
     * @tc.desc      strategy/result matrix 103 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0104 begin`);
      logInfo("strategy/result matrix 103");
      const actual: string = utilsNumAfter(5, 1133) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 4, 6, 7], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "5665|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("5665|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0105
     * @tc.name      Perf_StrategyResultMatrix_0105
     * @tc.desc      strategy/result matrix 104 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0105 begin`);
      logInfo("strategy/result matrix 104");
      const actual: string = utilsNumAfter(6, 1144) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 4, 6, 7], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6864|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("6864|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0106
     * @tc.name      Perf_StrategyResultMatrix_0106
     * @tc.desc      strategy/result matrix 105 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0106 begin`);
      logInfo("strategy/result matrix 105");
      const actual: string = utilsNumAfter(7, 1155) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([5, 6, 7], 7, 50000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "8085|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("8085|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0107
     * @tc.name      Perf_StrategyResultMatrix_0107
     * @tc.desc      strategy/result matrix 106 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0107 begin`);
      logInfo("strategy/result matrix 106");
      const actual: string = utilsNumAfter(8, 1166) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 5, 6, 7], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "9328|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("9328|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0108
     * @tc.name      Perf_StrategyResultMatrix_0108
     * @tc.desc      strategy/result matrix 107 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0108 begin`);
      logInfo("strategy/result matrix 107");
      const actual: string = utilsNumAfter(9, 1177) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 5, 6, 7], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "10593|true|false|false|38.333333|100|5|3|true");
      expect(actual).assertEqual("10593|true|false|false|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0109
     * @tc.name      Perf_StrategyResultMatrix_0109
     * @tc.desc      strategy/result matrix 108 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0109 begin`);
      logInfo("strategy/result matrix 108");
      const actual: string = utilsNumAfter(1, 1188) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 4, 5, 6, 7], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1188|true|false|false|7777.5|30000|10|4|true");
      expect(actual).assertEqual("1188|true|false|false|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0110
     * @tc.name      Perf_StrategyResultMatrix_0110
     * @tc.desc      strategy/result matrix 109 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0110 begin`);
      logInfo("strategy/result matrix 109");
      const actual: string = utilsNumAfter(2, 1199) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 4, 5, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2398|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("2398|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0111
     * @tc.name      Perf_StrategyResultMatrix_0111
     * @tc.desc      strategy/result matrix 110 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0111 begin`);
      logInfo("strategy/result matrix 110");
      const actual: string = utilsNumAfter(3, 1210) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 8], 3, 30000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3630|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("3630|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0112
     * @tc.name      Perf_StrategyResultMatrix_0112
     * @tc.desc      strategy/result matrix 111 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0112 begin`);
      logInfo("strategy/result matrix 111");
      const actual: string = utilsNumAfter(4, 1221) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "4884|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("4884|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0113
     * @tc.name      Perf_StrategyResultMatrix_0113
     * @tc.desc      strategy/result matrix 112 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0113 begin`);
      logInfo("strategy/result matrix 112");
      const actual: string = utilsNumAfter(5, 1232) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 4, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "6160|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("6160|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0114
     * @tc.name      Perf_StrategyResultMatrix_0114
     * @tc.desc      strategy/result matrix 113 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0114 begin`);
      logInfo("strategy/result matrix 113");
      const actual: string = utilsNumAfter(6, 1243) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 4, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "7458|true|false|false|29|100|1|4|true");
      expect(actual).assertEqual("7458|true|false|false|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0115
     * @tc.name      Perf_StrategyResultMatrix_0115
     * @tc.desc      strategy/result matrix 114 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0115 begin`);
      logInfo("strategy/result matrix 114");
      const actual: string = utilsNumAfter(7, 1254) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 4, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8778|true|false|false|6223|30000|5|5|true");
      expect(actual).assertEqual("8778|true|false|false|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0116
     * @tc.name      Perf_StrategyResultMatrix_0116
     * @tc.desc      strategy/result matrix 115 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0116 begin`);
      logInfo("strategy/result matrix 115");
      const actual: string = utilsNumAfter(8, 1265) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 5, 8], 8, 1000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10120|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("10120|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0117
     * @tc.name      Perf_StrategyResultMatrix_0117
     * @tc.desc      strategy/result matrix 116 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0117 begin`);
      logInfo("strategy/result matrix 116");
      const actual: string = utilsNumAfter(9, 1276) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 5, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "11484|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("11484|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0118
     * @tc.name      Perf_StrategyResultMatrix_0118
     * @tc.desc      strategy/result matrix 117 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0118 begin`);
      logInfo("strategy/result matrix 117");
      const actual: string = utilsNumAfter(1, 1287) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 4, 5, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "1287|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("1287|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0119
     * @tc.name      Perf_StrategyResultMatrix_0119
     * @tc.desc      strategy/result matrix 118 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0119 begin`);
      logInfo("strategy/result matrix 118");
      const actual: string = utilsNumAfter(2, 1298) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 4, 5, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2596|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("2596|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0120
     * @tc.name      Perf_StrategyResultMatrix_0120
     * @tc.desc      strategy/result matrix 119 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0120 begin`);
      logInfo("strategy/result matrix 119");
      const actual: string = utilsNumAfter(3, 1309) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 6, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3927|true|false|false|23.2|100|0|5|true");
      expect(actual).assertEqual("3927|true|false|false|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0121
     * @tc.name      Perf_StrategyResultMatrix_0121
     * @tc.desc      strategy/result matrix 120 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0121 begin`);
      logInfo("strategy/result matrix 120");
      const actual: string = utilsNumAfter(4, 1320) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 6, 8], 4, 999, "", false) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "5280|true|false|false|1|1|1|1|true");
      expect(actual).assertEqual("5280|true|false|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0122
     * @tc.name      Perf_StrategyResultMatrix_0122
     * @tc.desc      strategy/result matrix 121 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0122 begin`);
      logInfo("strategy/result matrix 121");
      const actual: string = utilsNumAfter(5, 1331) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([4, 6, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6655|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("6655|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0123
     * @tc.name      Perf_StrategyResultMatrix_0123
     * @tc.desc      strategy/result matrix 122 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0123 begin`);
      logInfo("strategy/result matrix 122");
      const actual: string = utilsNumAfter(6, 1342) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 4, 6, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8052|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("8052|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0124
     * @tc.name      Perf_StrategyResultMatrix_0124
     * @tc.desc      strategy/result matrix 123 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0124 begin`);
      logInfo("strategy/result matrix 123");
      const actual: string = utilsNumAfter(7, 1353) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 4, 6, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "9471|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("9471|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0125
     * @tc.name      Perf_StrategyResultMatrix_0125
     * @tc.desc      strategy/result matrix 124 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0125 begin`);
      logInfo("strategy/result matrix 124");
      const actual: string = utilsNumAfter(8, 1364) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 5, 6, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "10912|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("10912|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0126
     * @tc.name      Perf_StrategyResultMatrix_0126
     * @tc.desc      strategy/result matrix 125 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0126 begin`);
      logInfo("strategy/result matrix 125");
      const actual: string = utilsNumAfter(9, 1375) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 5, 6, 8], 9, 60001, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "12375|true|false|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("12375|true|false|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0127
     * @tc.name      Perf_StrategyResultMatrix_0127
     * @tc.desc      strategy/result matrix 126 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0127 begin`);
      logInfo("strategy/result matrix 126");
      const actual: string = utilsNumAfter(1, 1386) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 4, 5, 6, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1386|true|false|false|0.5|1|0|2|true");
      expect(actual).assertEqual("1386|true|false|false|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0128
     * @tc.name      Perf_StrategyResultMatrix_0128
     * @tc.desc      strategy/result matrix 127 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0128 begin`);
      logInfo("strategy/result matrix 127");
      const actual: string = utilsNumAfter(2, 1397) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 4, 5, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "2794|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("2794|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0129
     * @tc.name      Perf_StrategyResultMatrix_0129
     * @tc.desc      strategy/result matrix 128 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0129 begin`);
      logInfo("strategy/result matrix 128");
      const actual: string = utilsNumAfter(3, 1408) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4224|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("4224|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0130
     * @tc.name      Perf_StrategyResultMatrix_0130
     * @tc.desc      strategy/result matrix 129 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0130 begin`);
      logInfo("strategy/result matrix 129");
      const actual: string = utilsNumAfter(4, 1419) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "5676|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("5676|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0131
     * @tc.name      Perf_StrategyResultMatrix_0131
     * @tc.desc      strategy/result matrix 130 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0131 begin`);
      logInfo("strategy/result matrix 130");
      const actual: string = utilsNumAfter(5, 1430) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 7, 8], 5, 60000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "7150|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("7150|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0132
     * @tc.name      Perf_StrategyResultMatrix_0132
     * @tc.desc      strategy/result matrix 131 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0132 begin`);
      logInfo("strategy/result matrix 131");
      const actual: string = utilsNumAfter(6, 1441) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 4, 7, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8646|true|false|false|15500|30000|1000|2|true");
      expect(actual).assertEqual("8646|true|false|false|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0133
     * @tc.name      Perf_StrategyResultMatrix_0133
     * @tc.desc      strategy/result matrix 132 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0133 begin`);
      logInfo("strategy/result matrix 132");
      const actual: string = utilsNumAfter(7, 1452) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 4, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "10164|true|false|false|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("10164|true|false|false|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0134
     * @tc.name      Perf_StrategyResultMatrix_0134
     * @tc.desc      strategy/result matrix 133 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0134 begin`);
      logInfo("strategy/result matrix 133");
      const actual: string = utilsNumAfter(8, 1463) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 5, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "11704|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("11704|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0135
     * @tc.name      Perf_StrategyResultMatrix_0135
     * @tc.desc      strategy/result matrix 134 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0135 begin`);
      logInfo("strategy/result matrix 134");
      const actual: string = utilsNumAfter(9, 1474) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 5, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "13266|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("13266|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0136
     * @tc.name      Perf_StrategyResultMatrix_0136
     * @tc.desc      strategy/result matrix 135 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0136 begin`);
      logInfo("strategy/result matrix 135");
      const actual: string = utilsNumAfter(1, 1485) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 4, 5, 7, 8], 1, 50000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "1485|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("1485|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0137
     * @tc.name      Perf_StrategyResultMatrix_0137
     * @tc.desc      strategy/result matrix 136 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0137 begin`);
      logInfo("strategy/result matrix 136");
      const actual: string = utilsNumAfter(2, 1496) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 4, 5, 7, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2992|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("2992|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0138
     * @tc.name      Perf_StrategyResultMatrix_0138
     * @tc.desc      strategy/result matrix 137 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0138 begin`);
      logInfo("strategy/result matrix 137");
      const actual: string = utilsNumAfter(3, 1507) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([6, 7, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4521|true|false|false|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("4521|true|false|false|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0139
     * @tc.name      Perf_StrategyResultMatrix_0139
     * @tc.desc      strategy/result matrix 138 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0139 begin`);
      logInfo("strategy/result matrix 138");
      const actual: string = utilsNumAfter(4, 1518) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 6, 7, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "6072|true|false|false|7750.25|30000|0|4|true");
      expect(actual).assertEqual("6072|true|false|false|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0140
     * @tc.name      Perf_StrategyResultMatrix_0140
     * @tc.desc      strategy/result matrix 139 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0140 begin`);
      logInfo("strategy/result matrix 139");
      const actual: string = utilsNumAfter(5, 1529) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 6, 7, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7645|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("7645|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0141
     * @tc.name      Perf_StrategyResultMatrix_0141
     * @tc.desc      strategy/result matrix 140 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0141 begin`);
      logInfo("strategy/result matrix 140");
      const actual: string = utilsNumAfter(6, 1540) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 4, 6, 7, 8], 6, 30000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "9240|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("9240|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0142
     * @tc.name      Perf_StrategyResultMatrix_0142
     * @tc.desc      strategy/result matrix 141 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0142 begin`);
      logInfo("strategy/result matrix 141");
      const actual: string = utilsNumAfter(7, 1551) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 4, 6, 7, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "10857|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("10857|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0143
     * @tc.name      Perf_StrategyResultMatrix_0143
     * @tc.desc      strategy/result matrix 142 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0143 begin`);
      logInfo("strategy/result matrix 142");
      const actual: string = utilsNumAfter(8, 1562) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 5, 6, 7, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "12496|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("12496|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0144
     * @tc.name      Perf_StrategyResultMatrix_0144
     * @tc.desc      strategy/result matrix 143 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0144 begin`);
      logInfo("strategy/result matrix 143");
      const actual: string = utilsNumAfter(9, 1573) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 5, 6, 7, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14157|true|false|false|7777.5|30000|10|4|true");
      expect(actual).assertEqual("14157|true|false|false|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0145
     * @tc.name      Perf_StrategyResultMatrix_0145
     * @tc.desc      strategy/result matrix 144 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0145 begin`);
      logInfo("strategy/result matrix 144");
      const actual: string = utilsNumAfter(1, 1584) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 4, 5, 6, 7, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1584|true|false|false|6220.2|30000|0|5|true");
      expect(actual).assertEqual("1584|true|false|false|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0146
     * @tc.name      Perf_StrategyResultMatrix_0146
     * @tc.desc      strategy/result matrix 145 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0146 begin`);
      logInfo("strategy/result matrix 145");
      const actual: string = utilsNumAfter(2, 1595) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 4, 5, 6, 7, 8], 2, 1000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3190|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("3190|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0147
     * @tc.name      Perf_StrategyResultMatrix_0147
     * @tc.desc      strategy/result matrix 146 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0147 begin`);
      logInfo("strategy/result matrix 146");
      const actual: string = utilsNumAfter(3, 1606) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 6, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "4818|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("4818|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0148
     * @tc.name      Perf_StrategyResultMatrix_0148
     * @tc.desc      strategy/result matrix 147 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0148 begin`);
      logInfo("strategy/result matrix 147");
      const actual: string = utilsNumAfter(4, 1617) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "6468|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("6468|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0149
     * @tc.name      Perf_StrategyResultMatrix_0149
     * @tc.desc      strategy/result matrix 148 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0149 begin`);
      logInfo("strategy/result matrix 148");
      const actual: string = utilsNumAfter(5, 1628) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "8140|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("8140|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0150
     * @tc.name      Perf_StrategyResultMatrix_0150
     * @tc.desc      strategy/result matrix 149 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0150 begin`);
      logInfo("strategy/result matrix 149");
      const actual: string = utilsNumAfter(6, 1639) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 4], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "9834|true|false|false|6223|30000|5|5|true");
      expect(actual).assertEqual("9834|true|false|false|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0151
     * @tc.name      Perf_StrategyResultMatrix_0151
     * @tc.desc      strategy/result matrix 150 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0151 begin`);
      logInfo("strategy/result matrix 150");
      const actual: string = utilsNumAfter(7, 1650) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 4], 7, 999, "", false) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "11550|true|false|false|10|10|10|1|true");
      expect(actual).assertEqual("11550|true|false|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0152
     * @tc.name      Perf_StrategyResultMatrix_0152
     * @tc.desc      strategy/result matrix 151 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0152 begin`);
      logInfo("strategy/result matrix 151");
      const actual: string = utilsNumAfter(8, 1661) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 5], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "13288|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("13288|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0153
     * @tc.name      Perf_StrategyResultMatrix_0153
     * @tc.desc      strategy/result matrix 152 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0153 begin`);
      logInfo("strategy/result matrix 152");
      const actual: string = utilsNumAfter(9, 1672) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 5], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "15048|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("15048|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0154
     * @tc.name      Perf_StrategyResultMatrix_0154
     * @tc.desc      strategy/result matrix 153 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0154 begin`);
      logInfo("strategy/result matrix 153");
      const actual: string = utilsNumAfter(1, 1683) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([4, 5], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "1683|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("1683|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0155
     * @tc.name      Perf_StrategyResultMatrix_0155
     * @tc.desc      strategy/result matrix 154 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0155 begin`);
      logInfo("strategy/result matrix 154");
      const actual: string = utilsNumAfter(2, 1694) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 4, 5], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3388|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("3388|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0156
     * @tc.name      Perf_StrategyResultMatrix_0156
     * @tc.desc      strategy/result matrix 155 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0156 begin`);
      logInfo("strategy/result matrix 155");
      const actual: string = utilsNumAfter(3, 1705) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 4, 5], 3, 60001, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "5115|true|false|false|1|1|1|1|true");
      expect(actual).assertEqual("5115|true|false|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0157
     * @tc.name      Perf_StrategyResultMatrix_0157
     * @tc.desc      strategy/result matrix 156 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0157 begin`);
      logInfo("strategy/result matrix 156");
      const actual: string = utilsNumAfter(4, 1716) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 6], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6864|true|false|false|7.5|10|5|2|true");
      expect(actual).assertEqual("6864|true|false|false|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0158
     * @tc.name      Perf_StrategyResultMatrix_0158
     * @tc.desc      strategy/result matrix 157 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0158 begin`);
      logInfo("strategy/result matrix 157");
      const actual: string = utilsNumAfter(5, 1727) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 6], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8635|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("8635|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0159
     * @tc.name      Perf_StrategyResultMatrix_0159
     * @tc.desc      strategy/result matrix 158 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0159 begin`);
      logInfo("strategy/result matrix 158");
      const actual: string = utilsNumAfter(6, 1738) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 4, 6], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "10428|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("10428|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0160
     * @tc.name      Perf_StrategyResultMatrix_0160
     * @tc.desc      strategy/result matrix 159 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0160 begin`);
      logInfo("strategy/result matrix 159");
      const actual: string = utilsNumAfter(7, 1749) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 4, 6], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "12243|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("12243|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0161
     * @tc.name      Perf_StrategyResultMatrix_0161
     * @tc.desc      strategy/result matrix 160 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0161 begin`);
      logInfo("strategy/result matrix 160");
      const actual: string = utilsNumAfter(8, 1760) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 5, 6], 8, 60000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14080|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("14080|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0162
     * @tc.name      Perf_StrategyResultMatrix_0162
     * @tc.desc      strategy/result matrix 161 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0162 begin`);
      logInfo("strategy/result matrix 161");
      const actual: string = utilsNumAfter(9, 1771) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 5, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "15939|true|false|false|0.5|1|0|2|true");
      expect(actual).assertEqual("15939|true|false|false|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0163
     * @tc.name      Perf_StrategyResultMatrix_0163
     * @tc.desc      strategy/result matrix 162 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0163 begin`);
      logInfo("strategy/result matrix 162");
      const actual: string = utilsNumAfter(1, 1782) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 5, 6], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "1782|true|false|false|5.333333|10|1|3|true");
      expect(actual).assertEqual("1782|true|false|false|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0164
     * @tc.name      Perf_StrategyResultMatrix_0164
     * @tc.desc      strategy/result matrix 163 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0164 begin`);
      logInfo("strategy/result matrix 163");
      const actual: string = utilsNumAfter(2, 1793) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 4, 5, 6], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3586|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("3586|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0165
     * @tc.name      Perf_StrategyResultMatrix_0165
     * @tc.desc      strategy/result matrix 164 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0165 begin`);
      logInfo("strategy/result matrix 164");
      const actual: string = utilsNumAfter(3, 1804) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 4, 5, 6], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "5412|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("5412|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0166
     * @tc.name      Perf_StrategyResultMatrix_0166
     * @tc.desc      strategy/result matrix 165 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0166 begin`);
      logInfo("strategy/result matrix 165");
      const actual: string = utilsNumAfter(4, 1815) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 7], 4, 50000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "7260|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("7260|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0167
     * @tc.name      Perf_StrategyResultMatrix_0167
     * @tc.desc      strategy/result matrix 166 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0167 begin`);
      logInfo("strategy/result matrix 166");
      const actual: string = utilsNumAfter(5, 1826) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "9130|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("9130|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0168
     * @tc.name      Perf_StrategyResultMatrix_0168
     * @tc.desc      strategy/result matrix 167 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0168 begin`);
      logInfo("strategy/result matrix 167");
      const actual: string = utilsNumAfter(6, 1837) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 4, 7], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "11022|true|false|false|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("11022|true|false|false|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0169
     * @tc.name      Perf_StrategyResultMatrix_0169
     * @tc.desc      strategy/result matrix 168 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0169 begin`);
      logInfo("strategy/result matrix 168");
      const actual: string = utilsNumAfter(7, 1848) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 4, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "12936|true|false|false|4|10|0|4|true");
      expect(actual).assertEqual("12936|true|false|false|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0170
     * @tc.name      Perf_StrategyResultMatrix_0170
     * @tc.desc      strategy/result matrix 169 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0170 begin`);
      logInfo("strategy/result matrix 169");
      const actual: string = utilsNumAfter(8, 1859) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([5, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14872|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("14872|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0171
     * @tc.name      Perf_StrategyResultMatrix_0171
     * @tc.desc      strategy/result matrix 170 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0171 begin`);
      logInfo("strategy/result matrix 170");
      const actual: string = utilsNumAfter(9, 1870) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 5, 7], 9, 30000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "16830|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("16830|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0172
     * @tc.name      Perf_StrategyResultMatrix_0172
     * @tc.desc      strategy/result matrix 171 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0172 begin`);
      logInfo("strategy/result matrix 171");
      const actual: string = utilsNumAfter(1, 1881) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 5, 7], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "1881|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("1881|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0173
     * @tc.name      Perf_StrategyResultMatrix_0173
     * @tc.desc      strategy/result matrix 172 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0173 begin`);
      logInfo("strategy/result matrix 172");
      const actual: string = utilsNumAfter(2, 1892) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 4, 5, 7], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3784|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("3784|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0174
     * @tc.name      Perf_StrategyResultMatrix_0174
     * @tc.desc      strategy/result matrix 173 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0174 begin`);
      logInfo("strategy/result matrix 173");
      const actual: string = utilsNumAfter(3, 1903) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 4, 5, 7], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "5709|true|false|false|7750.25|30000|0|4|true");
      expect(actual).assertEqual("5709|true|false|false|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0175
     * @tc.name      Perf_StrategyResultMatrix_0175
     * @tc.desc      strategy/result matrix 174 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0175 begin`);
      logInfo("strategy/result matrix 174");
      const actual: string = utilsNumAfter(4, 1914) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 6, 7], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7656|true|false|false|6003.2|30000|0|5|true");
      expect(actual).assertEqual("7656|true|false|false|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0176
     * @tc.name      Perf_StrategyResultMatrix_0176
     * @tc.desc      strategy/result matrix 175 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0176 begin`);
      logInfo("strategy/result matrix 175");
      const actual: string = utilsNumAfter(5, 1925) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 6, 7], 5, 1000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "9625|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("9625|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0177
     * @tc.name      Perf_StrategyResultMatrix_0177
     * @tc.desc      strategy/result matrix 176 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0177 begin`);
      logInfo("strategy/result matrix 176");
      const actual: string = utilsNumAfter(6, 1936) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 4, 6, 7], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "11616|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("11616|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0178
     * @tc.name      Perf_StrategyResultMatrix_0178
     * @tc.desc      strategy/result matrix 177 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0178 begin`);
      logInfo("strategy/result matrix 177");
      const actual: string = utilsNumAfter(7, 1947) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 4, 6, 7], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "13629|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("13629|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0179
     * @tc.name      Perf_StrategyResultMatrix_0179
     * @tc.desc      strategy/result matrix 178 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0179 begin`);
      logInfo("strategy/result matrix 178");
      const actual: string = utilsNumAfter(8, 1958) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 4, 6, 7], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15664|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("15664|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0180
     * @tc.name      Perf_StrategyResultMatrix_0180
     * @tc.desc      strategy/result matrix 179 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0180 begin`);
      logInfo("strategy/result matrix 179");
      const actual: string = utilsNumAfter(9, 1969) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 5, 6, 7], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "17721|true|false|false|6220.2|30000|0|5|true");
      expect(actual).assertEqual("17721|true|false|false|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0181
     * @tc.name      Perf_StrategyResultMatrix_0181
     * @tc.desc      strategy/result matrix 180 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0181 begin`);
      logInfo("strategy/result matrix 180");
      const actual: string = utilsNumAfter(1, 1980) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 5, 6, 7], 1, 999, "", false) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1980|true|false|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("1980|true|false|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0182
     * @tc.name      Perf_StrategyResultMatrix_0182
     * @tc.desc      strategy/result matrix 181 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0182 begin`);
      logInfo("strategy/result matrix 181");
      const actual: string = utilsNumAfter(2, 1991) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 4, 5, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "3982|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("3982|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0183
     * @tc.name      Perf_StrategyResultMatrix_0183
     * @tc.desc      strategy/result matrix 182 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0183 begin`);
      logInfo("strategy/result matrix 182");
      const actual: string = utilsNumAfter(3, 2002) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 4, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "6006|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("6006|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0184
     * @tc.name      Perf_StrategyResultMatrix_0184
     * @tc.desc      strategy/result matrix 183 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0184 begin`);
      logInfo("strategy/result matrix 183");
      const actual: string = utilsNumAfter(4, 2013) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "8052|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("8052|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0185
     * @tc.name      Perf_StrategyResultMatrix_0185
     * @tc.desc      strategy/result matrix 184 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0185 begin`);
      logInfo("strategy/result matrix 184");
      const actual: string = utilsNumAfter(5, 2024) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "10120|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("10120|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0186
     * @tc.name      Perf_StrategyResultMatrix_0186
     * @tc.desc      strategy/result matrix 185 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0186 begin`);
      logInfo("strategy/result matrix 185");
      const actual: string = utilsNumAfter(6, 2035) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([4, 8], 6, 60001, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "12210|true|false|false|10|10|10|1|true");
      expect(actual).assertEqual("12210|true|false|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0187
     * @tc.name      Perf_StrategyResultMatrix_0187
     * @tc.desc      strategy/result matrix 186 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0187 begin`);
      logInfo("strategy/result matrix 186");
      const actual: string = utilsNumAfter(7, 2046) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 4, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14322|true|false|false|550|1000|100|2|true");
      expect(actual).assertEqual("14322|true|false|false|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0188
     * @tc.name      Perf_StrategyResultMatrix_0188
     * @tc.desc      strategy/result matrix 187 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0188 begin`);
      logInfo("strategy/result matrix 187");
      const actual: string = utilsNumAfter(8, 2057) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 4, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "16456|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("16456|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0189
     * @tc.name      Perf_StrategyResultMatrix_0189
     * @tc.desc      strategy/result matrix 188 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0189 begin`);
      logInfo("strategy/result matrix 188");
      const actual: string = utilsNumAfter(9, 2068) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 5, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "18612|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("18612|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0190
     * @tc.name      Perf_StrategyResultMatrix_0190
     * @tc.desc      strategy/result matrix 189 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0190 begin`);
      logInfo("strategy/result matrix 189");
      const actual: string = utilsNumAfter(1, 2079) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 5, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2079|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("2079|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0191
     * @tc.name      Perf_StrategyResultMatrix_0191
     * @tc.desc      strategy/result matrix 190 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0191 begin`);
      logInfo("strategy/result matrix 190");
      const actual: string = utilsNumAfter(2, 2090) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 4, 5, 8], 2, 60000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "4180|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("4180|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0192
     * @tc.name      Perf_StrategyResultMatrix_0192
     * @tc.desc      strategy/result matrix 191 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0192 begin`);
      logInfo("strategy/result matrix 191");
      const actual: string = utilsNumAfter(3, 2101) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 4, 5, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6303|true|false|false|7.5|10|5|2|true");
      expect(actual).assertEqual("6303|true|false|false|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0193
     * @tc.name      Perf_StrategyResultMatrix_0193
     * @tc.desc      strategy/result matrix 192 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0193 begin`);
      logInfo("strategy/result matrix 192");
      const actual: string = utilsNumAfter(4, 2112) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 6, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8448|true|false|false|370|1000|10|3|true");
      expect(actual).assertEqual("8448|true|false|false|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0194
     * @tc.name      Perf_StrategyResultMatrix_0194
     * @tc.desc      strategy/result matrix 193 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0194 begin`);
      logInfo("strategy/result matrix 193");
      const actual: string = utilsNumAfter(5, 2123) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 6, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "10615|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("10615|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0195
     * @tc.name      Perf_StrategyResultMatrix_0195
     * @tc.desc      strategy/result matrix 194 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0195 begin`);
      logInfo("strategy/result matrix 194");
      const actual: string = utilsNumAfter(6, 2134) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 6, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "12804|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("12804|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0196
     * @tc.name      Perf_StrategyResultMatrix_0196
     * @tc.desc      strategy/result matrix 195 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0196 begin`);
      logInfo("strategy/result matrix 195");
      const actual: string = utilsNumAfter(7, 2145) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 4, 6, 8], 7, 50000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15015|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("15015|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0197
     * @tc.name      Perf_StrategyResultMatrix_0197
     * @tc.desc      strategy/result matrix 196 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0197 begin`);
      logInfo("strategy/result matrix 196");
      const actual: string = utilsNumAfter(8, 2156) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 4, 6, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "17248|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("17248|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0198
     * @tc.name      Perf_StrategyResultMatrix_0198
     * @tc.desc      strategy/result matrix 197 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0198 begin`);
      logInfo("strategy/result matrix 197");
      const actual: string = utilsNumAfter(9, 2167) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 5, 6, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "19503|true|false|false|5.333333|10|1|3|true");
      expect(actual).assertEqual("19503|true|false|false|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0199
     * @tc.name      Perf_StrategyResultMatrix_0199
     * @tc.desc      strategy/result matrix 198 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0199 begin`);
      logInfo("strategy/result matrix 198");
      const actual: string = utilsNumAfter(1, 2178) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 5, 6, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "2178|true|false|false|278.75|1000|5|4|true");
      expect(actual).assertEqual("2178|true|false|false|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0200
     * @tc.name      Perf_StrategyResultMatrix_0200
     * @tc.desc      strategy/result matrix 199 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0200 begin`);
      logInfo("strategy/result matrix 199");
      const actual: string = utilsNumAfter(2, 2189) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 4, 5, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "4378|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("4378|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0201
     * @tc.name      Perf_StrategyResultMatrix_0201
     * @tc.desc      strategy/result matrix 200 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0201 begin`);
      logInfo("strategy/result matrix 200");
      const actual: string = utilsNumAfter(3, 2200) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 4, 5, 6, 8], 3, 30000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "6600|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("6600|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0202
     * @tc.name      Perf_StrategyResultMatrix_0202
     * @tc.desc      strategy/result matrix 201 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0202 begin`);
      logInfo("strategy/result matrix 201");
      const actual: string = utilsNumAfter(4, 2211) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8844|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("8844|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0203
     * @tc.name      Perf_StrategyResultMatrix_0203
     * @tc.desc      strategy/result matrix 202 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0203 begin`);
      logInfo("strategy/result matrix 202");
      const actual: string = utilsNumAfter(5, 2222) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "11110|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("11110|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0204
     * @tc.name      Perf_StrategyResultMatrix_0204
     * @tc.desc      strategy/result matrix 203 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0204 begin`);
      logInfo("strategy/result matrix 203");
      const actual: string = utilsNumAfter(6, 2233) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 7, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "13398|true|false|false|4|10|0|4|true");
      expect(actual).assertEqual("13398|true|false|false|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0205
     * @tc.name      Perf_StrategyResultMatrix_0205
     * @tc.desc      strategy/result matrix 204 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0205 begin`);
      logInfo("strategy/result matrix 204");
      const actual: string = utilsNumAfter(7, 2244) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 4, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15708|true|false|false|223.2|1000|1|5|true");
      expect(actual).assertEqual("15708|true|false|false|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0206
     * @tc.name      Perf_StrategyResultMatrix_0206
     * @tc.desc      strategy/result matrix 205 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0206 begin`);
      logInfo("strategy/result matrix 205");
      const actual: string = utilsNumAfter(8, 2255) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 4, 7, 8], 8, 1000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "18040|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("18040|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0207
     * @tc.name      Perf_StrategyResultMatrix_0207
     * @tc.desc      strategy/result matrix 206 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0207 begin`);
      logInfo("strategy/result matrix 206");
      const actual: string = utilsNumAfter(9, 2266) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 5, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "20394|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("20394|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0208
     * @tc.name      Perf_StrategyResultMatrix_0208
     * @tc.desc      strategy/result matrix 207 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0208 begin`);
      logInfo("strategy/result matrix 207");
      const actual: string = utilsNumAfter(1, 2277) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 5, 7, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "2277|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("2277|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0209
     * @tc.name      Perf_StrategyResultMatrix_0209
     * @tc.desc      strategy/result matrix 208 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0209 begin`);
      logInfo("strategy/result matrix 208");
      const actual: string = utilsNumAfter(2, 2288) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 4, 5, 7, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "4576|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("4576|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0210
     * @tc.name      Perf_StrategyResultMatrix_0210
     * @tc.desc      strategy/result matrix 209 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0210 begin`);
      logInfo("strategy/result matrix 209");
      const actual: string = utilsNumAfter(3, 2299) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 4, 5, 7, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "6897|true|false|false|6003.2|30000|0|5|true");
      expect(actual).assertEqual("6897|true|false|false|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0211
     * @tc.name      Perf_StrategyResultMatrix_0211
     * @tc.desc      strategy/result matrix 210 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0211 begin`);
      logInfo("strategy/result matrix 210");
      const actual: string = utilsNumAfter(4, 2310) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 7, 8], 4, 999, "", false) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "9240|true|false|false|0|0|0|1|true");
      expect(actual).assertEqual("9240|true|false|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0212
     * @tc.name      Perf_StrategyResultMatrix_0212
     * @tc.desc      strategy/result matrix 211 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0212 begin`);
      logInfo("strategy/result matrix 211");
      const actual: string = utilsNumAfter(5, 2321) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 6, 7, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "11605|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("11605|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0213
     * @tc.name      Perf_StrategyResultMatrix_0213
     * @tc.desc      strategy/result matrix 212 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0213 begin`);
      logInfo("strategy/result matrix 212");
      const actual: string = utilsNumAfter(6, 2332) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 6, 7, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "13992|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("13992|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0214
     * @tc.name      Perf_StrategyResultMatrix_0214
     * @tc.desc      strategy/result matrix 213 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0214 begin`);
      logInfo("strategy/result matrix 213");
      const actual: string = utilsNumAfter(7, 2343) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 4, 6, 7, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "16401|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("16401|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0215
     * @tc.name      Perf_StrategyResultMatrix_0215
     * @tc.desc      strategy/result matrix 214 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0215 begin`);
      logInfo("strategy/result matrix 214");
      const actual: string = utilsNumAfter(8, 2354) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 4, 6, 7, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "18832|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("18832|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0216
     * @tc.name      Perf_StrategyResultMatrix_0216
     * @tc.desc      strategy/result matrix 215 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0216 begin`);
      logInfo("strategy/result matrix 215");
      const actual: string = utilsNumAfter(9, 2365) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 5, 6, 7, 8], 9, 60001, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "21285|true|false|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("21285|true|false|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0217
     * @tc.name      Perf_StrategyResultMatrix_0217
     * @tc.desc      strategy/result matrix 216 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0217 begin`);
      logInfo("strategy/result matrix 216");
      const actual: string = utilsNumAfter(1, 2376) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 5, 6, 7, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "2376|true|false|false|15000|30000|0|2|true");
      expect(actual).assertEqual("2376|true|false|false|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0218
     * @tc.name      Perf_StrategyResultMatrix_0218
     * @tc.desc      strategy/result matrix 217 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0218 begin`);
      logInfo("strategy/result matrix 217");
      const actual: string = utilsNumAfter(2, 2387) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([4, 5, 6, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "4774|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("4774|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0219
     * @tc.name      Perf_StrategyResultMatrix_0219
     * @tc.desc      strategy/result matrix 218 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0219 begin`);
      logInfo("strategy/result matrix 218");
      const actual: string = utilsNumAfter(3, 2398) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 4, 5, 6, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "7194|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("7194|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0220
     * @tc.name      Perf_StrategyResultMatrix_0220
     * @tc.desc      strategy/result matrix 219 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0220 begin`);
      logInfo("strategy/result matrix 219");
      const actual: string = utilsNumAfter(4, 2409) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 4, 5, 6, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "9636|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("9636|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0221
     * @tc.name      Perf_StrategyResultMatrix_0221
     * @tc.desc      strategy/result matrix 220 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0221 begin`);
      logInfo("strategy/result matrix 220");
      const actual: string = utilsNumAfter(5, 2420) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2], 5, 60000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "12100|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("12100|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0222
     * @tc.name      Perf_StrategyResultMatrix_0222
     * @tc.desc      strategy/result matrix 221 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0222 begin`);
      logInfo("strategy/result matrix 221");
      const actual: string = utilsNumAfter(6, 2431) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14586|true|false|false|550|1000|100|2|true");
      expect(actual).assertEqual("14586|true|false|false|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0223
     * @tc.name      Perf_StrategyResultMatrix_0223
     * @tc.desc      strategy/result matrix 222 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0223 begin`);
      logInfo("strategy/result matrix 222");
      const actual: string = utilsNumAfter(7, 2442) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 4], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "17094|true|false|false|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("17094|true|false|false|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0224
     * @tc.name      Perf_StrategyResultMatrix_0224
     * @tc.desc      strategy/result matrix 223 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0224 begin`);
      logInfo("strategy/result matrix 223");
      const actual: string = utilsNumAfter(8, 2453) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 4], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "19624|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("19624|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0225
     * @tc.name      Perf_StrategyResultMatrix_0225
     * @tc.desc      strategy/result matrix 224 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0225 begin`);
      logInfo("strategy/result matrix 224");
      const actual: string = utilsNumAfter(9, 2464) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 5], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "22176|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("22176|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0226
     * @tc.name      Perf_StrategyResultMatrix_0226
     * @tc.desc      strategy/result matrix 225 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0226 begin`);
      logInfo("strategy/result matrix 225");
      const actual: string = utilsNumAfter(1, 2475) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 5], 1, 50000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2475|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("2475|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0227
     * @tc.name      Perf_StrategyResultMatrix_0227
     * @tc.desc      strategy/result matrix 226 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0227 begin`);
      logInfo("strategy/result matrix 226");
      const actual: string = utilsNumAfter(2, 2486) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 5], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "4972|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("4972|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0228
     * @tc.name      Perf_StrategyResultMatrix_0228
     * @tc.desc      strategy/result matrix 227 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0228 begin`);
      logInfo("strategy/result matrix 227");
      const actual: string = utilsNumAfter(3, 2497) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 4, 5], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "7491|true|false|false|370|1000|10|3|true");
      expect(actual).assertEqual("7491|true|false|false|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0229
     * @tc.name      Perf_StrategyResultMatrix_0229
     * @tc.desc      strategy/result matrix 228 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0229 begin`);
      logInfo("strategy/result matrix 228");
      const actual: string = utilsNumAfter(4, 2508) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 4, 5], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "10032|true|false|false|7775|30000|0|4|true");
      expect(actual).assertEqual("10032|true|false|false|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0230
     * @tc.name      Perf_StrategyResultMatrix_0230
     * @tc.desc      strategy/result matrix 229 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0230 begin`);
      logInfo("strategy/result matrix 229");
      const actual: string = utilsNumAfter(5, 2519) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 6], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "12595|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("12595|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0231
     * @tc.name      Perf_StrategyResultMatrix_0231
     * @tc.desc      strategy/result matrix 230 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0231 begin`);
      logInfo("strategy/result matrix 230");
      const actual: string = utilsNumAfter(6, 2530) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 6], 6, 30000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15180|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("15180|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0232
     * @tc.name      Perf_StrategyResultMatrix_0232
     * @tc.desc      strategy/result matrix 231 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0232 begin`);
      logInfo("strategy/result matrix 231");
      const actual: string = utilsNumAfter(7, 2541) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 4, 6], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "17787|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("17787|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0233
     * @tc.name      Perf_StrategyResultMatrix_0233
     * @tc.desc      strategy/result matrix 232 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0233 begin`);
      logInfo("strategy/result matrix 232");
      const actual: string = utilsNumAfter(8, 2552) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 4, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "20416|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("20416|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0234
     * @tc.name      Perf_StrategyResultMatrix_0234
     * @tc.desc      strategy/result matrix 233 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0234 begin`);
      logInfo("strategy/result matrix 233");
      const actual: string = utilsNumAfter(9, 2563) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([5, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "23067|true|false|false|278.75|1000|5|4|true");
      expect(actual).assertEqual("23067|true|false|false|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0235
     * @tc.name      Perf_StrategyResultMatrix_0235
     * @tc.desc      strategy/result matrix 234 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0235 begin`);
      logInfo("strategy/result matrix 234");
      const actual: string = utilsNumAfter(1, 2574) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 5, 6], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "2574|true|false|false|6222|30000|0|5|true");
      expect(actual).assertEqual("2574|true|false|false|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0236
     * @tc.name      Perf_StrategyResultMatrix_0236
     * @tc.desc      strategy/result matrix 235 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0236 begin`);
      logInfo("strategy/result matrix 235");
      const actual: string = utilsNumAfter(2, 2585) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 5, 6], 2, 1000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "5170|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("5170|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0237
     * @tc.name      Perf_StrategyResultMatrix_0237
     * @tc.desc      strategy/result matrix 236 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0237 begin`);
      logInfo("strategy/result matrix 236");
      const actual: string = utilsNumAfter(3, 2596) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 4, 5, 6], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "7788|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("7788|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0238
     * @tc.name      Perf_StrategyResultMatrix_0238
     * @tc.desc      strategy/result matrix 237 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0238 begin`);
      logInfo("strategy/result matrix 237");
      const actual: string = utilsNumAfter(4, 2607) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 4, 5, 6], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "10428|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("10428|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0239
     * @tc.name      Perf_StrategyResultMatrix_0239
     * @tc.desc      strategy/result matrix 238 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0239 begin`);
      logInfo("strategy/result matrix 238");
      const actual: string = utilsNumAfter(5, 2618) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "13090|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("13090|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0240
     * @tc.name      Perf_StrategyResultMatrix_0240
     * @tc.desc      strategy/result matrix 239 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0240 begin`);
      logInfo("strategy/result matrix 239");
      const actual: string = utilsNumAfter(6, 2629) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 7], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15774|true|false|false|223.2|1000|1|5|true");
      expect(actual).assertEqual("15774|true|false|false|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0241
     * @tc.name      Perf_StrategyResultMatrix_0241
     * @tc.desc      strategy/result matrix 240 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0241 begin`);
      logInfo("strategy/result matrix 240");
      const actual: string = utilsNumAfter(7, 2640) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 4, 7], 7, 999, "", false) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "18480|true|false|false|5|5|5|1|true");
      expect(actual).assertEqual("18480|true|false|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0242
     * @tc.name      Perf_StrategyResultMatrix_0242
     * @tc.desc      strategy/result matrix 241 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0242 begin`);
      logInfo("strategy/result matrix 241");
      const actual: string = utilsNumAfter(8, 2651) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 4, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "21208|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("21208|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0243
     * @tc.name      Perf_StrategyResultMatrix_0243
     * @tc.desc      strategy/result matrix 242 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0243 begin`);
      logInfo("strategy/result matrix 242");
      const actual: string = utilsNumAfter(9, 2662) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 4, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "23958|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("23958|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0244
     * @tc.name      Perf_StrategyResultMatrix_0244
     * @tc.desc      strategy/result matrix 243 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0244 begin`);
      logInfo("strategy/result matrix 243");
      const actual: string = utilsNumAfter(1, 2673) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 5, 7], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2673|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("2673|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0245
     * @tc.name      Perf_StrategyResultMatrix_0245
     * @tc.desc      strategy/result matrix 244 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0245 begin`);
      logInfo("strategy/result matrix 244");
      const actual: string = utilsNumAfter(2, 2684) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 5, 7], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "5368|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("5368|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0246
     * @tc.name      Perf_StrategyResultMatrix_0246
     * @tc.desc      strategy/result matrix 245 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0246 begin`);
      logInfo("strategy/result matrix 245");
      const actual: string = utilsNumAfter(3, 2695) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 4, 5, 7], 3, 60001, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "8085|true|false|false|0|0|0|1|true");
      expect(actual).assertEqual("8085|true|false|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0247
     * @tc.name      Perf_StrategyResultMatrix_0247
     * @tc.desc      strategy/result matrix 246 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0247 begin`);
      logInfo("strategy/result matrix 246");
      const actual: string = utilsNumAfter(4, 2706) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 4, 5, 7], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "10824|true|false|false|3|5|1|2|true");
      expect(actual).assertEqual("10824|true|false|false|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0248
     * @tc.name      Perf_StrategyResultMatrix_0248
     * @tc.desc      strategy/result matrix 247 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0248 begin`);
      logInfo("strategy/result matrix 247");
      const actual: string = utilsNumAfter(5, 2717) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 6, 7], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "13585|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("13585|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0249
     * @tc.name      Perf_StrategyResultMatrix_0249
     * @tc.desc      strategy/result matrix 248 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0249 begin`);
      logInfo("strategy/result matrix 248");
      const actual: string = utilsNumAfter(6, 2728) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 6, 7], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "16368|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("16368|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0250
     * @tc.name      Perf_StrategyResultMatrix_0250
     * @tc.desc      strategy/result matrix 249 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0250 begin`);
      logInfo("strategy/result matrix 249");
      const actual: string = utilsNumAfter(7, 2739) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([4, 6, 7], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "19173|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("19173|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0251
     * @tc.name      Perf_StrategyResultMatrix_0251
     * @tc.desc      strategy/result matrix 250 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0251 begin`);
      logInfo("strategy/result matrix 250");
      const actual: string = utilsNumAfter(8, 2750) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 4, 6, 7], 8, 60000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "22000|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("22000|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0252
     * @tc.name      Perf_StrategyResultMatrix_0252
     * @tc.desc      strategy/result matrix 251 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0252 begin`);
      logInfo("strategy/result matrix 251");
      const actual: string = utilsNumAfter(9, 2761) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 4, 6, 7], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "24849|true|false|false|15000|30000|0|2|true");
      expect(actual).assertEqual("24849|true|false|false|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0253
     * @tc.name      Perf_StrategyResultMatrix_0253
     * @tc.desc      strategy/result matrix 252 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0253 begin`);
      logInfo("strategy/result matrix 252");
      const actual: string = utilsNumAfter(1, 2772) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 5, 6, 7], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2772|true|false|false|2|5|0|3|true");
      expect(actual).assertEqual("2772|true|false|false|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0254
     * @tc.name      Perf_StrategyResultMatrix_0254
     * @tc.desc      strategy/result matrix 253 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0254 begin`);
      logInfo("strategy/result matrix 253");
      const actual: string = utilsNumAfter(2, 2783) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 5, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "5566|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("5566|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0255
     * @tc.name      Perf_StrategyResultMatrix_0255
     * @tc.desc      strategy/result matrix 254 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0255 begin`);
      logInfo("strategy/result matrix 254");
      const actual: string = utilsNumAfter(3, 2794) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 4, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8382|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("8382|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0256
     * @tc.name      Perf_StrategyResultMatrix_0256
     * @tc.desc      strategy/result matrix 255 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0256 begin`);
      logInfo("strategy/result matrix 255");
      const actual: string = utilsNumAfter(4, 2805) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 4, 5, 6, 7], 4, 50000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "11220|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("11220|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0257
     * @tc.name      Perf_StrategyResultMatrix_0257
     * @tc.desc      strategy/result matrix 256 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0257 begin`);
      logInfo("strategy/result matrix 256");
      const actual: string = utilsNumAfter(5, 2816) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14080|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("14080|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0258
     * @tc.name      Perf_StrategyResultMatrix_0258
     * @tc.desc      strategy/result matrix 257 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0258 begin`);
      logInfo("strategy/result matrix 257");
      const actual: string = utilsNumAfter(6, 2827) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "16962|true|false|false|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("16962|true|false|false|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0259
     * @tc.name      Perf_StrategyResultMatrix_0259
     * @tc.desc      strategy/result matrix 258 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0259 begin`);
      logInfo("strategy/result matrix 258");
      const actual: string = utilsNumAfter(7, 2838) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "19866|true|false|false|7501.5|30000|0|4|true");
      expect(actual).assertEqual("19866|true|false|false|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0260
     * @tc.name      Perf_StrategyResultMatrix_0260
     * @tc.desc      strategy/result matrix 259 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0260 begin`);
      logInfo("strategy/result matrix 259");
      const actual: string = utilsNumAfter(8, 2849) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 4, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "22792|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("22792|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0261
     * @tc.name      Perf_StrategyResultMatrix_0261
     * @tc.desc      strategy/result matrix 260 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0261 begin`);
      logInfo("strategy/result matrix 260");
      const actual: string = utilsNumAfter(9, 2860) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 4, 8], 9, 30000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "25740|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("25740|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0262
     * @tc.name      Perf_StrategyResultMatrix_0262
     * @tc.desc      strategy/result matrix 261 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0262 begin`);
      logInfo("strategy/result matrix 261");
      const actual: string = utilsNumAfter(1, 2871) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 5, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "2871|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("2871|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0263
     * @tc.name      Perf_StrategyResultMatrix_0263
     * @tc.desc      strategy/result matrix 262 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0263 begin`);
      logInfo("strategy/result matrix 262");
      const actual: string = utilsNumAfter(2, 2882) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 5, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "5764|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("5764|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0264
     * @tc.name      Perf_StrategyResultMatrix_0264
     * @tc.desc      strategy/result matrix 263 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0264 begin`);
      logInfo("strategy/result matrix 263");
      const actual: string = utilsNumAfter(3, 2893) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 4, 5, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "8679|true|false|false|7775|30000|0|4|true");
      expect(actual).assertEqual("8679|true|false|false|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0265
     * @tc.name      Perf_StrategyResultMatrix_0265
     * @tc.desc      strategy/result matrix 264 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0265 begin`);
      logInfo("strategy/result matrix 264");
      const actual: string = utilsNumAfter(4, 2904) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 4, 5, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "11616|true|false|false|6201.2|30000|0|5|true");
      expect(actual).assertEqual("11616|true|false|false|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0266
     * @tc.name      Perf_StrategyResultMatrix_0266
     * @tc.desc      strategy/result matrix 265 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0266 begin`);
      logInfo("strategy/result matrix 265");
      const actual: string = utilsNumAfter(5, 2915) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([6, 8], 5, 1000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14575|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("14575|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0267
     * @tc.name      Perf_StrategyResultMatrix_0267
     * @tc.desc      strategy/result matrix 266 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0267 begin`);
      logInfo("strategy/result matrix 266");
      const actual: string = utilsNumAfter(6, 2926) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 6, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "17556|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("17556|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0268
     * @tc.name      Perf_StrategyResultMatrix_0268
     * @tc.desc      strategy/result matrix 267 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0268 begin`);
      logInfo("strategy/result matrix 267");
      const actual: string = utilsNumAfter(7, 2937) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 6, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "20559|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("20559|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0269
     * @tc.name      Perf_StrategyResultMatrix_0269
     * @tc.desc      strategy/result matrix 268 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0269 begin`);
      logInfo("strategy/result matrix 268");
      const actual: string = utilsNumAfter(8, 2948) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 4, 6, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "23584|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("23584|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0270
     * @tc.name      Perf_StrategyResultMatrix_0270
     * @tc.desc      strategy/result matrix 269 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0270 begin`);
      logInfo("strategy/result matrix 269");
      const actual: string = utilsNumAfter(9, 2959) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 4, 6, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "26631|true|false|false|6222|30000|0|5|true");
      expect(actual).assertEqual("26631|true|false|false|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0271
     * @tc.name      Perf_StrategyResultMatrix_0271
     * @tc.desc      strategy/result matrix 270 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0271 begin`);
      logInfo("strategy/result matrix 270");
      const actual: string = utilsNumAfter(1, 2970) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 5, 6, 8], 1, 999, "", false) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "2970|true|false|false|100|100|100|1|true");
      expect(actual).assertEqual("2970|true|false|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0272
     * @tc.name      Perf_StrategyResultMatrix_0272
     * @tc.desc      strategy/result matrix 271 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0272 begin`);
      logInfo("strategy/result matrix 271");
      const actual: string = utilsNumAfter(2, 2981) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 5, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "5962|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("5962|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0273
     * @tc.name      Perf_StrategyResultMatrix_0273
     * @tc.desc      strategy/result matrix 272 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0273 begin`);
      logInfo("strategy/result matrix 272");
      const actual: string = utilsNumAfter(3, 2992) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 4, 5, 6, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "8976|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("8976|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0274
     * @tc.name      Perf_StrategyResultMatrix_0274
     * @tc.desc      strategy/result matrix 273 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0274 begin`);
      logInfo("strategy/result matrix 273");
      const actual: string = utilsNumAfter(4, 3003) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 4, 5, 6, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "12012|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("12012|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0275
     * @tc.name      Perf_StrategyResultMatrix_0275
     * @tc.desc      strategy/result matrix 274 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0275 begin`);
      logInfo("strategy/result matrix 274");
      const actual: string = utilsNumAfter(5, 3014) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 6, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15070|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("15070|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0276
     * @tc.name      Perf_StrategyResultMatrix_0276
     * @tc.desc      strategy/result matrix 275 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0276 begin`);
      logInfo("strategy/result matrix 275");
      const actual: string = utilsNumAfter(6, 3025) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 7, 8], 6, 60001, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "18150|true|false|false|5|5|5|1|true");
      expect(actual).assertEqual("18150|true|false|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0277
     * @tc.name      Perf_StrategyResultMatrix_0277
     * @tc.desc      strategy/result matrix 276 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0277 begin`);
      logInfo("strategy/result matrix 276");
      const actual: string = utilsNumAfter(7, 3036) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "21252|true|false|false|55|100|10|2|true");
      expect(actual).assertEqual("21252|true|false|false|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0278
     * @tc.name      Perf_StrategyResultMatrix_0278
     * @tc.desc      strategy/result matrix 277 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0278 begin`);
      logInfo("strategy/result matrix 277");
      const actual: string = utilsNumAfter(8, 3047) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 4, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "24376|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("24376|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0279
     * @tc.name      Perf_StrategyResultMatrix_0279
     * @tc.desc      strategy/result matrix 278 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0279 begin`);
      logInfo("strategy/result matrix 278");
      const actual: string = utilsNumAfter(9, 3058) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 4, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "27522|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("27522|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0280
     * @tc.name      Perf_StrategyResultMatrix_0280
     * @tc.desc      strategy/result matrix 279 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0280 begin`);
      logInfo("strategy/result matrix 279");
      const actual: string = utilsNumAfter(1, 3069) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 5, 7, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "3069|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("3069|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0281
     * @tc.name      Perf_StrategyResultMatrix_0281
     * @tc.desc      strategy/result matrix 280 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0281 begin`);
      logInfo("strategy/result matrix 280");
      const actual: string = utilsNumAfter(2, 3080) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 5, 7, 8], 2, 60000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "6160|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("6160|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0282
     * @tc.name      Perf_StrategyResultMatrix_0282
     * @tc.desc      strategy/result matrix 281 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0282 begin`);
      logInfo("strategy/result matrix 281");
      const actual: string = utilsNumAfter(3, 3091) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([4, 5, 7, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "9273|true|false|false|3|5|1|2|true");
      expect(actual).assertEqual("9273|true|false|false|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0283
     * @tc.name      Perf_StrategyResultMatrix_0283
     * @tc.desc      strategy/result matrix 282 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0283 begin`);
      logInfo("strategy/result matrix 282");
      const actual: string = utilsNumAfter(4, 3102) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 4, 5, 7, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "12408|true|false|false|38.333333|100|5|3|true");
      expect(actual).assertEqual("12408|true|false|false|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0284
     * @tc.name      Perf_StrategyResultMatrix_0284
     * @tc.desc      strategy/result matrix 283 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0284 begin`);
      logInfo("strategy/result matrix 283");
      const actual: string = utilsNumAfter(5, 3113) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 4, 5, 7, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15565|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("15565|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0285
     * @tc.name      Perf_StrategyResultMatrix_0285
     * @tc.desc      strategy/result matrix 284 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0285 begin`);
      logInfo("strategy/result matrix 284");
      const actual: string = utilsNumAfter(6, 3124) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 6, 7, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "18744|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("18744|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0286
     * @tc.name      Perf_StrategyResultMatrix_0286
     * @tc.desc      strategy/result matrix 285 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0286 begin`);
      logInfo("strategy/result matrix 285");
      const actual: string = utilsNumAfter(7, 3135) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 6, 7, 8], 7, 50000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "21945|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("21945|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0287
     * @tc.name      Perf_StrategyResultMatrix_0287
     * @tc.desc      strategy/result matrix 286 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0287 begin`);
      logInfo("strategy/result matrix 286");
      const actual: string = utilsNumAfter(8, 3146) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 4, 6, 7, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "25168|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("25168|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0288
     * @tc.name      Perf_StrategyResultMatrix_0288
     * @tc.desc      strategy/result matrix 287 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0288 begin`);
      logInfo("strategy/result matrix 287");
      const actual: string = utilsNumAfter(9, 3157) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 4, 6, 7, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "28413|true|false|false|2|5|0|3|true");
      expect(actual).assertEqual("28413|true|false|false|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0289
     * @tc.name      Perf_StrategyResultMatrix_0289
     * @tc.desc      strategy/result matrix 288 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0289 begin`);
      logInfo("strategy/result matrix 288");
      const actual: string = utilsNumAfter(1, 3168) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 5, 6, 7, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "3168|true|false|false|29|100|1|4|true");
      expect(actual).assertEqual("3168|true|false|false|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0290
     * @tc.name      Perf_StrategyResultMatrix_0290
     * @tc.desc      strategy/result matrix 289 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0290 begin`);
      logInfo("strategy/result matrix 289");
      const actual: string = utilsNumAfter(2, 3179) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 5, 6, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "6358|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("6358|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0291
     * @tc.name      Perf_StrategyResultMatrix_0291
     * @tc.desc      strategy/result matrix 290 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0291 begin`);
      logInfo("strategy/result matrix 290");
      const actual: string = utilsNumAfter(3, 3190) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 5, 6, 7, 8], 3, 30000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "9570|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("9570|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0292
     * @tc.name      Perf_StrategyResultMatrix_0292
     * @tc.desc      strategy/result matrix 291 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0292 begin`);
      logInfo("strategy/result matrix 291");
      const actual: string = utilsNumAfter(4, 3201) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 4, 5, 6, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "12804|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("12804|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0293
     * @tc.name      Perf_StrategyResultMatrix_0293
     * @tc.desc      strategy/result matrix 292 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0293 begin`);
      logInfo("strategy/result matrix 292");
      const actual: string = utilsNumAfter(5, 3212) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 4, 5, 6, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "16060|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("16060|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0294
     * @tc.name      Perf_StrategyResultMatrix_0294
     * @tc.desc      strategy/result matrix 293 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0294 begin`);
      logInfo("strategy/result matrix 293");
      const actual: string = utilsNumAfter(6, 3223) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "19338|true|false|false|7501.5|30000|0|4|true");
      expect(actual).assertEqual("19338|true|false|false|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0295
     * @tc.name      Perf_StrategyResultMatrix_0295
     * @tc.desc      strategy/result matrix 294 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0295 begin`);
      logInfo("strategy/result matrix 294");
      const actual: string = utilsNumAfter(7, 3234) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "22638|true|false|false|23.2|100|0|5|true");
      expect(actual).assertEqual("22638|true|false|false|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0296
     * @tc.name      Perf_StrategyResultMatrix_0296
     * @tc.desc      strategy/result matrix 295 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0296 begin`);
      logInfo("strategy/result matrix 295");
      const actual: string = utilsNumAfter(8, 3245) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 4], 8, 1000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "25960|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("25960|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0297
     * @tc.name      Perf_StrategyResultMatrix_0297
     * @tc.desc      strategy/result matrix 296 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0297 begin`);
      logInfo("strategy/result matrix 296");
      const actual: string = utilsNumAfter(9, 3256) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 4], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "29304|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("29304|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0298
     * @tc.name      Perf_StrategyResultMatrix_0298
     * @tc.desc      strategy/result matrix 297 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0298 begin`);
      logInfo("strategy/result matrix 297");
      const actual: string = utilsNumAfter(1, 3267) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([5], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3267|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("3267|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0299
     * @tc.name      Perf_StrategyResultMatrix_0299
     * @tc.desc      strategy/result matrix 298 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0299 begin`);
      logInfo("strategy/result matrix 298");
      const actual: string = utilsNumAfter(2, 3278) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 5], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "6556|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("6556|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0300
     * @tc.name      Perf_StrategyResultMatrix_0300
     * @tc.desc      strategy/result matrix 299 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0300 begin`);
      logInfo("strategy/result matrix 299");
      const actual: string = utilsNumAfter(3, 3289) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 5], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "9867|true|false|false|6201.2|30000|0|5|true");
      expect(actual).assertEqual("9867|true|false|false|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0300 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0301
     * @tc.name      Perf_StrategyResultMatrix_0301
     * @tc.desc      strategy/result matrix 300 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0301 begin`);
      logInfo("strategy/result matrix 300");
      const actual: string = utilsNumAfter(4, 3300) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 4, 5], 4, 999, "", false) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "13200|true|false|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("13200|true|false|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0301 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0302
     * @tc.name      Perf_StrategyResultMatrix_0302
     * @tc.desc      strategy/result matrix 301 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0302 begin`);
      logInfo("strategy/result matrix 301");
      const actual: string = utilsNumAfter(5, 3311) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 4, 5], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "16555|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("16555|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0302 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0303
     * @tc.name      Perf_StrategyResultMatrix_0303
     * @tc.desc      strategy/result matrix 302 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0303 begin`);
      logInfo("strategy/result matrix 302");
      const actual: string = utilsNumAfter(6, 3322) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 6], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "19932|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("19932|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0303 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0304
     * @tc.name      Perf_StrategyResultMatrix_0304
     * @tc.desc      strategy/result matrix 303 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0304 begin`);
      logInfo("strategy/result matrix 303");
      const actual: string = utilsNumAfter(7, 3333) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 6], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "23331|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("23331|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0304 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0305
     * @tc.name      Perf_StrategyResultMatrix_0305
     * @tc.desc      strategy/result matrix 304 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0305 begin`);
      logInfo("strategy/result matrix 304");
      const actual: string = utilsNumAfter(8, 3344) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 4, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "26752|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("26752|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0305 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0306
     * @tc.name      Perf_StrategyResultMatrix_0306
     * @tc.desc      strategy/result matrix 305 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0306 begin`);
      logInfo("strategy/result matrix 305");
      const actual: string = utilsNumAfter(9, 3355) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 4, 6], 9, 60001, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "30195|true|false|false|100|100|100|1|true");
      expect(actual).assertEqual("30195|true|false|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0306 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0307
     * @tc.name      Perf_StrategyResultMatrix_0307
     * @tc.desc      strategy/result matrix 306 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0307 begin`);
      logInfo("strategy/result matrix 306");
      const actual: string = utilsNumAfter(1, 3366) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 4, 6], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3366|true|false|false|15500|30000|1000|2|true");
      expect(actual).assertEqual("3366|true|false|false|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0307 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0308
     * @tc.name      Perf_StrategyResultMatrix_0308
     * @tc.desc      strategy/result matrix 307 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0308 begin`);
      logInfo("strategy/result matrix 307");
      const actual: string = utilsNumAfter(2, 3377) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 5, 6], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "6754|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("6754|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0308 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0309
     * @tc.name      Perf_StrategyResultMatrix_0309
     * @tc.desc      strategy/result matrix 308 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0309 begin`);
      logInfo("strategy/result matrix 308");
      const actual: string = utilsNumAfter(3, 3388) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 5, 6], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10164|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("10164|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0309 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0310
     * @tc.name      Perf_StrategyResultMatrix_0310
     * @tc.desc      strategy/result matrix 309 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0310 begin`);
      logInfo("strategy/result matrix 309");
      const actual: string = utilsNumAfter(4, 3399) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 4, 5, 6], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "13596|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("13596|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0310 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0311
     * @tc.name      Perf_StrategyResultMatrix_0311
     * @tc.desc      strategy/result matrix 310 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0311 begin`);
      logInfo("strategy/result matrix 310");
      const actual: string = utilsNumAfter(5, 3410) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 4, 5, 6], 5, 60000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "17050|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("17050|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0311 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0312
     * @tc.name      Perf_StrategyResultMatrix_0312
     * @tc.desc      strategy/result matrix 311 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0312 begin`);
      logInfo("strategy/result matrix 311");
      const actual: string = utilsNumAfter(6, 3421) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 7], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "20526|true|false|false|55|100|10|2|true");
      expect(actual).assertEqual("20526|true|false|false|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0312 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0313
     * @tc.name      Perf_StrategyResultMatrix_0313
     * @tc.desc      strategy/result matrix 312 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0313 begin`);
      logInfo("strategy/result matrix 312");
      const actual: string = utilsNumAfter(7, 3432) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "24024|true|false|false|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("24024|true|false|false|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0313 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0314
     * @tc.name      Perf_StrategyResultMatrix_0314
     * @tc.desc      strategy/result matrix 313 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0314 begin`);
      logInfo("strategy/result matrix 313");
      const actual: string = utilsNumAfter(8, 3443) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([4, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "27544|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("27544|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0314 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0315
     * @tc.name      Perf_StrategyResultMatrix_0315
     * @tc.desc      strategy/result matrix 314 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0315 begin`);
      logInfo("strategy/result matrix 314");
      const actual: string = utilsNumAfter(9, 3454) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 4, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "31086|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("31086|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0315 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0316
     * @tc.name      Perf_StrategyResultMatrix_0316
     * @tc.desc      strategy/result matrix 315 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0316 begin`);
      logInfo("strategy/result matrix 315");
      const actual: string = utilsNumAfter(1, 3465) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 4, 7], 1, 50000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "3465|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("3465|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0316 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0317
     * @tc.name      Perf_StrategyResultMatrix_0317
     * @tc.desc      strategy/result matrix 316 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0317 begin`);
      logInfo("strategy/result matrix 316");
      const actual: string = utilsNumAfter(2, 3476) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 5, 7], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "6952|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("6952|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0317 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0318
     * @tc.name      Perf_StrategyResultMatrix_0318
     * @tc.desc      strategy/result matrix 317 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0318 begin`);
      logInfo("strategy/result matrix 317");
      const actual: string = utilsNumAfter(3, 3487) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 5, 7], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "10461|true|false|false|38.333333|100|5|3|true");
      expect(actual).assertEqual("10461|true|false|false|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0318 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0319
     * @tc.name      Perf_StrategyResultMatrix_0319
     * @tc.desc      strategy/result matrix 318 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0319 begin`);
      logInfo("strategy/result matrix 318");
      const actual: string = utilsNumAfter(4, 3498) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 4, 5, 7], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "13992|true|false|false|7777.5|30000|10|4|true");
      expect(actual).assertEqual("13992|true|false|false|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0319 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0320
     * @tc.name      Perf_StrategyResultMatrix_0320
     * @tc.desc      strategy/result matrix 319 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0320 begin`);
      logInfo("strategy/result matrix 319");
      const actual: string = utilsNumAfter(5, 3509) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 4, 5, 7], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "17545|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("17545|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0320 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0321
     * @tc.name      Perf_StrategyResultMatrix_0321
     * @tc.desc      strategy/result matrix 320 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0321 begin`);
      logInfo("strategy/result matrix 320");
      const actual: string = utilsNumAfter(6, 3520) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 6, 7], 6, 30000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "21120|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("21120|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0321 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0322
     * @tc.name      Perf_StrategyResultMatrix_0322
     * @tc.desc      strategy/result matrix 321 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0322 begin`);
      logInfo("strategy/result matrix 321");
      const actual: string = utilsNumAfter(7, 3531) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 6, 7], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "24717|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("24717|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0322 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0323
     * @tc.name      Perf_StrategyResultMatrix_0323
     * @tc.desc      strategy/result matrix 322 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0323 begin`);
      logInfo("strategy/result matrix 322");
      const actual: string = utilsNumAfter(8, 3542) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 6, 7], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "28336|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("28336|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0323 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0324
     * @tc.name      Perf_StrategyResultMatrix_0324
     * @tc.desc      strategy/result matrix 323 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0324 begin`);
      logInfo("strategy/result matrix 323");
      const actual: string = utilsNumAfter(9, 3553) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 4, 6, 7], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "31977|true|false|false|29|100|1|4|true");
      expect(actual).assertEqual("31977|true|false|false|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0324 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0325
     * @tc.name      Perf_StrategyResultMatrix_0325
     * @tc.desc      strategy/result matrix 324 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0325 begin`);
      logInfo("strategy/result matrix 324");
      const actual: string = utilsNumAfter(1, 3564) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 4, 6, 7], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "3564|true|false|false|6223|30000|5|5|true");
      expect(actual).assertEqual("3564|true|false|false|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0325 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0326
     * @tc.name      Perf_StrategyResultMatrix_0326
     * @tc.desc      strategy/result matrix 325 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0326 begin`);
      logInfo("strategy/result matrix 325");
      const actual: string = utilsNumAfter(2, 3575) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 5, 6, 7], 2, 1000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7150|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("7150|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0326 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0327
     * @tc.name      Perf_StrategyResultMatrix_0327
     * @tc.desc      strategy/result matrix 326 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0327 begin`);
      logInfo("strategy/result matrix 326");
      const actual: string = utilsNumAfter(3, 3586) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "10758|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("10758|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0327 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0328
     * @tc.name      Perf_StrategyResultMatrix_0328
     * @tc.desc      strategy/result matrix 327 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0328 begin`);
      logInfo("strategy/result matrix 327");
      const actual: string = utilsNumAfter(4, 3597) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 4, 5, 6, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "14388|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("14388|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0328 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0329
     * @tc.name      Perf_StrategyResultMatrix_0329
     * @tc.desc      strategy/result matrix 328 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0329 begin`);
      logInfo("strategy/result matrix 328");
      const actual: string = utilsNumAfter(5, 3608) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 4, 5, 6, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "18040|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("18040|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0329 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0330
     * @tc.name      Perf_StrategyResultMatrix_0330
     * @tc.desc      strategy/result matrix 329 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0330 begin`);
      logInfo("strategy/result matrix 329");
      const actual: string = utilsNumAfter(6, 3619) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "21714|true|false|false|23.2|100|0|5|true");
      expect(actual).assertEqual("21714|true|false|false|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0330 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0331
     * @tc.name      Perf_StrategyResultMatrix_0331
     * @tc.desc      strategy/result matrix 330 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0331 begin`);
      logInfo("strategy/result matrix 330");
      const actual: string = utilsNumAfter(7, 3630) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 8], 7, 999, "", false) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "25410|true|false|false|1|1|1|1|true");
      expect(actual).assertEqual("25410|true|false|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0331 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0332
     * @tc.name      Perf_StrategyResultMatrix_0332
     * @tc.desc      strategy/result matrix 331 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0332 begin`);
      logInfo("strategy/result matrix 331");
      const actual: string = utilsNumAfter(8, 3641) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "29128|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("29128|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0332 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0333
     * @tc.name      Perf_StrategyResultMatrix_0333
     * @tc.desc      strategy/result matrix 332 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0333 begin`);
      logInfo("strategy/result matrix 332");
      const actual: string = utilsNumAfter(9, 3652) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 4, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "32868|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("32868|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0333 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0334
     * @tc.name      Perf_StrategyResultMatrix_0334
     * @tc.desc      strategy/result matrix 333 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0334 begin`);
      logInfo("strategy/result matrix 333");
      const actual: string = utilsNumAfter(1, 3663) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 4, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "3663|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("3663|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0334 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0335
     * @tc.name      Perf_StrategyResultMatrix_0335
     * @tc.desc      strategy/result matrix 334 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0335 begin`);
      logInfo("strategy/result matrix 334");
      const actual: string = utilsNumAfter(2, 3674) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 5, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "7348|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("7348|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0335 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0336
     * @tc.name      Perf_StrategyResultMatrix_0336
     * @tc.desc      strategy/result matrix 335 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0336 begin`);
      logInfo("strategy/result matrix 335");
      const actual: string = utilsNumAfter(3, 3685) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 5, 8], 3, 60001, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "11055|true|false|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("11055|true|false|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0336 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0337
     * @tc.name      Perf_StrategyResultMatrix_0337
     * @tc.desc      strategy/result matrix 336 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0337 begin`);
      logInfo("strategy/result matrix 336");
      const actual: string = utilsNumAfter(4, 3696) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 4, 5, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "14784|true|false|false|0.5|1|0|2|true");
      expect(actual).assertEqual("14784|true|false|false|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0337 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0338
     * @tc.name      Perf_StrategyResultMatrix_0338
     * @tc.desc      strategy/result matrix 337 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0338 begin`);
      logInfo("strategy/result matrix 337");
      const actual: string = utilsNumAfter(5, 3707) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 4, 5, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "18535|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("18535|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0338 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0339
     * @tc.name      Perf_StrategyResultMatrix_0339
     * @tc.desc      strategy/result matrix 338 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0339 begin`);
      logInfo("strategy/result matrix 338");
      const actual: string = utilsNumAfter(6, 3718) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "22308|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("22308|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0339 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0340
     * @tc.name      Perf_StrategyResultMatrix_0340
     * @tc.desc      strategy/result matrix 339 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0340 begin`);
      logInfo("strategy/result matrix 339");
      const actual: string = utilsNumAfter(7, 3729) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 6, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "26103|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("26103|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0340 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0341
     * @tc.name      Perf_StrategyResultMatrix_0341
     * @tc.desc      strategy/result matrix 340 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0341 begin`);
      logInfo("strategy/result matrix 340");
      const actual: string = utilsNumAfter(8, 3740) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 6, 8], 8, 60000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "29920|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("29920|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0341 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0342
     * @tc.name      Perf_StrategyResultMatrix_0342
     * @tc.desc      strategy/result matrix 341 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0342 begin`);
      logInfo("strategy/result matrix 341");
      const actual: string = utilsNumAfter(9, 3751) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 4, 6, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "33759|true|false|false|15500|30000|1000|2|true");
      expect(actual).assertEqual("33759|true|false|false|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0342 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0343
     * @tc.name      Perf_StrategyResultMatrix_0343
     * @tc.desc      strategy/result matrix 342 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0343 begin`);
      logInfo("strategy/result matrix 342");
      const actual: string = utilsNumAfter(1, 3762) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 4, 6, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "3762|true|false|false|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("3762|true|false|false|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0343 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0344
     * @tc.name      Perf_StrategyResultMatrix_0344
     * @tc.desc      strategy/result matrix 343 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0344 begin`);
      logInfo("strategy/result matrix 343");
      const actual: string = utilsNumAfter(2, 3773) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 5, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7546|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("7546|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0344 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0345
     * @tc.name      Perf_StrategyResultMatrix_0345
     * @tc.desc      strategy/result matrix 344 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0345 begin`);
      logInfo("strategy/result matrix 344");
      const actual: string = utilsNumAfter(3, 3784) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 5, 6, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "11352|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("11352|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0345 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0346
     * @tc.name      Perf_StrategyResultMatrix_0346
     * @tc.desc      strategy/result matrix 345 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0346 begin`);
      logInfo("strategy/result matrix 345");
      const actual: string = utilsNumAfter(4, 3795) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([4, 5, 6, 8], 4, 50000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "15180|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("15180|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0346 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0347
     * @tc.name      Perf_StrategyResultMatrix_0347
     * @tc.desc      strategy/result matrix 346 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0347 begin`);
      logInfo("strategy/result matrix 346");
      const actual: string = utilsNumAfter(5, 3806) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 4, 5, 6, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "19030|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("19030|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0347 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0348
     * @tc.name      Perf_StrategyResultMatrix_0348
     * @tc.desc      strategy/result matrix 347 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0348 begin`);
      logInfo("strategy/result matrix 347");
      const actual: string = utilsNumAfter(6, 3817) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 4, 5, 6, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "22902|true|false|false|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("22902|true|false|false|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0348 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0349
     * @tc.name      Perf_StrategyResultMatrix_0349
     * @tc.desc      strategy/result matrix 348 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0349 begin`);
      logInfo("strategy/result matrix 348");
      const actual: string = utilsNumAfter(7, 3828) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "26796|true|false|false|7750.25|30000|0|4|true");
      expect(actual).assertEqual("26796|true|false|false|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0349 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0350
     * @tc.name      Perf_StrategyResultMatrix_0350
     * @tc.desc      strategy/result matrix 349 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0350 begin`);
      logInfo("strategy/result matrix 349");
      const actual: string = utilsNumAfter(8, 3839) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "30712|true|true|true|6003.2|30000|0|5|true");
      expect(actual).assertEqual("30712|true|true|true|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0350 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0351
     * @tc.name      Perf_StrategyResultMatrix_0351
     * @tc.desc      strategy/result matrix 350 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0351 begin`);
      logInfo("strategy/result matrix 350");
      const actual: string = utilsNumAfter(9, 3850) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 4, 7, 8], 9, 30000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "34650|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("34650|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0351 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0352
     * @tc.name      Perf_StrategyResultMatrix_0352
     * @tc.desc      strategy/result matrix 351 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0352 begin`);
      logInfo("strategy/result matrix 351");
      const actual: string = utilsNumAfter(1, 3861) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 4, 7, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "3861|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("3861|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0352 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0353
     * @tc.name      Perf_StrategyResultMatrix_0353
     * @tc.desc      strategy/result matrix 352 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0353 begin`);
      logInfo("strategy/result matrix 352");
      const actual: string = utilsNumAfter(2, 3872) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 5, 7, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "7744|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("7744|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0353 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0354
     * @tc.name      Perf_StrategyResultMatrix_0354
     * @tc.desc      strategy/result matrix 353 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0354 begin`);
      logInfo("strategy/result matrix 353");
      const actual: string = utilsNumAfter(3, 3883) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 5, 7, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "11649|true|false|false|7777.5|30000|10|4|true");
      expect(actual).assertEqual("11649|true|false|false|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0354 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0355
     * @tc.name      Perf_StrategyResultMatrix_0355
     * @tc.desc      strategy/result matrix 354 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0355 begin`);
      logInfo("strategy/result matrix 354");
      const actual: string = utilsNumAfter(4, 3894) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 5, 7, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "15576|true|false|false|6220.2|30000|0|5|true");
      expect(actual).assertEqual("15576|true|false|false|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0355 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0356
     * @tc.name      Perf_StrategyResultMatrix_0356
     * @tc.desc      strategy/result matrix 355 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0356 begin`);
      logInfo("strategy/result matrix 355");
      const actual: string = utilsNumAfter(5, 3905) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 4, 5, 7, 8], 5, 1000, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "19525|true|true|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("19525|true|true|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0356 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0357
     * @tc.name      Perf_StrategyResultMatrix_0357
     * @tc.desc      strategy/result matrix 356 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0357 begin`);
      logInfo("strategy/result matrix 356");
      const actual: string = utilsNumAfter(6, 3916) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 4, 5, 7, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "23496|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("23496|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0357 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0358
     * @tc.name      Perf_StrategyResultMatrix_0358
     * @tc.desc      strategy/result matrix 357 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0358 begin`);
      logInfo("strategy/result matrix 357");
      const actual: string = utilsNumAfter(7, 3927) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 6, 7, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "27489|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("27489|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0358 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0359
     * @tc.name      Perf_StrategyResultMatrix_0359
     * @tc.desc      strategy/result matrix 358 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0359 begin`);
      logInfo("strategy/result matrix 358");
      const actual: string = utilsNumAfter(8, 3938) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 6, 7, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "31504|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("31504|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0359 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0360
     * @tc.name      Perf_StrategyResultMatrix_0360
     * @tc.desc      strategy/result matrix 359 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0360 begin`);
      logInfo("strategy/result matrix 359");
      const actual: string = utilsNumAfter(9, 3949) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 4, 6, 7, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "35541|true|false|false|6223|30000|5|5|true");
      expect(actual).assertEqual("35541|true|false|false|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0360 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0361
     * @tc.name      Perf_StrategyResultMatrix_0361
     * @tc.desc      strategy/result matrix 360 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0361 begin`);
      logInfo("strategy/result matrix 360");
      const actual: string = utilsNumAfter(1, 3960) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 4, 6, 7, 8], 1, 999, "", false) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "3960|true|false|false|10|10|10|1|true");
      expect(actual).assertEqual("3960|true|false|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0361 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0362
     * @tc.name      Perf_StrategyResultMatrix_0362
     * @tc.desc      strategy/result matrix 361 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0362 begin`);
      logInfo("strategy/result matrix 361");
      const actual: string = utilsNumAfter(2, 3971) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([5, 6, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "7942|true|true|true|550|1000|100|2|true");
      expect(actual).assertEqual("7942|true|true|true|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0362 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0363
     * @tc.name      Perf_StrategyResultMatrix_0363
     * @tc.desc      strategy/result matrix 362 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0363 begin`);
      logInfo("strategy/result matrix 362");
      const actual: string = utilsNumAfter(3, 3982) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 5, 6, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "11946|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("11946|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0363 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0364
     * @tc.name      Perf_StrategyResultMatrix_0364
     * @tc.desc      strategy/result matrix 363 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0364 begin`);
      logInfo("strategy/result matrix 363");
      const actual: string = utilsNumAfter(4, 3993) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 5, 6, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "15972|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("15972|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0364 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0365
     * @tc.name      Perf_StrategyResultMatrix_0365
     * @tc.desc      strategy/result matrix 364 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0365 begin`);
      logInfo("strategy/result matrix 364");
      const actual: string = utilsNumAfter(5, 4004) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 4, 5, 6, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "20020|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("20020|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0365 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0366
     * @tc.name      Perf_StrategyResultMatrix_0366
     * @tc.desc      strategy/result matrix 365 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0366 begin`);
      logInfo("strategy/result matrix 365");
      const actual: string = utilsNumAfter(6, 4015) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 4, 5, 6, 7, 8], 6, 60001, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "24090|true|false|false|1|1|1|1|true");
      expect(actual).assertEqual("24090|true|false|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0366 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0367
     * @tc.name      Perf_StrategyResultMatrix_0367
     * @tc.desc      strategy/result matrix 366 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0367 begin`);
      logInfo("strategy/result matrix 366");
      const actual: string = utilsNumAfter(7, 4026) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "28182|true|false|false|7.5|10|5|2|true");
      expect(actual).assertEqual("28182|true|false|false|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0367 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0368
     * @tc.name      Perf_StrategyResultMatrix_0368
     * @tc.desc      strategy/result matrix 367 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0368 begin`);
      logInfo("strategy/result matrix 367");
      const actual: string = utilsNumAfter(8, 4037) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "32296|true|true|true|370|1000|10|3|true");
      expect(actual).assertEqual("32296|true|true|true|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0368 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0369
     * @tc.name      Perf_StrategyResultMatrix_0369
     * @tc.desc      strategy/result matrix 368 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0369 begin`);
      logInfo("strategy/result matrix 368");
      const actual: string = utilsNumAfter(9, 4048) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 4], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "36432|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("36432|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0369 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0370
     * @tc.name      Perf_StrategyResultMatrix_0370
     * @tc.desc      strategy/result matrix 369 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0370 begin`);
      logInfo("strategy/result matrix 369");
      const actual: string = utilsNumAfter(1, 4059) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 4], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "4059|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("4059|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0370 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0371
     * @tc.name      Perf_StrategyResultMatrix_0371
     * @tc.desc      strategy/result matrix 370 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0371 begin`);
      logInfo("strategy/result matrix 370");
      const actual: string = utilsNumAfter(2, 4070) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 4], 2, 60000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8140|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("8140|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0371 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0372
     * @tc.name      Perf_StrategyResultMatrix_0372
     * @tc.desc      strategy/result matrix 371 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0372 begin`);
      logInfo("strategy/result matrix 371");
      const actual: string = utilsNumAfter(3, 4081) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 5], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "12243|true|false|false|0.5|1|0|2|true");
      expect(actual).assertEqual("12243|true|false|false|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0372 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0373
     * @tc.name      Perf_StrategyResultMatrix_0373
     * @tc.desc      strategy/result matrix 372 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0373 begin`);
      logInfo("strategy/result matrix 372");
      const actual: string = utilsNumAfter(4, 4092) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 5], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "16368|true|false|false|5.333333|10|1|3|true");
      expect(actual).assertEqual("16368|true|false|false|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0373 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0374
     * @tc.name      Perf_StrategyResultMatrix_0374
     * @tc.desc      strategy/result matrix 373 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0374 begin`);
      logInfo("strategy/result matrix 373");
      const actual: string = utilsNumAfter(5, 4103) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 4, 5], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "20515|true|true|true|278.75|1000|5|4|true");
      expect(actual).assertEqual("20515|true|true|true|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0374 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0375
     * @tc.name      Perf_StrategyResultMatrix_0375
     * @tc.desc      strategy/result matrix 374 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0375 begin`);
      logInfo("strategy/result matrix 374");
      const actual: string = utilsNumAfter(6, 4114) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 4, 5], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "24684|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("24684|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0375 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0376
     * @tc.name      Perf_StrategyResultMatrix_0376
     * @tc.desc      strategy/result matrix 375 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0376 begin`);
      logInfo("strategy/result matrix 375");
      const actual: string = utilsNumAfter(7, 4125) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 6], 7, 50000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "28875|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("28875|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0376 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0377
     * @tc.name      Perf_StrategyResultMatrix_0377
     * @tc.desc      strategy/result matrix 376 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0377 begin`);
      logInfo("strategy/result matrix 376");
      const actual: string = utilsNumAfter(8, 4136) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "33088|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("33088|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0377 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0378
     * @tc.name      Perf_StrategyResultMatrix_0378
     * @tc.desc      strategy/result matrix 377 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0378 begin`);
      logInfo("strategy/result matrix 377");
      const actual: string = utilsNumAfter(9, 4147) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([4, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "37323|true|false|false|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("37323|true|false|false|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0378 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0379
     * @tc.name      Perf_StrategyResultMatrix_0379
     * @tc.desc      strategy/result matrix 378 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0379 begin`);
      logInfo("strategy/result matrix 378");
      const actual: string = utilsNumAfter(1, 4158) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 4, 6], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "4158|true|false|false|4|10|0|4|true");
      expect(actual).assertEqual("4158|true|false|false|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0379 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0380
     * @tc.name      Perf_StrategyResultMatrix_0380
     * @tc.desc      strategy/result matrix 379 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0380 begin`);
      logInfo("strategy/result matrix 379");
      const actual: string = utilsNumAfter(2, 4169) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 4, 6], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8338|true|true|true|223.2|1000|1|5|true");
      expect(actual).assertEqual("8338|true|true|true|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0380 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0381
     * @tc.name      Perf_StrategyResultMatrix_0381
     * @tc.desc      strategy/result matrix 380 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0381 begin`);
      logInfo("strategy/result matrix 380");
      const actual: string = utilsNumAfter(3, 4180) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 5, 6], 3, 30000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "12540|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("12540|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0381 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0382
     * @tc.name      Perf_StrategyResultMatrix_0382
     * @tc.desc      strategy/result matrix 381 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0382 begin`);
      logInfo("strategy/result matrix 381");
      const actual: string = utilsNumAfter(4, 4191) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 5, 6], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "16764|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("16764|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0382 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0383
     * @tc.name      Perf_StrategyResultMatrix_0383
     * @tc.desc      strategy/result matrix 382 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0383 begin`);
      logInfo("strategy/result matrix 382");
      const actual: string = utilsNumAfter(5, 4202) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 4, 5, 6], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "21010|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("21010|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0383 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0384
     * @tc.name      Perf_StrategyResultMatrix_0384
     * @tc.desc      strategy/result matrix 383 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0384 begin`);
      logInfo("strategy/result matrix 383");
      const actual: string = utilsNumAfter(6, 4213) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 4, 5, 6], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "25278|true|false|false|7750.25|30000|0|4|true");
      expect(actual).assertEqual("25278|true|false|false|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0384 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0385
     * @tc.name      Perf_StrategyResultMatrix_0385
     * @tc.desc      strategy/result matrix 384 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0385 begin`);
      logInfo("strategy/result matrix 384");
      const actual: string = utilsNumAfter(7, 4224) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "29568|true|false|false|6003.2|30000|0|5|true");
      expect(actual).assertEqual("29568|true|false|false|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0385 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0386
     * @tc.name      Perf_StrategyResultMatrix_0386
     * @tc.desc      strategy/result matrix 385 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0386 begin`);
      logInfo("strategy/result matrix 385");
      const actual: string = utilsNumAfter(8, 4235) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 7], 8, 1000, "", true) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "33880|true|true|false|0|0|0|1|true");
      expect(actual).assertEqual("33880|true|true|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0386 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0387
     * @tc.name      Perf_StrategyResultMatrix_0387
     * @tc.desc      strategy/result matrix 386 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0387 begin`);
      logInfo("strategy/result matrix 386");
      const actual: string = utilsNumAfter(9, 4246) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "38214|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("38214|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0387 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0388
     * @tc.name      Perf_StrategyResultMatrix_0388
     * @tc.desc      strategy/result matrix 387 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0388 begin`);
      logInfo("strategy/result matrix 387");
      const actual: string = utilsNumAfter(1, 4257) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 4, 7], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "4257|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("4257|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0388 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0389
     * @tc.name      Perf_StrategyResultMatrix_0389
     * @tc.desc      strategy/result matrix 388 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0389 begin`);
      logInfo("strategy/result matrix 388");
      const actual: string = utilsNumAfter(2, 4268) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 4, 7], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "8536|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("8536|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0389 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0390
     * @tc.name      Perf_StrategyResultMatrix_0390
     * @tc.desc      strategy/result matrix 389 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0390 begin`);
      logInfo("strategy/result matrix 389");
      const actual: string = utilsNumAfter(3, 4279) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 5, 7], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "12837|true|false|false|6220.2|30000|0|5|true");
      expect(actual).assertEqual("12837|true|false|false|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0390 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0391
     * @tc.name      Perf_StrategyResultMatrix_0391
     * @tc.desc      strategy/result matrix 390 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0391 begin`);
      logInfo("strategy/result matrix 390");
      const actual: string = utilsNumAfter(4, 4290) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 5, 7], 4, 999, "", false) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "17160|true|false|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("17160|true|false|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0391 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0392
     * @tc.name      Perf_StrategyResultMatrix_0392
     * @tc.desc      strategy/result matrix 391 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0392 begin`);
      logInfo("strategy/result matrix 391");
      const actual: string = utilsNumAfter(5, 4301) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 4, 5, 7], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "21505|true|true|true|15000|30000|0|2|true");
      expect(actual).assertEqual("21505|true|true|true|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0392 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0393
     * @tc.name      Perf_StrategyResultMatrix_0393
     * @tc.desc      strategy/result matrix 392 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0393 begin`);
      logInfo("strategy/result matrix 392");
      const actual: string = utilsNumAfter(6, 4312) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3, 4, 5, 7], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "25872|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("25872|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0393 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0394
     * @tc.name      Perf_StrategyResultMatrix_0394
     * @tc.desc      strategy/result matrix 393 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0394 begin`);
      logInfo("strategy/result matrix 393");
      const actual: string = utilsNumAfter(7, 4323) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([6, 7], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "30261|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("30261|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0394 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0395
     * @tc.name      Perf_StrategyResultMatrix_0395
     * @tc.desc      strategy/result matrix 394 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0395 begin`);
      logInfo("strategy/result matrix 394");
      const actual: string = utilsNumAfter(8, 4334) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 6, 7], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "34672|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("34672|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0395 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0396
     * @tc.name      Perf_StrategyResultMatrix_0396
     * @tc.desc      strategy/result matrix 395 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0396 begin`);
      logInfo("strategy/result matrix 395");
      const actual: string = utilsNumAfter(9, 4345) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 6, 7], 9, 60001, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "39105|true|false|false|10|10|10|1|true");
      expect(actual).assertEqual("39105|true|false|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0396 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0397
     * @tc.name      Perf_StrategyResultMatrix_0397
     * @tc.desc      strategy/result matrix 396 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0397 begin`);
      logInfo("strategy/result matrix 396");
      const actual: string = utilsNumAfter(1, 4356) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 4, 6, 7], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4356|true|false|false|550|1000|100|2|true");
      expect(actual).assertEqual("4356|true|false|false|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0397 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0398
     * @tc.name      Perf_StrategyResultMatrix_0398
     * @tc.desc      strategy/result matrix 397 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0398 begin`);
      logInfo("strategy/result matrix 397");
      const actual: string = utilsNumAfter(2, 4367) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 4, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "8734|true|true|true|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("8734|true|true|true|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0398 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0399
     * @tc.name      Perf_StrategyResultMatrix_0399
     * @tc.desc      strategy/result matrix 398 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0399 begin`);
      logInfo("strategy/result matrix 398");
      const actual: string = utilsNumAfter(3, 4378) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "13134|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("13134|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0399 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0400
     * @tc.name      Perf_StrategyResultMatrix_0400
     * @tc.desc      strategy/result matrix 399 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0400 begin`);
      logInfo("strategy/result matrix 399");
      const actual: string = utilsNumAfter(4, 4389) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 5, 6, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "17556|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("17556|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0400 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0401
     * @tc.name      Perf_StrategyResultMatrix_0401
     * @tc.desc      strategy/result matrix 400 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0401 begin`);
      logInfo("strategy/result matrix 400");
      const actual: string = utilsNumAfter(5, 4400) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 4, 5, 6, 7], 5, 60000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "22000|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("22000|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0401 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0402
     * @tc.name      Perf_StrategyResultMatrix_0402
     * @tc.desc      strategy/result matrix 401 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0402 begin`);
      logInfo("strategy/result matrix 401");
      const actual: string = utilsNumAfter(6, 4411) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 4, 5, 6, 7], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "26466|true|false|false|7.5|10|5|2|true");
      expect(actual).assertEqual("26466|true|false|false|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0402 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0403
     * @tc.name      Perf_StrategyResultMatrix_0403
     * @tc.desc      strategy/result matrix 402 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0403 begin`);
      logInfo("strategy/result matrix 402");
      const actual: string = utilsNumAfter(7, 4422) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 3, 4, 5, 6, 7], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30954|true|false|false|370|1000|10|3|true");
      expect(actual).assertEqual("30954|true|false|false|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0403 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0404
     * @tc.name      Perf_StrategyResultMatrix_0404
     * @tc.desc      strategy/result matrix 403 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0404 begin`);
      logInfo("strategy/result matrix 403");
      const actual: string = utilsNumAfter(8, 4433) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "35464|true|true|true|7775|30000|0|4|true");
      expect(actual).assertEqual("35464|true|true|true|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0404 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0405
     * @tc.name      Perf_StrategyResultMatrix_0405
     * @tc.desc      strategy/result matrix 404 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0405 begin`);
      logInfo("strategy/result matrix 404");
      const actual: string = utilsNumAfter(9, 4444) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 3, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "39996|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("39996|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0405 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0406
     * @tc.name      Perf_StrategyResultMatrix_0406
     * @tc.desc      strategy/result matrix 405 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0406 begin`);
      logInfo("strategy/result matrix 405");
      const actual: string = utilsNumAfter(1, 4455) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 4, 8], 1, 50000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4455|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("4455|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0406 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0407
     * @tc.name      Perf_StrategyResultMatrix_0407
     * @tc.desc      strategy/result matrix 406 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0407 begin`);
      logInfo("strategy/result matrix 406");
      const actual: string = utilsNumAfter(2, 4466) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 3, 4, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "8932|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("8932|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0407 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0408
     * @tc.name      Perf_StrategyResultMatrix_0408
     * @tc.desc      strategy/result matrix 407 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0408 begin`);
      logInfo("strategy/result matrix 407");
      const actual: string = utilsNumAfter(3, 4477) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 5, 8], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "13431|true|false|false|5.333333|10|1|3|true");
      expect(actual).assertEqual("13431|true|false|false|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0408 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0409
     * @tc.name      Perf_StrategyResultMatrix_0409
     * @tc.desc      strategy/result matrix 408 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0409 begin`);
      logInfo("strategy/result matrix 408");
      const actual: string = utilsNumAfter(4, 4488) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 3, 5, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "17952|true|false|false|278.75|1000|5|4|true");
      expect(actual).assertEqual("17952|true|false|false|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0409 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0410
     * @tc.name      Perf_StrategyResultMatrix_0410
     * @tc.desc      strategy/result matrix 409 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0410 begin`);
      logInfo("strategy/result matrix 409");
      const actual: string = utilsNumAfter(5, 4499) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([4, 5, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "22495|true|true|true|6222|30000|0|5|true");
      expect(actual).assertEqual("22495|true|true|true|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0410 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0411
     * @tc.name      Perf_StrategyResultMatrix_0411
     * @tc.desc      strategy/result matrix 410 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0411 begin`);
      logInfo("strategy/result matrix 410");
      const actual: string = utilsNumAfter(6, 4510) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 4, 5, 8], 6, 30000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "27060|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("27060|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0411 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0412
     * @tc.name      Perf_StrategyResultMatrix_0412
     * @tc.desc      strategy/result matrix 411 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0412 begin`);
      logInfo("strategy/result matrix 411");
      const actual: string = utilsNumAfter(7, 4521) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 3, 4, 5, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "31647|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("31647|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0412 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0413
     * @tc.name      Perf_StrategyResultMatrix_0413
     * @tc.desc      strategy/result matrix 412 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0413 begin`);
      logInfo("strategy/result matrix 412");
      const actual: string = utilsNumAfter(8, 4532) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 6, 8], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "36256|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("36256|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0413 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0414
     * @tc.name      Perf_StrategyResultMatrix_0414
     * @tc.desc      strategy/result matrix 413 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0414 begin`);
      logInfo("strategy/result matrix 413");
      const actual: string = utilsNumAfter(9, 4543) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 3, 6, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "40887|true|false|false|4|10|0|4|true");
      expect(actual).assertEqual("40887|true|false|false|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0414 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0415
     * @tc.name      Perf_StrategyResultMatrix_0415
     * @tc.desc      strategy/result matrix 414 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0415 begin`);
      logInfo("strategy/result matrix 414");
      const actual: string = utilsNumAfter(1, 4554) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 4, 6, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4554|true|false|false|223.2|1000|1|5|true");
      expect(actual).assertEqual("4554|true|false|false|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0415 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0416
     * @tc.name      Perf_StrategyResultMatrix_0416
     * @tc.desc      strategy/result matrix 415 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0416 begin`);
      logInfo("strategy/result matrix 415");
      const actual: string = utilsNumAfter(2, 4565) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 3, 4, 6, 8], 2, 1000, "", true) + '|' + resultSummary([5]) + '|' + resultValid([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "9130|true|true|false|5|5|5|1|true");
      expect(actual).assertEqual("9130|true|true|false|5|5|5|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0416 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0417
     * @tc.name      Perf_StrategyResultMatrix_0417
     * @tc.desc      strategy/result matrix 416 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0417 begin`);
      logInfo("strategy/result matrix 416");
      const actual: string = utilsNumAfter(3, 4576) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 5, 6, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100]) + '|' + resultValid([10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "13728|true|true|true|55|100|10|2|true");
      expect(actual).assertEqual("13728|true|true|true|55|100|10|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0417 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0418
     * @tc.name      Perf_StrategyResultMatrix_0418
     * @tc.desc      strategy/result matrix 417 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0418 begin`);
      logInfo("strategy/result matrix 417");
      const actual: string = utilsNumAfter(4, 4587) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([3, 5, 6, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000]) + '|' + resultValid([100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "18348|true|true|true|10366.666667|30000|100|3|true");
      expect(actual).assertEqual("18348|true|true|true|10366.666667|30000|100|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0418 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0419
     * @tc.name      Perf_StrategyResultMatrix_0419
     * @tc.desc      strategy/result matrix 418 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0419 begin`);
      logInfo("strategy/result matrix 418");
      const actual: string = utilsNumAfter(5, 4598) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 3, 5, 6, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1]) + '|' + resultValid([1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "22990|true|true|true|7750.25|30000|0|4|true");
      expect(actual).assertEqual("22990|true|true|true|7750.25|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0419 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0420
     * @tc.name      Perf_StrategyResultMatrix_0420
     * @tc.desc      strategy/result matrix 419 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0420 begin`);
      logInfo("strategy/result matrix 419");
      const actual: string = utilsNumAfter(6, 4609) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 4, 5, 6, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5,10]) + '|' + resultValid([30000,0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "27654|true|false|false|6003.2|30000|0|5|true");
      expect(actual).assertEqual("27654|true|false|false|6003.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0420 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0421
     * @tc.name      Perf_StrategyResultMatrix_0421
     * @tc.desc      strategy/result matrix 420 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0421 begin`);
      logInfo("strategy/result matrix 420");
      const actual: string = utilsNumAfter(7, 4620) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 3, 4, 5, 6, 8], 7, 999, "", false) + '|' + resultSummary([0]) + '|' + resultValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "32340|true|false|false|0|0|0|1|true");
      expect(actual).assertEqual("32340|true|false|false|0|0|0|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0421 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0422
     * @tc.name      Perf_StrategyResultMatrix_0422
     * @tc.desc      strategy/result matrix 421 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0422 begin`);
      logInfo("strategy/result matrix 421");
      const actual: string = utilsNumAfter(8, 4631) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5]) + '|' + resultValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "37048|true|true|true|3|5|1|2|true");
      expect(actual).assertEqual("37048|true|true|true|3|5|1|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0422 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0423
     * @tc.name      Perf_StrategyResultMatrix_0423
     * @tc.desc      strategy/result matrix 422 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0423 begin`);
      logInfo("strategy/result matrix 422");
      const actual: string = utilsNumAfter(9, 4642) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 3, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100]) + '|' + resultValid([5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "41778|true|true|true|38.333333|100|5|3|true");
      expect(actual).assertEqual("41778|true|true|true|38.333333|100|5|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0423 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0424
     * @tc.name      Perf_StrategyResultMatrix_0424
     * @tc.desc      strategy/result matrix 423 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0424 begin`);
      logInfo("strategy/result matrix 423");
      const actual: string = utilsNumAfter(1, 4653) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 4, 7, 8], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000,30000]) + '|' + resultValid([10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "4653|true|true|true|7777.5|30000|10|4|true");
      expect(actual).assertEqual("4653|true|true|true|7777.5|30000|10|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0424 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0425
     * @tc.name      Perf_StrategyResultMatrix_0425
     * @tc.desc      strategy/result matrix 424 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0425 begin`);
      logInfo("strategy/result matrix 424");
      const actual: string = utilsNumAfter(2, 4664) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 3, 4, 7, 8], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000,30000,0,1]) + '|' + resultValid([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "9328|true|true|true|6220.2|30000|0|5|true");
      expect(actual).assertEqual("9328|true|true|true|6220.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0425 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0426
     * @tc.name      Perf_StrategyResultMatrix_0426
     * @tc.desc      strategy/result matrix 425 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0426 begin`);
      logInfo("strategy/result matrix 425");
      const actual: string = utilsNumAfter(3, 4675) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([5, 7, 8], 3, 60001, "", true) + '|' + resultSummary([1000]) + '|' + resultValid([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14025|true|false|false|1000|1000|1000|1|true");
      expect(actual).assertEqual("14025|true|false|false|1000|1000|1000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0426 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0427
     * @tc.name      Perf_StrategyResultMatrix_0427
     * @tc.desc      strategy/result matrix 426 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0427 begin`);
      logInfo("strategy/result matrix 426");
      const actual: string = utilsNumAfter(4, 4686) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 2, 5, 7, 8], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([30000,0]) + '|' + resultValid([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "18744|true|false|false|15000|30000|0|2|true");
      expect(actual).assertEqual("18744|true|false|false|15000|30000|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0427 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0428
     * @tc.name      Perf_StrategyResultMatrix_0428
     * @tc.desc      strategy/result matrix 427 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0428 begin`);
      logInfo("strategy/result matrix 427");
      const actual: string = utilsNumAfter(5, 4697) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([1, 2, 3, 5, 7, 8], 5, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5]) + '|' + resultValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "23485|true|true|true|2|5|0|3|true");
      expect(actual).assertEqual("23485|true|true|true|2|5|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0428 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0429
     * @tc.name      Perf_StrategyResultMatrix_0429
     * @tc.desc      strategy/result matrix 428 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0429 begin`);
      logInfo("strategy/result matrix 428");
      const actual: string = utilsNumAfter(6, 4708) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 2, 4, 5, 7, 8], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100]) + '|' + resultValid([1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "28248|true|true|true|29|100|1|4|true");
      expect(actual).assertEqual("28248|true|true|true|29|100|1|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0429 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0430
     * @tc.name      Perf_StrategyResultMatrix_0430
     * @tc.desc      strategy/result matrix 429 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0430 begin`);
      logInfo("strategy/result matrix 429");
      const actual: string = utilsNumAfter(7, 4719) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([2, 3, 4, 5, 7, 8], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000,30000]) + '|' + resultValid([5,10,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "33033|true|true|true|6223|30000|5|5|true");
      expect(actual).assertEqual("33033|true|true|true|6223|30000|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0430 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0431
     * @tc.name      Perf_StrategyResultMatrix_0431
     * @tc.desc      strategy/result matrix 430 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0431 begin`);
      logInfo("strategy/result matrix 430");
      const actual: string = utilsNumAfter(8, 4730) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 6, 7, 8], 8, 60000, "", true) + '|' + resultSummary([10]) + '|' + resultValid([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "37840|true|true|false|10|10|10|1|true");
      expect(actual).assertEqual("37840|true|true|false|10|10|10|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0431 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0432
     * @tc.name      Perf_StrategyResultMatrix_0432
     * @tc.desc      strategy/result matrix 431 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0432 begin`);
      logInfo("strategy/result matrix 431");
      const actual: string = utilsNumAfter(9, 4741) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 3, 6, 7, 8], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([100,1000]) + '|' + resultValid([100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "42669|true|false|false|550|1000|100|2|true");
      expect(actual).assertEqual("42669|true|false|false|550|1000|100|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0432 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0433
     * @tc.name      Perf_StrategyResultMatrix_0433
     * @tc.desc      strategy/result matrix 432 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0433 begin`);
      logInfo("strategy/result matrix 432");
      const actual: string = utilsNumAfter(1, 4752) + '|' + iterationsValid(1) + '|' + timeoutValid(999) + '|' + strategyValid([0, 4, 6, 7, 8], 1, 999, "com.samples.test.perftest", false) + '|' + resultSummary([1000,30000,0]) + '|' + resultValid([1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "4752|true|false|false|10333.333333|30000|0|3|true");
      expect(actual).assertEqual("4752|true|false|false|10333.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0433 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0434
     * @tc.name      Perf_StrategyResultMatrix_0434
     * @tc.desc      strategy/result matrix 433 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0434 begin`);
      logInfo("strategy/result matrix 433");
      const actual: string = utilsNumAfter(2, 4763) + '|' + iterationsValid(2) + '|' + timeoutValid(1000) + '|' + strategyValid([3, 4, 6, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1,5]) + '|' + resultValid([30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "9526|true|true|true|7501.5|30000|0|4|true");
      expect(actual).assertEqual("9526|true|true|true|7501.5|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0434 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0435
     * @tc.name      Perf_StrategyResultMatrix_0435
     * @tc.desc      strategy/result matrix 434 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0435 begin`);
      logInfo("strategy/result matrix 434");
      const actual: string = utilsNumAfter(3, 4774) + '|' + iterationsValid(3) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 2, 3, 4, 6, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10,100]) + '|' + resultValid([0,1,5,10,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "14322|true|true|true|23.2|100|0|5|true");
      expect(actual).assertEqual("14322|true|true|true|23.2|100|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0435 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0436
     * @tc.name      Perf_StrategyResultMatrix_0436
     * @tc.desc      strategy/result matrix 435 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0436 begin`);
      logInfo("strategy/result matrix 435");
      const actual: string = utilsNumAfter(4, 4785) + '|' + iterationsValid(4) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 2, 5, 6, 7, 8], 4, 50000, "", true) + '|' + resultSummary([1]) + '|' + resultValid([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "19140|true|true|false|1|1|1|1|true");
      expect(actual).assertEqual("19140|true|true|false|1|1|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0436 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0437
     * @tc.name      Perf_StrategyResultMatrix_0437
     * @tc.desc      strategy/result matrix 436 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0437 begin`);
      logInfo("strategy/result matrix 436");
      const actual: string = utilsNumAfter(5, 4796) + '|' + iterationsValid(5) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 2, 3, 5, 6, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([5,10]) + '|' + resultValid([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "23980|true|true|true|7.5|10|5|2|true");
      expect(actual).assertEqual("23980|true|true|true|7.5|10|5|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0437 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0438
     * @tc.name      Perf_StrategyResultMatrix_0438
     * @tc.desc      strategy/result matrix 437 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0438 begin`);
      logInfo("strategy/result matrix 437");
      const actual: string = utilsNumAfter(6, 4807) + '|' + iterationsValid(6) + '|' + timeoutValid(60001) + '|' + strategyValid([2, 4, 5, 6, 7, 8], 6, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([10,100,1000]) + '|' + resultValid([10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "28842|true|false|false|370|1000|10|3|true");
      expect(actual).assertEqual("28842|true|false|false|370|1000|10|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0438 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0439
     * @tc.name      Perf_StrategyResultMatrix_0439
     * @tc.desc      strategy/result matrix 438 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0439 begin`);
      logInfo("strategy/result matrix 438");
      const actual: string = utilsNumAfter(7, 4818) + '|' + iterationsValid(7) + '|' + timeoutValid(999) + '|' + strategyValid([0, 1, 3, 4, 5, 6, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + resultSummary([100,1000,30000,0]) + '|' + resultValid([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "33726|true|false|false|7775|30000|0|4|true");
      expect(actual).assertEqual("33726|true|false|false|7775|30000|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0439 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0440
     * @tc.name      Perf_StrategyResultMatrix_0440
     * @tc.desc      strategy/result matrix 439 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0440 begin`);
      logInfo("strategy/result matrix 439");
      const actual: string = utilsNumAfter(8, 4829) + '|' + iterationsValid(8) + '|' + timeoutValid(1000) + '|' + strategyValid([1], 8, 1000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000,0,1,5]) + '|' + resultValid([1000,30000,0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "38632|true|true|true|6201.2|30000|0|5|true");
      expect(actual).assertEqual("38632|true|true|true|6201.2|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0440 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0441
     * @tc.name      Perf_StrategyResultMatrix_0441
     * @tc.desc      strategy/result matrix 440 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyResultMatrix_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0441 begin`);
      logInfo("strategy/result matrix 440");
      const actual: string = utilsNumAfter(9, 4840) + '|' + iterationsValid(9) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 3], 9, 30000, "", true) + '|' + resultSummary([30000]) + '|' + resultValid([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "43560|true|true|false|30000|30000|30000|1|true");
      expect(actual).assertEqual("43560|true|true|false|30000|30000|30000|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0441 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0442
     * @tc.name      Perf_StrategyResultMatrix_0442
     * @tc.desc      strategy/result matrix 441 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0442 begin`);
      logInfo("strategy/result matrix 441");
      const actual: string = utilsNumAfter(1, 4851) + '|' + iterationsValid(1) + '|' + timeoutValid(50000) + '|' + strategyValid([4], 1, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1]) + '|' + resultValid([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "4851|true|true|true|0.5|1|0|2|true");
      expect(actual).assertEqual("4851|true|true|true|0.5|1|0|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0442 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0443
     * @tc.name      Perf_StrategyResultMatrix_0443
     * @tc.desc      strategy/result matrix 442 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyResultMatrix_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0443 begin`);
      logInfo("strategy/result matrix 442");
      const actual: string = utilsNumAfter(2, 4862) + '|' + iterationsValid(2) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 1, 2, 4], 2, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10]) + '|' + resultValid([1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "9724|true|true|true|5.333333|10|1|3|true");
      expect(actual).assertEqual("9724|true|true|true|5.333333|10|1|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0443 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0444
     * @tc.name      Perf_StrategyResultMatrix_0444
     * @tc.desc      strategy/result matrix 443 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0444 begin`);
      logInfo("strategy/result matrix 443");
      const actual: string = utilsNumAfter(3, 4873) + '|' + iterationsValid(3) + '|' + timeoutValid(60001) + '|' + strategyValid([1, 2, 3, 4], 3, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([5,10,100,1000]) + '|' + resultValid([5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "14619|true|false|false|278.75|1000|5|4|true");
      expect(actual).assertEqual("14619|true|false|false|278.75|1000|5|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0444 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0445
     * @tc.name      Perf_StrategyResultMatrix_0445
     * @tc.desc      strategy/result matrix 444 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0445 begin`);
      logInfo("strategy/result matrix 444");
      const actual: string = utilsNumAfter(4, 4884) + '|' + iterationsValid(4) + '|' + timeoutValid(999) + '|' + strategyValid([0, 2, 5], 4, 999, "com.samples.test.perftest", false) + '|' + resultSummary([10,100,1000,30000,0]) + '|' + resultValid([10,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "19536|true|false|false|6222|30000|0|5|true");
      expect(actual).assertEqual("19536|true|false|false|6222|30000|0|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0445 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0446
     * @tc.name      Perf_StrategyResultMatrix_0446
     * @tc.desc      strategy/result matrix 445 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0446 begin`);
      logInfo("strategy/result matrix 445");
      const actual: string = utilsNumAfter(5, 4895) + '|' + iterationsValid(5) + '|' + timeoutValid(1000) + '|' + strategyValid([2, 3, 5], 5, 1000, "", true) + '|' + resultSummary([100]) + '|' + resultValid([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "24475|true|true|false|100|100|100|1|true");
      expect(actual).assertEqual("24475|true|true|false|100|100|100|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0446 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0447
     * @tc.name      Perf_StrategyResultMatrix_0447
     * @tc.desc      strategy/result matrix 446 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0447 begin`);
      logInfo("strategy/result matrix 446");
      const actual: string = utilsNumAfter(6, 4906) + '|' + iterationsValid(6) + '|' + timeoutValid(30000) + '|' + strategyValid([0, 1, 4, 5], 6, 30000, "com.samples.test.perftest", true) + '|' + resultSummary([1000,30000]) + '|' + resultValid([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "29436|true|true|true|15500|30000|1000|2|true");
      expect(actual).assertEqual("29436|true|true|true|15500|30000|1000|2|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0447 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0448
     * @tc.name      Perf_StrategyResultMatrix_0448
     * @tc.desc      strategy/result matrix 447 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0448 begin`);
      logInfo("strategy/result matrix 447");
      const actual: string = utilsNumAfter(7, 4917) + '|' + iterationsValid(7) + '|' + timeoutValid(50000) + '|' + strategyValid([1, 3, 4, 5], 7, 50000, "com.samples.test.perftest", true) + '|' + resultSummary([30000,0,1]) + '|' + resultValid([30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "34419|true|true|true|10000.333333|30000|0|3|true");
      expect(actual).assertEqual("34419|true|true|true|10000.333333|30000|0|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0448 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0449
     * @tc.name      Perf_StrategyResultMatrix_0449
     * @tc.desc      strategy/result matrix 448 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0449 begin`);
      logInfo("strategy/result matrix 448");
      const actual: string = utilsNumAfter(8, 4928) + '|' + iterationsValid(8) + '|' + timeoutValid(60000) + '|' + strategyValid([0, 6], 8, 60000, "com.samples.test.perftest", true) + '|' + resultSummary([0,1,5,10]) + '|' + resultValid([0,1,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "39424|true|true|true|4|10|0|4|true");
      expect(actual).assertEqual("39424|true|true|true|4|10|0|4|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0449 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_RESULT_MATRIX_0450
     * @tc.name      Perf_StrategyResultMatrix_0450
     * @tc.desc      strategy/result matrix 449 keeps validation and statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyResultMatrix_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyResultMatrix_0450 begin`);
      logInfo("strategy/result matrix 449");
      const actual: string = utilsNumAfter(9, 4939) + '|' + iterationsValid(9) + '|' + timeoutValid(60001) + '|' + strategyValid([3, 6], 9, 60001, "com.samples.test.perftest", true) + '|' + resultSummary([1,5,10,100,1000]) + '|' + resultValid([1,5,10,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "44451|true|false|false|223.2|1000|1|5|true");
      expect(actual).assertEqual("44451|true|false|false|223.2|1000|1|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyResultMatrix_0450 end`);
    });
  });
}
