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

const BUNDLE: string = 'Annotation_Lifecycle_';

export default function annotationLifecycleExtTest() {
  describe('AnnotationLifecycleExt', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationLifecycleExt, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationLifecycleExt, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationLifecycleExt, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationLifecycleExt, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0100
     * @tc.name testInitializationState0001
     * @tc.desc Verify initialization state consistency.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testInitializationState0001', 0, () => {
      logger.info(`${BUNDLE}testInitializationState0001, begin`);
      
      // First access should initialize
      const version1 = AnnotationService.getLocalApiVersion();
      const version2 = AnnotationService.getLocalApiVersion();
      
      expect(version1).assertEqual(version2);
      expect(version1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof version1).assertEqual('number');
      expect(typeof version2).assertEqual('number');
      expect(version1 === version2).assertTrue();
      
      logger.info(`${BUNDLE}testInitializationState0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0200
     * @tc.name testStatePersistence0002
     * @tc.desc Verify state persistence across operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStatePersistence0002', 0, () => {
      logger.info(`${BUNDLE}testStatePersistence0002, begin`);
      
      const initialVersion = AnnotationService.getLocalApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialRules.length).assertEqual(3);
      expect(typeof initialVersion).assertEqual('number');
      
      // Perform operations
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      
      // Verify state persisted
      const afterVersion = AnnotationService.getLocalApiVersion();
      const afterRules = AnnotationService.getSuppressionRules();
      
      expect(afterVersion).assertEqual(initialVersion);
      expect(afterRules.length).assertEqual(initialRules.length);
      expect(afterVersion === initialVersion).assertTrue();
      expect(typeof afterVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testStatePersistence0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0300
     * @tc.name testResourceCleanup0003
     * @tc.desc Verify resource cleanup after operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testResourceCleanup0003', 0, () => {
      logger.info(`${BUNDLE}testResourceCleanup0003, begin`);
      
      // Perform many operations
      for (let i = 0; i < 100; i++) {
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.getSuppressionRules();
      }
      
      // Verify system still works (resources not exhausted)
      const version = AnnotationService.getLocalApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      
      expect(version).assertEqual(deviceInfo.sdkApiVersion);
      expect(rules.length).assertEqual(3);
      expect(typeof version).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testResourceCleanup0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0400
     * @tc.name testRepeatedInitialization0004
     * @tc.desc Verify repeated initialization doesn't cause issues.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedInitialization0004', 0, () => {
      logger.info(`${BUNDLE}testRepeatedInitialization0004, begin`);
      
      const iterations = 50;
      const versions: number[] = [];
      
      // Repeated initialization
      for (let i = 0; i < iterations; i++) {
        versions.push(AnnotationService.getLocalApiVersion());
      }
      
      // Verify all versions are the same
      const firstVersion = versions[0];
      let allSame = true;
      for (const version of versions) {
        if (version !== firstVersion) {
          allSame = false;
          break;
        }
      }
      
      expect(allSame).assertTrue();
      expect(firstVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(versions.length).assertEqual(iterations);
      expect(typeof firstVersion).assertEqual('number');
      expect(iterations).assertEqual(50);
      
      logger.info(`${BUNDLE}testRepeatedInitialization0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0500
     * @tc.name testStateRecoveryAfterStress0005
     * @tc.desc Verify state recovery after stress operations.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateRecoveryAfterStress0005', 0, () => {
      logger.info(`${BUNDLE}testStateRecoveryAfterStress0005, begin`);
      
      // Baseline
      const baseline = AnnotationService.getLocalApiVersion();
      expect(baseline).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof baseline).assertEqual('number');
      
      // Stress
      for (let i = 0; i < 500; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
      }
      
      // Recovery
      const recovered = AnnotationService.getLocalApiVersion();
      expect(recovered).assertEqual(baseline);
      expect(recovered === baseline).assertTrue();
      expect(typeof recovered).assertEqual('number');
      
      logger.info(`${BUNDLE}testStateRecoveryAfterStress0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0600
     * @tc.name testConcurrentStatePreservation0006
     * @tc.desc Verify concurrent state preservation.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConcurrentStatePreservation0006', 0, () => {
      logger.info(`${BUNDLE}testConcurrentStatePreservation0006, begin`);
      
      const iterations = 100;
      const localVersions: number[] = [];
      const localRulesCounts: number[] = [];
      const mockVersions: number[] = [];
      const mockResults: boolean[] = [];
      
      // Capture concurrent snapshots
      for (let i = 0; i < iterations; i++) {
        localVersions.push(AnnotationService.getLocalApiVersion());
        localRulesCounts.push(AnnotationService.getSuppressionRules().length);
        mockVersions.push(AnnotationService.getMockApiVersion());
        mockResults.push(AnnotationService.runMockAvailableDemo());
      }
      
      // Verify local state preservation
      const firstLocalVersion = localVersions[0];
      const firstLocalRules = localRulesCounts[0];
      let allLocalSame = true;
      for (let i = 0; i < iterations; i++) {
        if (localVersions[i] !== firstLocalVersion || localRulesCounts[i] !== firstLocalRules) {
          allLocalSame = false;
          break;
        }
      }
      
      // Verify mock state preservation
      const firstMockVersion = mockVersions[0];
      const firstMockResult = mockResults[0];
      let allMockSame = true;
      for (let i = 0; i < iterations; i++) {
        if (mockVersions[i] !== firstMockVersion || mockResults[i] !== firstMockResult) {
          allMockSame = false;
          break;
        }
      }
      
      expect(allLocalSame).assertTrue();
      expect(allMockSame).assertTrue();
      expect(firstLocalVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstLocalRules).assertEqual(3);
      expect(firstMockVersion).assertEqual(21);
      expect(firstMockResult).assertFalse();
      expect(localVersions.length).assertEqual(iterations);
      expect(mockVersions.length).assertEqual(iterations);
      expect(typeof firstLocalVersion).assertEqual('number');
      expect(typeof firstMockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testConcurrentStatePreservation0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0700
     * @tc.name testLifecyclePhaseTransitions0007
     * @tc.desc Verify lifecycle phase transitions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLifecyclePhaseTransitions0007', 0, () => {
      logger.info(`${BUNDLE}testLifecyclePhaseTransitions0007, begin`);
      
      // Phase 1: Initial access
      const phase1Version = AnnotationService.getLocalApiVersion();
      expect(phase1Version).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof phase1Version).assertEqual('number');
      
      // Phase 2: Active usage
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      const phase2Version = AnnotationService.getLocalApiVersion();
      expect(phase2Version).assertEqual(phase1Version);
      
      // Phase 3: Mock environment
      const phase3Mock = AnnotationService.getMockApiVersion();
      expect(phase3Mock).assertEqual(21);
      expect(typeof phase3Mock).assertEqual('number');
      
      // Phase 4: Return to local
      const phase4Version = AnnotationService.getLocalApiVersion();
      expect(phase4Version).assertEqual(phase1Version);
      expect(phase4Version === phase1Version).assertTrue();
      
      logger.info(`${BUNDLE}testLifecyclePhaseTransitions0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0800
     * @tc.name testStateConsistencyOverTime0008
     * @tc.desc Verify state consistency over time.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateConsistencyOverTime0008', 0, () => {
      logger.info(`${BUNDLE}testStateConsistencyOverTime0008, begin`);
      
      const timePoints = 20;
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      
      // Sample at different time points
      for (let i = 0; i < timePoints; i++) {
        // Perform some operations between samples
        for (let j = 0; j < 10; j++) {
          AnnotationService.runAvailableDemo();
          AnnotationService.runMockAvailableDemo();
        }
        
        localVersions.push(AnnotationService.getLocalApiVersion());
        mockVersions.push(AnnotationService.getMockApiVersion());
      }
      
      // Verify consistency over time
      const firstLocal = localVersions[0];
      const firstMock = mockVersions[0];
      
      let localConsistent = true;
      let mockConsistent = true;
      
      for (const version of localVersions) {
        if (version !== firstLocal) {
          localConsistent = false;
          break;
        }
      }
      
      for (const version of mockVersions) {
        if (version !== firstMock) {
          mockConsistent = false;
          break;
        }
      }
      
      expect(localConsistent).assertTrue();
      expect(mockConsistent).assertTrue();
      expect(firstLocal).assertEqual(deviceInfo.sdkApiVersion);
      expect(firstMock).assertEqual(21);
      expect(localVersions.length).assertEqual(timePoints);
      expect(mockVersions.length).assertEqual(timePoints);
      expect(typeof firstLocal).assertEqual('number');
      expect(typeof firstMock).assertEqual('number');
      
      logger.info(`${BUNDLE}testStateConsistencyOverTime0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_0900
     * @tc.name testCleanupAfterMockOperations0009
     * @tc.desc Verify cleanup after mock operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCleanupAfterMockOperations0009', 0, () => {
      logger.info(`${BUNDLE}testCleanupAfterMockOperations0009, begin`);
      
      // Perform mock operations
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      AnnotationService.getMockApiVersion();
      
      // Verify local environment is clean
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion).assertEqual('number');
      
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testCleanupAfterMockOperations0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LCE_1000
     * @tc.name testLongTermStability0010
     * @tc.desc Verify long term stability (100 operations).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLongTermStability0010', 0, () => {
      logger.info(`${BUNDLE}testLongTermStability0010, begin`);
      
      const baseline = AnnotationService.getLocalApiVersion();
      expect(baseline).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof baseline).assertEqual('number');
      
      // Long term operations (reduced to 100 to avoid appfreeze)
      const totalOps = 100;
      let successCount = 0;
      
      logger.info(`${BUNDLE}Starting ${totalOps} operations...`);
      
      for (let i = 0; i < totalOps; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          successCount++;
        } catch (e) {
          // Should not happen
          logger.error(`${BUNDLE}Error in iteration ${i}: ${e}`);
        }
      }
      
      logger.info(`${BUNDLE}Completed ${successCount}/${totalOps} operations`);
      
      // Verify stability
      const final = AnnotationService.getLocalApiVersion();
      expect(final).assertEqual(baseline);
      expect(successCount).assertEqual(totalOps);
      expect(typeof successCount).assertEqual('number');
      expect(totalOps).assertEqual(100);
      
      logger.info(`${BUNDLE}testLongTermStability0010, end`);
    });
  });
}
