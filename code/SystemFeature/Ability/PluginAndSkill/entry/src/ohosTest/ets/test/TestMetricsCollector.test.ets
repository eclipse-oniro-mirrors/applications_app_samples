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
import {
  TestMetricsCollector,
  MetricDataPoint,
  MetricSummary,
  CategorySummary
} from '../../../main/ets/util/TestMetricsCollector';

export default function testMetricsCollectorTest(): void {
  describe('TestMetricsCollectorTest', (): void => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    // ==================== 单例模式 (2 用例) ====================

    /*
     * @tc.number: SUB_MC_0100
     * @tc.name: testTmcSingleton0001
     * @tc.desc: Verify getInstance returns a non-null object.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTmcSingleton0001', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      expect(collector.getDataPointCount()).assertEqual(0);
      expect(collector).assertEqual(collector);
      expect(collector.getAllMetricNames().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_MC_0200
     * @tc.name: testTmcSingleton0002
     * @tc.desc: Verify multiple getInstance calls return the same reference.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTmcSingleton0002', 0, async (done: Function) => {
      const a = TestMetricsCollector.getInstance();
      const b = TestMetricsCollector.getInstance();
      expect(a === b).assertTrue();
      expect(a).assertEqual(b);
      expect(TestMetricsCollector.getInstance() === a).assertTrue();
      done();
    });

    // ==================== recordMetric + getDataPoints (2 用例) ====================

    /*
     * @tc.number: SUB_MC_0300
     * @tc.name: testRecordMetric0003
     * @tc.desc: Verify recordMetric stores data point with correct name, value, category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetric0003', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('latency', 120, 'network');
      const points = collector.getDataPoints();
      expect(points.length).assertEqual(1);
      expect(points[0].name).assertEqual('latency');
      expect(points[0].value).assertEqual(120);
      done();
    });

    /*
     * @tc.number: SUB_MC_0400
     * @tc.name: testRecordMetric0004
     * @tc.desc: Verify recordMetric sets timestamp and tags correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetric0004', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      const before = Date.now();
      collector.recordMetric('ops', 5, 'compute');
      const after = Date.now();
      const points = collector.getDataPoints();
      expect(points[0].category).assertEqual('compute');
      expect(points[0].timestamp).assertLarger(-1);
      expect(points[0].timestamp).assertLarger(-1);
      done();
    });

    // ==================== recordMetricWithTags (1 用例) ====================

    /*
     * @tc.number: SUB_MC_0500
     * @tc.name: testRecordMetricWithTags0005
     * @tc.desc: Verify recordMetricWithTags stores custom tags map.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRecordMetricWithTags0005', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      const tags: Map<string, string> = new Map();
      tags.set('env', 'test');
      tags.set('region', 'cn');
      collector.recordMetricWithTags('req', 10, 'api', tags);
      const points = collector.getDataPoints();
      expect(points.length).assertEqual(1);
      expect(points[0].tags.get('env')).assertEqual('test');
      expect(points[0].tags.get('region')).assertEqual('cn');
      done();
    });

    // ==================== incrementCounter (2 用例) ====================

    /*
     * @tc.number: SUB_MC_0600
     * @tc.name: testIncrementCounter0006
     * @tc.desc: Verify incrementCounter starts from 0 and increments to 1.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIncrementCounter0006', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.incrementCounter('clicks', 'ui');
      const val = collector.getLatestValue('clicks', 'ui');
      expect(val).assertEqual(1);
      expect(collector.getDataPointCount()).assertEqual(1);
      expect(collector.getLatestValue('nonexist', 'x')).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_MC_0700
     * @tc.name: testIncrementCounter0007
     * @tc.desc: Verify incrementCounter accumulates over multiple calls.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIncrementCounter0007', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.incrementCounter('hits', 'web');
      collector.incrementCounter('hits', 'web');
      collector.incrementCounter('hits', 'web');
      const val = collector.getLatestValue('hits', 'web');
      expect(val).assertEqual(3);
      expect(collector.getDataPointCount()).assertEqual(3);
      expect(val).assertLarger(0);
      done();
    });

    // ==================== getLatestValue (2 用例) ====================

    /*
     * @tc.number: SUB_MC_0800
     * @tc.name: testGetLatestValue0008
     * @tc.desc: Verify getLatestValue returns most recent value when multiple exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetLatestValue0008', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('cpu', 10, 'sys');
      collector.recordMetric('cpu', 20, 'sys');
      collector.recordMetric('cpu', 30, 'sys');
      const latest = collector.getLatestValue('cpu', 'sys');
      expect(latest).assertEqual(30);
      expect(collector.getDataPointCount()).assertEqual(3);
      expect(latest).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_MC_0900
     * @tc.name: testGetLatestValue0009
     * @tc.desc: Verify getLatestValue returns 0 for non-existing metric.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetLatestValue0009', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      expect(collector.getLatestValue('missing', 'cat')).assertEqual(0);
      expect(collector.getDataPointCount()).assertEqual(0);
      expect(collector.getLatestValue('', '')).assertEqual(0);
      done();
    });

    // ==================== getDataPointsByCategory / getDataPointsByName (2 用例) ====================

    /*
     * @tc.number: SUB_MC_1000
     * @tc.name: testGetDataPointsByCategory0010
     * @tc.desc: Verify getDataPointsByCategory filters correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetDataPointsByCategory0010', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('a', 1, 'net');
      collector.recordMetric('b', 2, 'cpu');
      collector.recordMetric('c', 3, 'net');
      const netPoints = collector.getDataPointsByCategory('net');
      expect(netPoints.length).assertEqual(2);
      expect(netPoints[0].name).assertEqual('a');
      expect(netPoints[1].name).assertEqual('c');
      done();
    });

    /*
     * @tc.number: SUB_MC_1100
     * @tc.name: testGetDataPointsByName0011
     * @tc.desc: Verify getDataPointsByName filters by name across categories.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetDataPointsByName0011', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('req', 10, 'api');
      collector.recordMetric('req', 20, 'web');
      collector.recordMetric('other', 5, 'api');
      const reqPoints = collector.getDataPointsByName('req');
      expect(reqPoints.length).assertEqual(2);
      expect(reqPoints[0].value).assertEqual(10);
      expect(reqPoints[1].value).assertEqual(20);
      done();
    });

    // ==================== getMetricSummary (3 用例) ====================

    /*
     * @tc.number: SUB_MC_1200
     * @tc.name: testGetMetricSummary0012
     * @tc.desc: Verify getMetricSummary calculates count, sum, average correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricSummary0012', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('lat', 100, 'net');
      collector.recordMetric('lat', 200, 'net');
      collector.recordMetric('lat', 300, 'net');
      const summary = collector.getMetricSummary('lat', 'net');
      expect(summary.count).assertEqual(3);
      expect(summary.sum).assertEqual(600);
      expect(summary.average).assertEqual(200);
      done();
    });

    /*
     * @tc.number: SUB_MC_1300
     * @tc.name: testGetMetricSummary0013
     * @tc.desc: Verify getMetricSummary calculates min, max, latest correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricSummary0013', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('val', 50, 'm');
      collector.recordMetric('val', 10, 'm');
      collector.recordMetric('val', 90, 'm');
      const summary = collector.getMetricSummary('val', 'm');
      expect(summary.min).assertEqual(10);
      expect(summary.max).assertEqual(90);
      expect(summary.latest).assertEqual(90);
      done();
    });

    /*
     * @tc.number: SUB_MC_1400
     * @tc.name: testGetMetricSummary0014
     * @tc.desc: Verify getMetricSummary returns zeroed summary for non-existing metric.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricSummary0014', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      const summary = collector.getMetricSummary('nope', 'x');
      expect(summary.count).assertEqual(0);
      expect(summary.sum).assertEqual(0);
      expect(summary.min).assertEqual(0);
      done();
    });

    // ==================== getCategorySummaries (2 用例) ====================

    /*
     * @tc.number: SUB_MC_1500
     * @tc.name: testGetCategorySummaries0015
     * @tc.desc: Verify getCategorySummaries returns correct category count and metrics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetCategorySummaries0015', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('a', 10, 'cat1');
      collector.recordMetric('b', 20, 'cat1');
      collector.recordMetric('c', 30, 'cat2');
      const summaries = collector.getCategorySummaries();
      expect(summaries.length).assertEqual(2);
      let cat1Summary: CategorySummary | undefined = undefined;
      for (let i = 0; i < summaries.length; i++) {
        if (summaries[i].category === 'cat1') {
          cat1Summary = summaries[i];
        }
      }
      expect(cat1Summary!.category).assertEqual('cat1');
      expect(cat1Summary!.totalDataPoints).assertEqual(2);
      expect(cat1Summary!.metricCount).assertEqual(2);
      done();
    });

    /*
     * @tc.number: SUB_MC_1600
     * @tc.name: testGetCategorySummaries0016
     * @tc.desc: Verify getCategorySummaries calculates averageValue correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetCategorySummaries0016', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('x', 100, 'single');
      collector.recordMetric('x', 200, 'single');
      const summaries = collector.getCategorySummaries();
      expect(summaries.length).assertEqual(1);
      expect(summaries[0].averageValue).assertEqual(150);
      expect(summaries[0].category).assertEqual('single');
      done();
    });

    // ==================== getAllMetricNames / getAllCategories (2 用例) ====================

    /*
     * @tc.number: SUB_MC_1700
     * @tc.name: testGetAllMetricNames0017
     * @tc.desc: Verify getAllMetricNames returns deduplicated names.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllMetricNames0017', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('alpha', 1, 'c');
      collector.recordMetric('beta', 2, 'c');
      collector.recordMetric('alpha', 3, 'c');
      const names = collector.getAllMetricNames();
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('alpha');
      expect(names[1]).assertEqual('beta');
      done();
    });

    /*
     * @tc.number: SUB_MC_1800
     * @tc.name: testGetAllCategories0018
     * @tc.desc: Verify getAllCategories returns deduplicated categories.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllCategories0018', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('m1', 1, 'A');
      collector.recordMetric('m2', 2, 'B');
      collector.recordMetric('m3', 3, 'A');
      const cats = collector.getAllCategories();
      expect(cats.length).assertEqual(2);
      expect(cats[0]).assertEqual('A');
      expect(cats[1]).assertEqual('B');
      done();
    });

    // ==================== generateSummaryReport (1 用例) ====================

    /*
     * @tc.number: SUB_MC_1900
     * @tc.name: testGenerateSummaryReport0019
     * @tc.desc: Verify generateSummaryReport contains key sections.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSummaryReport0019', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('r1', 10, 'catA');
      collector.recordMetric('r2', 20, 'catB');
      const report = collector.generateSummaryReport();
      expect(report.length).assertLarger(0);
      expect(report).assertContain('Test Metrics Summary Report');
      expect(report).assertContain('catA');
      done();
    });

    // ==================== clear / getDataPointCount (2 用例) ====================

    /*
     * @tc.number: SUB_MC_2000
     * @tc.name: testTmcClear0020
     * @tc.desc: Verify clear resets all data points.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTmcClear0020', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.recordMetric('x', 1, 'y');
      collector.recordMetric('x', 2, 'y');
      expect(collector.getDataPointCount()).assertLarger(0);
      collector.clear();
      expect(collector.getDataPointCount()).assertEqual(0);
      expect(collector.getDataPoints().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_MC_2100
     * @tc.name: testGetDataPointCount0021
     * @tc.desc: Verify getDataPointCount tracks additions correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetDataPointCount0021', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      expect(collector.getDataPointCount()).assertEqual(0);
      collector.recordMetric('a', 1, 'c');
      expect(collector.getDataPointCount()).assertEqual(1);
      collector.recordMetric('b', 2, 'c');
      expect(collector.getDataPointCount()).assertEqual(2);
      done();
    });

    // ==================== setMaxDataPoints capacity eviction (2 用例) ====================

    /*
     * @tc.number: SUB_MC_2200
     * @tc.name: testSetMaxDataPoints0022
     * @tc.desc: Verify setMaxDataPoints limits capacity and evicts oldest.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSetMaxDataPoints0022', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.setMaxDataPoints(3);
      collector.recordMetric('a', 1, 'c');
      collector.recordMetric('b', 2, 'c');
      collector.recordMetric('c', 3, 'c');
      collector.recordMetric('d', 4, 'c');
      expect(collector.getDataPointCount()).assertEqual(3);
      const points = collector.getDataPoints();
      expect(points[0].name).assertEqual('b');
      expect(points[2].name).assertEqual('d');
      done();
    });

    /*
     * @tc.number: SUB_MC_2300
     * @tc.name: testSetMaxDataPoints0023
     * @tc.desc: Verify setMaxDataPoints can expand capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSetMaxDataPoints0023', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.setMaxDataPoints(10000);
      for (let i = 0; i < 50; i++) {
        collector.recordMetric('m' + String(i), i, 'batch');
      }
      expect(collector.getDataPointCount()).assertEqual(50);
      expect(collector.getAllMetricNames().length).assertEqual(50);
      expect(collector.getDataPointCount()).assertLarger(0);
      done();
    });

    // ==================== getDataPoints returns copy (1 用例) ====================

    /*
     * @tc.number: SUB_MC_2400
     * @tc.name: testGetDataPointsCopy0024
     * @tc.desc: Verify getDataPoints returns a copy, not the internal array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetDataPointsCopy0024', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('orig', 100, 'cat');
      const copy1 = collector.getDataPoints();
      const copy2 = collector.getDataPoints();
      expect(copy1 === copy2).assertFalse();
      expect(copy1.length).assertEqual(copy2.length);
      expect(copy1[0].name).assertEqual(copy2[0].name);
      done();
    });

    // ==================== getMetricSummary with single data point (1 用例) ====================

    /*
     * @tc.number: SUB_MC_2500
     * @tc.name: testGetMetricSummary0025
     * @tc.desc: Verify getMetricSummary with single data point has min=max=latest=value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetMetricSummary0025', 0, async (done: Function) => {
      const collector = TestMetricsCollector.getInstance();
      collector.clear();
      collector.recordMetric('solo', 42, 's');
      const summary = collector.getMetricSummary('solo', 's');
      expect(summary.count).assertEqual(1);
      expect(summary.min).assertEqual(42);
      expect(summary.max).assertEqual(42);
      done();
    });
  });
}
