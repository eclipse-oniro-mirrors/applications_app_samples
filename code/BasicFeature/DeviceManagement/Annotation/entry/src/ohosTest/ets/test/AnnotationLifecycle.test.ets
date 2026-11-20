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

export default function annotationLifecycleTest() {
  describe('AnnotationLifecycle', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationLifecycle, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationLifecycle, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationLifecycle, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationLifecycle, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0100
     * @tc.name testServiceInitialization0001
     * @tc.desc Verify AnnotationService initialization and first access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testServiceInitialization0001', 0, () => {
      logger.info(`${BUNDLE}testServiceInitialization0001, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(localVersion > 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testServiceInitialization0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0200
     * @tc.name testStatePersistenceAcrossCalls0002
     * @tc.desc Verify state persistence across multiple API calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStatePersistenceAcrossCalls0002', 0, () => {
      logger.info(`${BUNDLE}testStatePersistenceAcrossCalls0002, begin`);
      const localVersion1 = AnnotationService.getLocalApiVersion();
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      const localVersion2 = AnnotationService.getLocalApiVersion();
      expect(localVersion1).assertEqual(localVersion2);
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion1).assertEqual('number');
      expect(typeof localVersion2).assertEqual('number');
      expect(localVersion1 === localVersion2).assertTrue();
      expect(localVersion1 > 0).assertTrue();
      logger.info(`${BUNDLE}testStatePersistenceAcrossCalls0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0300
     * @tc.name testEnvironmentSwitchPersistence0003
     * @tc.desc Verify environment switch state persistence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEnvironmentSwitchPersistence0003', 0, () => {
      logger.info(`${BUNDLE}testEnvironmentSwitchPersistence0003, begin`);
      const mockResult1 = AnnotationService.runMockAvailableDemo();
      const localResult1 = AnnotationService.runAvailableDemo();
      const mockResult2 = AnnotationService.runMockAvailableDemo();
      const localResult2 = AnnotationService.runAvailableDemo();
      expect(mockResult1).assertFalse();
      expect(mockResult2).assertFalse();
      expect(localResult1).assertEqual(localResult2);
      expect(mockResult1 === mockResult2).assertTrue();
      expect(localResult1 === localResult2).assertTrue();
      expect(typeof mockResult1).assertEqual('boolean');
      expect(typeof localResult1).assertEqual('boolean');
      logger.info(`${BUNDLE}testEnvironmentSwitchPersistence0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0400
     * @tc.name testRulesPersistence0004
     * @tc.desc Verify suppression rules persistence throughout lifecycle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesPersistence0004', 0, () => {
      logger.info(`${BUNDLE}testRulesPersistence0004, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules1[0]).assertEqual(rules2[0]);
      expect(rules1[1]).assertEqual(rules2[1]);
      expect(rules1[2]).assertEqual(rules2[2]);
      expect(rules1.length).assertEqual(3);
      expect(Array.isArray(rules1)).assertTrue();
      expect(Array.isArray(rules2)).assertTrue();
      logger.info(`${BUNDLE}testRulesPersistence0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0500
     * @tc.name testConstantPersistence0005
     * @tc.desc Verify constants remain unchanged throughout lifecycle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testConstantPersistence0005', 0, () => {
      logger.info(`${BUNDLE}testConstantPersistence0005, begin`);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      AnnotationService.runAvailableDemo();
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      AnnotationService.runSuppressWarningsDemo();
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testConstantPersistence0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0600
     * @tc.name testVersionStability0006
     * @tc.desc Verify version stability throughout service lifecycle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionStability0006', 0, () => {
      logger.info(`${BUNDLE}testVersionStability0006, begin`);
      const initialLocalVersion = AnnotationService.getLocalApiVersion();
      const initialMockVersion = AnnotationService.getMockApiVersion();
      for (let i = 0; i < 10; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runMockAvailableDemo();
      }
      const finalLocalVersion = AnnotationService.getLocalApiVersion();
      const finalMockVersion = AnnotationService.getMockApiVersion();
      expect(initialLocalVersion).assertEqual(finalLocalVersion);
      expect(initialMockVersion).assertEqual(finalMockVersion);
      expect(initialLocalVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialMockVersion).assertEqual(21);
      expect(typeof initialLocalVersion).assertEqual('number');
      expect(typeof initialMockVersion).assertEqual('number');
      logger.info(`${BUNDLE}testVersionStability0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0700
     * @tc.name testStateAfterHeavyUsage0007
     * @tc.desc Verify state integrity after heavy usage pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateAfterHeavyUsage0007', 0, () => {
      logger.info(`${BUNDLE}testStateAfterHeavyUsage0007, begin`);
      for (let i = 0; i < 50; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
        AnnotationService.getLocalApiVersion();
        AnnotationService.getMockApiVersion();
        AnnotationService.getSuppressionRules();
      }
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(rules.length).assertEqual(3);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      logger.info(`${BUNDLE}testStateAfterHeavyUsage0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0800
     * @tc.name testInitializationOrder0008
     * @tc.desc Verify initialization order does not affect results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInitializationOrder0008', 0, () => {
      logger.info(`${BUNDLE}testInitializationOrder0008, begin`);
      const order1: string[] = [];
      order1.push(AnnotationService.getLocalApiVersion().toString());
      order1.push(AnnotationService.getMockApiVersion().toString());
      order1.push(AnnotationService.runAvailableDemo().toString());
      const order2: string[] = [];
      order2.push(AnnotationService.runAvailableDemo().toString());
      order2.push(AnnotationService.getMockApiVersion().toString());
      order2.push(AnnotationService.getLocalApiVersion().toString());
      expect(order1[0]).assertEqual(order2[2]);
      expect(order1[1]).assertEqual(order2[1]);
      expect(order1[2]).assertEqual(order2[0]);
      expect(order1.length).assertEqual(3);
      expect(order2.length).assertEqual(3);
      expect(order1[0] !== '').assertTrue();
      expect(order1[1] !== '').assertTrue();
      logger.info(`${BUNDLE}testInitializationOrder0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_0900
     * @tc.name testCleanupBehavior0009
     * @tc.desc Verify cleanup behavior and state reset (if applicable).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCleanupBehavior0009', 0, () => {
      logger.info(`${BUNDLE}testCleanupBehavior0009, begin`);
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(rules.length).assertEqual(3);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      expect(localVersion > 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testCleanupBehavior0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_LIFECYCLE_1000
     * @tc.name testLongRunningScenario0010
     * @tc.desc Verify service behavior in long-running scenario.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLongRunningScenario0010', 0, () => {
      logger.info(`${BUNDLE}testLongRunningScenario0010, begin`);
      const iterations = 100;
      const results: boolean[] = [];
      for (let i = 0; i < iterations; i++) {
        results.push(AnnotationService.runAvailableDemo());
      }
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
      expect(firstResult === true || firstResult === false).assertTrue();
      expect(results[0] === results[iterations - 1]).assertTrue();
      expect(iterations).assertEqual(100);
      logger.info(`${BUNDLE}testLongRunningScenario0010, end`);
    });
  });
}
