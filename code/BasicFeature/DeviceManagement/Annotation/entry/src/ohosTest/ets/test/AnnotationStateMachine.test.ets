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

const BUNDLE: string = 'Annotation_StateMachine_';

export default function annotationStateMachineTest() {
  describe('AnnotationStateMachine', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationStateMachine, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationStateMachine, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationStateMachine, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationStateMachine, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0100
     * @tc.name testLocalToMockStateTransition0001
     * @tc.desc Verify state transition from local to mock environment.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocalToMockStateTransition0001', 0, () => {
      logger.info(`${BUNDLE}testLocalToMockStateTransition0001, begin`);
      
      // Initial state: local environment
      const localVersion1 = AnnotationService.getLocalApiVersion();
      const result1 = AnnotationService.runAvailableDemo();
      
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof result1).assertEqual('boolean');
      expect(typeof localVersion1).assertEqual('number');
      
      // Transition: call mock environment
      const mockVersion = AnnotationService.getMockApiVersion();
      const result2 = AnnotationService.runMockAvailableDemo();
      
      expect(mockVersion).assertEqual(21);
      expect(result2).assertFalse();
      expect(typeof mockVersion).assertEqual('number');
      
      // Verify local state unchanged after mock call
      const localVersion2 = AnnotationService.getLocalApiVersion();
      expect(localVersion2).assertEqual(localVersion1);
      expect(localVersion2 === localVersion1).assertTrue();
      
      logger.info(`${BUNDLE}testLocalToMockStateTransition0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0200
     * @tc.name testMockToLocalStateTransition0002
     * @tc.desc Verify state transition from mock to local environment.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockToLocalStateTransition0002', 0, () => {
      logger.info(`${BUNDLE}testMockToLocalStateTransition0002, begin`);
      
      // Initial state: mock environment
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const result1 = AnnotationService.runMockAvailableDemo();
      
      expect(mockVersion1).assertEqual(21);
      expect(result1).assertFalse();
      expect(typeof mockVersion1).assertEqual('number');
      
      // Transition: call local environment
      const localVersion = AnnotationService.getLocalApiVersion();
      const result2 = AnnotationService.runAvailableDemo();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof result2).assertEqual('boolean');
      expect(typeof localVersion).assertEqual('number');
      
      // Verify mock state unchanged after local call
      const mockVersion2 = AnnotationService.getMockApiVersion();
      expect(mockVersion2).assertEqual(mockVersion1);
      expect(mockVersion2 === mockVersion1).assertTrue();
      
      logger.info(`${BUNDLE}testMockToLocalStateTransition0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0300
     * @tc.name testMultipleStateSwitches0003
     * @tc.desc Verify state consistency after multiple switches.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMultipleStateSwitches0003', 0, () => {
      logger.info(`${BUNDLE}testMultipleStateSwitches0003, begin`);
      
      const iterations = 10;
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      
      // Perform multiple state switches
      for (let i = 0; i < iterations; i++) {
        localVersions.push(AnnotationService.getLocalApiVersion());
        mockVersions.push(AnnotationService.getMockApiVersion());
      }
      
      // Verify all local versions are the same
      const firstLocal = localVersions[0];
      let allLocalSame = true;
      for (const version of localVersions) {
        if (version !== firstLocal) {
          allLocalSame = false;
          break;
        }
      }
      
      // Verify all mock versions are the same
      const firstMock = mockVersions[0];
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
      expect(localVersions.length).assertEqual(iterations);
      expect(mockVersions.length).assertEqual(iterations);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testMultipleStateSwitches0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0400
     * @tc.name testSuppressStateTransition0004
     * @tc.desc Verify suppress annotation state transition.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressStateTransition0004', 0, () => {
      logger.info(`${BUNDLE}testSuppressStateTransition0004, begin`);
      
      // Local suppress state
      const result1 = AnnotationService.runSuppressWarningsDemo();
      expect(typeof result1).assertEqual('boolean');
      expect(result1 === true || result1 === false).assertTrue();
      
      // Mock suppress state
      const result2 = AnnotationService.runMockSuppressWarningsDemo();
      expect(result2).assertFalse();
      expect(typeof result2).assertEqual('boolean');
      
      // Verify rules state unchanged
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testSuppressStateTransition0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0500
     * @tc.name testRulesStateConsistency0005
     * @tc.desc Verify rules state consistency across calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesStateConsistency0005', 0, () => {
      logger.info(`${BUNDLE}testRulesStateConsistency0005, begin`);
      
      const calls = 20;
      const rulesLengths: number[] = [];
      const firstRules: string[] = [];
      
      for (let i = 0; i < calls; i++) {
        const rules = AnnotationService.getSuppressionRules();
        rulesLengths.push(rules.length);
        if (i === 0) {
          firstRules.push(...rules);
        }
      }
      
      // Verify all calls return the same length
      const firstLength = rulesLengths[0];
      let allSameLength = true;
      for (const length of rulesLengths) {
        if (length !== firstLength) {
          allSameLength = false;
          break;
        }
      }
      
      // Verify current rules match first call
      const currentRules = AnnotationService.getSuppressionRules();
      expect(allSameLength).assertTrue();
      expect(firstLength).assertEqual(3);
      expect(currentRules.length).assertEqual(firstLength);
      expect(currentRules[0]).assertEqual(firstRules[0]);
      expect(rulesLengths.length).assertEqual(calls);
      expect(typeof firstLength).assertEqual('number');
      expect(Array.isArray(currentRules)).assertTrue();
      
      logger.info(`${BUNDLE}testRulesStateConsistency0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0600
     * @tc.name testConcurrentStateAccess0006
     * @tc.desc Verify state consistency under concurrent-like access.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConcurrentStateAccess0006', 0, () => {
      logger.info(`${BUNDLE}testConcurrentStateAccess0006, begin`);
      
      const iterations = 100;
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      
      // Simulate concurrent access
      for (let i = 0; i < iterations; i++) {
        localVersions.push(AnnotationService.getLocalApiVersion());
        mockVersions.push(AnnotationService.getMockApiVersion());
      }
      
      // Verify all results are consistent
      const firstLocal = localVersions[0];
      const firstMock = mockVersions[0];
      let allConsistent = true;
      
      for (let i = 0; i < iterations; i++) {
        if (localVersions[i] !== firstLocal || mockVersions[i] !== firstMock) {
          allConsistent = false;
          break;
        }
      }
      
      expect(allConsistent).assertTrue();
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(localVersions.length).assertEqual(iterations);
      expect(mockVersions.length).assertEqual(iterations);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      expect(iterations).assertEqual(100);
      
      logger.info(`${BUNDLE}testConcurrentStateAccess0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0700
     * @tc.name testStateAfterOperations0007
     * @tc.desc Verify state preservation after various operations.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStateAfterOperations0007', 0, () => {
      logger.info(`${BUNDLE}testStateAfterOperations0007, begin`);
      
      // Capture initial state
      const initialLocal = AnnotationService.getLocalApiVersion();
      const initialMock = AnnotationService.getMockApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      
      expect(initialLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialMock).assertEqual(21);
      expect(initialRules.length).assertEqual(3);
      
      // Perform various operations
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      
      // Verify state unchanged
      const finalLocal = AnnotationService.getLocalApiVersion();
      const finalMock = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalLocal).assertEqual(initialLocal);
      expect(finalMock).assertEqual(initialMock);
      expect(finalRules.length).assertEqual(initialRules.length);
      expect(finalLocal === initialLocal).assertTrue();
      expect(finalMock === initialMock).assertTrue();
      expect(typeof finalLocal).assertEqual('number');
      expect(typeof finalMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testStateAfterOperations0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0800
     * @tc.name testAlternatingStatePattern0008
     * @tc.desc Verify alternating state pattern.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testAlternatingStatePattern0008', 0, () => {
      logger.info(`${BUNDLE}testAlternatingStatePattern0008, begin`);
      
      const pattern = ['local', 'mock', 'local', 'mock', 'local'];
      const localResults: number[] = [];
      const mockResults: number[] = [];
      
      for (const state of pattern) {
        if (state === 'local') {
          localResults.push(AnnotationService.getLocalApiVersion());
        } else {
          mockResults.push(AnnotationService.getMockApiVersion());
        }
      }
      
      // Verify all local results are the same
      const firstLocal = localResults[0];
      let allLocalSame = true;
      for (const result of localResults) {
        if (result !== firstLocal) {
          allLocalSame = false;
          break;
        }
      }
      
      // Verify all mock results are the same
      const firstMock = mockResults[0];
      let allMockSame = true;
      for (const result of mockResults) {
        if (result !== firstMock) {
          allMockSame = false;
          break;
        }
      }
      
      expect(allLocalSame).assertTrue();
      expect(allMockSame).assertTrue();
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(localResults.length).assertEqual(3);
      expect(mockResults.length).assertEqual(2);
      expect(pattern.length).assertEqual(5);
      
      logger.info(`${BUNDLE}testAlternatingStatePattern0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_0900
     * @tc.name testStateIsolation0009
     * @tc.desc Verify state isolation between environments.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStateIsolation0009', 0, () => {
      logger.info(`${BUNDLE}testStateIsolation0009, begin`);
      
      // Perform operations in mock environment
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      
      // Verify local environment not affected
      const localVersion = AnnotationService.getLocalApiVersion();
      const localResult = AnnotationService.runAvailableDemo();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localResult).assertEqual('boolean');
      expect(typeof localVersion).assertEqual('number');
      
      // Perform operations in local environment
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      
      // Verify mock environment not affected
      const mockVersion = AnnotationService.getMockApiVersion();
      const mockResult = AnnotationService.runMockAvailableDemo();
      
      expect(mockVersion).assertEqual(21);
      expect(mockResult).assertFalse();
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testStateIsolation0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_SM_1000
     * @tc.name testStateRecovery0010
     * @tc.desc Verify state recovery after intensive operations.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateRecovery0010', 0, () => {
      logger.info(`${BUNDLE}testStateRecovery0010, begin`);
      
      // Capture baseline
      const baselineLocal = AnnotationService.getLocalApiVersion();
      const baselineMock = AnnotationService.getMockApiVersion();
      const baselineRules = AnnotationService.getSuppressionRules();
      
      expect(baselineLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(baselineMock).assertEqual(21);
      expect(baselineRules.length).assertEqual(3);
      
      // Intensive operations
      for (let i = 0; i < 100; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.getSuppressionRules();
      }
      
      // Verify recovery to baseline
      const recoveredLocal = AnnotationService.getLocalApiVersion();
      const recoveredMock = AnnotationService.getMockApiVersion();
      const recoveredRules = AnnotationService.getSuppressionRules();
      
      expect(recoveredLocal).assertEqual(baselineLocal);
      expect(recoveredMock).assertEqual(baselineMock);
      expect(recoveredRules.length).assertEqual(baselineRules.length);
      expect(recoveredLocal === baselineLocal).assertTrue();
      expect(recoveredMock === baselineMock).assertTrue();
      expect(typeof recoveredLocal).assertEqual('number');
      expect(typeof recoveredMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testStateRecovery0010, end`);
    });
  });
}
