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
  isCpuMetric,
  isMemoryMetric,
  isTimeMetric,
  isFpsMetric,
  scenarioMetrics,
  scenarioName,
} from '../model/PerfTestLogic';

/** MetricBoundaryMatrixTest logic checks (36 cases). */
export default function metricBoundaryMatrixTest(): void {
  describe('MetricBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0001
     * @tc.name      Perf_MetricMatrix_0001
     * @tc.desc      metric matrix 0,0,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricMatrix_0001 begin`);
      logInfo("metric matrix 0,0,0");
      const actual: string = metricName(0) + '|' + metricId("DURATION") + '|' + isCpuMetric(0) + ':' + isMemoryMetric(0) + ':' + isTimeMetric(0) + ':' + isFpsMetric(0) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION|0|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("DURATION|0|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0002
     * @tc.name      Perf_MetricMatrix_0002
     * @tc.desc      metric matrix 1,1,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0002 begin`);
      logInfo("metric matrix 1,1,1");
      const actual: string = metricName(1) + '|' + metricId("CPU_LOAD") + '|' + isCpuMetric(1) + ':' + isMemoryMetric(1) + ':' + isTimeMetric(1) + ':' + isFpsMetric(1) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_LOAD|1|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("CPU_LOAD|1|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0003
     * @tc.name      Perf_MetricMatrix_0003
     * @tc.desc      metric matrix 2,2,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0003 begin`);
      logInfo("metric matrix 2,2,2");
      const actual: string = metricName(2) + '|' + metricId("CPU_USAGE") + '|' + isCpuMetric(2) + ':' + isMemoryMetric(2) + ':' + isTimeMetric(2) + ':' + isFpsMetric(2) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_USAGE|2|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("CPU_USAGE|2|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0004
     * @tc.name      Perf_MetricMatrix_0004
     * @tc.desc      metric matrix 3,3,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0004 begin`);
      logInfo("metric matrix 3,3,3");
      const actual: string = metricName(3) + '|' + metricId("MEMORY_RSS") + '|' + isCpuMetric(3) + ':' + isMemoryMetric(3) + ':' + isTimeMetric(3) + ':' + isFpsMetric(3) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_RSS|3|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("MEMORY_RSS|3|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0005
     * @tc.name      Perf_MetricMatrix_0005
     * @tc.desc      metric matrix 4,4,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0005 begin`);
      logInfo("metric matrix 4,4,4");
      const actual: string = metricName(4) + '|' + metricId("MEMORY_PSS") + '|' + isCpuMetric(4) + ':' + isMemoryMetric(4) + ':' + isTimeMetric(4) + ':' + isFpsMetric(4) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_PSS|4|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("MEMORY_PSS|4|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0006
     * @tc.name      Perf_MetricMatrix_0006
     * @tc.desc      metric matrix 5,5,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0006 begin`);
      logInfo("metric matrix 5,5,5");
      const actual: string = metricName(5) + '|' + metricId("PAGE_SWITCH_COMPLETE_TIME") + '|' + isCpuMetric(5) + ':' + isMemoryMetric(5) + ':' + isTimeMetric(5) + ':' + isFpsMetric(5) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME|5|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME|5|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0007
     * @tc.name      Perf_MetricMatrix_0007
     * @tc.desc      metric matrix 6,6,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0007 begin`);
      logInfo("metric matrix 6,6,0");
      const actual: string = metricName(6) + '|' + metricId("LIST_SWIPE_FPS") + '|' + isCpuMetric(6) + ':' + isMemoryMetric(6) + ':' + isTimeMetric(6) + ':' + isFpsMetric(6) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS|6|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("LIST_SWIPE_FPS|6|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0008
     * @tc.name      Perf_MetricMatrix_0008
     * @tc.desc      metric matrix 7,7,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0008 begin`);
      logInfo("metric matrix 7,7,1");
      const actual: string = metricName(7) + '|' + metricId("APP_START_RESPONSE_TIME") + '|' + isCpuMetric(7) + ':' + isMemoryMetric(7) + ':' + isTimeMetric(7) + ':' + isFpsMetric(7) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_RESPONSE_TIME|7|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("APP_START_RESPONSE_TIME|7|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0009
     * @tc.name      Perf_MetricMatrix_0009
     * @tc.desc      metric matrix 8,8,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0009 begin`);
      logInfo("metric matrix 8,8,2");
      const actual: string = metricName(8) + '|' + metricId("APP_START_COMPLETE_TIME") + '|' + isCpuMetric(8) + ':' + isMemoryMetric(8) + ':' + isTimeMetric(8) + ':' + isFpsMetric(8) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_COMPLETE_TIME|8|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("APP_START_COMPLETE_TIME|8|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0010
     * @tc.name      Perf_MetricMatrix_0010
     * @tc.desc      metric matrix 9,0,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0010 begin`);
      logInfo("metric matrix 9,0,3");
      const actual: string = metricName(9) + '|' + metricId("DURATION") + '|' + isCpuMetric(9) + ':' + isMemoryMetric(9) + ':' + isTimeMetric(9) + ':' + isFpsMetric(9) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|0|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|0|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0011
     * @tc.name      Perf_MetricMatrix_0011
     * @tc.desc      metric matrix 10,1,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0011 begin`);
      logInfo("metric matrix 10,1,4");
      const actual: string = metricName(10) + '|' + metricId("CPU_LOAD") + '|' + isCpuMetric(10) + ':' + isMemoryMetric(10) + ':' + isTimeMetric(10) + ':' + isFpsMetric(10) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|1|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|1|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0012
     * @tc.name      Perf_MetricMatrix_0012
     * @tc.desc      metric matrix 11,2,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricMatrix_0012 begin`);
      logInfo("metric matrix 11,2,5");
      const actual: string = metricName(11) + '|' + metricId("CPU_USAGE") + '|' + isCpuMetric(11) + ':' + isMemoryMetric(11) + ':' + isTimeMetric(11) + ':' + isFpsMetric(11) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|2|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|2|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0013
     * @tc.name      Perf_MetricMatrix_0013
     * @tc.desc      metric matrix 0,3,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0013 begin`);
      logInfo("metric matrix 0,3,0");
      const actual: string = metricName(0) + '|' + metricId("MEMORY_RSS") + '|' + isCpuMetric(0) + ':' + isMemoryMetric(0) + ':' + isTimeMetric(0) + ':' + isFpsMetric(0) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION|3|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("DURATION|3|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0014
     * @tc.name      Perf_MetricMatrix_0014
     * @tc.desc      metric matrix 1,4,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0014 begin`);
      logInfo("metric matrix 1,4,1");
      const actual: string = metricName(1) + '|' + metricId("MEMORY_PSS") + '|' + isCpuMetric(1) + ':' + isMemoryMetric(1) + ':' + isTimeMetric(1) + ':' + isFpsMetric(1) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_LOAD|4|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("CPU_LOAD|4|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0015
     * @tc.name      Perf_MetricMatrix_0015
     * @tc.desc      metric matrix 2,5,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0015 begin`);
      logInfo("metric matrix 2,5,2");
      const actual: string = metricName(2) + '|' + metricId("PAGE_SWITCH_COMPLETE_TIME") + '|' + isCpuMetric(2) + ':' + isMemoryMetric(2) + ':' + isTimeMetric(2) + ':' + isFpsMetric(2) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_USAGE|5|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("CPU_USAGE|5|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0016
     * @tc.name      Perf_MetricMatrix_0016
     * @tc.desc      metric matrix 3,6,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0016 begin`);
      logInfo("metric matrix 3,6,3");
      const actual: string = metricName(3) + '|' + metricId("LIST_SWIPE_FPS") + '|' + isCpuMetric(3) + ':' + isMemoryMetric(3) + ':' + isTimeMetric(3) + ':' + isFpsMetric(3) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_RSS|6|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("MEMORY_RSS|6|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0017
     * @tc.name      Perf_MetricMatrix_0017
     * @tc.desc      metric matrix 4,7,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0017 begin`);
      logInfo("metric matrix 4,7,4");
      const actual: string = metricName(4) + '|' + metricId("APP_START_RESPONSE_TIME") + '|' + isCpuMetric(4) + ':' + isMemoryMetric(4) + ':' + isTimeMetric(4) + ':' + isFpsMetric(4) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_PSS|7|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("MEMORY_PSS|7|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0018
     * @tc.name      Perf_MetricMatrix_0018
     * @tc.desc      metric matrix 5,8,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_MetricMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MetricMatrix_0018 begin`);
      logInfo("metric matrix 5,8,5");
      const actual: string = metricName(5) + '|' + metricId("APP_START_COMPLETE_TIME") + '|' + isCpuMetric(5) + ':' + isMemoryMetric(5) + ':' + isTimeMetric(5) + ':' + isFpsMetric(5) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME|8|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME|8|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0019
     * @tc.name      Perf_MetricMatrix_0019
     * @tc.desc      metric matrix 6,0,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0019 begin`);
      logInfo("metric matrix 6,0,0");
      const actual: string = metricName(6) + '|' + metricId("DURATION") + '|' + isCpuMetric(6) + ':' + isMemoryMetric(6) + ':' + isTimeMetric(6) + ':' + isFpsMetric(6) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS|0|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("LIST_SWIPE_FPS|0|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0020
     * @tc.name      Perf_MetricMatrix_0020
     * @tc.desc      metric matrix 7,1,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0020 begin`);
      logInfo("metric matrix 7,1,1");
      const actual: string = metricName(7) + '|' + metricId("CPU_LOAD") + '|' + isCpuMetric(7) + ':' + isMemoryMetric(7) + ':' + isTimeMetric(7) + ':' + isFpsMetric(7) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_RESPONSE_TIME|1|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("APP_START_RESPONSE_TIME|1|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0021
     * @tc.name      Perf_MetricMatrix_0021
     * @tc.desc      metric matrix 8,2,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0021 begin`);
      logInfo("metric matrix 8,2,2");
      const actual: string = metricName(8) + '|' + metricId("CPU_USAGE") + '|' + isCpuMetric(8) + ':' + isMemoryMetric(8) + ':' + isTimeMetric(8) + ':' + isFpsMetric(8) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_COMPLETE_TIME|2|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("APP_START_COMPLETE_TIME|2|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0022
     * @tc.name      Perf_MetricMatrix_0022
     * @tc.desc      metric matrix 9,3,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0022 begin`);
      logInfo("metric matrix 9,3,3");
      const actual: string = metricName(9) + '|' + metricId("MEMORY_RSS") + '|' + isCpuMetric(9) + ':' + isMemoryMetric(9) + ':' + isTimeMetric(9) + ':' + isFpsMetric(9) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|3|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|3|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0023
     * @tc.name      Perf_MetricMatrix_0023
     * @tc.desc      metric matrix 10,4,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricMatrix_0023 begin`);
      logInfo("metric matrix 10,4,4");
      const actual: string = metricName(10) + '|' + metricId("MEMORY_PSS") + '|' + isCpuMetric(10) + ':' + isMemoryMetric(10) + ':' + isTimeMetric(10) + ':' + isFpsMetric(10) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|4|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|4|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0024
     * @tc.name      Perf_MetricMatrix_0024
     * @tc.desc      metric matrix 11,5,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0024 begin`);
      logInfo("metric matrix 11,5,5");
      const actual: string = metricName(11) + '|' + metricId("PAGE_SWITCH_COMPLETE_TIME") + '|' + isCpuMetric(11) + ':' + isMemoryMetric(11) + ':' + isTimeMetric(11) + ':' + isFpsMetric(11) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|5|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|5|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0025
     * @tc.name      Perf_MetricMatrix_0025
     * @tc.desc      metric matrix 0,6,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0025 begin`);
      logInfo("metric matrix 0,6,0");
      const actual: string = metricName(0) + '|' + metricId("LIST_SWIPE_FPS") + '|' + isCpuMetric(0) + ':' + isMemoryMetric(0) + ':' + isTimeMetric(0) + ':' + isFpsMetric(0) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION|6|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("DURATION|6|false:false:true:false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0026
     * @tc.name      Perf_MetricMatrix_0026
     * @tc.desc      metric matrix 1,7,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0026 begin`);
      logInfo("metric matrix 1,7,1");
      const actual: string = metricName(1) + '|' + metricId("APP_START_RESPONSE_TIME") + '|' + isCpuMetric(1) + ':' + isMemoryMetric(1) + ':' + isTimeMetric(1) + ':' + isFpsMetric(1) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_LOAD|7|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("CPU_LOAD|7|true:false:false:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0027
     * @tc.name      Perf_MetricMatrix_0027
     * @tc.desc      metric matrix 2,8,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0027 begin`);
      logInfo("metric matrix 2,8,2");
      const actual: string = metricName(2) + '|' + metricId("APP_START_COMPLETE_TIME") + '|' + isCpuMetric(2) + ':' + isMemoryMetric(2) + ':' + isTimeMetric(2) + ':' + isFpsMetric(2) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_USAGE|8|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("CPU_USAGE|8|true:false:false:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0028
     * @tc.name      Perf_MetricMatrix_0028
     * @tc.desc      metric matrix 3,0,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0028 begin`);
      logInfo("metric matrix 3,0,3");
      const actual: string = metricName(3) + '|' + metricId("DURATION") + '|' + isCpuMetric(3) + ':' + isMemoryMetric(3) + ':' + isTimeMetric(3) + ':' + isFpsMetric(3) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_RSS|0|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("MEMORY_RSS|0|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0029
     * @tc.name      Perf_MetricMatrix_0029
     * @tc.desc      metric matrix 4,1,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0029 begin`);
      logInfo("metric matrix 4,1,4");
      const actual: string = metricName(4) + '|' + metricId("CPU_LOAD") + '|' + isCpuMetric(4) + ':' + isMemoryMetric(4) + ':' + isTimeMetric(4) + ':' + isFpsMetric(4) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_PSS|1|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("MEMORY_PSS|1|false:true:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0030
     * @tc.name      Perf_MetricMatrix_0030
     * @tc.desc      metric matrix 5,2,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0030 begin`);
      logInfo("metric matrix 5,2,5");
      const actual: string = metricName(5) + '|' + metricId("CPU_USAGE") + '|' + isCpuMetric(5) + ':' + isMemoryMetric(5) + ':' + isTimeMetric(5) + ':' + isFpsMetric(5) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME|2|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME|2|false:false:true:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0031
     * @tc.name      Perf_MetricMatrix_0031
     * @tc.desc      metric matrix 6,3,0 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0031 begin`);
      logInfo("metric matrix 6,3,0");
      const actual: string = metricName(6) + '|' + metricId("MEMORY_RSS") + '|' + isCpuMetric(6) + ':' + isMemoryMetric(6) + ':' + isTimeMetric(6) + ':' + isFpsMetric(6) + '|' + scenarioMetrics(0) + '|' + scenarioName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS|3|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      expect(actual).assertEqual("LIST_SWIPE_FPS|3|false:false:false:true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|calculate");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0032
     * @tc.name      Perf_MetricMatrix_0032
     * @tc.desc      metric matrix 7,4,1 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0032 begin`);
      logInfo("metric matrix 7,4,1");
      const actual: string = metricName(7) + '|' + metricId("MEMORY_PSS") + '|' + isCpuMetric(7) + ':' + isMemoryMetric(7) + ':' + isTimeMetric(7) + ':' + isFpsMetric(7) + '|' + scenarioMetrics(1) + '|' + scenarioName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_RESPONSE_TIME|4|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      expect(actual).assertEqual("APP_START_RESPONSE_TIME|4|false:false:true:false|PAGE_SWITCH_COMPLETE_TIME|pageSwitch");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0033
     * @tc.name      Perf_MetricMatrix_0033
     * @tc.desc      metric matrix 8,5,2 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0033 begin`);
      logInfo("metric matrix 8,5,2");
      const actual: string = metricName(8) + '|' + metricId("PAGE_SWITCH_COMPLETE_TIME") + '|' + isCpuMetric(8) + ':' + isMemoryMetric(8) + ':' + isTimeMetric(8) + ':' + isFpsMetric(8) + '|' + scenarioMetrics(2) + '|' + scenarioName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_COMPLETE_TIME|5|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      expect(actual).assertEqual("APP_START_COMPLETE_TIME|5|false:false:true:false|LIST_SWIPE_FPS|listSwipe");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0034
     * @tc.name      Perf_MetricMatrix_0034
     * @tc.desc      metric matrix 9,6,3 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricMatrix_0034 begin`);
      logInfo("metric matrix 9,6,3");
      const actual: string = metricName(9) + '|' + metricId("LIST_SWIPE_FPS") + '|' + isCpuMetric(9) + ':' + isMemoryMetric(9) + ':' + isTimeMetric(9) + ':' + isFpsMetric(9) + '|' + scenarioMetrics(3) + '|' + scenarioName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "|6|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      expect(actual).assertEqual("|6|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS|keep");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0035
     * @tc.name      Perf_MetricMatrix_0035
     * @tc.desc      metric matrix 10,7,4 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_MetricMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MetricMatrix_0035 begin`);
      logInfo("metric matrix 10,7,4");
      const actual: string = metricName(10) + '|' + metricId("APP_START_RESPONSE_TIME") + '|' + isCpuMetric(10) + ':' + isMemoryMetric(10) + ':' + isTimeMetric(10) + ':' + isFpsMetric(10) + '|' + scenarioMetrics(4) + '|' + scenarioName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "|7|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      expect(actual).assertEqual("|7|false:false:false:false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_MATRIX_0036
     * @tc.name      Perf_MetricMatrix_0036
     * @tc.desc      metric matrix 11,8,5 keeps name/category/scenario.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricMatrix_0036 begin`);
      logInfo("metric matrix 11,8,5");
      const actual: string = metricName(11) + '|' + metricId("APP_START_COMPLETE_TIME") + '|' + isCpuMetric(11) + ':' + isMemoryMetric(11) + ':' + isTimeMetric(11) + ':' + isFpsMetric(11) + '|' + scenarioMetrics(5) + '|' + scenarioName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "|8|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      expect(actual).assertEqual("|8|false:false:false:false|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|appStart");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricMatrix_0036 end`);
    });
  });
}
