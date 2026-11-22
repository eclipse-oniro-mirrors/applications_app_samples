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
