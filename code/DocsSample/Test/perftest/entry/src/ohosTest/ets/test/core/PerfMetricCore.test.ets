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
  metricName,
  metricId,
  METRIC_COUNT,
  scenarioMetrics,
  scenarioName,
} from '../model/PerfTestLogic';

/** PerfMetricCoreTest logic checks (32 cases). */
export default function perfMetricCoreTest(): void {
  describe('PerfMetricCoreTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0001
     * @tc.name      Perf_MetricCore_0001
     * @tc.desc      metric 0 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricCore_0001 begin`);
      logInfo("metric core 0");
      const actual: string = metricName(0) + '|' + metricId(metricName(0)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION|0|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("DURATION|0|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0002
     * @tc.name      Perf_MetricCore_0002
     * @tc.desc      metric 1 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0002 begin`);
      logInfo("metric core 1");
      const actual: string = metricName(1) + '|' + metricId(metricName(1)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_LOAD|1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("CPU_LOAD|1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0003
     * @tc.name      Perf_MetricCore_0003
     * @tc.desc      metric 2 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0003 begin`);
      logInfo("metric core 2");
      const actual: string = metricName(2) + '|' + metricId(metricName(2)) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_USAGE|2|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("CPU_USAGE|2|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0004
     * @tc.name      Perf_MetricCore_0004
     * @tc.desc      metric 3 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0004 begin`);
      logInfo("metric core 3");
      const actual: string = metricName(3) + '|' + metricId(metricName(3)) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_RSS|3|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("MEMORY_RSS|3|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0005
     * @tc.name      Perf_MetricCore_0005
     * @tc.desc      metric 4 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0005 begin`);
      logInfo("metric core 4");
      const actual: string = metricName(4) + '|' + metricId(metricName(4)) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_PSS|4|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("MEMORY_PSS|4|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0006
     * @tc.name      Perf_MetricCore_0006
     * @tc.desc      metric 5 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0006 begin`);
      logInfo("metric core 5");
      const actual: string = metricName(5) + '|' + metricId(metricName(5)) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME|5|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME|5|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0007
     * @tc.name      Perf_MetricCore_0007
     * @tc.desc      metric 6 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0007 begin`);
      logInfo("metric core 6");
      const actual: string = metricName(6) + '|' + metricId(metricName(6)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS|6|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("LIST_SWIPE_FPS|6|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0008
     * @tc.name      Perf_MetricCore_0008
     * @tc.desc      metric 7 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0008 begin`);
      logInfo("metric core 7");
      const actual: string = metricName(7) + '|' + metricId(metricName(7)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_RESPONSE_TIME|7|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("APP_START_RESPONSE_TIME|7|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0009
     * @tc.name      Perf_MetricCore_0009
     * @tc.desc      metric 8 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0009 begin`);
      logInfo("metric core 8");
      const actual: string = metricName(8) + '|' + metricId(metricName(8)) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_COMPLETE_TIME|8|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("APP_START_COMPLETE_TIME|8|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0010
     * @tc.name      Perf_MetricCore_0010
     * @tc.desc      metric 9 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0010 begin`);
      logInfo("metric core 9");
      const actual: string = metricName(9) + '|' + metricId(metricName(9)) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0011
     * @tc.name      Perf_MetricCore_0011
     * @tc.desc      metric 10 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0011 begin`);
      logInfo("metric core 10");
      const actual: string = metricName(10) + '|' + metricId(metricName(10)) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0012
     * @tc.name      Perf_MetricCore_0012
     * @tc.desc      metric 11 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricCore_0012 begin`);
      logInfo("metric core 11");
      const actual: string = metricName(11) + '|' + metricId(metricName(11)) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0013
     * @tc.name      Perf_MetricCore_0013
     * @tc.desc      metric 12 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0013 begin`);
      logInfo("metric core 12");
      const actual: string = metricName(12) + '|' + metricId(metricName(12)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0014
     * @tc.name      Perf_MetricCore_0014
     * @tc.desc      metric 13 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0014 begin`);
      logInfo("metric core 13");
      const actual: string = metricName(13) + '|' + metricId(metricName(13)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0015
     * @tc.name      Perf_MetricCore_0015
     * @tc.desc      metric 14 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0015 begin`);
      logInfo("metric core 14");
      const actual: string = metricName(14) + '|' + metricId(metricName(14)) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("|-1|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0016
     * @tc.name      Perf_MetricCore_0016
     * @tc.desc      metric 15 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0016 begin`);
      logInfo("metric core 15");
      const actual: string = metricName(15) + '|' + metricId(metricName(15)) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0017
     * @tc.name      Perf_MetricCore_0017
     * @tc.desc      metric 16 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0017 begin`);
      logInfo("metric core 16");
      const actual: string = metricName(16) + '|' + metricId(metricName(16)) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0018
     * @tc.name      Perf_MetricCore_0018
     * @tc.desc      metric 17 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_MetricCore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MetricCore_0018 begin`);
      logInfo("metric core 17");
      const actual: string = metricName(17) + '|' + metricId(metricName(17)) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0019
     * @tc.name      Perf_MetricCore_0019
     * @tc.desc      metric 18 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0019 begin`);
      logInfo("metric core 18");
      const actual: string = metricName(18) + '|' + metricId(metricName(18)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0020
     * @tc.name      Perf_MetricCore_0020
     * @tc.desc      metric 19 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0020 begin`);
      logInfo("metric core 19");
      const actual: string = metricName(19) + '|' + metricId(metricName(19)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0021
     * @tc.name      Perf_MetricCore_0021
     * @tc.desc      metric 20 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0021 begin`);
      logInfo("metric core 20");
      const actual: string = metricName(20) + '|' + metricId(metricName(20)) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("|-1|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0022
     * @tc.name      Perf_MetricCore_0022
     * @tc.desc      metric 21 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0022 begin`);
      logInfo("metric core 21");
      const actual: string = metricName(21) + '|' + metricId(metricName(21)) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0023
     * @tc.name      Perf_MetricCore_0023
     * @tc.desc      metric 22 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricCore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricCore_0023 begin`);
      logInfo("metric core 22");
      const actual: string = metricName(22) + '|' + metricId(metricName(22)) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0024
     * @tc.name      Perf_MetricCore_0024
     * @tc.desc      metric 23 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0024 begin`);
      logInfo("metric core 23");
      const actual: string = metricName(23) + '|' + metricId(metricName(23)) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0025
     * @tc.name      Perf_MetricCore_0025
     * @tc.desc      metric 24 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0025 begin`);
      logInfo("metric core 24");
      const actual: string = metricName(24) + '|' + metricId(metricName(24)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0026
     * @tc.name      Perf_MetricCore_0026
     * @tc.desc      metric 25 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0026 begin`);
      logInfo("metric core 25");
      const actual: string = metricName(25) + '|' + metricId(metricName(25)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0027
     * @tc.name      Perf_MetricCore_0027
     * @tc.desc      metric 26 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0027 begin`);
      logInfo("metric core 26");
      const actual: string = metricName(26) + '|' + metricId(metricName(26)) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("|-1|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0028
     * @tc.name      Perf_MetricCore_0028
     * @tc.desc      metric 27 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0028 begin`);
      logInfo("metric core 27");
      const actual: string = metricName(27) + '|' + metricId(metricName(27)) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0029
     * @tc.name      Perf_MetricCore_0029
     * @tc.desc      metric 28 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0029 begin`);
      logInfo("metric core 28");
      const actual: string = metricName(28) + '|' + metricId(metricName(28)) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|-1|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0030
     * @tc.name      Perf_MetricCore_0030
     * @tc.desc      metric 29 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0030 begin`);
      logInfo("metric core 29");
      const actual: string = metricName(29) + '|' + metricId(metricName(29)) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|-1|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0031
     * @tc.name      Perf_MetricCore_0031
     * @tc.desc      metric 30 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0031 begin`);
      logInfo("metric core 30");
      const actual: string = metricName(30) + '|' + metricId(metricName(30)) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("|-1|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CORE_0032
     * @tc.name      Perf_MetricCore_0032
     * @tc.desc      metric 31 and scenario contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCore_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCore_0032 begin`);
      logInfo("metric core 31");
      const actual: string = metricName(31) + '|' + metricId(metricName(31)) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("|-1|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCore_0032 end`);
    });
  });
}
