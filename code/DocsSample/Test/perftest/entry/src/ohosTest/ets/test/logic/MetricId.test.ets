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
  metricId,
} from '../model/PerfTestLogic';

/** MetricIdTest logic checks (13 cases). */
export default function metricIdTest(): void {
  describe('MetricIdTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0001
     * @tc.name      Perf_MetricId_0001
     * @tc.desc      metricId("DURATION") resolves 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricId_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricId_0001 begin`);
      logInfo("metricId(\"DURATION\")");
      const actual: number = metricId("DURATION");
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}MetricId_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0002
     * @tc.name      Perf_MetricId_0002
     * @tc.desc      metricId("CPU_LOAD") resolves 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0002 begin`);
      logInfo("metricId(\"CPU_LOAD\")");
      const actual: number = metricId("CPU_LOAD");
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MetricId_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0003
     * @tc.name      Perf_MetricId_0003
     * @tc.desc      metricId("CPU_USAGE") resolves 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0003 begin`);
      logInfo("metricId(\"CPU_USAGE\")");
      const actual: number = metricId("CPU_USAGE");
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MetricId_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0004
     * @tc.name      Perf_MetricId_0004
     * @tc.desc      metricId("MEMORY_RSS") resolves 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0004 begin`);
      logInfo("metricId(\"MEMORY_RSS\")");
      const actual: number = metricId("MEMORY_RSS");
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}MetricId_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0005
     * @tc.name      Perf_MetricId_0005
     * @tc.desc      metricId("MEMORY_PSS") resolves 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0005 begin`);
      logInfo("metricId(\"MEMORY_PSS\")");
      const actual: number = metricId("MEMORY_PSS");
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MetricId_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0006
     * @tc.name      Perf_MetricId_0006
     * @tc.desc      metricId("PAGE_SWITCH_COMPLETE_TIME") resolves 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0006 begin`);
      logInfo("metricId(\"PAGE_SWITCH_COMPLETE_TIME\")");
      const actual: number = metricId("PAGE_SWITCH_COMPLETE_TIME");
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}MetricId_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0007
     * @tc.name      Perf_MetricId_0007
     * @tc.desc      metricId("LIST_SWIPE_FPS") resolves 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0007 begin`);
      logInfo("metricId(\"LIST_SWIPE_FPS\")");
      const actual: number = metricId("LIST_SWIPE_FPS");
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}MetricId_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0008
     * @tc.name      Perf_MetricId_0008
     * @tc.desc      metricId("APP_START_RESPONSE_TIME") resolves 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0008 begin`);
      logInfo("metricId(\"APP_START_RESPONSE_TIME\")");
      const actual: number = metricId("APP_START_RESPONSE_TIME");
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}MetricId_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0009
     * @tc.name      Perf_MetricId_0009
     * @tc.desc      metricId("APP_START_COMPLETE_TIME") resolves 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0009 begin`);
      logInfo("metricId(\"APP_START_COMPLETE_TIME\")");
      const actual: number = metricId("APP_START_COMPLETE_TIME");
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}MetricId_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0010
     * @tc.name      Perf_MetricId_0010
     * @tc.desc      metricId("") resolves -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0010 begin`);
      logInfo("metricId(\"\")");
      const actual: number = metricId("");
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}MetricId_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0011
     * @tc.name      Perf_MetricId_0011
     * @tc.desc      metricId("duration") resolves -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0011 begin`);
      logInfo("metricId(\"duration\")");
      const actual: number = metricId("duration");
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MetricId_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0012
     * @tc.name      Perf_MetricId_0012
     * @tc.desc      metricId("CPU") resolves -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricId_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricId_0012 begin`);
      logInfo("metricId(\"CPU\")");
      const actual: number = metricId("CPU");
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MetricId_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_ID_0013
     * @tc.name      Perf_MetricId_0013
     * @tc.desc      metricId("UNKNOWN") resolves -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricId_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricId_0013 begin`);
      logInfo("metricId(\"UNKNOWN\")");
      const actual: number = metricId("UNKNOWN");
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}MetricId_0013 end`);
    });
  });
}
