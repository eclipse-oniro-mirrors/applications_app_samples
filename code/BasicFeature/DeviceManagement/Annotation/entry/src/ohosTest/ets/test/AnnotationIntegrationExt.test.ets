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

const BUNDLE: string = 'Annotation_IntegrationExt_';

export default function annotationIntegrationExtTest() {
  describe('AnnotationIntegrationExt', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationIntegrationExt, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationIntegrationExt, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationIntegrationExt, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationIntegrationExt, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0100
     * @tc.name testCrossModuleDataFlow0001
     * @tc.desc Verify cross-module data flow integrity.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCrossModuleDataFlow0001', 0, () => {
      logger.info(`${BUNDLE}testCrossModuleDataFlow0001, begin`);
      
      // Module 1: Get version
      const version1 = AnnotationService.getLocalApiVersion();
      expect(version1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof version1).assertEqual('number');
      
      // Module 2: Use version for decision
      const result = AnnotationService.runAvailableDemo();
      const expected = version1 >= AVAILABLE_MIN_API_VERSION;
      expect(typeof result).assertEqual('boolean');
      expect(result).assertEqual(expected);
      
      // Module 3: Verify consistency
      const version2 = AnnotationService.getLocalApiVersion();
      expect(version2).assertEqual(version1);
      expect(version2 === version1).assertTrue();
      
      logger.info(`${BUNDLE}testCrossModuleDataFlow0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0200
     * @tc.name testMultiServiceCoordination0002
     * @tc.desc Verify multi-service coordination.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMultiServiceCoordination0002', 0, () => {
      logger.info(`${BUNDLE}testMultiServiceCoordination0002, begin`);
      
      // Coordinate local and mock services
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(localVersion !== mockVersion).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // Use both services
      const localResult = AnnotationService.runAvailableDemo();
      const mockResult = AnnotationService.runMockAvailableDemo();
      
      expect(typeof localResult).assertEqual('boolean');
      expect(mockResult).assertFalse();
      
      logger.info(`${BUNDLE}testMultiServiceCoordination0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0300
     * @tc.name testDataPropagation0003
     * @tc.desc Verify data propagation across operations.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataPropagation0003', 0, () => {
      logger.info(`${BUNDLE}testDataPropagation0003, begin`);
      
      // Initial data
      const rules1 = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules1)).assertTrue();
      expect(rules1.length).assertEqual(3);
      
      // Operations that might affect data
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      
      // Verify data propagation
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(rules1.length);
      expect(rules2[0]).assertEqual(rules1[0]);
      expect(typeof rules2[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testDataPropagation0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0400
     * @tc.name testEndToEndWorkflow0004
     * @tc.desc Verify end-to-end workflow.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndToEndWorkflow0004', 0, () => {
      logger.info(`${BUNDLE}testEndToEndWorkflow0004, begin`);
      
      // Step 1: Initialize
      const version = AnnotationService.getLocalApiVersion();
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof version).assertEqual('number');
      
      // Step 2: Check availability
      const isAvailable = AnnotationService.runAvailableDemo();
      expect(typeof isAvailable).assertEqual('boolean');
      
      // Step 3: Use suppress annotation
      const canSuppress = AnnotationService.runSuppressWarningsDemo();
      expect(typeof canSuppress).assertEqual('boolean');
      
      // Step 4: Verify rules
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      
      // Step 5: Final verification
      const finalVersion = AnnotationService.getLocalApiVersion();
      expect(finalVersion).assertEqual(version);
      expect(finalVersion === version).assertTrue();
      
      logger.info(`${BUNDLE}testEndToEndWorkflow0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0500
     * @tc.name testErrorPropagation0005
     * @tc.desc Verify error propagation handling.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorPropagation0005', 0, () => {
      logger.info(`${BUNDLE}testErrorPropagation0005, begin`);
      
      // Perform operations that should not throw
      let errorCount = 0;
      const operations = 10;
      
      for (let i = 0; i < operations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          AnnotationService.runSuppressWarningsDemo();
          AnnotationService.getSuppressionRules();
        } catch (e) {
          errorCount++;
        }
      }
      
      expect(errorCount).assertEqual(0);
      expect(typeof errorCount).assertEqual('number');
      expect(operations).assertEqual(10);
      
      logger.info(`${BUNDLE}testErrorPropagation0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0600
     * @tc.name testIntegrationConsistency0006
     * @tc.desc Verify integration consistency across multiple calls.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testIntegrationConsistency0006', 0, () => {
      logger.info(`${BUNDLE}testIntegrationConsistency0006, begin`);
      
      const iterations = 50;
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      const rulesCounts: number[] = [];
      
      // Collect snapshots
      for (let i = 0; i < iterations; i++) {
        localVersions.push(AnnotationService.getLocalApiVersion());
        mockVersions.push(AnnotationService.getMockApiVersion());
        rulesCounts.push(AnnotationService.getSuppressionRules().length);
      }
      
      // Verify consistency
      const firstLocal = localVersions[0];
      const firstMock = mockVersions[0];
      const firstRules = rulesCounts[0];
      let allConsistent = true;
      
      for (let i = 0; i < iterations; i++) {
        if (localVersions[i] !== firstLocal ||
            mockVersions[i] !== firstMock ||
            rulesCounts[i] !== firstRules) {
          allConsistent = false;
          break;
        }
      }
      
      expect(allConsistent).assertTrue();
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(firstRules).assertEqual(3);
      expect(localVersions.length).assertEqual(iterations);
      expect(mockVersions.length).assertEqual(iterations);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testIntegrationConsistency0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0700
     * @tc.name testModuleIsolation0007
     * @tc.desc Verify module isolation in integration.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testModuleIsolation0007', 0, () => {
      logger.info(`${BUNDLE}testModuleIsolation0007, begin`);
      
      // Test local module isolation
      const localBefore = AnnotationService.getLocalApiVersion();
      AnnotationService.runMockAvailableDemo();
      const localAfter = AnnotationService.getLocalApiVersion();
      
      expect(localBefore).assertEqual(localAfter);
      expect(localBefore === localAfter).assertTrue();
      expect(typeof localBefore).assertEqual('number');
      
      // Test mock module isolation
      const mockBefore = AnnotationService.getMockApiVersion();
      AnnotationService.runAvailableDemo();
      const mockAfter = AnnotationService.getMockApiVersion();
      
      expect(mockBefore).assertEqual(mockAfter);
      expect(mockBefore === mockAfter).assertTrue();
      expect(typeof mockBefore).assertEqual('number');
      
      logger.info(`${BUNDLE}testModuleIsolation0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTE_0800
     * @tc.name testIntegrationDataIntegrity0008
     * @tc.desc Verify integration data integrity.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testIntegrationDataIntegrity0008', 0, () => {
      logger.info(`${BUNDLE}testIntegrationDataIntegrity0008, begin`);
      
      // Capture baseline
      const baselineLocal = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(21);
      expect(baselineRules.length).assertEqual(3);
      
      // Integration operations
      const operations = 100;
      for (let i = 0; i < operations; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
        AnnotationService.getSuppressionRules();
      }
      
      // Verify integrity
      const finalLocal = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalLocal).assertEqual(baselineLocal);
      expect(finalMock).assertEqual(baselineMock);
      expect(finalRules.length).assertEqual(baselineRules.length);
      expect(finalLocal === baselineLocal).assertTrue();
      expect(finalMock === baselineMock).assertTrue();
      expect(typeof finalLocal).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testIntegrationDataIntegrity0008, end`);
    });
  });
}
