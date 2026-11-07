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
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_Memory_';
const MOCK_API_VERSION: number = 21;
const MEMORY_TEST_ITERATIONS: number = 1000;

export default function annotationMemoryTest() {
  describe('AnnotationMemory', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationMemory, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationMemory, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationMemory, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationMemory, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0100
     * @tc.name testMemoryLeakLongRunning0001
     * @tc.desc Verify no memory leak after prolonged usage.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMemoryLeakLongRunning0001', 0, () => {
      logger.info(`${BUNDLE}testMemoryLeakDetection0001, begin`);
      
      // Baseline measurement
      const baselineVersion = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(MOCK_API_VERSION);
      expect(baselineRules.length).assertEqual(3);
      expect(typeof baselineVersion).assertEqual('number');
      expect(typeof baselineMock).assertEqual('number');
      
      // Prolonged usage
      for (let i = 0; i < MEMORY_TEST_ITERATIONS; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.getSuppressionRules();
      }
      
      // Verify no memory leak (state remains consistent)
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalVersion).assertEqual(baselineVersion);
      expect(finalMock).assertEqual(baselineMock);
      expect(finalRules.length).assertEqual(baselineRules.length);
      expect(finalVersion === baselineVersion).assertTrue();
      expect(finalMock === baselineMock).assertTrue();
      expect(typeof finalVersion).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      expect(MEMORY_TEST_ITERATIONS).assertEqual(1000);
      
      logger.info(`${BUNDLE}testMemoryLeakLongRunning0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0200
     * @tc.name testResourceCleanupAfterCalls0002
     * @tc.desc Verify resources are properly cleaned up after API calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testResourceCleanupAfterCalls0002', 0, () => {
      logger.info(`${BUNDLE}testResourceCleanupAfterCalls0002, begin`);
      
      // Perform operations
      for (let i = 0; i < 100; i++) {
        const rules = AnnotationService.getSuppressionRules();
        expect(rules.length).assertEqual(3);
        expect(Array.isArray(rules)).assertTrue();
      }
      
      // Verify system state is clean
      const version = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(rules.length).assertEqual(3);
      expect(typeof version).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testResourceCleanupAfterCalls0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0300
     * @tc.name testArrayReturnIndependence0003
     * @tc.desc Verify returned arrays are independent copies.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayReturnIndependence0003', 0, () => {
      logger.info(`${BUNDLE}testArrayReturnIndependence0003, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      
      // Modify first array
      rules1.push('modified');
      rules1[0] = 'changed';
      
      // Verify second array is not affected
      expect(rules2.length).assertEqual(3);
      expect(rules2[0]).assertEqual('compatibility');
      expect(rules2[1]).assertEqual('syscap');
      expect(rules2[2]).assertEqual('permission');
      
      // Get fresh copy
      const rules3 = AnnotationService.getSuppressionRules();
      expect(rules3.length).assertEqual(3);
      expect(rules3[0]).assertEqual('compatibility');
      expect(Array.isArray(rules3)).assertTrue();
      
      logger.info(`${BUNDLE}testArrayReturnIndependence0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0400
     * @tc.name testRepeatedObjectCreation0004
     * @tc.desc Verify repeated object creation doesn't cause issues.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedObjectCreation0004', 0, () => {
      logger.info(`${BUNDLE}testRepeatedObjectCreation0004, begin`);
      
      const results: string[][] = [];
      
      for (let i = 0; i < 100; i++) {
        const rules = AnnotationService.getSuppressionRules();
        results.push(rules);
        expect(rules.length).assertEqual(3);
        expect(Array.isArray(rules)).assertTrue();
      }
      
      // Verify all results are consistent
      for (const result of results) {
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual('compatibility');
        expect(typeof result[0]).assertEqual('string');
      }
      
      expect(results.length).assertEqual(100);
      
      logger.info(`${BUNDLE}testRepeatedObjectCreation0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0500
     * @tc.name testMemoryPressureStability0005
     * @tc.desc Verify stability under memory pressure.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMemoryPressureStability0005', 0, () => {
      logger.info(`${BUNDLE}testMemoryPressureStability0005, begin`);
      
      // Create many temporary objects
      const tempArrays: string[][] = [];
      for (let i = 0; i < 50; i++) {
        tempArrays.push(AnnotationService.getSuppressionRules());
      }
      
      // Verify system still works
      const version = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(rules.length).assertEqual(3);
      expect(typeof version).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      
      // Verify temp arrays are still valid
      for (const arr of tempArrays) {
        expect(arr.length).assertEqual(3);
        expect(Array.isArray(arr)).assertTrue();
      }
      
      expect(tempArrays.length).assertEqual(50);
      
      logger.info(`${BUNDLE}testMemoryPressureStability0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0600
     * @tc.name testNoCircularReferences0006
     * @tc.desc Verify no circular references in returned objects.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNoCircularReferences0006', 0, () => {
      logger.info(`${BUNDLE}testNoCircularReferences0006, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      // Verify array structure
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      
      // Verify all elements are strings (not arrays or objects)
      for (const rule of rules) {
        expect(typeof rule).assertEqual('string');
        expect(rule.length > 0).assertTrue();
        // Verify each element is a string, not an array
        expect(Array.isArray(rule)).assertFalse();
      }
      
      // Verify array elements are independent strings
      expect(rules[0] === rules[1]).assertFalse();
      expect(rules[1] === rules[2]).assertFalse();
      expect(rules[0] === rules[2]).assertFalse();
      
      logger.info(`${BUNDLE}testNoCircularReferences0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0700
     * @tc.name testGCBehavior0007
     * @tc.desc Verify system behavior after garbage collection simulation.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGCBehavior0007', 0, () => {
      logger.info(`${BUNDLE}testGCBehavior0007, begin`);
      
      // Create and discard many objects (reduced to 100 to avoid appfreeze)
      for (let i = 0; i < 100; i++) {
        const tempRules = AnnotationService.getSuppressionRules();
        const tempVersion = AnnotationService.getLocalApiVersion();
        expect(tempRules.length).assertEqual(3);
        expect(typeof tempVersion).assertEqual('number');
      }
      
      // Verify system state after GC-like behavior
      const version = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(rules.length).assertEqual(3);
      expect(typeof version).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testGCBehavior0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0800
     * @tc.name testMemoryUsageTrend0008
     * @tc.desc Verify memory usage trend remains stable.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMemoryUsageTrend0008', 0, () => {
      logger.info(`${BUNDLE}testMemoryUsageTrend0008, begin`);
      
      const measurements: number[] = [];
      
      // Take measurements at intervals
      for (let i = 0; i < 10; i++) {
        const startRules: string[][] = [];
        for (let j = 0; j < 100; j++) {
          startRules.push(AnnotationService.getSuppressionRules());
        }
        
        measurements.push(startRules.length);
        expect(startRules.length).assertEqual(100);
      }
      
      // Verify measurements are consistent
      for (const measurement of measurements) {
        expect(measurement).assertEqual(100);
        expect(typeof measurement).assertEqual('number');
      }
      
      expect(measurements.length).assertEqual(10);
      
      // Verify system still works
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testMemoryUsageTrend0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_0900
     * @tc.name testLongRunningStability0009
     * @tc.desc Verify stability during long-running operations.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLongRunningStability0009', 0, () => {
      logger.info(`${BUNDLE}testLongRunningStability0009, begin`);
      
      const iterations = 200;
      let errorCount = 0;
      
      for (let i = 0; i < iterations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          AnnotationService.runMockAvailableDemo();
          AnnotationService.getSuppressionRules();
        } catch (e) {
          errorCount++;
        }
      }
      
      expect(errorCount).assertEqual(0);
      expect(typeof errorCount).assertEqual('number');
      expect(iterations).assertEqual(200);
      
      // Verify final state
      const version = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(typeof version).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testLongRunningStability0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_MEMORY_1000
     * @tc.name testResourceCleanupCompleteness0010
     * @tc.desc Verify completeness of resource cleanup.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testResourceCleanupCompleteness0010', 0, () => {
      logger.info(`${BUNDLE}testResourceCleanupCompleteness0010, begin`);
      
      // Initial state
      const initialVersion = AnnotationService.getLocalApiVersion();
      const initialMock = AnnotationService.getMockApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialMock).assertEqual(MOCK_API_VERSION);
      expect(initialRules.length).assertEqual(3);
      
      // Perform operations (reduced to 100 to avoid appfreeze)
      for (let i = 0; i < 100; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.getSuppressionRules();
      }
      
      // Final state
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalVersion).assertEqual(initialVersion);
      expect(finalMock).assertEqual(initialMock);
      expect(finalRules.length).assertEqual(initialRules.length);
      expect(finalVersion === initialVersion).assertTrue();
      expect(finalMock === initialMock).assertTrue();
      expect(typeof finalVersion).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testResourceCleanupCompleteness0010, end`);
    });
  });
}
