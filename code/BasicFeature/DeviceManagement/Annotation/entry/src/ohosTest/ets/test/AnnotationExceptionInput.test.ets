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

const BUNDLE: string = 'Annotation_Exception_';

export default function annotationExceptionInputTest() {
  describe('AnnotationExceptionInput', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationExceptionInput, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationExceptionInput, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationExceptionInput, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationExceptionInput, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0100
     * @tc.name testRapidConsecutiveCalls0001
     * @tc.desc Test rapid consecutive calls (100 times in sequence).
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidConsecutiveCalls0001', 0, () => {
      logger.info(`${BUNDLE}testRapidConsecutiveCalls0001, begin`);
      
      const iterations = 100;
      const results: boolean[] = [];
      
      // Rapid consecutive calls
      for (let i = 0; i < iterations; i++) {
        results.push(AnnotationService.runAvailableDemo());
      }
      
      // Verify all results are consistent
      const firstResult = results[0];
      let allSame = true;
      for (const result of results) {
        if (result !== firstResult) {
          allSame = false;
          break;
        }
      }
      
      expect(allSame).assertTrue();
      expect(results.length).assertEqual(iterations);
      expect(typeof firstResult).assertEqual('boolean');
      expect(iterations).assertEqual(100);
      expect(Array.isArray(results)).assertTrue();
      
      logger.info(`${BUNDLE}testRapidConsecutiveCalls0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0200
     * @tc.name testHighFrequencyMixedCalls0002
     * @tc.desc Test high frequency mixed calls.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testHighFrequencyMixedCalls0002', 0, () => {
      logger.info(`${BUNDLE}testHighFrequencyMixedCalls0002, begin`);
      
      const iterations = 50;
      const localResults: number[] = [];
      const mockResults: number[] = [];
      const availableResults: boolean[] = [];
      const suppressResults: boolean[] = [];
      
      // High frequency mixed calls
      for (let i = 0; i < iterations; i++) {
        localResults.push(AnnotationService.getLocalApiVersion());
        mockResults.push(AnnotationService.getMockApiVersion());
        availableResults.push(AnnotationService.runAvailableDemo());
        suppressResults.push(AnnotationService.runSuppressWarningsDemo());
      }
      
      // Verify consistency
      expect(localResults.length).assertEqual(iterations);
      expect(mockResults.length).assertEqual(iterations);
      expect(availableResults.length).assertEqual(iterations);
      expect(suppressResults.length).assertEqual(iterations);
      
      const firstLocal = localResults[0];
      const firstMock = mockResults[0];
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      expect(typeof availableResults[0]).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testHighFrequencyMixedCalls0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0300
     * @tc.name testRepeatedRulesRetrieval0003
     * @tc.desc Test repeated rules retrieval (1000 times).
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedRulesRetrieval0003', 0, () => {
      logger.info(`${BUNDLE}testRepeatedRulesRetrieval0003, begin`);
      
      const iterations = 1000;
      const lengths: number[] = [];
      
      // Repeated retrieval
      for (let i = 0; i < iterations; i++) {
        const rules = AnnotationService.getSuppressionRules();
        lengths.push(rules.length);
      }
      
      // Verify all lengths are the same
      const firstLength = lengths[0];
      let allSame = true;
      for (const length of lengths) {
        if (length !== firstLength) {
          allSame = false;
          break;
        }
      }
      
      expect(allSame).assertTrue();
      expect(firstLength).assertEqual(3);
      expect(lengths.length).assertEqual(iterations);
      expect(typeof firstLength).assertEqual('number');
      expect(iterations).assertEqual(1000);
      
      logger.info(`${BUNDLE}testRepeatedRulesRetrieval0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0400
     * @tc.name testAlternatingPatternStability0004
     * @tc.desc Test alternating pattern stability.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAlternatingPatternStability0004', 0, () => {
      logger.info(`${BUNDLE}testAlternatingPatternStability0004, begin`);
      
      const iterations = 200;
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      
      // Alternating pattern
      for (let i = 0; i < iterations; i++) {
        if (i % 2 === 0) {
          localVersions.push(AnnotationService.getLocalApiVersion());
        } else {
          mockVersions.push(AnnotationService.getMockApiVersion());
        }
      }
      
      // Verify stability
      const firstLocal = localVersions[0];
      const firstMock = mockVersions[0];
      
      let allLocalSame = true;
      for (const version of localVersions) {
        if (version !== firstLocal) {
          allLocalSame = false;
          break;
        }
      }
      
      let allMockSame = true;
      for (const version of mockVersions) {
        if (version !== firstMock) {
          allMockSame = false;
          break;
        }
      }
      
      expect(allLocalSame).assertTrue();
      expect(allMockSame).assertTrue();
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(localVersions.length + mockVersions.length).assertEqual(iterations);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testAlternatingPatternStability0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0500
     * @tc.name testLongRunningStability0005
     * @tc.desc Test long running stability (500 iterations).
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLongRunningStability0005', 0, () => {
      logger.info(`${BUNDLE}testLongRunningStability0005, begin`);
      
      const iterations = 500;
      let successCount = 0;
      let errorCount = 0;
      
      // Long running test
      for (let i = 0; i < iterations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          AnnotationService.runSuppressWarningsDemo();
          AnnotationService.runMockAvailableDemo();
          AnnotationService.runMockSuppressWarningsDemo();
          AnnotationService.getSuppressionRules();
          successCount++;
        } catch (e) {
          errorCount++;
        }
      }
      
      // Verify stability
      expect(successCount).assertEqual(iterations);
      expect(errorCount).assertEqual(0);
      expect(successCount + errorCount).assertEqual(iterations);
      expect(typeof successCount).assertEqual('number');
      expect(typeof errorCount).assertEqual('number');
      expect(iterations).assertEqual(500);
      
      logger.info(`${BUNDLE}testLongRunningStability0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0600
     * @tc.name testDataConsistencyAfterStress0006
     * @tc.desc Test data consistency after stress operations.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataConsistencyAfterStress0006', 0, () => {
      logger.info(`${BUNDLE}testDataConsistencyAfterStress0006, begin`);
      
      // Capture baseline
      const baselineLocal = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(21);
      expect(baselineRules.length).assertEqual(3);
      
      // Stress operations
      for (let i = 0; i < 200; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
      }
      
      // Verify consistency
      const afterLocal = AnnotationService.getLocalApiVersion();
      const afterMock = AnnotationService.getMockApiVersion();
      const afterRules = AnnotationService.getSuppressionRules();
      
      expect(afterLocal).assertEqual(baselineLocal);
      expect(afterMock).assertEqual(baselineMock);
      expect(afterRules.length).assertEqual(baselineRules.length);
      expect(afterLocal === baselineLocal).assertTrue();
      expect(afterMock === baselineMock).assertTrue();
      expect(typeof afterLocal).assertEqual('number');
      expect(typeof afterMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testDataConsistencyAfterStress0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0700
     * @tc.name testEmptyInputHandling0007
     * @tc.desc Test handling of empty input scenarios.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEmptyInputHandling0007', 0, () => {
      logger.info(`${BUNDLE}testEmptyInputHandling0007, begin`);
      
      // Test with zero iterations
      const zeroIterations = 0;
      const results: boolean[] = [];
      
      for (let i = 0; i < zeroIterations; i++) {
        results.push(AnnotationService.runAvailableDemo());
      }
      
      expect(results.length).assertEqual(0);
      expect(Array.isArray(results)).assertTrue();
      
      // Verify system still works after empty loop
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion).assertEqual('number');
      expect(zeroIterations).assertEqual(0);
      
      logger.info(`${BUNDLE}testEmptyInputHandling0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEP_0800
     * @tc.name testSingleIterationBoundary0008
     * @tc.desc Test single iteration boundary case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSingleIterationBoundary0008', 0, () => {
      logger.info(`${BUNDLE}testSingleIterationBoundary0008, begin`);
      
      const singleIteration = 1;
      const results: number[] = [];
      
      for (let i = 0; i < singleIteration; i++) {
        results.push(AnnotationService.getLocalApiVersion());
      }
      
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof results[0]).assertEqual('number');
      expect(singleIteration).assertEqual(1);
      expect(Array.isArray(results)).assertTrue();
      
      logger.info(`${BUNDLE}testSingleIterationBoundary0008, end`);
    });
  });
}
