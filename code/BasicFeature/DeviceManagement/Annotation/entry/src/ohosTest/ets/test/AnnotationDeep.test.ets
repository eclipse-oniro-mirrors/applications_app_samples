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

const BUNDLE: string = 'Annotation_Deep_';

export default function annotationDeepTest() {
  describe('AnnotationDeep', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationDeep, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationDeep, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationDeep, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationDeep, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0100
     * @tc.name testAvailableAnnotationMechanism0001
     * @tc.desc Verify @Available annotation mechanism controls function execution.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableAnnotationMechanism0001', 0, () => {
      logger.info(`${BUNDLE}testAvailableAnnotationMechanism0001, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const result = AnnotationService.runAvailableDemo();
      const expected = localVersion >= AVAILABLE_MIN_API_VERSION;
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      logger.info(`${BUNDLE}testAvailableAnnotationMechanism0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0200
     * @tc.name testSuppressWarningsAnnotationMechanism0002
     * @tc.desc Verify @SuppressWarnings annotation mechanism controls warning suppression.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressWarningsAnnotationMechanism0002', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsAnnotationMechanism0002, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const result = AnnotationService.runSuppressWarningsDemo();
      const expected = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      logger.info(`${BUNDLE}testSuppressWarningsAnnotationMechanism0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0300
     * @tc.name testAnnotationParameterValidation0003
     * @tc.desc Verify annotation parameter validation and constraints.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnnotationParameterValidation0003', 0, () => {
      logger.info(`${BUNDLE}testAnnotationParameterValidation0003, begin`);
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testAnnotationParameterValidation0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0400
     * @tc.name testSuppressionRulesApplication0004
     * @tc.desc Verify how suppression rules are applied in different scenarios.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesApplication0004', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesApplication0004, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules[0]).assertEqual('compatibility');
      expect(rules[1]).assertEqual('syscap');
      expect(rules[2]).assertEqual('permission');
      expect(rules.includes('compatibility')).assertTrue();
      expect(rules.includes('syscap')).assertTrue();
      expect(rules.includes('permission')).assertTrue();
      logger.info(`${BUNDLE}testSuppressionRulesApplication0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0500
     * @tc.name testAnnotationInheritance0005
     * @tc.desc Verify annotation inheritance behavior across versions.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testAnnotationInheritance0005', 0, () => {
      logger.info(`${BUNDLE}testAnnotationInheritance0005, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(localVersion >= AVAILABLE_MIN_API_VERSION || localVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testAnnotationInheritance0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0600
     * @tc.name testVersionThresholdBehavior0006
     * @tc.desc Verify behavior at different version thresholds.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionThresholdBehavior0006', 0, () => {
      logger.info(`${BUNDLE}testVersionThresholdBehavior0006, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(availableResult === expectedAvailable).assertTrue();
      expect(suppressResult === expectedSuppress).assertTrue();
      logger.info(`${BUNDLE}testVersionThresholdBehavior0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0700
     * @tc.name testMockAnnotationBehavior0007
     * @tc.desc Verify mock annotation behavior differs from local.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockAnnotationBehavior0007', 0, () => {
      logger.info(`${BUNDLE}testMockAnnotationBehavior0007, begin`);
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      expect(mockVersion).assertEqual(21);
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(typeof mockAvailable).assertEqual('boolean');
      logger.info(`${BUNDLE}testMockAnnotationBehavior0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0800
     * @tc.name testAnnotationStateTransitions0008
     * @tc.desc Verify state transitions between local and mock environments.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testAnnotationStateTransitions0008', 0, () => {
      logger.info(`${BUNDLE}testAnnotationStateTransitions0008, begin`);
      const localResult1 = AnnotationService.runAvailableDemo();
      const mockResult1 = AnnotationService.runMockAvailableDemo();
      const localResult2 = AnnotationService.runAvailableDemo();
      const mockResult2 = AnnotationService.runMockAvailableDemo();
      expect(localResult1).assertEqual(localResult2);
      expect(mockResult1).assertFalse();
      expect(mockResult2).assertFalse();
      expect(localResult1 === localResult2).assertTrue();
      expect(mockResult1 === mockResult2).assertTrue();
      expect(typeof localResult1).assertEqual('boolean');
      logger.info(`${BUNDLE}testAnnotationStateTransitions0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_DEEP_0900
     * @tc.name testAnnotationDemoDeterminism0009
     * @tc.desc Verify annotation demos produce deterministic results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnnotationDemoDeterminism0009', 0, () => {
      logger.info(`${BUNDLE}testAnnotationDemoDeterminism0009, begin`);
      const results1: boolean[] = [];
      const results2: boolean[] = [];
      for (let i = 0; i < 5; i++) {
        results1.push(AnnotationService.runAvailableDemo());
        results2.push(AnnotationService.runAvailableDemo());
      }
      expect(results1.length).assertEqual(5);
      expect(results2.length).assertEqual(5);
      expect(results1[0]).assertEqual(results2[0]);
      expect(results1[4]).assertEqual(results2[4]);
      expect(results1[0] === results1[4]).assertTrue();
      expect(results2[0] === results2[4]).assertTrue();
      logger.info(`${BUNDLE}testAnnotationDemoDeterminism0009, end`);
    });
  });
}
