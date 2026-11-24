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
  clampMetricValue,
} from '../model/PerfTestLogic';

/** ClampMetricValueTest logic checks (32 cases). */
export default function clampMetricValueTest(): void {
  describe('ClampMetricValueTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0001
     * @tc.name      Perf_ClampMetric_0001
     * @tc.desc      clampMetricValue(3) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ClampMetric_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampMetric_0001 begin`);
      logInfo("clampMetricValue(3)");
      const actual: number = clampMetricValue(3);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0002
     * @tc.name      Perf_ClampMetric_0002
     * @tc.desc      clampMetricValue(4) is 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0002 begin`);
      logInfo("clampMetricValue(4)");
      const actual: number = clampMetricValue(4);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ClampMetric_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0003
     * @tc.name      Perf_ClampMetric_0003
     * @tc.desc      clampMetricValue(5) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0003 begin`);
      logInfo("clampMetricValue(5)");
      const actual: number = clampMetricValue(5);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ClampMetric_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0004
     * @tc.name      Perf_ClampMetric_0004
     * @tc.desc      clampMetricValue(6) is 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0004 begin`);
      logInfo("clampMetricValue(6)");
      const actual: number = clampMetricValue(6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0005
     * @tc.name      Perf_ClampMetric_0005
     * @tc.desc      clampMetricValue(7) is 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0005 begin`);
      logInfo("clampMetricValue(7)");
      const actual: number = clampMetricValue(7);
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}ClampMetric_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0006
     * @tc.name      Perf_ClampMetric_0006
     * @tc.desc      clampMetricValue(8) is 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0006 begin`);
      logInfo("clampMetricValue(8)");
      const actual: number = clampMetricValue(8);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ClampMetric_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0007
     * @tc.name      Perf_ClampMetric_0007
     * @tc.desc      clampMetricValue(9) is 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0007 begin`);
      logInfo("clampMetricValue(9)");
      const actual: number = clampMetricValue(9);
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0008
     * @tc.name      Perf_ClampMetric_0008
     * @tc.desc      clampMetricValue(10) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0008 begin`);
      logInfo("clampMetricValue(10)");
      const actual: number = clampMetricValue(10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ClampMetric_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0009
     * @tc.name      Perf_ClampMetric_0009
     * @tc.desc      clampMetricValue(11) is 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0009 begin`);
      logInfo("clampMetricValue(11)");
      const actual: number = clampMetricValue(11);
      logInfo('actual=' + String(actual) + ', expected=' + "11");
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ClampMetric_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0010
     * @tc.name      Perf_ClampMetric_0010
     * @tc.desc      clampMetricValue(12) is 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0010 begin`);
      logInfo("clampMetricValue(12)");
      const actual: number = clampMetricValue(12);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0011
     * @tc.name      Perf_ClampMetric_0011
     * @tc.desc      clampMetricValue(13) is 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0011 begin`);
      logInfo("clampMetricValue(13)");
      const actual: number = clampMetricValue(13);
      logInfo('actual=' + String(actual) + ', expected=' + "13");
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}ClampMetric_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0012
     * @tc.name      Perf_ClampMetric_0012
     * @tc.desc      clampMetricValue(14) is 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ClampMetric_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampMetric_0012 begin`);
      logInfo("clampMetricValue(14)");
      const actual: number = clampMetricValue(14);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}ClampMetric_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0013
     * @tc.name      Perf_ClampMetric_0013
     * @tc.desc      clampMetricValue(15) is 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0013 begin`);
      logInfo("clampMetricValue(15)");
      const actual: number = clampMetricValue(15);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0014
     * @tc.name      Perf_ClampMetric_0014
     * @tc.desc      clampMetricValue(16) is 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0014 begin`);
      logInfo("clampMetricValue(16)");
      const actual: number = clampMetricValue(16);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ClampMetric_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0015
     * @tc.name      Perf_ClampMetric_0015
     * @tc.desc      clampMetricValue(20) is 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0015 begin`);
      logInfo("clampMetricValue(20)");
      const actual: number = clampMetricValue(20);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ClampMetric_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0016
     * @tc.name      Perf_ClampMetric_0016
     * @tc.desc      clampMetricValue(24) is 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0016 begin`);
      logInfo("clampMetricValue(24)");
      const actual: number = clampMetricValue(24);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0017
     * @tc.name      Perf_ClampMetric_0017
     * @tc.desc      clampMetricValue(25) is 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0017 begin`);
      logInfo("clampMetricValue(25)");
      const actual: number = clampMetricValue(25);
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ClampMetric_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0018
     * @tc.name      Perf_ClampMetric_0018
     * @tc.desc      clampMetricValue(30) is 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_ClampMetric_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampMetric_0018 begin`);
      logInfo("clampMetricValue(30)");
      const actual: number = clampMetricValue(30);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}ClampMetric_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0019
     * @tc.name      Perf_ClampMetric_0019
     * @tc.desc      clampMetricValue(32) is 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0019 begin`);
      logInfo("clampMetricValue(32)");
      const actual: number = clampMetricValue(32);
      logInfo('actual=' + String(actual) + ', expected=' + "32");
      expect(actual).assertEqual(32);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0020
     * @tc.name      Perf_ClampMetric_0020
     * @tc.desc      clampMetricValue(40) is 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0020 begin`);
      logInfo("clampMetricValue(40)");
      const actual: number = clampMetricValue(40);
      logInfo('actual=' + String(actual) + ', expected=' + "40");
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}ClampMetric_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0021
     * @tc.name      Perf_ClampMetric_0021
     * @tc.desc      clampMetricValue(45) is 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0021 begin`);
      logInfo("clampMetricValue(45)");
      const actual: number = clampMetricValue(45);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}ClampMetric_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0022
     * @tc.name      Perf_ClampMetric_0022
     * @tc.desc      clampMetricValue(50) is 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0022 begin`);
      logInfo("clampMetricValue(50)");
      const actual: number = clampMetricValue(50);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0023
     * @tc.name      Perf_ClampMetric_0023
     * @tc.desc      clampMetricValue(60) is 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ClampMetric_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampMetric_0023 begin`);
      logInfo("clampMetricValue(60)");
      const actual: number = clampMetricValue(60);
      logInfo('actual=' + String(actual) + ', expected=' + "60");
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}ClampMetric_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0024
     * @tc.name      Perf_ClampMetric_0024
     * @tc.desc      clampMetricValue(64) is 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0024 begin`);
      logInfo("clampMetricValue(64)");
      const actual: number = clampMetricValue(64);
      logInfo('actual=' + String(actual) + ', expected=' + "64");
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}ClampMetric_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0025
     * @tc.name      Perf_ClampMetric_0025
     * @tc.desc      clampMetricValue(70) is 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0025 begin`);
      logInfo("clampMetricValue(70)");
      const actual: number = clampMetricValue(70);
      logInfo('actual=' + String(actual) + ', expected=' + "70");
      expect(actual).assertEqual(70);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0026
     * @tc.name      Perf_ClampMetric_0026
     * @tc.desc      clampMetricValue(80) is 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0026 begin`);
      logInfo("clampMetricValue(80)");
      const actual: number = clampMetricValue(80);
      logInfo('actual=' + String(actual) + ', expected=' + "80");
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ClampMetric_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0027
     * @tc.name      Perf_ClampMetric_0027
     * @tc.desc      clampMetricValue(90) is 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0027 begin`);
      logInfo("clampMetricValue(90)");
      const actual: number = clampMetricValue(90);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ClampMetric_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0028
     * @tc.name      Perf_ClampMetric_0028
     * @tc.desc      clampMetricValue(99) is 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0028 begin`);
      logInfo("clampMetricValue(99)");
      const actual: number = clampMetricValue(99);
      logInfo('actual=' + String(actual) + ', expected=' + "99");
      expect(actual).assertEqual(99);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0029
     * @tc.name      Perf_ClampMetric_0029
     * @tc.desc      clampMetricValue(100) is 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0029 begin`);
      logInfo("clampMetricValue(100)");
      const actual: number = clampMetricValue(100);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampMetric_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0030
     * @tc.name      Perf_ClampMetric_0030
     * @tc.desc      clampMetricValue(120) is 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0030 begin`);
      logInfo("clampMetricValue(120)");
      const actual: number = clampMetricValue(120);
      logInfo('actual=' + String(actual) + ', expected=' + "120");
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ClampMetric_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0031
     * @tc.name      Perf_ClampMetric_0031
     * @tc.desc      clampMetricValue(150) is 150.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0031 begin`);
      logInfo("clampMetricValue(150)");
      const actual: number = clampMetricValue(150);
      logInfo('actual=' + String(actual) + ', expected=' + "150");
      expect(actual).assertEqual(150);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ClampMetric_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CLAMP_METRIC_0032
     * @tc.name      Perf_ClampMetric_0032
     * @tc.desc      clampMetricValue(200) is 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ClampMetric_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampMetric_0032 begin`);
      logInfo("clampMetricValue(200)");
      const actual: number = clampMetricValue(200);
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ClampMetric_0032 end`);
    });
  });
}
