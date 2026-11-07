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

import { deviceInfo, SuppressWarningsType } from '@kit.BasicServicesKit';
import { describe, expect, it } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  FUTURE_DEMO_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_';
const MOCK_API_VERSION: number = 21;

export default function annotationEdgeCasesTest() {
  describe('AnnotationEdgeCasesTest', () => {
    /**
     * @tc.number SUB_ANNOTATION_EDGE_0100
     * @tc.name testApiVersionBoundary0001
     * @tc.desc Verify API version relationships at boundaries.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testApiVersionBoundary0001', 0, () => {
      logger.info(`${BUNDLE}testApiVersionBoundary0001, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testApiVersionBoundary0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0200
     * @tc.name testMockEnvironmentConsistency0002
     * @tc.desc Verify mock environment returns consistent results across calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockEnvironmentConsistency0002', 0, () => {
      logger.info(`${BUNDLE}testMockEnvironmentConsistency0002, begin`);
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const mockVersion2 = AnnotationService.getMockApiVersion();
      const mockAvailable1 = AnnotationService.runMockAvailableDemo();
      const mockAvailable2 = AnnotationService.runMockAvailableDemo();
      expect(mockVersion1).assertEqual(mockVersion2);
      expect(mockAvailable1).assertEqual(mockAvailable2);
      expect(typeof mockVersion1).assertEqual('number');
      expect(typeof mockAvailable1).assertEqual('boolean');
      logger.info(`${BUNDLE}testMockEnvironmentConsistency0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0300
     * @tc.name testSuppressionRulesImmutability0003
     * @tc.desc Verify that modifying returned rules array does not affect internal state.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesImmutability0003', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesImmutability0003, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const originalLength = rules1.length;
      rules1.push('test_rule');
      rules1.pop();
      rules1.reverse();
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(originalLength);
      expect(rules2[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules2[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules2[2]).assertEqual(SuppressWarningsType.PERMISSION);
      logger.info(`${BUNDLE}testSuppressionRulesImmutability0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0400
     * @tc.name testAvailableDemoBoundaryBehavior0004
     * @tc.desc Verify Available demo behavior at API version boundaries.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableDemoBoundaryBehavior0004', 0, () => {
      logger.info(`${BUNDLE}testAvailableDemoBoundaryBehavior0004, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const localResult = AnnotationService.runAvailableDemo();
      const mockResult = AnnotationService.runMockAvailableDemo();
      expect(localResult).assertEqual(localVersion >= AVAILABLE_MIN_API_VERSION);
      expect(mockResult).assertEqual(mockVersion >= AVAILABLE_MIN_API_VERSION);
      expect(typeof localResult).assertEqual('boolean');
      expect(typeof mockResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testAvailableDemoBoundaryBehavior0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0500
     * @tc.name testSuppressWarningsDemoBoundaryBehavior0005
     * @tc.desc Verify SuppressWarnings demo behavior at API version boundaries.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressWarningsDemoBoundaryBehavior0005', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsDemoBoundaryBehavior0005, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const localResult = AnnotationService.runSuppressWarningsDemo();
      const mockResult = AnnotationService.runMockSuppressWarningsDemo();
      expect(localResult).assertEqual(localVersion >= FUTURE_DEMO_API_VERSION);
      expect(mockResult).assertEqual(mockVersion >= FUTURE_DEMO_API_VERSION);
      expect(typeof localResult).assertEqual('boolean');
      expect(typeof mockResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testSuppressWarningsDemoBoundaryBehavior0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0600
     * @tc.name testVersionConstantsArePositive0006
     * @tc.desc Verify all version constants are positive numbers.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionConstantsArePositive0006', 0, () => {
      logger.info(`${BUNDLE}testVersionConstantsArePositive0006, begin`);
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      expect(MOCK_API_VERSION > 0).assertTrue();
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      logger.info(`${BUNDLE}testVersionConstantsArePositive0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0700
     * @tc.name testSuppressionRulesNotEmpty0007
     * @tc.desc Verify suppression rules array is not empty and contains valid types.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesNotEmpty0007', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesNotEmpty0007, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length > 0).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules.includes(SuppressWarningsType.COMPATIBILITY)).assertTrue();
      expect(rules.includes(SuppressWarningsType.SYSCAP)).assertTrue();
      expect(rules.includes(SuppressWarningsType.PERMISSION)).assertTrue();
      logger.info(`${BUNDLE}testSuppressionRulesNotEmpty0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0800
     * @tc.name testLocalAndMockVersionIndependence0008
     * @tc.desc Verify local and mock versions are independent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocalAndMockVersionIndependence0008', 0, () => {
      logger.info(`${BUNDLE}testLocalAndMockVersionIndependence0008, begin`);
      const localVersion1 = AnnotationService.getLocalApiVersion();
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const localVersion2 = AnnotationService.getLocalApiVersion();
      const mockVersion2 = AnnotationService.getMockApiVersion();
      expect(localVersion1).assertEqual(localVersion2);
      expect(mockVersion1).assertEqual(mockVersion2);
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion1).assertEqual(MOCK_API_VERSION);
      logger.info(`${BUNDLE}testLocalAndMockVersionIndependence0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_0900
     * @tc.name testDemoExecutionOrderIndependence0009
     * @tc.desc Verify demo execution order does not affect results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDemoExecutionOrderIndependence0009', 0, () => {
      logger.info(`${BUNDLE}testDemoExecutionOrderIndependence0009, begin`);
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runSuppressWarningsDemo();
      const result3 = AnnotationService.runAvailableDemo();
      const result4 = AnnotationService.runSuppressWarningsDemo();
      expect(result1).assertEqual(expectedAvailable);
      expect(result2).assertEqual(expectedSuppress);
      expect(result3).assertEqual(expectedAvailable);
      expect(result4).assertEqual(expectedSuppress);
      logger.info(`${BUNDLE}testDemoExecutionOrderIndependence0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_1000
     * @tc.name testMockDemoExecutionOrderIndependence0010
     * @tc.desc Verify mock demo execution order does not affect results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockDemoExecutionOrderIndependence0010', 0, () => {
      logger.info(`${BUNDLE}testMockDemoExecutionOrderIndependence0010, begin`);
      const expectedMockAvailable = MOCK_API_VERSION >= AVAILABLE_MIN_API_VERSION;
      const expectedMockSuppress = MOCK_API_VERSION >= FUTURE_DEMO_API_VERSION;
      const result1 = AnnotationService.runMockAvailableDemo();
      const result2 = AnnotationService.runMockSuppressWarningsDemo();
      const result3 = AnnotationService.runMockAvailableDemo();
      const result4 = AnnotationService.runMockSuppressWarningsDemo();
      expect(result1).assertEqual(expectedMockAvailable);
      expect(result2).assertEqual(expectedMockSuppress);
      expect(result3).assertEqual(expectedMockAvailable);
      expect(result4).assertEqual(expectedMockSuppress);
      logger.info(`${BUNDLE}testMockDemoExecutionOrderIndependence0010, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_1100
     * @tc.name testSuppressionRulesMultipleRetrievals0011
     * @tc.desc Verify multiple retrievals of suppression rules return consistent results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesMultipleRetrievals0011', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesMultipleRetrievals0011, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules2.length).assertEqual(rules3.length);
      expect(rules1[0]).assertEqual(rules2[0]);
      expect(rules2[1]).assertEqual(rules3[1]);
      expect(rules1[2]).assertEqual(rules3[2]);
      logger.info(`${BUNDLE}testSuppressionRulesMultipleRetrievals0011, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EDGE_1200
     * @tc.name testVersionRetrievalStability0012
     * @tc.desc Verify version retrieval is stable and does not change.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionRetrievalStability0012', 0, () => {
      logger.info(`${BUNDLE}testVersionRetrievalStability0012, begin`);
      const versions: number[] = [];
      for (let i = 0; i < 5; i++) {
        versions.push(AnnotationService.getLocalApiVersion());
      }
      for (let i = 1; i < versions.length; i++) {
        expect(versions[i]).assertEqual(versions[0]);
      }
      expect(versions.length).assertEqual(5);
      expect(versions[0]).assertEqual(deviceInfo.sdkApiVersion);
      logger.info(`${BUNDLE}testVersionRetrievalStability0012, end`);
    });
  });
}
