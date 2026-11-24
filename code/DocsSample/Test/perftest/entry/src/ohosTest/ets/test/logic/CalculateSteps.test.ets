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
  calculateSteps,
} from '../model/PerfTestLogic';

/** CalculateStepsTest logic checks (32 cases). */
export default function calculateStepsTest(): void {
  describe('CalculateStepsTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0001
     * @tc.name      Perf_CalcSteps_0001
     * @tc.desc      calculateSteps(0, 0) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcSteps_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcSteps_0001 begin`);
      logInfo("calculateSteps(0, 0)");
      const actual: number = calculateSteps(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0002
     * @tc.name      Perf_CalcSteps_0002
     * @tc.desc      calculateSteps(1, 3) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0002 begin`);
      logInfo("calculateSteps(1, 3)");
      const actual: number = calculateSteps(1, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CalcSteps_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0003
     * @tc.name      Perf_CalcSteps_0003
     * @tc.desc      calculateSteps(2, 6) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0003 begin`);
      logInfo("calculateSteps(2, 6)");
      const actual: number = calculateSteps(2, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}CalcSteps_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0004
     * @tc.name      Perf_CalcSteps_0004
     * @tc.desc      calculateSteps(3, 9) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0004 begin`);
      logInfo("calculateSteps(3, 9)");
      const actual: number = calculateSteps(3, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0005
     * @tc.name      Perf_CalcSteps_0005
     * @tc.desc      calculateSteps(4, 1) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0005 begin`);
      logInfo("calculateSteps(4, 1)");
      const actual: number = calculateSteps(4, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}CalcSteps_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0006
     * @tc.name      Perf_CalcSteps_0006
     * @tc.desc      calculateSteps(5, 4) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0006 begin`);
      logInfo("calculateSteps(5, 4)");
      const actual: number = calculateSteps(5, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CalcSteps_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0007
     * @tc.name      Perf_CalcSteps_0007
     * @tc.desc      calculateSteps(6, 7) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0007 begin`);
      logInfo("calculateSteps(6, 7)");
      const actual: number = calculateSteps(6, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "42");
      expect(actual).assertEqual(42);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0008
     * @tc.name      Perf_CalcSteps_0008
     * @tc.desc      calculateSteps(7, 10) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0008 begin`);
      logInfo("calculateSteps(7, 10)");
      const actual: number = calculateSteps(7, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "70");
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}CalcSteps_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0009
     * @tc.name      Perf_CalcSteps_0009
     * @tc.desc      calculateSteps(8, 2) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0009 begin`);
      logInfo("calculateSteps(8, 2)");
      const actual: number = calculateSteps(8, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}CalcSteps_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0010
     * @tc.name      Perf_CalcSteps_0010
     * @tc.desc      calculateSteps(0, 5) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0010 begin`);
      logInfo("calculateSteps(0, 5)");
      const actual: number = calculateSteps(0, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0011
     * @tc.name      Perf_CalcSteps_0011
     * @tc.desc      calculateSteps(1, 8) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0011 begin`);
      logInfo("calculateSteps(1, 8)");
      const actual: number = calculateSteps(1, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}CalcSteps_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0012
     * @tc.name      Perf_CalcSteps_0012
     * @tc.desc      calculateSteps(2, 0) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcSteps_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcSteps_0012 begin`);
      logInfo("calculateSteps(2, 0)");
      const actual: number = calculateSteps(2, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CalcSteps_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0013
     * @tc.name      Perf_CalcSteps_0013
     * @tc.desc      calculateSteps(3, 3) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0013 begin`);
      logInfo("calculateSteps(3, 3)");
      const actual: number = calculateSteps(3, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0014
     * @tc.name      Perf_CalcSteps_0014
     * @tc.desc      calculateSteps(4, 6) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0014 begin`);
      logInfo("calculateSteps(4, 6)");
      const actual: number = calculateSteps(4, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}CalcSteps_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0015
     * @tc.name      Perf_CalcSteps_0015
     * @tc.desc      calculateSteps(5, 9) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0015 begin`);
      logInfo("calculateSteps(5, 9)");
      const actual: number = calculateSteps(5, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}CalcSteps_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0016
     * @tc.name      Perf_CalcSteps_0016
     * @tc.desc      calculateSteps(6, 1) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0016 begin`);
      logInfo("calculateSteps(6, 1)");
      const actual: number = calculateSteps(6, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0017
     * @tc.name      Perf_CalcSteps_0017
     * @tc.desc      calculateSteps(7, 4) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0017 begin`);
      logInfo("calculateSteps(7, 4)");
      const actual: number = calculateSteps(7, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "28");
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}CalcSteps_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0018
     * @tc.name      Perf_CalcSteps_0018
     * @tc.desc      calculateSteps(8, 7) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_CalcSteps_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CalcSteps_0018 begin`);
      logInfo("calculateSteps(8, 7)");
      const actual: number = calculateSteps(8, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}CalcSteps_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0019
     * @tc.name      Perf_CalcSteps_0019
     * @tc.desc      calculateSteps(0, 10) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0019 begin`);
      logInfo("calculateSteps(0, 10)");
      const actual: number = calculateSteps(0, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0020
     * @tc.name      Perf_CalcSteps_0020
     * @tc.desc      calculateSteps(1, 2) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0020 begin`);
      logInfo("calculateSteps(1, 2)");
      const actual: number = calculateSteps(1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CalcSteps_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0021
     * @tc.name      Perf_CalcSteps_0021
     * @tc.desc      calculateSteps(2, 5) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0021 begin`);
      logInfo("calculateSteps(2, 5)");
      const actual: number = calculateSteps(2, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}CalcSteps_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0022
     * @tc.name      Perf_CalcSteps_0022
     * @tc.desc      calculateSteps(3, 8) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0022 begin`);
      logInfo("calculateSteps(3, 8)");
      const actual: number = calculateSteps(3, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0023
     * @tc.name      Perf_CalcSteps_0023
     * @tc.desc      calculateSteps(4, 0) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcSteps_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcSteps_0023 begin`);
      logInfo("calculateSteps(4, 0)");
      const actual: number = calculateSteps(4, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CalcSteps_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0024
     * @tc.name      Perf_CalcSteps_0024
     * @tc.desc      calculateSteps(5, 3) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0024 begin`);
      logInfo("calculateSteps(5, 3)");
      const actual: number = calculateSteps(5, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}CalcSteps_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0025
     * @tc.name      Perf_CalcSteps_0025
     * @tc.desc      calculateSteps(6, 6) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0025 begin`);
      logInfo("calculateSteps(6, 6)");
      const actual: number = calculateSteps(6, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "36");
      expect(actual).assertEqual(36);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0026
     * @tc.name      Perf_CalcSteps_0026
     * @tc.desc      calculateSteps(7, 9) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0026 begin`);
      logInfo("calculateSteps(7, 9)");
      const actual: number = calculateSteps(7, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "63");
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}CalcSteps_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0027
     * @tc.name      Perf_CalcSteps_0027
     * @tc.desc      calculateSteps(8, 1) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0027 begin`);
      logInfo("calculateSteps(8, 1)");
      const actual: number = calculateSteps(8, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}CalcSteps_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0028
     * @tc.name      Perf_CalcSteps_0028
     * @tc.desc      calculateSteps(0, 4) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0028 begin`);
      logInfo("calculateSteps(0, 4)");
      const actual: number = calculateSteps(0, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0029
     * @tc.name      Perf_CalcSteps_0029
     * @tc.desc      calculateSteps(1, 7) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0029 begin`);
      logInfo("calculateSteps(1, 7)");
      const actual: number = calculateSteps(1, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}CalcSteps_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0030
     * @tc.name      Perf_CalcSteps_0030
     * @tc.desc      calculateSteps(2, 10) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0030 begin`);
      logInfo("calculateSteps(2, 10)");
      const actual: number = calculateSteps(2, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CalcSteps_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0031
     * @tc.name      Perf_CalcSteps_0031
     * @tc.desc      calculateSteps(3, 2) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0031 begin`);
      logInfo("calculateSteps(3, 2)");
      const actual: number = calculateSteps(3, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcSteps_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_STEPS_0032
     * @tc.name      Perf_CalcSteps_0032
     * @tc.desc      calculateSteps(4, 5) totals the loop steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcSteps_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcSteps_0032 begin`);
      logInfo("calculateSteps(4, 5)");
      const actual: number = calculateSteps(4, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CalcSteps_0032 end`);
    });
  });
}
