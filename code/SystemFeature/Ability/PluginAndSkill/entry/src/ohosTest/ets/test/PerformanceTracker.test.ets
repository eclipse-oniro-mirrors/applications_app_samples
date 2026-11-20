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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { PerformanceMetric, PerformanceSummary, PerformanceTracker } from '../../../main/ets/util/PerformanceTracker';

export default function performanceTrackerTest(): void {
  describe('PerformanceTrackerTest', (): void => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    // ==================== startTimer + stopTimer (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_0100
     * @tc.name: testTimer0001
     * @tc.desc: Verify startTimer and stopTimer return valid metric with correct name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTimer0001', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('op1');
      const metric: PerformanceMetric | undefined = tracker.stopTimer('op1');
      expect(metric!.name).assertEqual('op1');
      expect(metric!.duration).assertLarger(-1);
      expect(metric!.category).assertEqual('default');
      done();
    });

    /*
     * @tc.number: SUB_PERF_0200
     * @tc.name: testTimer0002
     * @tc.desc: Verify stopTimer returns undefined for non-existent timer.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTimer0002', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const metric: PerformanceMetric | undefined = tracker.stopTimer('nonexistent');
      expect(metric === undefined).assertTrue();
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetricCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_0300
     * @tc.name: testTimer0003
     * @tc.desc: Verify stopTimer uses default category and success values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTimer0003', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('op2');
      const metric: PerformanceMetric | undefined = tracker.stopTimer('op2');
      expect(metric!.category).assertEqual('default');
      expect(metric!.success).assertTrue();
      expect(tracker.getMetricCount()).assertEqual(1);
      done();
    });

    // ==================== stopTimer with custom params (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_0400
     * @tc.name: testTimerCustom0004
     * @tc.desc: Verify stopTimer with custom category and success=false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTimerCustom0004', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('op3');
      const metric: PerformanceMetric | undefined = tracker.stopTimer('op3', 'network', false, 'timeout');
      expect(metric!.category).assertEqual('network');
      expect(metric!.success).assertFalse();
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_0500
     * @tc.name: testTimerCustom0005
     * @tc.desc: Verify stopTimer stores error message and removes timer from active.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTimerCustom0005', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('op4');
      expect(tracker.getActiveTimerCount()).assertEqual(1);
      const metric: PerformanceMetric | undefined = tracker.stopTimer('op4', 'db', false, 'connection lost');
      expect(metric!.errorMessage).assertEqual('connection lost');
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetricCount()).assertEqual(1);
      done();
    });

    // ==================== recordMetric (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_0600
     * @tc.name: testRecordMetric0006
     * @tc.desc: Verify recordMetric adds metric with specified values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetric0006', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('direct', 150, 'compute', true);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics.length).assertEqual(1);
      expect(metrics[0].name).assertEqual('direct');
      expect(metrics[0].duration).assertEqual(150);
      done();
    });

    /*
     * @tc.number: SUB_PERF_0700
     * @tc.name: testRecordMetric0007
     * @tc.desc: Verify recordMetric uses default category and success values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetric0007', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('simple', 50);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics.length).assertEqual(1);
      expect(metrics[0].category).assertEqual('default');
      expect(metrics[0].success).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_PERF_0800
     * @tc.name: testRecordMetric0008
     * @tc.desc: Verify recordMetric calculates startTime and endTime correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetric0008', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const before: number = Date.now();
      tracker.recordMetric('timed', 200, 'test');
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics[0].endTime).assertLarger(-1);
      expect(metrics[0].startTime).assertLarger(-1);
      expect(metrics[0].duration).assertEqual(200);
      done();
    });

    // ==================== maxMetrics capacity (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_0900
     * @tc.name: testCapacity0009
     * @tc.desc: Verify custom maxMetrics limit is respected.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCapacity0009', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker(3);
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 20);
      tracker.recordMetric('c', 30);
      tracker.recordMetric('d', 40);
      expect(tracker.getMetricCount()).assertEqual(3);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics[0].name).assertEqual('b');
      expect(metrics[2].name).assertEqual('d');
      done();
    });

    /*
     * @tc.number: SUB_PERF_1000
     * @tc.name: testCapacity0010
     * @tc.desc: Verify default maxMetrics allows many entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCapacity0010', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      for (let i: number = 0; i < 100; i++) {
        tracker.recordMetric('m' + i, i);
      }
      expect(tracker.getMetricCount()).assertEqual(100);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics[0].name).assertEqual('m0');
      expect(metrics[99].name).assertEqual('m99');
      done();
    });

    // ==================== getMetrics (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_1100
     * @tc.name: testGetMetrics0011
     * @tc.desc: Verify getMetrics returns empty array when no metrics recorded.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetrics0011', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics.length).assertEqual(0);
      expect(Array.isArray(metrics)).assertTrue();
      expect(tracker.getMetricCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_1200
     * @tc.name: testGetMetrics0012
     * @tc.desc: Verify getMetrics returns all recorded metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetrics0012', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 20);
      tracker.recordMetric('c', 30);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics.length).assertEqual(3);
      expect(metrics[0].name).assertEqual('a');
      expect(metrics[1].name).assertEqual('b');
      done();
    });

    /*
     * @tc.number: SUB_PERF_1300
     * @tc.name: testGetMetrics0013
     * @tc.desc: Verify getMetrics returns deep copies with independent tags.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetrics0013', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('x', 50, 'cat');
      const first: PerformanceMetric[] = tracker.getMetrics();
      const second: PerformanceMetric[] = tracker.getMetrics();
      expect(first.length).assertEqual(second.length);
      expect(first[0].name).assertEqual(second[0].name);
      expect(first === second).assertFalse();
      done();
    });

    // ==================== getMetricsByCategory (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_1400
     * @tc.name: testGetByCategory0014
     * @tc.desc: Verify getMetricsByCategory returns empty for non-existent category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByCategory0014', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'network');
      const result: PerformanceMetric[] = tracker.getMetricsByCategory('nonexistent');
      expect(result.length).assertEqual(0);
      expect(Array.isArray(result)).assertTrue();
      expect(tracker.getMetricCount()).assertEqual(1);
      done();
    });

    /*
     * @tc.number: SUB_PERF_1500
     * @tc.name: testGetByCategory0015
     * @tc.desc: Verify getMetricsByCategory returns matching metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByCategory0015', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'network');
      tracker.recordMetric('b', 20, 'compute');
      tracker.recordMetric('c', 30, 'network');
      const result: PerformanceMetric[] = tracker.getMetricsByCategory('network');
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('a');
      expect(result[1].name).assertEqual('c');
      done();
    });

    /*
     * @tc.number: SUB_PERF_1600
     * @tc.name: testGetByCategory0016
     * @tc.desc: Verify getMetricsByCategory with default category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByCategory0016', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 20, 'custom');
      const result: PerformanceMetric[] = tracker.getMetricsByCategory('default');
      expect(result.length).assertEqual(1);
      expect(result[0].name).assertEqual('a');
      expect(result[0].category).assertEqual('default');
      done();
    });

    // ==================== getMetricsByName (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_1700
     * @tc.name: testGetByName0017
     * @tc.desc: Verify getMetricsByName returns empty for non-existent name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByName0017', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      const result: PerformanceMetric[] = tracker.getMetricsByName('nonexistent');
      expect(result.length).assertEqual(0);
      expect(Array.isArray(result)).assertTrue();
      expect(tracker.getMetricCount()).assertEqual(1);
      done();
    });

    /*
     * @tc.number: SUB_PERF_1800
     * @tc.name: testGetByName0018
     * @tc.desc: Verify getMetricsByName returns matching metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByName0018', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('query', 10, 'db');
      tracker.recordMetric('render', 20, 'ui');
      tracker.recordMetric('query', 30, 'db');
      const result: PerformanceMetric[] = tracker.getMetricsByName('query');
      expect(result.length).assertEqual(2);
      expect(result[0].duration).assertEqual(10);
      expect(result[1].duration).assertEqual(30);
      done();
    });

    /*
     * @tc.number: SUB_PERF_1900
     * @tc.name: testGetByName0019
     * @tc.desc: Verify getMetricsByName returns single match.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetByName0019', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('unique', 50);
      const result: PerformanceMetric[] = tracker.getMetricsByName('unique');
      expect(result.length).assertEqual(1);
      expect(result[0].name).assertEqual('unique');
      expect(result[0].duration).assertEqual(50);
      done();
    });

    // ==================== getFailedMetrics (3 用例) ====================

    /*
     * @tc.number: SUB_PERF_2000
     * @tc.name: testGetFailed0020
     * @tc.desc: Verify getFailedMetrics returns empty when all metrics are successful.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailed0020', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'cat', true);
      tracker.recordMetric('b', 20, 'cat', true);
      const failed: PerformanceMetric[] = tracker.getFailedMetrics();
      expect(failed.length).assertEqual(0);
      expect(Array.isArray(failed)).assertTrue();
      expect(tracker.getMetricCount()).assertEqual(2);
      done();
    });

    /*
     * @tc.number: SUB_PERF_2100
     * @tc.name: testGetFailed0021
     * @tc.desc: Verify getFailedMetrics returns only failed metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailed0021', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'cat', true);
      tracker.recordMetric('b', 20, 'cat', false, 'err1');
      tracker.recordMetric('c', 30, 'cat', true);
      tracker.recordMetric('d', 40, 'cat', false, 'err2');
      const failed: PerformanceMetric[] = tracker.getFailedMetrics();
      expect(failed.length).assertEqual(2);
      expect(failed[0].name).assertEqual('b');
      expect(failed[1].name).assertEqual('d');
      done();
    });

    /*
     * @tc.number: SUB_PERF_2200
     * @tc.name: testGetFailed0022
     * @tc.desc: Verify getFailedMetrics returns all when all metrics fail.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailed0022', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'cat', false, 'err');
      tracker.recordMetric('b', 20, 'cat', false, 'err');
      const failed: PerformanceMetric[] = tracker.getFailedMetrics();
      expect(failed.length).assertEqual(2);
      expect(failed[0].errorMessage).assertEqual('err');
      expect(failed[1].success).assertFalse();
      done();
    });

    // ==================== summarize (4 用例) ====================

    /*
     * @tc.number: SUB_PERF_2300
     * @tc.name: testSummarize0023
     * @tc.desc: Verify summarize returns zero values when no metrics recorded.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0023', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(0);
      expect(summary.averageDuration).assertEqual(0);
      expect(summary.minDuration).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_2400
     * @tc.name: testSummarize0024
     * @tc.desc: Verify summarize calculates correct statistics for single metric.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0024', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('only', 100, 'test', true);
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(1);
      expect(summary.averageDuration).assertEqual(100);
      expect(summary.minDuration).assertEqual(100);
      done();
    });

    /*
     * @tc.number: SUB_PERF_2500
     * @tc.name: testSummarize0025
     * @tc.desc: Verify summarize calculates correct min/max/average for multiple metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0025', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 50);
      tracker.recordMetric('c', 90);
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(3);
      expect(summary.minDuration).assertEqual(10);
      expect(summary.maxDuration).assertEqual(90);
      done();
    });

    /*
     * @tc.number: SUB_PERF_2600
     * @tc.name: testSummarize0026
     * @tc.desc: Verify summarize calculates correct success rate and category counts.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0026', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'net', true);
      tracker.recordMetric('b', 20, 'net', false);
      tracker.recordMetric('c', 30, 'db', true);
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.successRate).assertEqual(67);
      expect(summary.totalMetrics).assertEqual(3);
      expect(summary.slowestMetrics.length).assertLarger(0);
      done();
    });

    // ==================== generateReport (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_2700
     * @tc.name: testGenerateReport0027
     * @tc.desc: Verify generateReport includes header and basic sections when empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0027', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const report: string = tracker.generateReport();
      expect(report.length).assertLarger(0);
      expect(report.indexOf('Performance Report') >= 0).assertTrue();
      expect(report.indexOf('End of Report') >= 0).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_PERF_2800
     * @tc.name: testGenerateReport0028
     * @tc.desc: Verify generateReport includes category and slowest sections with data.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0028', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('slow-op', 500, 'network', true);
      tracker.recordMetric('fast-op', 10, 'compute', false, 'err');
      const report: string = tracker.generateReport();
      expect(report.indexOf('Metrics by Category') >= 0).assertTrue();
      expect(report.indexOf('Top 10 Slowest') >= 0).assertTrue();
      expect(report.indexOf('slow-op') >= 0).assertTrue();
      done();
    });

    // ==================== clear (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_2900
     * @tc.name: testClear0029
     * @tc.desc: Verify clear resets all metrics and active timers.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testClear0029', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.startTimer('running');
      expect(tracker.getMetricCount()).assertEqual(1);
      expect(tracker.getActiveTimerCount()).assertEqual(1);
      tracker.clear();
      expect(tracker.getMetricCount()).assertEqual(0);
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetrics().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_3000
     * @tc.name: testClear0030
     * @tc.desc: Verify tracker works normally after clear.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testClear0030', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.clear();
      tracker.recordMetric('b', 20);
      const metrics: PerformanceMetric[] = tracker.getMetrics();
      expect(metrics.length).assertEqual(1);
      expect(metrics[0].name).assertEqual('b');
      expect(metrics[0].duration).assertEqual(20);
      done();
    });

    // ==================== getMetricCount (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_3100
     * @tc.name: testGetMetricCount0031
     * @tc.desc: Verify getMetricCount returns zero initially.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricCount0031', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      expect(tracker.getMetricCount()).assertEqual(0);
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetrics().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_3200
     * @tc.name: testGetMetricCount0032
     * @tc.desc: Verify getMetricCount increments with each recorded metric.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricCount0032', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 20);
      tracker.startTimer('c');
      tracker.stopTimer('c');
      expect(tracker.getMetricCount()).assertEqual(3);
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetrics().length).assertEqual(3);
      done();
    });

    // ==================== getActiveTimerCount (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_3300
     * @tc.name: testGetActiveTimerCount0033
     * @tc.desc: Verify getActiveTimerCount tracks started but not stopped timers.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetActiveTimerCount0033', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('t1');
      tracker.startTimer('t2');
      expect(tracker.getActiveTimerCount()).assertEqual(2);
      tracker.stopTimer('t1');
      expect(tracker.getActiveTimerCount()).assertEqual(1);
      tracker.stopTimer('t2');
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_3400
     * @tc.name: testGetActiveTimerCount0034
     * @tc.desc: Verify getActiveTimerCount handles duplicate timer names.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetActiveTimerCount0034', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.startTimer('dup');
      tracker.startTimer('dup');
      expect(tracker.getActiveTimerCount()).assertEqual(1);
      tracker.stopTimer('dup');
      expect(tracker.getActiveTimerCount()).assertEqual(0);
      expect(tracker.getMetricCount()).assertEqual(1);
      done();
    });

    // ==================== summarize with percentiles (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_3500
     * @tc.name: testSummarizePercentiles0035
     * @tc.desc: Verify summarize calculates median and percentile values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarizePercentiles0035', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10);
      tracker.recordMetric('b', 20);
      tracker.recordMetric('c', 30);
      tracker.recordMetric('d', 40);
      tracker.recordMetric('e', 50);
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(5);
      expect(summary.medianDuration >= 10).assertTrue();
      expect(summary.p90Duration >= 10).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_PERF_3600
     * @tc.name: testSummarizePercentiles0036
     * @tc.desc: Verify summarize slowestMetrics is limited to top 10.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarizePercentiles0036', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      for (let i: number = 0; i < 15; i++) {
        tracker.recordMetric('m' + i, (i + 1) * 10);
      }
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(15);
      expect(summary.slowestMetrics.length).assertEqual(10);
      expect(summary.slowestMetrics[0].duration).assertLarger(0);
      done();
    });

    // ==================== summarize with categories (2 用例) ====================

    /*
     * @tc.number: SUB_PERF_3700
     * @tc.name: testSummarizeCategory0037
     * @tc.desc: Verify summarize metricsByCategory counts correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarizeCategory0037', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      tracker.recordMetric('a', 10, 'network');
      tracker.recordMetric('b', 20, 'network');
      tracker.recordMetric('c', 30, 'compute');
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(3);
      const networkCount: number | undefined = summary.metricsByCategory.get('network');
      expect(networkCount).assertEqual(2);
      expect(summary.metricsByCategory.size).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_PERF_3800
     * @tc.name: testSummarizeCategory0038
     * @tc.desc: Verify summarize metricsByCategory is empty when no metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarizeCategory0038', 0, async (done: Function) => {
      const tracker: PerformanceTracker = new PerformanceTracker();
      const summary: PerformanceSummary = tracker.summarize();
      expect(summary.totalMetrics).assertEqual(0);
      expect(summary.metricsByCategory.size).assertEqual(0);
      expect(summary.slowestMetrics.length).assertEqual(0);
      done();
    });
  });
}
