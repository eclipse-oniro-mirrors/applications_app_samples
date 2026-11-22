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
