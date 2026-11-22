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
  isCpuMetric,
  isMemoryMetric,
  isTimeMetric,
  isFpsMetric,
} from '../model/PerfTestLogic';

/** MetricCategoryTest logic checks (32 cases). */
export default function metricCategoryTest(): void {
  describe('MetricCategoryTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0001
     * @tc.name      Perf_MetricCategory_0001
     * @tc.desc      metric category flags for 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricCategory_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricCategory_0001 begin`);
      logInfo("isCpuMetric(0) + ':' + isMemoryMetric(0) + ':' + isTimeMetric(0) + ':' + isFpsMetric(0)");
      const actual: string = isCpuMetric(0) + ':' + isMemoryMetric(0) + ':' + isTimeMetric(0) + ':' + isFpsMetric(0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:false");
      expect(actual).assertEqual("false:false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCategory_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0002
     * @tc.name      Perf_MetricCategory_0002
     * @tc.desc      metric category flags for 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0002 begin`);
      logInfo("isCpuMetric(1) + ':' + isMemoryMetric(1) + ':' + isTimeMetric(1) + ':' + isFpsMetric(1)");
      const actual: string = isCpuMetric(1) + ':' + isMemoryMetric(1) + ':' + isTimeMetric(1) + ':' + isFpsMetric(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false:false");
      expect(actual).assertEqual("true:false:false:false");
      logInfo(`${BUNDLE}MetricCategory_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0003
     * @tc.name      Perf_MetricCategory_0003
     * @tc.desc      metric category flags for 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0003 begin`);
      logInfo("isCpuMetric(2) + ':' + isMemoryMetric(2) + ':' + isTimeMetric(2) + ':' + isFpsMetric(2)");
      const actual: string = isCpuMetric(2) + ':' + isMemoryMetric(2) + ':' + isTimeMetric(2) + ':' + isFpsMetric(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false:false");
      expect(actual).assertEqual("true:false:false:false");
      logInfo(`${BUNDLE}MetricCategory_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0004
     * @tc.name      Perf_MetricCategory_0004
     * @tc.desc      metric category flags for 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0004 begin`);
      logInfo("isCpuMetric(3) + ':' + isMemoryMetric(3) + ':' + isTimeMetric(3) + ':' + isFpsMetric(3)");
      const actual: string = isCpuMetric(3) + ':' + isMemoryMetric(3) + ':' + isTimeMetric(3) + ':' + isFpsMetric(3);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false:false");
      expect(actual).assertEqual("false:true:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCategory_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0005
     * @tc.name      Perf_MetricCategory_0005
     * @tc.desc      metric category flags for 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0005 begin`);
      logInfo("isCpuMetric(4) + ':' + isMemoryMetric(4) + ':' + isTimeMetric(4) + ':' + isFpsMetric(4)");
      const actual: string = isCpuMetric(4) + ':' + isMemoryMetric(4) + ':' + isTimeMetric(4) + ':' + isFpsMetric(4);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false:false");
      expect(actual).assertEqual("false:true:false:false");
      logInfo(`${BUNDLE}MetricCategory_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0006
     * @tc.name      Perf_MetricCategory_0006
     * @tc.desc      metric category flags for 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0006 begin`);
      logInfo("isCpuMetric(5) + ':' + isMemoryMetric(5) + ':' + isTimeMetric(5) + ':' + isFpsMetric(5)");
      const actual: string = isCpuMetric(5) + ':' + isMemoryMetric(5) + ':' + isTimeMetric(5) + ':' + isFpsMetric(5);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:false");
      expect(actual).assertEqual("false:false:true:false");
      logInfo(`${BUNDLE}MetricCategory_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0007
     * @tc.name      Perf_MetricCategory_0007
     * @tc.desc      metric category flags for 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0007 begin`);
      logInfo("isCpuMetric(6) + ':' + isMemoryMetric(6) + ':' + isTimeMetric(6) + ':' + isFpsMetric(6)");
      const actual: string = isCpuMetric(6) + ':' + isMemoryMetric(6) + ':' + isTimeMetric(6) + ':' + isFpsMetric(6);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:true");
      expect(actual).assertEqual("false:false:false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCategory_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0008
     * @tc.name      Perf_MetricCategory_0008
     * @tc.desc      metric category flags for 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0008 begin`);
      logInfo("isCpuMetric(7) + ':' + isMemoryMetric(7) + ':' + isTimeMetric(7) + ':' + isFpsMetric(7)");
      const actual: string = isCpuMetric(7) + ':' + isMemoryMetric(7) + ':' + isTimeMetric(7) + ':' + isFpsMetric(7);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:false");
      expect(actual).assertEqual("false:false:true:false");
      logInfo(`${BUNDLE}MetricCategory_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0009
     * @tc.name      Perf_MetricCategory_0009
     * @tc.desc      metric category flags for 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0009 begin`);
      logInfo("isCpuMetric(8) + ':' + isMemoryMetric(8) + ':' + isTimeMetric(8) + ':' + isFpsMetric(8)");
      const actual: string = isCpuMetric(8) + ':' + isMemoryMetric(8) + ':' + isTimeMetric(8) + ':' + isFpsMetric(8);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:false");
      expect(actual).assertEqual("false:false:true:false");
      logInfo(`${BUNDLE}MetricCategory_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0010
     * @tc.name      Perf_MetricCategory_0010
     * @tc.desc      metric category flags for 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0010 begin`);
      logInfo("isCpuMetric(9) + ':' + isMemoryMetric(9) + ':' + isTimeMetric(9) + ':' + isFpsMetric(9)");
      const actual: string = isCpuMetric(9) + ':' + isMemoryMetric(9) + ':' + isTimeMetric(9) + ':' + isFpsMetric(9);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:false");
      expect(actual).assertEqual("false:false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCategory_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0011
     * @tc.name      Perf_MetricCategory_0011
     * @tc.desc      metric category flags for 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0011 begin`);
      logInfo("isCpuMetric(10) + ':' + isMemoryMetric(10) + ':' + isTimeMetric(10) + ':' + isFpsMetric(10)");
      const actual: string = isCpuMetric(10) + ':' + isMemoryMetric(10) + ':' + isTimeMetric(10) + ':' + isFpsMetric(10);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:false");
      expect(actual).assertEqual("false:false:false:false");
      logInfo(`${BUNDLE}MetricCategory_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0012
     * @tc.name      Perf_MetricCategory_0012
     * @tc.desc      metric category flags for 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricCategory_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricCategory_0012 begin`);
      logInfo("isCpuMetric(11) + ':' + isMemoryMetric(11) + ':' + isTimeMetric(11) + ':' + isFpsMetric(11)");
      const actual: string = isCpuMetric(11) + ':' + isMemoryMetric(11) + ':' + isTimeMetric(11) + ':' + isFpsMetric(11);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:false");
      expect(actual).assertEqual("false:false:false:false");
      logInfo(`${BUNDLE}MetricCategory_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0013
     * @tc.name      Perf_MetricCategory_0013
     * @tc.desc      metric category flags for 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0013 begin`);
      logInfo("isCpuMetric(12) + ':' + isMemoryMetric(12) + ':' + isTimeMetric(12) + ':' + isFpsMetric(12)");
      const actual: string = isCpuMetric(12) + ':' + isMemoryMetric(12) + ':' + isTimeMetric(12) + ':' + isFpsMetric(12);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:false");
      expect(actual).assertEqual("false:false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MetricCategory_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_CATEGORY_0014
     * @tc.name      Perf_MetricCategory_0014
     * @tc.desc      metric category flags for 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricCategory_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricCategory_0014 begin`);
      logInfo("isCpuMetric(13) + ':' + isMemoryMetric(13) + ':' + isTimeMetric(13) + ':' + isFpsMetric(13)");
      const actual: string = isCpuMetric(13) + ':' + isMemoryMetric(13) + ':' + isTimeMetric(13) + ':' + isFpsMetric(13);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:false");
