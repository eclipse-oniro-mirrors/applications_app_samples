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
  scenarioMetrics,
  scenarioName,
} from '../model/PerfTestLogic';

/** ScenarioMetricsTest logic checks (32 cases). */
export default function scenarioMetricsTest(): void {
  describe('ScenarioMetricsTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0001
     * @tc.name      Perf_ScenarioMetrics_0001
     * @tc.desc      scenario 0 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ScenarioMetrics_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0001 begin`);
      logInfo("scenarioMetrics(0) + ':' + scenarioName(0)");
      const actual: string = scenarioMetrics(0) + ':' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS:calculate");
      expect(actual).assertEqual("DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS:calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0002
     * @tc.name      Perf_ScenarioMetrics_0002
     * @tc.desc      scenario 1 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0002 begin`);
      logInfo("scenarioMetrics(1) + ':' + scenarioName(1)");
      const actual: string = scenarioMetrics(1) + ':' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME:pageSwitch");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME:pageSwitch");
      logInfo(`${BUNDLE}ScenarioMetrics_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0003
     * @tc.name      Perf_ScenarioMetrics_0003
     * @tc.desc      scenario 2 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0003 begin`);
      logInfo("scenarioMetrics(2) + ':' + scenarioName(2)");
      const actual: string = scenarioMetrics(2) + ':' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS:listSwipe");
      expect(actual).assertEqual("LIST_SWIPE_FPS:listSwipe");
      logInfo(`${BUNDLE}ScenarioMetrics_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0004
     * @tc.name      Perf_ScenarioMetrics_0004
     * @tc.desc      scenario 3 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0004 begin`);
      logInfo("scenarioMetrics(3) + ':' + scenarioName(3)");
      const actual: string = scenarioMetrics(3) + ':' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,MEMORY_RSS,MEMORY_PSS:keep");
      expect(actual).assertEqual("DURATION,MEMORY_RSS,MEMORY_PSS:keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0005
     * @tc.name      Perf_ScenarioMetrics_0005
     * @tc.desc      scenario 4 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0005 begin`);
      logInfo("scenarioMetrics(4) + ':' + scenarioName(4)");
      const actual: string = scenarioMetrics(4) + ':' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME:navigation");
      expect(actual).assertEqual("DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME:navigation");
      logInfo(`${BUNDLE}ScenarioMetrics_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0006
     * @tc.name      Perf_ScenarioMetrics_0006
     * @tc.desc      scenario 5 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0006 begin`);
      logInfo("scenarioMetrics(5) + ':' + scenarioName(5)");
      const actual: string = scenarioMetrics(5) + ':' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:appStart");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:appStart");
      logInfo(`${BUNDLE}ScenarioMetrics_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0007
     * @tc.name      Perf_ScenarioMetrics_0007
     * @tc.desc      scenario 6 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0007 begin`);
      logInfo("scenarioMetrics(6) + ':' + scenarioName(6)");
      const actual: string = scenarioMetrics(6) + ':' + scenarioName(6);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0008
     * @tc.name      Perf_ScenarioMetrics_0008
     * @tc.desc      scenario 7 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0008 begin`);
      logInfo("scenarioMetrics(7) + ':' + scenarioName(7)");
      const actual: string = scenarioMetrics(7) + ':' + scenarioName(7);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0009
     * @tc.name      Perf_ScenarioMetrics_0009
     * @tc.desc      scenario 8 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0009 begin`);
      logInfo("scenarioMetrics(8) + ':' + scenarioName(8)");
      const actual: string = scenarioMetrics(8) + ':' + scenarioName(8);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0010
     * @tc.name      Perf_ScenarioMetrics_0010
     * @tc.desc      scenario 9 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0010 begin`);
      logInfo("scenarioMetrics(9) + ':' + scenarioName(9)");
      const actual: string = scenarioMetrics(9) + ':' + scenarioName(9);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0011
     * @tc.name      Perf_ScenarioMetrics_0011
     * @tc.desc      scenario 10 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0011 begin`);
      logInfo("scenarioMetrics(10) + ':' + scenarioName(10)");
      const actual: string = scenarioMetrics(10) + ':' + scenarioName(10);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0012
     * @tc.name      Perf_ScenarioMetrics_0012
     * @tc.desc      scenario 11 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ScenarioMetrics_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0012 begin`);
      logInfo("scenarioMetrics(11) + ':' + scenarioName(11)");
      const actual: string = scenarioMetrics(11) + ':' + scenarioName(11);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0013
     * @tc.name      Perf_ScenarioMetrics_0013
     * @tc.desc      scenario 12 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0013 begin`);
      logInfo("scenarioMetrics(12) + ':' + scenarioName(12)");
      const actual: string = scenarioMetrics(12) + ':' + scenarioName(12);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0014
     * @tc.name      Perf_ScenarioMetrics_0014
     * @tc.desc      scenario 13 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0014 begin`);
      logInfo("scenarioMetrics(13) + ':' + scenarioName(13)");
      const actual: string = scenarioMetrics(13) + ':' + scenarioName(13);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0015
     * @tc.name      Perf_ScenarioMetrics_0015
     * @tc.desc      scenario 14 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0015 begin`);
      logInfo("scenarioMetrics(14) + ':' + scenarioName(14)");
      const actual: string = scenarioMetrics(14) + ':' + scenarioName(14);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0016
     * @tc.name      Perf_ScenarioMetrics_0016
     * @tc.desc      scenario 15 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0016 begin`);
      logInfo("scenarioMetrics(15) + ':' + scenarioName(15)");
      const actual: string = scenarioMetrics(15) + ':' + scenarioName(15);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0017
     * @tc.name      Perf_ScenarioMetrics_0017
     * @tc.desc      scenario 16 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0017 begin`);
      logInfo("scenarioMetrics(16) + ':' + scenarioName(16)");
      const actual: string = scenarioMetrics(16) + ':' + scenarioName(16);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0018
     * @tc.name      Perf_ScenarioMetrics_0018
     * @tc.desc      scenario -1 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_ScenarioMetrics_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0018 begin`);
      logInfo("scenarioMetrics(-1) + ':' + scenarioName(-1)");
      const actual: string = scenarioMetrics(-1) + ':' + scenarioName(-1);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0019
     * @tc.name      Perf_ScenarioMetrics_0019
     * @tc.desc      scenario 20 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0019 begin`);
      logInfo("scenarioMetrics(20) + ':' + scenarioName(20)");
      const actual: string = scenarioMetrics(20) + ':' + scenarioName(20);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0020
     * @tc.name      Perf_ScenarioMetrics_0020
     * @tc.desc      scenario 30 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0020 begin`);
      logInfo("scenarioMetrics(30) + ':' + scenarioName(30)");
      const actual: string = scenarioMetrics(30) + ':' + scenarioName(30);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0021
     * @tc.name      Perf_ScenarioMetrics_0021
     * @tc.desc      scenario 40 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0021 begin`);
      logInfo("scenarioMetrics(40) + ':' + scenarioName(40)");
      const actual: string = scenarioMetrics(40) + ':' + scenarioName(40);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0022
     * @tc.name      Perf_ScenarioMetrics_0022
     * @tc.desc      scenario 50 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0022 begin`);
      logInfo("scenarioMetrics(50) + ':' + scenarioName(50)");
      const actual: string = scenarioMetrics(50) + ':' + scenarioName(50);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0023
     * @tc.name      Perf_ScenarioMetrics_0023
     * @tc.desc      scenario 60 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_ScenarioMetrics_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0023 begin`);
      logInfo("scenarioMetrics(60) + ':' + scenarioName(60)");
      const actual: string = scenarioMetrics(60) + ':' + scenarioName(60);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0024
     * @tc.name      Perf_ScenarioMetrics_0024
     * @tc.desc      scenario 70 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0024 begin`);
      logInfo("scenarioMetrics(70) + ':' + scenarioName(70)");
      const actual: string = scenarioMetrics(70) + ':' + scenarioName(70);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0025
     * @tc.name      Perf_ScenarioMetrics_0025
     * @tc.desc      scenario 80 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0025 begin`);
      logInfo("scenarioMetrics(80) + ':' + scenarioName(80)");
      const actual: string = scenarioMetrics(80) + ':' + scenarioName(80);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0026
     * @tc.name      Perf_ScenarioMetrics_0026
     * @tc.desc      scenario 90 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0026 begin`);
      logInfo("scenarioMetrics(90) + ':' + scenarioName(90)");
      const actual: string = scenarioMetrics(90) + ':' + scenarioName(90);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0027
     * @tc.name      Perf_ScenarioMetrics_0027
     * @tc.desc      scenario 100 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0027 begin`);
      logInfo("scenarioMetrics(100) + ':' + scenarioName(100)");
      const actual: string = scenarioMetrics(100) + ':' + scenarioName(100);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0028
     * @tc.name      Perf_ScenarioMetrics_0028
     * @tc.desc      scenario 200 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0028 begin`);
      logInfo("scenarioMetrics(200) + ':' + scenarioName(200)");
      const actual: string = scenarioMetrics(200) + ':' + scenarioName(200);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0029
     * @tc.name      Perf_ScenarioMetrics_0029
     * @tc.desc      scenario 255 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0029 begin`);
      logInfo("scenarioMetrics(255) + ':' + scenarioName(255)");
      const actual: string = scenarioMetrics(255) + ':' + scenarioName(255);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0030
     * @tc.name      Perf_ScenarioMetrics_0030
     * @tc.desc      scenario 360 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0030 begin`);
      logInfo("scenarioMetrics(360) + ':' + scenarioName(360)");
      const actual: string = scenarioMetrics(360) + ':' + scenarioName(360);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0031
     * @tc.name      Perf_ScenarioMetrics_0031
     * @tc.desc      scenario 720 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0031 begin`);
      logInfo("scenarioMetrics(720) + ':' + scenarioName(720)");
      const actual: string = scenarioMetrics(720) + ':' + scenarioName(720);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ScenarioMetrics_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SCENARIO_METRICS_0032
     * @tc.name      Perf_ScenarioMetrics_0032
     * @tc.desc      scenario 1080 metric set/name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_ScenarioMetrics_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScenarioMetrics_0032 begin`);
      logInfo("scenarioMetrics(1080) + ':' + scenarioName(1080)");
      const actual: string = scenarioMetrics(1080) + ':' + scenarioName(1080);
      logInfo('actual=' + String(actual) + ', expected=' + ":");
      expect(actual).assertEqual(":");
      logInfo(`${BUNDLE}ScenarioMetrics_0032 end`);
    });
  });
}
