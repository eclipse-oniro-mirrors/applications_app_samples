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

const BUNDLE: string = 'Annotation_Integration_';

export default function annotationIntegrationTest() {
  describe('AnnotationIntegration', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationIntegration, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationIntegration, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationIntegration, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationIntegration, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0100
     * @tc.name testEndToEndWorkflow0001
     * @tc.desc Verify complete workflow from initialization to execution.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndToEndWorkflow0001', 0, () => {
      logger.info(`${BUNDLE}testEndToEndWorkflow0001, begin`);
      
      // Step 1: Verify initialization
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(typeof localVersion).assertEqual('number');
      
      // Step 2: Execute local demos
      const localAvailable = AnnotationService.runAvailableDemo();
      const localSuppress = AnnotationService.runSuppressWarningsDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(localAvailable).assertEqual(expectedAvailable);
      expect(localSuppress).assertEqual(expectedSuppress);
      expect(typeof localAvailable).assertEqual('boolean');
      
      // Step 3: Execute mock demos
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      expect(typeof mockAvailable).assertEqual('boolean');
      
      // Step 4: Verify rules
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules[0]).assertEqual('compatibility');
      
      // Step 5: Verify state consistency
      const finalLocalVersion = AnnotationService.getLocalApiVersion();
      const finalMockVersion = AnnotationService.getMockApiVersion();
      expect(finalLocalVersion).assertEqual(localVersion);
      expect(finalMockVersion).assertEqual(mockVersion);
      expect(finalLocalVersion === localVersion).assertTrue();
      
      logger.info(`${BUNDLE}testEndToEndWorkflow0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0200
     * @tc.name testCrossModuleIntegration0002
     * @tc.desc Verify integration between different service methods.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCrossModuleIntegration0002', 0, () => {
      logger.info(`${BUNDLE}testCrossModuleIntegration0002, begin`);
      
      // Test version methods integration
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(localVersion !== mockVersion).assertTrue();
      
      // Test demo methods integration
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(availableResult === expectedAvailable).assertTrue();
      
      // Test rules integration
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length).assertEqual(3);
      expect(rules.includes('compatibility')).assertTrue();
      expect(rules.includes('syscap')).assertTrue();
      expect(rules.includes('permission')).assertTrue();
      
      // Test cross-validation
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testCrossModuleIntegration0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0300
     * @tc.name testUserJourney0003
     * @tc.desc Simulate real user operation sequence.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUserJourney0003', 0, () => {
      logger.info(`${BUNDLE}testUserJourney0003, begin`);
      
      // User opens app - check initial state
      const initialVersion = AnnotationService.getLocalApiVersion();
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof initialVersion).assertEqual('number');
      expect(initialVersion > 0).assertTrue();
      
      // User clicks Available demo
      const availableResult = AnnotationService.runAvailableDemo();
      const expectedAvailable = initialVersion >= AVAILABLE_MIN_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(typeof availableResult).assertEqual('boolean');
      expect(availableResult === expectedAvailable).assertTrue();
      
      // User clicks SuppressWarnings demo
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedSuppress = initialVersion >= FUTURE_DEMO_API_VERSION;
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(typeof suppressResult).assertEqual('boolean');
      expect(suppressResult === expectedSuppress).assertTrue();
      
      // User switches to mock environment
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      expect(typeof mockAvailable).assertEqual('boolean');
      
      // User checks version info
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion).assertEqual(21);
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      
      // User refreshes - verify state reset
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules[0]).assertEqual('compatibility');
      
      // Final state verification
      const finalVersion = AnnotationService.getLocalApiVersion();
      expect(finalVersion).assertEqual(initialVersion);
      expect(finalVersion === initialVersion).assertTrue();
      
      logger.info(`${BUNDLE}testUserJourney0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0400
     * @tc.name testDataFlowIntegration0004
     * @tc.desc Verify data flow across different operations.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataFlowIntegration0004', 0, () => {
      logger.info(`${BUNDLE}testDataFlowIntegration0004, begin`);
      
      // Collect initial data
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(typeof localVersion).assertEqual('number');
      
      // Execute operations
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      
      // Verify data consistency
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      // Verify versions unchanged
      const finalLocalVersion = AnnotationService.getLocalApiVersion();
      const finalMockVersion = AnnotationService.getMockApiVersion();
      expect(finalLocalVersion).assertEqual(localVersion);
      expect(finalMockVersion).assertEqual(mockVersion);
      expect(finalLocalVersion === localVersion).assertTrue();
      
      logger.info(`${BUNDLE}testDataFlowIntegration0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0500
     * @tc.name testEnvironmentTransition0005
     * @tc.desc Verify smooth transitions between environments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEnvironmentTransition0005', 0, () => {
      logger.info(`${BUNDLE}testEnvironmentTransition0005, begin`);
      
      // Local environment
      const localResult1 = AnnotationService.runAvailableDemo();
      const localVersion1 = AnnotationService.getLocalApiVersion();
      expect(typeof localResult1).assertEqual('boolean');
      expect(typeof localVersion1).assertEqual('number');
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      
      // Transition to mock
      const mockResult1 = AnnotationService.runMockAvailableDemo();
      const mockVersion1 = AnnotationService.getMockApiVersion();
      expect(mockResult1).assertFalse();
      expect(mockVersion1).assertEqual(21);
      expect(typeof mockResult1).assertEqual('boolean');
      
      // Back to local
      const localResult2 = AnnotationService.runAvailableDemo();
      const localVersion2 = AnnotationService.getLocalApiVersion();
      expect(localResult2).assertEqual(localResult1);
      expect(localVersion2).assertEqual(localVersion1);
      expect(localResult2 === localResult1).assertTrue();
      
      // Verify independence
      expect(localVersion2 !== mockVersion1).assertTrue();
      expect(typeof localResult2).assertEqual('boolean');
      expect(typeof localVersion2).assertEqual('number');
      
      logger.info(`${BUNDLE}testEnvironmentTransition0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0600
     * @tc.name testMultiOperationSequence0006
     * @tc.desc Verify correct behavior with multiple operations in sequence.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMultiOperationSequence0006', 0, () => {
      logger.info(`${BUNDLE}testMultiOperationSequence0006, begin`);
      
      const results: boolean[] = [];
      const versions: number[] = [];
      
      // Execute multiple operations
      for (let i = 0; i < 10; i++) {
        results.push(AnnotationService.runAvailableDemo());
        versions.push(AnnotationService.getLocalApiVersion());
      }
      
      // Verify consistency
      const firstResult = results[0];
      const firstVersion = versions[0];
      let allResultsSame = true;
      let allVersionsSame = true;
      
      for (const result of results) {
        if (result !== firstResult) {
          allResultsSame = false;
          break;
        }
      }
      
      for (const version of versions) {
        if (version !== firstVersion) {
          allVersionsSame = false;
          break;
        }
      }
      
      expect(allResultsSame).assertTrue();
      expect(allVersionsSame).assertTrue();
      expect(results.length).assertEqual(10);
      expect(versions.length).assertEqual(10);
      expect(typeof firstResult).assertEqual('boolean');
      expect(typeof firstVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testMultiOperationSequence0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0700
     * @tc.name testStatePreservation0007
     * @tc.desc Verify state preservation across complex operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStatePreservation0007', 0, () => {
      logger.info(`${BUNDLE}testStatePreservation0007, begin`);
      
      // Capture initial state
      const initialVersion = AnnotationService.getLocalApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialRules.length).assertEqual(3);
      expect(typeof initialVersion).assertEqual('number');
      
      // Perform complex operations
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      AnnotationService.getMockApiVersion();
      
      // Verify state preserved
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      expect(finalVersion).assertEqual(initialVersion);
      expect(finalRules.length).assertEqual(initialRules.length);
      expect(finalRules[0]).assertEqual(initialRules[0]);
      expect(finalVersion === initialVersion).assertTrue();
      expect(finalRules.length === initialRules.length).assertTrue();
      
      logger.info(`${BUNDLE}testStatePreservation0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0800
     * @tc.name testIntegratedValidation0008
     * @tc.desc Comprehensive integrated validation.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testIntegratedValidation0008', 0, () => {
      logger.info(`${BUNDLE}testIntegratedValidation0008, begin`);
      
      // Version validation
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(localVersion > 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // Demo validation
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(typeof mockAvailable).assertEqual('boolean');
      expect(typeof mockSuppress).assertEqual('boolean');
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      
      // Rules validation
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      expect(typeof rules[1]).assertEqual('string');
      expect(typeof rules[2]).assertEqual('string');
      
      // Constants validation
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      
      logger.info(`${BUNDLE}testIntegratedValidation0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_0900
     * @tc.name testWorkflowCompletion0009
     * @tc.desc Verify complete workflow completion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkflowCompletion0009', 0, () => {
      logger.info(`${BUNDLE}testWorkflowCompletion0009, begin`);
      
      let workflowCompleted = true;
      
      try {
        // Complete workflow
        const version = AnnotationService.getLocalApiVersion();
        const result = AnnotationService.runAvailableDemo();
        const rules = AnnotationService.getSuppressionRules();
        
        expect(typeof version).assertEqual('number');
        expect(typeof result).assertEqual('boolean');
        expect(Array.isArray(rules)).assertTrue();
        expect(version > 0).assertTrue();
        expect(rules.length).assertEqual(3);
      } catch (e) {
        workflowCompleted = false;
      }
      
      expect(workflowCompleted).assertTrue();
      expect(typeof workflowCompleted).assertEqual('boolean');
      expect(workflowCompleted === true).assertTrue();
      
      logger.info(`${BUNDLE}testWorkflowCompletion0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_INTEG_1000
     * @tc.name testSystemIntegration0010
     * @tc.desc Verify overall system integration.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testSystemIntegration0010', 0, () => {
      logger.info(`${BUNDLE}testSystemIntegration0010, begin`);
      
      // System initialization
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // System operations
      const results: boolean[] = [];
      for (let i = 0; i < 5; i++) {
        results.push(AnnotationService.runAvailableDemo());
        results.push(AnnotationService.runMockAvailableDemo());
      }
      expect(results.length).assertEqual(10);
      expect(typeof results[0]).assertEqual('boolean');
      
      // System validation
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules.includes('compatibility')).assertTrue();
      expect(rules.includes('syscap')).assertTrue();
      expect(rules.includes('permission')).assertTrue();
      
      // System stability
      const finalVersion = AnnotationService.getLocalApiVersion();
      expect(finalVersion).assertEqual(localVersion);
      expect(finalVersion === localVersion).assertTrue();
      expect(typeof finalVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testSystemIntegration0010, end`);
    });
  });
}
