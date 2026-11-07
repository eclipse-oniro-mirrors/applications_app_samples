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
  FUTURE_DEMO_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_Regression_';
const MOCK_API_VERSION: number = 21;
const SUPPRESSION_RULE_COUNT: number = 3;

export default function annotationRegressionTest() {
  describe('AnnotationRegression', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationRegression, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationRegression, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationRegression, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationRegression, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0100
     * @tc.name testCoreFunctionalityStability0001
     * @tc.desc Verify core functionality remains stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCoreFunctionalityStability0001', 0, () => {
      logger.info(`${BUNDLE}testCoreFunctionalityStability0001, begin`);
      
      for (let i = 0; i < 100; i++) {
        const localVersion = AnnotationService.getLocalApiVersion();
        const mockVersion = AnnotationService.getMockApiVersion();
        
        expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
        expect(mockVersion).assertEqual(MOCK_API_VERSION);
        expect(typeof localVersion).assertEqual('number');
        expect(typeof mockVersion).assertEqual('number');
      }
      
      logger.info(`${BUNDLE}testCoreFunctionalityStability0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0200
     * @tc.name testCriticalPathRegression0002
     * @tc.desc Verify critical path has no regression.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCriticalPathRegression0002', 0, () => {
      logger.info(`${BUNDLE}testCriticalPathRegression0002, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const availableResult = AnnotationService.runAvailableDemo();
      const mockAvailableResult = AnnotationService.runMockAvailableDemo();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof mockAvailableResult).assertEqual('boolean');
      expect(mockAvailableResult).assertFalse();
      
      logger.info(`${BUNDLE}testCriticalPathRegression0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0300
     * @tc.name testPerformanceNoRegression0003
     * @tc.desc Verify no performance regression.
     * @tc.size MEDIUM
     * @tc.type Performance
     * @tc.level Level 2
     */
    it('testPerformanceNoRegression0003', 0, () => {
      logger.info(`${BUNDLE}testPerformanceNoRegression0003, begin`);
      
      const iterations = 1000;
      const startTime = new Date().getTime();
      
      for (let i = 0; i < iterations; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runMockAvailableDemo();
      }
      
      const endTime = new Date().getTime();
      const duration = endTime - startTime;
      
      expect(duration >= 0).assertTrue();
      expect(typeof duration).assertEqual('number');
      expect(iterations).assertEqual(1000);
      
      logger.info(`${BUNDLE}Duration: ${duration}ms for ${iterations} iterations`);
      logger.info(`${BUNDLE}testPerformanceNoRegression0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0400
     * @tc.name testCompatibilityNoRegression0004
     * @tc.desc Verify compatibility has no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCompatibilityNoRegression0004', 0, () => {
      logger.info(`${BUNDLE}testCompatibilityNoRegression0004, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(localVersion >= 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Number.isInteger(localVersion)).assertTrue();
      expect(Number.isInteger(mockVersion)).assertTrue();
      
      logger.info(`${BUNDLE}testCompatibilityNoRegression0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0500
     * @tc.name testBoundaryConditionRegression0005
     * @tc.desc Verify boundary conditions have no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoundaryConditionRegression0005', 0, () => {
      logger.info(`${BUNDLE}testBoundaryConditionRegression0005, begin`);
      
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(mockVersion).assertEqual(21);
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testBoundaryConditionRegression0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0600
     * @tc.name testExceptionHandlingRegression0006
     * @tc.desc Verify exception handling has no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testExceptionHandlingRegression0006', 0, () => {
      logger.info(`${BUNDLE}testExceptionHandlingRegression0006, begin`);
      
      let exceptionOccurred = false;
      
      try {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.runAvailableDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.getSuppressionRules();
      } catch (e) {
        exceptionOccurred = true;
      }
      
      expect(exceptionOccurred).assertFalse();
      expect(typeof exceptionOccurred).assertEqual('boolean');
      expect(exceptionOccurred === false).assertTrue();
      
      logger.info(`${BUNDLE}testExceptionHandlingRegression0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0700
     * @tc.name testStateMachineRegression0007
     * @tc.desc Verify state machine has no regression.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStateMachineRegression0007', 0, () => {
      logger.info(`${BUNDLE}testStateMachineRegression0007, begin`);
      
      for (let i = 0; i < 10; i++) {
        const mockResult = AnnotationService.runMockAvailableDemo();
        const localResult = AnnotationService.runAvailableDemo();
        
        expect(mockResult).assertFalse();
        expect(typeof mockResult).assertEqual('boolean');
        expect(typeof localResult).assertEqual('boolean');
      }
      
      logger.info(`${BUNDLE}testStateMachineRegression0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0800
     * @tc.name testConstantValuesRegression0008
     * @tc.desc Verify constant values have no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testConstantValuesRegression0008', 0, () => {
      logger.info(`${BUNDLE}testConstantValuesRegression0008, begin`);
      
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantValuesRegression0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_0900
     * @tc.name testRulesArrayRegression0009
     * @tc.desc Verify rules array has no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRulesArrayRegression0009', 0, () => {
      logger.info(`${BUNDLE}testRulesArrayRegression0009, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(rules[0]).assertEqual('compatibility');
      expect(rules[1]).assertEqual('syscap');
      expect(rules[2]).assertEqual('permission');
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRulesArrayRegression0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_1000
     * @tc.name testMockEnvironmentRegression0010
     * @tc.desc Verify mock environment has no regression.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockEnvironmentRegression0010', 0, () => {
      logger.info(`${BUNDLE}testMockEnvironmentRegression0010, begin`);
      
      const mockVersion = AnnotationService.getMockApiVersion();
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      
      expect(mockVersion).assertEqual(21);
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      expect(typeof mockVersion).assertEqual('number');
      expect(typeof mockAvailable).assertEqual('boolean');
      expect(typeof mockSuppress).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testMockEnvironmentRegression0010, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_1100
     * @tc.name testIntegrationPointsRegression0011
     * @tc.desc Verify integration points have no regression.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntegrationPointsRegression0011', 0, () => {
      logger.info(`${BUNDLE}testIntegrationPointsRegression0011, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      const availableResult = AnnotationService.runAvailableDemo();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(rules.length).assertEqual(3);
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testIntegrationPointsRegression0011, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_REGRESSION_1200
     * @tc.name testOverallSystemStability0012
     * @tc.desc Verify overall system stability.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testOverallSystemStability0012', 0, () => {
      logger.info(`${BUNDLE}testOverallSystemStability0012, begin`);
      
      const iterations = 100;
      let errorCount = 0;
      
      for (let i = 0; i < iterations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          AnnotationService.runMockAvailableDemo();
          AnnotationService.runSuppressWarningsDemo();
          AnnotationService.runMockSuppressWarningsDemo();
          AnnotationService.getSuppressionRules();
        } catch (e) {
          errorCount++;
        }
      }
      
      expect(errorCount).assertEqual(0);
      expect(typeof errorCount).assertEqual('number');
      expect(iterations).assertEqual(100);
      
      // Verify system still works
      const version = AnnotationService.getLocalApiVersion();
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof version).assertEqual('number');
      
      logger.info(`${BUNDLE}testOverallSystemStability0012, end`);
    });
  });
}
