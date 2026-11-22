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
  calculateNum,
} from '../model/PerfTestLogic';

/** CalculateNumTest logic checks (32 cases). */
export default function calculateNumTest(): void {
  describe('CalculateNumTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0001
     * @tc.name      Perf_CalcNum_0001
     * @tc.desc      calculateNum(-5, 0) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcNum_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcNum_0001 begin`);
      logInfo("calculateNum(-5, 0)");
      const actual: number = calculateNum(-5, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-5");
      expect(actual).assertEqual(-5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0002
     * @tc.name      Perf_CalcNum_0002
     * @tc.desc      calculateNum(-4, 1) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0002 begin`);
      logInfo("calculateNum(-4, 1)");
      const actual: number = calculateNum(-4, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-3");
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}CalcNum_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0003
     * @tc.name      Perf_CalcNum_0003
     * @tc.desc      calculateNum(-3, -1) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0003 begin`);
      logInfo("calculateNum(-3, -1)");
      const actual: number = calculateNum(-3, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-4");
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}CalcNum_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0004
     * @tc.name      Perf_CalcNum_0004
     * @tc.desc      calculateNum(-2, 2) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0004 begin`);
      logInfo("calculateNum(-2, 2)");
      const actual: number = calculateNum(-2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0005
     * @tc.name      Perf_CalcNum_0005
     * @tc.desc      calculateNum(-1, 3) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0005 begin`);
      logInfo("calculateNum(-1, 3)");
      const actual: number = calculateNum(-1, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CalcNum_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0006
     * @tc.name      Perf_CalcNum_0006
     * @tc.desc      calculateNum(0, 4) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0006 begin`);
      logInfo("calculateNum(0, 4)");
      const actual: number = calculateNum(0, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}CalcNum_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0007
     * @tc.name      Perf_CalcNum_0007
     * @tc.desc      calculateNum(1, 5) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0007 begin`);
      logInfo("calculateNum(1, 5)");
      const actual: number = calculateNum(1, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0008
     * @tc.name      Perf_CalcNum_0008
     * @tc.desc      calculateNum(2, 6) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0008 begin`);
      logInfo("calculateNum(2, 6)");
      const actual: number = calculateNum(2, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}CalcNum_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0009
     * @tc.name      Perf_CalcNum_0009
     * @tc.desc      calculateNum(3, 7) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0009 begin`);
      logInfo("calculateNum(3, 7)");
      const actual: number = calculateNum(3, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}CalcNum_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0010
     * @tc.name      Perf_CalcNum_0010
     * @tc.desc      calculateNum(4, 8) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0010 begin`);
      logInfo("calculateNum(4, 8)");
      const actual: number = calculateNum(4, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0011
     * @tc.name      Perf_CalcNum_0011
     * @tc.desc      calculateNum(5, 9) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0011 begin`);
      logInfo("calculateNum(5, 9)");
      const actual: number = calculateNum(5, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}CalcNum_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0012
     * @tc.name      Perf_CalcNum_0012
     * @tc.desc      calculateNum(6, 10) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcNum_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcNum_0012 begin`);
      logInfo("calculateNum(6, 10)");
      const actual: number = calculateNum(6, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}CalcNum_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0013
     * @tc.name      Perf_CalcNum_0013
     * @tc.desc      calculateNum(7, 11) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0013 begin`);
      logInfo("calculateNum(7, 11)");
      const actual: number = calculateNum(7, 11);
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0014
     * @tc.name      Perf_CalcNum_0014
     * @tc.desc      calculateNum(8, 12) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0014 begin`);
      logInfo("calculateNum(8, 12)");
      const actual: number = calculateNum(8, 12);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CalcNum_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0015
     * @tc.name      Perf_CalcNum_0015
     * @tc.desc      calculateNum(9, 13) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0015 begin`);
      logInfo("calculateNum(9, 13)");
      const actual: number = calculateNum(9, 13);
      logInfo('actual=' + String(actual) + ', expected=' + "22");
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}CalcNum_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0016
     * @tc.name      Perf_CalcNum_0016
     * @tc.desc      calculateNum(10, 14) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0016 begin`);
      logInfo("calculateNum(10, 14)");
      const actual: number = calculateNum(10, 14);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0017
     * @tc.name      Perf_CalcNum_0017
     * @tc.desc      calculateNum(11, 15) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0017 begin`);
      logInfo("calculateNum(11, 15)");
      const actual: number = calculateNum(11, 15);
      logInfo('actual=' + String(actual) + ', expected=' + "26");
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}CalcNum_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0018
     * @tc.name      Perf_CalcNum_0018
     * @tc.desc      calculateNum(12, 16) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_CalcNum_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CalcNum_0018 begin`);
      logInfo("calculateNum(12, 16)");
      const actual: number = calculateNum(12, 16);
      logInfo('actual=' + String(actual) + ', expected=' + "28");
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}CalcNum_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0019
     * @tc.name      Perf_CalcNum_0019
     * @tc.desc      calculateNum(13, 20) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0019 begin`);
      logInfo("calculateNum(13, 20)");
      const actual: number = calculateNum(13, 20);
      logInfo('actual=' + String(actual) + ', expected=' + "33");
      expect(actual).assertEqual(33);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0020
     * @tc.name      Perf_CalcNum_0020
     * @tc.desc      calculateNum(14, 24) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0020 begin`);
      logInfo("calculateNum(14, 24)");
      const actual: number = calculateNum(14, 24);
      logInfo('actual=' + String(actual) + ', expected=' + "38");
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}CalcNum_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0021
     * @tc.name      Perf_CalcNum_0021
     * @tc.desc      calculateNum(15, 25) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0021 begin`);
      logInfo("calculateNum(15, 25)");
      const actual: number = calculateNum(15, 25);
      logInfo('actual=' + String(actual) + ', expected=' + "40");
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}CalcNum_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0022
     * @tc.name      Perf_CalcNum_0022
     * @tc.desc      calculateNum(16, 30) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0022 begin`);
      logInfo("calculateNum(16, 30)");
      const actual: number = calculateNum(16, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "46");
      expect(actual).assertEqual(46);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0023
     * @tc.name      Perf_CalcNum_0023
     * @tc.desc      calculateNum(17, 32) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_CalcNum_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalcNum_0023 begin`);
      logInfo("calculateNum(17, 32)");
      const actual: number = calculateNum(17, 32);
      logInfo('actual=' + String(actual) + ', expected=' + "49");
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}CalcNum_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0024
     * @tc.name      Perf_CalcNum_0024
     * @tc.desc      calculateNum(18, 40) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0024 begin`);
      logInfo("calculateNum(18, 40)");
      const actual: number = calculateNum(18, 40);
      logInfo('actual=' + String(actual) + ', expected=' + "58");
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}CalcNum_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0025
     * @tc.name      Perf_CalcNum_0025
     * @tc.desc      calculateNum(19, 45) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0025 begin`);
      logInfo("calculateNum(19, 45)");
      const actual: number = calculateNum(19, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "64");
      expect(actual).assertEqual(64);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}CalcNum_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0026
     * @tc.name      Perf_CalcNum_0026
     * @tc.desc      calculateNum(20, 50) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0026 begin`);
      logInfo("calculateNum(20, 50)");
      const actual: number = calculateNum(20, 50);
      logInfo('actual=' + String(actual) + ', expected=' + "70");
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}CalcNum_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CALC_NUM_0027
     * @tc.name      Perf_CalcNum_0027
     * @tc.desc      calculateNum(21, 60) increments the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_CalcNum_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalcNum_0027 begin`);
