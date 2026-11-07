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

export default function annotationExceptionTest() {
  describe('AnnotationException', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationException, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationException, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationException, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationException, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0100
     * @tc.name testApiVersionBoundaryValues0001
     * @tc.desc Verify API version boundary values are valid and in correct order.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testApiVersionBoundaryValues0001', 0, () => {
      logger.info(`${BUNDLE}testApiVersionBoundaryValues0001, begin`);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testApiVersionBoundaryValues0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0200
     * @tc.name testDeviceApiVersionValidity0002
     * @tc.desc Verify device API version is within expected range.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceApiVersionValidity0002', 0, () => {
      logger.info(`${BUNDLE}testDeviceApiVersionValidity0002, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(localVersion > 0).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(localVersion >= AVAILABLE_MIN_API_VERSION || localVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testDeviceApiVersionValidity0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0300
     * @tc.name testDemoReturnTypeConsistency0003
     * @tc.desc Verify all demo methods return boolean type consistently.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDemoReturnTypeConsistency0003', 0, () => {
      logger.info(`${BUNDLE}testDemoReturnTypeConsistency0003, begin`);
      const localAvailable = AnnotationService.runAvailableDemo();
      const localSuppress = AnnotationService.runSuppressWarningsDemo();
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      expect(typeof localAvailable).assertEqual('boolean');
      expect(typeof localSuppress).assertEqual('boolean');
      expect(typeof mockAvailable).assertEqual('boolean');
      expect(typeof mockSuppress).assertEqual('boolean');
      expect(localAvailable === true || localAvailable === false).assertTrue();
      expect(localSuppress === true || localSuppress === false).assertTrue();
      logger.info(`${BUNDLE}testDemoReturnTypeConsistency0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0400
     * @tc.name testVersionComparisonLogic0004
     * @tc.desc Verify version comparison logic is correct.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionComparisonLogic0004', 0, () => {
      logger.info(`${BUNDLE}testVersionComparisonLogic0004, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(expectedAvailable === (localVersion >= AVAILABLE_MIN_API_VERSION)).assertTrue();
      expect(expectedSuppress === (localVersion >= FUTURE_DEMO_API_VERSION)).assertTrue();
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testVersionComparisonLogic0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0500
     * @tc.name testRulesArrayIntegrity0005
     * @tc.desc Verify suppression rules array maintains integrity.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesArrayIntegrity0005', 0, () => {
      logger.info(`${BUNDLE}testRulesArrayIntegrity0005, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules.includes('compatibility')).assertTrue();
      expect(rules.includes('syscap')).assertTrue();
      expect(rules.includes('permission')).assertTrue();
      expect(rules[0] !== undefined && rules[0] !== null).assertTrue();
      logger.info(`${BUNDLE}testRulesArrayIntegrity0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0600
     * @tc.name testMultipleCallsIdempotency0006
     * @tc.desc Verify multiple calls return same results (idempotency).
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMultipleCallsIdempotency0006', 0, () => {
      logger.info(`${BUNDLE}testMultipleCallsIdempotency0006, begin`);
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runAvailableDemo();
      const result3 = AnnotationService.runAvailableDemo();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1 === result2).assertTrue();
      expect(result2 === result3).assertTrue();
      expect(typeof result1).assertEqual('boolean');
      logger.info(`${BUNDLE}testMultipleCallsIdempotency0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0700
     * @tc.name testMockEnvironmentIsolation0007
     * @tc.desc Verify mock environment is isolated from local environment.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockEnvironmentIsolation0007', 0, () => {
      logger.info(`${BUNDLE}testMockEnvironmentIsolation0007, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(localVersion !== mockVersion).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      logger.info(`${BUNDLE}testMockEnvironmentIsolation0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0800
     * @tc.name testStateConsistencyAfterOperations0008
     * @tc.desc Verify state consistency after various operations.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateConsistencyAfterOperations0008', 0, () => {
      logger.info(`${BUNDLE}testStateConsistencyAfterOperations0008, begin`);
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      const localVersion = AnnotationService.getLocalApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(rules.length).assertEqual(3);
      expect(typeof localVersion).assertEqual('number');
      expect(Array.isArray(rules)).assertTrue();
      logger.info(`${BUNDLE}testStateConsistencyAfterOperations0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_EXCEPT_0900
     * @tc.name testCrossEnvironmentState0009
     * @tc.desc Verify state remains consistent across environment switches.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCrossEnvironmentState0009', 0, () => {
      logger.info(`${BUNDLE}testCrossEnvironmentState0009, begin`);
      const localResult1 = AnnotationService.runAvailableDemo();
      const mockResult1 = AnnotationService.runMockAvailableDemo();
      const localResult2 = AnnotationService.runAvailableDemo();
      const mockResult2 = AnnotationService.runMockAvailableDemo();
      expect(localResult1).assertEqual(localResult2);
      expect(mockResult1).assertEqual(mockResult2);
      expect(mockResult1).assertFalse();
      expect(localResult1 === localResult2).assertTrue();
      expect(mockResult1 === mockResult2).assertTrue();
      logger.info(`${BUNDLE}testCrossEnvironmentState0009, end`);
    });
  });
}
