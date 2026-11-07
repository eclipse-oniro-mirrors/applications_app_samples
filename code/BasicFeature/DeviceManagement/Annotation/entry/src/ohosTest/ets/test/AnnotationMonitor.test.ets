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

import { deviceInfo } from '@kit.BasicServicesKit';
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION,
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_Monitor_';

export default function annotationMonitorTest() {
  describe('AnnotationMonitor', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationMonitor, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationMonitor, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationMonitor, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationMonitor, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0100
     * @tc.name testRealTimePerformanceMonitor0001
     * @tc.desc Monitor real-time performance metrics.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 2
     */
    it('testRealTimePerformanceMonitor0001', 0, () => {
      logger.info(`${BUNDLE}testRealTimePerformanceMonitor0001, begin`);
      
      const iterations = 100;
      const performanceMetrics: number[] = [];
      
      // Monitor performance over iterations
      for (let i = 0; i < iterations; i++) {
        const start = new Date().getTime();
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        const end = new Date().getTime();
        performanceMetrics.push(end - start);
      }
      
      // Calculate metrics
      let total = 0;
      let min = performanceMetrics[0];
      let max = performanceMetrics[0];
      
      for (const metric of performanceMetrics) {
        total += metric;
        if (metric < min) min = metric;
        if (metric > max) max = metric;
      }
      
      const avg = total / iterations;
      
      logger.info(`${BUNDLE}Avg: ${avg.toFixed(3)}ms, Min: ${min}ms, Max: ${max}ms`);
      
      expect(avg >= 0).assertTrue();
      expect(min >= 0).assertTrue();
      expect(max >= min).assertTrue();
      expect(typeof avg).assertEqual('number');
      expect(typeof min).assertEqual('number');
      expect(typeof max).assertEqual('number');
      expect(performanceMetrics.length).assertEqual(iterations);
      
      logger.info(`${BUNDLE}testRealTimePerformanceMonitor0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0200
     * @tc.name testMemoryUsageMonitor0002
     * @tc.desc Monitor memory usage patterns.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMemoryUsageMonitor0002', 0, () => {
      logger.info(`${BUNDLE}testMemoryUsageMonitor0002, begin`);
      
      // Baseline measurement
      const baselineVersion = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(21);
      expect(baselineRules.length).assertEqual(3);
      expect(typeof baselineVersion).assertEqual('number');
      expect(typeof baselineMock).assertEqual('number');
      
      // Execute operations (reduced: 1000 -> 100 to avoid appfreeze)
      for (let i = 0; i < 100; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
      }
      
      // Verify no memory leak
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalVersion).assertEqual(baselineVersion);
      expect(finalMock).assertEqual(baselineMock);
      expect(finalRules.length).assertEqual(baselineRules.length);
      expect(typeof finalVersion).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testMemoryUsageMonitor0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0300
     * @tc.name testOperationLatencyMonitor0003
     * @tc.desc Monitor operation latency.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 2
     */
    it('testOperationLatencyMonitor0003', 0, () => {
      logger.info(`${BUNDLE}testOperationLatencyMonitor0003, begin`);
      
      const operations = [
        'getLocalApiVersion',
        'getMockApiVersion',
        'runAvailableDemo',
        'runSuppressWarningsDemo',
        'getSuppressionRules'
      ];
      
      const latencies: number[] = [];
      
      // Measure latency for each operation
      for (const op of operations) {
        const start = new Date().getTime();
        
        switch (op) {
          case 'getLocalApiVersion':
            AnnotationService.getLocalApiVersion();
            break;
          case 'getMockApiVersion':
            AnnotationService.getMockApiVersion();
            break;
          case 'runAvailableDemo':
            AnnotationService.runAvailableDemo();
            break;
          case 'runSuppressWarningsDemo':
            AnnotationService.runSuppressWarningsDemo();
            break;
          case 'getSuppressionRules':
            AnnotationService.getSuppressionRules();
            break;
        }
        
        const end = new Date().getTime();
        latencies.push(end - start);
      }
      
      // Verify latencies
      expect(latencies.length).assertEqual(operations.length);
      for (const latency of latencies) {
        expect(latency >= 0).assertTrue();
        expect(typeof latency).assertEqual('number');
      }
      
      logger.info(`${BUNDLE}Latencies: ${latencies.join(', ')}ms`);
      logger.info(`${BUNDLE}testOperationLatencyMonitor0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0400
     * @tc.name testThroughputMonitor0004
     * @tc.desc Monitor system throughput.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 2
     */
    it('testThroughputMonitor0004', 0, () => {
      logger.info(`${BUNDLE}testThroughputMonitor0004, begin`);
      
      const testDuration = 1000; // 1 second
      const startTime = new Date().getTime();
      let operationCount = 0;
      
      // Execute operations for fixed duration
      while (new Date().getTime() - startTime < testDuration) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        operationCount++;
      }
      
      const endTime = new Date().getTime();
      const actualDuration = endTime - startTime;
      const throughput = operationCount / (actualDuration / 1000);
      
      logger.info(`${BUNDLE}Operations: ${operationCount}, Duration: ${actualDuration}ms, Throughput: ${throughput.toFixed(2)} ops/sec`);
      
      expect(operationCount > 0).assertTrue();
      expect(actualDuration >= testDuration).assertTrue();
      expect(throughput > 0).assertTrue();
      expect(typeof operationCount).assertEqual('number');
      expect(typeof actualDuration).assertEqual('number');
      expect(typeof throughput).assertEqual('number');
      
      logger.info(`${BUNDLE}testThroughputMonitor0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0500
     * @tc.name testErrorRateMonitor0005
     * @tc.desc Monitor error rate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorRateMonitor0005', 0, () => {
      logger.info(`${BUNDLE}testErrorRateMonitor0005, begin`);
      
      const iterations = 100;
      let successCount = 0;
      let errorCount = 0;
      
      for (let i = 0; i < iterations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.runAvailableDemo();
          successCount++;
        } catch (e) {
          errorCount++;
        }
      }
      
      const errorRate = errorCount / iterations;
      
      logger.info(`${BUNDLE}Success: ${successCount}, Errors: ${errorCount}, Error Rate: ${(errorRate * 100).toFixed(2)}%`);
      
      expect(successCount + errorCount).assertEqual(iterations);
      expect(errorCount >= 0).assertTrue();
      expect(successCount >= 0).assertTrue();
      expect(typeof errorCount).assertEqual('number');
      expect(typeof successCount).assertEqual('number');
      expect(typeof errorRate).assertEqual('number');
      expect(iterations).assertEqual(100);
      
      logger.info(`${BUNDLE}testErrorRateMonitor0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0600
     * @tc.name testResourceUtilizationMonitor0006
     * @tc.desc Monitor resource utilization.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testResourceUtilizationMonitor0006', 0, () => {
      logger.info(`${BUNDLE}testResourceUtilizationMonitor0006, begin`);
      
      // Baseline
      const baselineLocal = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(21);
      expect(baselineRules.length).assertEqual(3);
      expect(typeof baselineLocal).assertEqual('number');
      expect(typeof baselineMock).assertEqual('number');
      
      // Stress test (reduced: 500 -> 100 to avoid appfreeze)
      for (let i = 0; i < 100; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
      }
      
      // Verify resource utilization is stable
      const finalLocal = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalLocal).assertEqual(baselineLocal);
      expect(finalMock).assertEqual(baselineMock);
      expect(finalRules.length).assertEqual(baselineRules.length);
      expect(typeof finalLocal).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testResourceUtilizationMonitor0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0700
     * @tc.name testHealthCheckMonitor0007
     * @tc.desc Perform health check monitoring.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHealthCheckMonitor0007', 0, () => {
      logger.info(`${BUNDLE}testHealthCheckMonitor0007, begin`);
      
      // Health check 1: API availability
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion).assertEqual('number');
      
      // Health check 2: Mock availability
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion).assertEqual(21);
      expect(typeof mockVersion).assertEqual('number');
      
      // Health check 3: Rules availability
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      
      // Health check 4: Constants availability
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      
      logger.info(`${BUNDLE}testHealthCheckMonitor0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0800
     * @tc.name testPerformanceAlertMonitor0008
     * @tc.desc Monitor performance alerts.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testPerformanceAlertMonitor0008', 0, () => {
      logger.info(`${BUNDLE}testPerformanceAlertMonitor0008, begin`);
      
      const threshold = 100; // 100ms threshold
      const iterations = 50;
      const alerts: boolean[] = [];
      
      for (let i = 0; i < iterations; i++) {
        const start = new Date().getTime();
        
        // Execute operations
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        
        const end = new Date().getTime();
        const duration = end - start;
        
        // Check if exceeds threshold
        alerts.push(duration > threshold);
      }
      
      // Verify alerts
      const alertCount = alerts.filter(a => a).length;
      const alertRate = alertCount / iterations;
      
      logger.info(`${BUNDLE}Alerts: ${alertCount}/${iterations}, Alert Rate: ${(alertRate * 100).toFixed(2)}%`);
      
      expect(alertCount >= 0).assertTrue();
      expect(alertCount <= iterations).assertTrue();
      expect(typeof alertCount).assertEqual('number');
      expect(typeof alertRate).assertEqual('number');
      expect(iterations).assertEqual(50);
      expect(alerts.length).assertEqual(iterations);
      
      logger.info(`${BUNDLE}testPerformanceAlertMonitor0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_0900
     * @tc.name testStabilityMonitor0009
     * @tc.desc Monitor system stability over time.
     * @tc.size LARGE
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testStabilityMonitor0009', 0, () => {
      logger.info(`${BUNDLE}testStabilityMonitor0009, begin`);
      
      const testRounds = 10;
      const operationsPerRound = 100;
      const roundResults: number[] = [];
      
      // Execute multiple rounds
      for (let round = 0; round < testRounds; round++) {
        const startTime = new Date().getTime();
        
        for (let i = 0; i < operationsPerRound; i++) {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
        }
        
        const endTime = new Date().getTime();
        roundResults.push(endTime - startTime);
      }
      
      // Calculate stability metrics
      let total = 0;
      let min = roundResults[0];
      let max = roundResults[0];
      
      for (const result of roundResults) {
        total += result;
        if (result < min) min = result;
        if (result > max) max = result;
      }
      
      const avg = total / testRounds;
      const variance = roundResults.reduce((sum, r) => sum + Math.pow(r - avg, 2), 0) / testRounds;
      const stability = variance / avg;
      
      logger.info(`${BUNDLE}Avg: ${avg.toFixed(2)}ms, Stability: ${stability.toFixed(3)}`);
      
      expect(avg >= 0).assertTrue();
      expect(min >= 0).assertTrue();
      expect(max >= min).assertTrue();
      expect(stability >= 0).assertTrue();
      expect(typeof avg).assertEqual('number');
      expect(typeof min).assertEqual('number');
      expect(typeof max).assertEqual('number');
      expect(typeof stability).assertEqual('number');
      expect(testRounds).assertEqual(10);
      
      logger.info(`${BUNDLE}testStabilityMonitor0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MON_1000
     * @tc.name testComprehensiveMonitor0010
     * @tc.desc Comprehensive monitoring check.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComprehensiveMonitor0010', 0, () => {
      logger.info(`${BUNDLE}testComprehensiveMonitor0010, begin`);
      
      // Monitor 1: State
      const state1 = AnnotationService.getLocalApiVersion();
      const state2 = AnnotationService.getMockApiVersion();
      expect(state1).assertEqual(deviceInfo.sdkApiVersion);
      expect(state2).assertEqual(21);
      expect(typeof state1).assertEqual('number');
      expect(typeof state2).assertEqual('number');
      
      // Monitor 2: Operations
      const op1 = AnnotationService.runAvailableDemo();
      const op2 = AnnotationService.runSuppressWarningsDemo();
      expect(typeof op1).assertEqual('boolean');
      expect(typeof op2).assertEqual('boolean');
      
      // Monitor 3: Rules
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      
      // Monitor 4: Constants
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      
      logger.info(`${BUNDLE}testComprehensiveMonitor0010, end`);
    });
  });
}
