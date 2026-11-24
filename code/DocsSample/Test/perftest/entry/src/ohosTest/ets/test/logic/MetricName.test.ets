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
} from '../model/PerfTestLogic';

/** MetricNameTest logic checks (13 cases). */
export default function metricNameTest(): void {
  describe('MetricNameTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0001
     * @tc.name      Perf_MetricName_0001
     * @tc.desc      metricName(1) resolves "CPU_LOAD".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricName_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricName_0001 begin`);
      logInfo("metricName(1)");
      const actual: string = metricName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_LOAD");
      expect(actual).assertEqual("CPU_LOAD");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricName_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0002
     * @tc.name      Perf_MetricName_0002
     * @tc.desc      metricName(-1) resolves "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0002 begin`);
      logInfo("metricName(-1)");
      const actual: string = metricName(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}MetricName_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0003
     * @tc.name      Perf_MetricName_0003
     * @tc.desc      metricName(2) resolves "CPU_USAGE".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0003 begin`);
      logInfo("metricName(2)");
      const actual: string = metricName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CPU_USAGE");
      expect(actual).assertEqual("CPU_USAGE");
      logInfo(`${BUNDLE}MetricName_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0004
     * @tc.name      Perf_MetricName_0004
     * @tc.desc      metricName(3) resolves "MEMORY_RSS".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0004 begin`);
      logInfo("metricName(3)");
      const actual: string = metricName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_RSS");
      expect(actual).assertEqual("MEMORY_RSS");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricName_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0005
     * @tc.name      Perf_MetricName_0005
     * @tc.desc      metricName(4) resolves "MEMORY_PSS".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0005 begin`);
      logInfo("metricName(4)");
      const actual: string = metricName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "MEMORY_PSS");
      expect(actual).assertEqual("MEMORY_PSS");
      logInfo(`${BUNDLE}MetricName_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0006
     * @tc.name      Perf_MetricName_0006
     * @tc.desc      metricName(5) resolves "PAGE_SWITCH_COMPLETE_TIME".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0006 begin`);
      logInfo("metricName(5)");
      const actual: string = metricName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "PAGE_SWITCH_COMPLETE_TIME");
      expect(actual).assertEqual("PAGE_SWITCH_COMPLETE_TIME");
      logInfo(`${BUNDLE}MetricName_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0007
     * @tc.name      Perf_MetricName_0007
     * @tc.desc      metricName(6) resolves "LIST_SWIPE_FPS".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0007 begin`);
      logInfo("metricName(6)");
      const actual: string = metricName(6);
      logInfo('actual=' + String(actual) + ', expected=' + "LIST_SWIPE_FPS");
      expect(actual).assertEqual("LIST_SWIPE_FPS");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricName_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0008
     * @tc.name      Perf_MetricName_0008
     * @tc.desc      metricName(7) resolves "APP_START_RESPONSE_TIME".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0008 begin`);
      logInfo("metricName(7)");
      const actual: string = metricName(7);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_RESPONSE_TIME");
      expect(actual).assertEqual("APP_START_RESPONSE_TIME");
      logInfo(`${BUNDLE}MetricName_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0009
     * @tc.name      Perf_MetricName_0009
     * @tc.desc      metricName(8) resolves "APP_START_COMPLETE_TIME".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0009 begin`);
      logInfo("metricName(8)");
      const actual: string = metricName(8);
      logInfo('actual=' + String(actual) + ', expected=' + "APP_START_COMPLETE_TIME");
      expect(actual).assertEqual("APP_START_COMPLETE_TIME");
      logInfo(`${BUNDLE}MetricName_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0010
     * @tc.name      Perf_MetricName_0010
     * @tc.desc      metricName(9) resolves "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0010 begin`);
      logInfo("metricName(9)");
      const actual: string = metricName(9);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricName_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0011
     * @tc.name      Perf_MetricName_0011
     * @tc.desc      metricName(10) resolves "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0011 begin`);
      logInfo("metricName(10)");
      const actual: string = metricName(10);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}MetricName_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0012
     * @tc.name      Perf_MetricName_0012
     * @tc.desc      metricName(11) resolves "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricName_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricName_0012 begin`);
      logInfo("metricName(11)");
      const actual: string = metricName(11);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}MetricName_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_NAME_0013
     * @tc.name      Perf_MetricName_0013
     * @tc.desc      metricName(0) resolves "DURATION".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricName_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricName_0013 begin`);
      logInfo("metricName(0)");
      const actual: string = metricName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION");
      expect(actual).assertEqual("DURATION");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricName_0013 end`);
    });
  });
}
