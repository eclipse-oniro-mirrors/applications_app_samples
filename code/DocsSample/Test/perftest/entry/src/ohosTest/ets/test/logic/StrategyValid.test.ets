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
} from '../model/PerfTestLogic';

/** StrategyValidTest logic checks (32 cases). */
export default function strategyValidTest(): void {
  describe('StrategyValidTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0001
     * @tc.name      Perf_StrategyValid_0001
     * @tc.desc      strategyValid(1,1,999,,false) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyValid_0001 begin`);
      logInfo("strategyValid([0], 1, 999, \"\", false)");
      const actual: boolean = strategyValid([0], 1, 999, "", false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0002
     * @tc.name      Perf_StrategyValid_0002
     * @tc.desc      strategyValid(4,2,1000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0002 begin`);
      logInfo("strategyValid([2], 2, 1000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([2], 2, 1000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0003
     * @tc.name      Perf_StrategyValid_0003
     * @tc.desc      strategyValid(7,3,30000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0003 begin`);
      logInfo("strategyValid([0, 1, 2], 3, 30000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 2], 3, 30000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0004
     * @tc.name      Perf_StrategyValid_0004
     * @tc.desc      strategyValid(10,4,50000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0004 begin`);
      logInfo("strategyValid([1, 3], 4, 50000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 3], 4, 50000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0005
     * @tc.name      Perf_StrategyValid_0005
     * @tc.desc      strategyValid(13,5,60000,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0005 begin`);
      logInfo("strategyValid([0, 2, 3], 5, 60000, \"\", true)");
      const actual: boolean = strategyValid([0, 2, 3], 5, 60000, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0006
     * @tc.name      Perf_StrategyValid_0006
     * @tc.desc      strategyValid(16,1,60001,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0006 begin`);
      logInfo("strategyValid([4], 1, 60001, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([4], 1, 60001, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0007
     * @tc.name      Perf_StrategyValid_0007
     * @tc.desc      strategyValid(19,2,999,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0007 begin`);
      logInfo("strategyValid([0, 1, 4], 2, 999, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 4], 2, 999, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0008
     * @tc.name      Perf_StrategyValid_0008
     * @tc.desc      strategyValid(22,3,1000,com.samples.test.perftest,false) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0008 begin`);
      logInfo("strategyValid([1, 2, 4], 3, 1000, \"com.samples.test.perftest\", false)");
      const actual: boolean = strategyValid([1, 2, 4], 3, 1000, "com.samples.test.perftest", false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0009
     * @tc.name      Perf_StrategyValid_0009
     * @tc.desc      strategyValid(25,4,30000,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0009 begin`);
      logInfo("strategyValid([0, 3, 4], 4, 30000, \"\", true)");
      const actual: boolean = strategyValid([0, 3, 4], 4, 30000, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0010
     * @tc.name      Perf_StrategyValid_0010
     * @tc.desc      strategyValid(28,5,50000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0010 begin`);
      logInfo("strategyValid([2, 3, 4], 5, 50000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([2, 3, 4], 5, 50000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0011
     * @tc.name      Perf_StrategyValid_0011
     * @tc.desc      strategyValid(31,1,60000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0011 begin`);
      logInfo("strategyValid([0, 1, 2, 3, 4], 1, 60000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 2, 3, 4], 1, 60000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0012
     * @tc.name      Perf_StrategyValid_0012
     * @tc.desc      strategyValid(34,2,60001,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyValid_0012 begin`);
      logInfo("strategyValid([1, 5], 2, 60001, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 5], 2, 60001, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0013
     * @tc.name      Perf_StrategyValid_0013
     * @tc.desc      strategyValid(37,3,999,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0013 begin`);
      logInfo("strategyValid([0, 2, 5], 3, 999, \"\", true)");
      const actual: boolean = strategyValid([0, 2, 5], 3, 999, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0014
     * @tc.name      Perf_StrategyValid_0014
     * @tc.desc      strategyValid(40,4,1000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0014 begin`);
      logInfo("strategyValid([3, 5], 4, 1000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([3, 5], 4, 1000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0015
     * @tc.name      Perf_StrategyValid_0015
     * @tc.desc      strategyValid(43,5,30000,com.samples.test.perftest,false) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0015 begin`);
      logInfo("strategyValid([0, 1, 3, 5], 5, 30000, \"com.samples.test.perftest\", false)");
      const actual: boolean = strategyValid([0, 1, 3, 5], 5, 30000, "com.samples.test.perftest", false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0016
     * @tc.name      Perf_StrategyValid_0016
     * @tc.desc      strategyValid(46,1,50000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0016 begin`);
      logInfo("strategyValid([1, 2, 3, 5], 1, 50000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 2, 3, 5], 1, 50000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0017
     * @tc.name      Perf_StrategyValid_0017
     * @tc.desc      strategyValid(49,2,60000,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0017 begin`);
      logInfo("strategyValid([0, 4, 5], 2, 60000, \"\", true)");
      const actual: boolean = strategyValid([0, 4, 5], 2, 60000, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0018
     * @tc.name      Perf_StrategyValid_0018
     * @tc.desc      strategyValid(52,3,60001,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyValid_0018 begin`);
      logInfo("strategyValid([2, 4, 5], 3, 60001, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([2, 4, 5], 3, 60001, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0019
     * @tc.name      Perf_StrategyValid_0019
     * @tc.desc      strategyValid(55,4,999,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0019 begin`);
      logInfo("strategyValid([0, 1, 2, 4, 5], 4, 999, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 2, 4, 5], 4, 999, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0020
     * @tc.name      Perf_StrategyValid_0020
     * @tc.desc      strategyValid(58,5,1000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0020 begin`);
      logInfo("strategyValid([1, 3, 4, 5], 5, 1000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 3, 4, 5], 5, 1000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0021
     * @tc.name      Perf_StrategyValid_0021
     * @tc.desc      strategyValid(61,1,30000,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0021 begin`);
      logInfo("strategyValid([0, 2, 3, 4, 5], 1, 30000, \"\", true)");
      const actual: boolean = strategyValid([0, 2, 3, 4, 5], 1, 30000, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0022
     * @tc.name      Perf_StrategyValid_0022
     * @tc.desc      strategyValid(64,2,50000,com.samples.test.perftest,false) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0022 begin`);
      logInfo("strategyValid([6], 2, 50000, \"com.samples.test.perftest\", false)");
      const actual: boolean = strategyValid([6], 2, 50000, "com.samples.test.perftest", false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0023
     * @tc.name      Perf_StrategyValid_0023
     * @tc.desc      strategyValid(67,3,60000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyValid_0023 begin`);
      logInfo("strategyValid([0, 1, 6], 3, 60000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 6], 3, 60000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0024
     * @tc.name      Perf_StrategyValid_0024
     * @tc.desc      strategyValid(70,4,60001,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0024 begin`);
      logInfo("strategyValid([1, 2, 6], 4, 60001, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 2, 6], 4, 60001, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0025
     * @tc.name      Perf_StrategyValid_0025
     * @tc.desc      strategyValid(73,5,999,,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0025 begin`);
      logInfo("strategyValid([0, 3, 6], 5, 999, \"\", true)");
      const actual: boolean = strategyValid([0, 3, 6], 5, 999, "", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0026
     * @tc.name      Perf_StrategyValid_0026
     * @tc.desc      strategyValid(76,1,1000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0026 begin`);
      logInfo("strategyValid([2, 3, 6], 1, 1000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([2, 3, 6], 1, 1000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0027
     * @tc.name      Perf_StrategyValid_0027
     * @tc.desc      strategyValid(79,2,30000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0027 begin`);
      logInfo("strategyValid([0, 1, 2, 3, 6], 2, 30000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 2, 3, 6], 2, 30000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0028
     * @tc.name      Perf_StrategyValid_0028
     * @tc.desc      strategyValid(82,3,50000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0028 begin`);
      logInfo("strategyValid([1, 4, 6], 3, 50000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 4, 6], 3, 50000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0029
     * @tc.name      Perf_StrategyValid_0029
     * @tc.desc      strategyValid(85,4,60000,,false) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0029 begin`);
      logInfo("strategyValid([0, 2, 4, 6], 4, 60000, \"\", false)");
      const actual: boolean = strategyValid([0, 2, 4, 6], 4, 60000, "", false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0030
     * @tc.name      Perf_StrategyValid_0030
     * @tc.desc      strategyValid(88,5,60001,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0030 begin`);
      logInfo("strategyValid([3, 4, 6], 5, 60001, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([3, 4, 6], 5, 60001, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}StrategyValid_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0031
     * @tc.name      Perf_StrategyValid_0031
     * @tc.desc      strategyValid(91,1,999,com.samples.test.perftest,true) is false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0031 begin`);
      logInfo("strategyValid([0, 1, 3, 4, 6], 1, 999, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([0, 1, 3, 4, 6], 1, 999, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}StrategyValid_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_VALID_0032
     * @tc.name      Perf_StrategyValid_0032
     * @tc.desc      strategyValid(94,2,1000,com.samples.test.perftest,true) is true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyValid_0032 begin`);
      logInfo("strategyValid([1, 2, 3, 4, 6], 2, 1000, \"com.samples.test.perftest\", true)");
      const actual: boolean = strategyValid([1, 2, 3, 4, 6], 2, 1000, "com.samples.test.perftest", true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}StrategyValid_0032 end`);
    });
  });
}
