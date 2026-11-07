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
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_';
const MOCK_API_VERSION: number = 21;
const BOUNDARY_BELOW_AVAILABLE: number = AVAILABLE_MIN_API_VERSION - 1;
const BOUNDARY_AT_AVAILABLE: number = AVAILABLE_MIN_API_VERSION;
const BOUNDARY_ABOVE_AVAILABLE: number = AVAILABLE_MIN_API_VERSION + 1;
const BOUNDARY_BELOW_FUTURE: number = FUTURE_DEMO_API_VERSION - 1;
const BOUNDARY_AT_FUTURE: number = FUTURE_DEMO_API_VERSION;
const BOUNDARY_ABOVE_FUTURE: number = FUTURE_DEMO_API_VERSION + 1;

export default function apiVersionBoundaryTest() {
  describe('ApiVersionBoundary', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}ApiVersionBoundary, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}ApiVersionBoundary, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}ApiVersionBoundary, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}ApiVersionBoundary, afterAll`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0100
     * @tc.name testMockApiVersionBelowAvailable0001
     * @tc.desc Verify mock API version 21 is below Available threshold 22.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockApiVersionBelowAvailable0001', 0, () => {
      logger.info(`${BUNDLE}testMockApiVersionBelowAvailable0001, begin`);
      expect(MOCK_API_VERSION < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(AnnotationService.runMockAvailableDemo()).assertFalse();
      expect(typeof MOCK_API_VERSION).assertEqual('number');
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(MOCK_API_VERSION).assertEqual(21);
      logger.info(`${BUNDLE}testMockApiVersionBelowAvailable0001, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0200
     * @tc.name testMockApiVersionBelowFuture0002
     * @tc.desc Verify mock API version 21 is below SuppressWarnings threshold 27.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockApiVersionBelowFuture0002', 0, () => {
      logger.info(`${BUNDLE}testMockApiVersionBelowFuture0002, begin`);
      expect(MOCK_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(AnnotationService.runMockSuppressWarningsDemo()).assertFalse();
      expect(typeof MOCK_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      expect(MOCK_API_VERSION).assertEqual(21);
      logger.info(`${BUNDLE}testMockApiVersionBelowFuture0002, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0300
     * @tc.name testLocalApiVersionAtBoundary0003
     * @tc.desc Verify local API version comparison with Available threshold.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLocalApiVersionAtBoundary0003', 0, () => {
      logger.info(`${BUNDLE}testLocalApiVersionAtBoundary0003, begin`);
      const localVersion = deviceInfo.sdkApiVersion;
      const expected = localVersion >= AVAILABLE_MIN_API_VERSION;
      const result = AnnotationService.runAvailableDemo();
      expect(result).assertEqual(expected);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testLocalApiVersionAtBoundary0003, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0400
     * @tc.name testLocalApiVersionAtFutureBoundary0004
     * @tc.desc Verify local API version comparison with SuppressWarnings threshold.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLocalApiVersionAtFutureBoundary0004', 0, () => {
      logger.info(`${BUNDLE}testLocalApiVersionAtFutureBoundary0004, begin`);
      const localVersion = deviceInfo.sdkApiVersion;
      const expected = localVersion >= FUTURE_DEMO_API_VERSION;
      const result = AnnotationService.runSuppressWarningsDemo();
      expect(result).assertEqual(expected);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testLocalApiVersionAtFutureBoundary0004, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0500
     * @tc.name testAvailableBoundaryValues0005
     * @tc.desc Verify Available boundary values are correctly defined.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableBoundaryValues0005', 0, () => {
      logger.info(`${BUNDLE}testAvailableBoundaryValues0005, begin`);
      expect(BOUNDARY_BELOW_AVAILABLE).assertEqual(AVAILABLE_MIN_API_VERSION - 1);
      expect(BOUNDARY_AT_AVAILABLE).assertEqual(AVAILABLE_MIN_API_VERSION);
      expect(BOUNDARY_ABOVE_AVAILABLE).assertEqual(AVAILABLE_MIN_API_VERSION + 1);
      logger.info(`${BUNDLE}testAvailableBoundaryValues0005, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0600
     * @tc.name testFutureBoundaryValues0006
     * @tc.desc Verify SuppressWarnings boundary values are correctly defined.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFutureBoundaryValues0006', 0, () => {
      logger.info(`${BUNDLE}testFutureBoundaryValues0006, begin`);
      expect(BOUNDARY_BELOW_FUTURE).assertEqual(FUTURE_DEMO_API_VERSION - 1);
      expect(BOUNDARY_AT_FUTURE).assertEqual(FUTURE_DEMO_API_VERSION);
      expect(BOUNDARY_ABOVE_FUTURE).assertEqual(FUTURE_DEMO_API_VERSION + 1);
      logger.info(`${BUNDLE}testFutureBoundaryValues0006, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0700
     * @tc.name testMockApiVersionIsFixed0007
     * @tc.desc Verify mock API version remains constant at 21.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockApiVersionIsFixed0007', 0, () => {
      logger.info(`${BUNDLE}testMockApiVersionIsFixed0007, begin`);
      const version1 = AnnotationService.getMockApiVersion();
      const version2 = AnnotationService.getMockApiVersion();
      const version3 = AnnotationService.getMockApiVersion();
      expect(version1).assertEqual(MOCK_API_VERSION);
      expect(version2).assertEqual(MOCK_API_VERSION);
      expect(version3).assertEqual(MOCK_API_VERSION);
      logger.info(`${BUNDLE}testMockApiVersionIsFixed0007, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0800
     * @tc.name testLocalApiVersionIsConsistent0008
     * @tc.desc Verify local API version remains consistent across calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocalApiVersionIsConsistent0008', 0, () => {
      logger.info(`${BUNDLE}testLocalApiVersionIsConsistent0008, begin`);
      const version1 = AnnotationService.getLocalApiVersion();
      const version2 = AnnotationService.getLocalApiVersion();
      expect(version1).assertEqual(version2);
      expect(version1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof version1).assertEqual('number');
      expect(typeof version2).assertEqual('number');
      expect(version1 === version2).assertTrue();
      logger.info(`${BUNDLE}testLocalApiVersionIsConsistent0008, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_0900
     * @tc.name testBoundaryRelationshipMockAvailable0009
     * @tc.desc Verify mock version is always below Available threshold.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoundaryRelationshipMockAvailable0009', 0, () => {
      logger.info(`${BUNDLE}testBoundaryRelationshipMockAvailable0009, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(mockVersion).assertEqual(21);
      logger.info(`${BUNDLE}testBoundaryRelationshipMockAvailable0009, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1000
     * @tc.name testBoundaryRelationshipMockFuture0010
     * @tc.desc Verify mock version is always below SuppressWarnings threshold.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoundaryRelationshipMockFuture0010', 0, () => {
      logger.info(`${BUNDLE}testBoundaryRelationshipMockFuture0010, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      expect(mockVersion).assertEqual(21);
      logger.info(`${BUNDLE}testBoundaryRelationshipMockFuture0010, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1100
     * @tc.name testAvailableThresholdGap0011
     * @tc.desc Verify gap between Available and SuppressWarnings thresholds.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableThresholdGap0011', 0, () => {
      logger.info(`${BUNDLE}testAvailableThresholdGap0011, begin`);
      const gap = FUTURE_DEMO_API_VERSION - AVAILABLE_MIN_API_VERSION;
      expect(gap).assertEqual(5);
      expect(gap > 0).assertTrue();
      expect(typeof gap).assertEqual('number');
      expect(gap === 5).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > AVAILABLE_MIN_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testAvailableThresholdGap0011, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1200
     * @tc.name testMockResultConsistency0012
     * @tc.desc Verify mock demo results are consistent with boundary conditions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockResultConsistency0012', 0, () => {
      logger.info(`${BUNDLE}testMockResultConsistency0012, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      const expectedAvailable = mockVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = mockVersion >= FUTURE_DEMO_API_VERSION;
      const actualAvailable = AnnotationService.runMockAvailableDemo();
      const actualSuppress = AnnotationService.runMockSuppressWarningsDemo();
      expect(actualAvailable).assertEqual(expectedAvailable);
      expect(actualSuppress).assertEqual(expectedSuppress);
      expect(typeof actualAvailable).assertEqual('boolean');
      expect(typeof actualSuppress).assertEqual('boolean');
      logger.info(`${BUNDLE}testMockResultConsistency0012, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1300
     * @tc.name testLocalResultConsistency0013
     * @tc.desc Verify local demo results are consistent with boundary conditions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLocalResultConsistency0013', 0, () => {
      logger.info(`${BUNDLE}testLocalResultConsistency0013, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      const actualAvailable = AnnotationService.runAvailableDemo();
      const actualSuppress = AnnotationService.runSuppressWarningsDemo();
      expect(actualAvailable).assertEqual(expectedAvailable);
      expect(actualSuppress).assertEqual(expectedSuppress);
      expect(typeof actualAvailable).assertEqual('boolean');
      expect(typeof actualSuppress).assertEqual('boolean');
      logger.info(`${BUNDLE}testLocalResultConsistency0013, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1400
     * @tc.name testBoundaryValuesPositive0014
     * @tc.desc Verify all boundary values are positive numbers.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBoundaryValuesPositive0014', 0, () => {
      logger.info(`${BUNDLE}testBoundaryValuesPositive0014, begin`);
      expect(MOCK_API_VERSION > 0).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      expect(BOUNDARY_BELOW_AVAILABLE > 0).assertTrue();
      expect(BOUNDARY_BELOW_FUTURE > 0).assertTrue();
      logger.info(`${BUNDLE}testBoundaryValuesPositive0014, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1500
     * @tc.name testBoundaryOrdering0015
     * @tc.desc Verify correct ordering of all boundary values.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundaryOrdering0015', 0, () => {
      logger.info(`${BUNDLE}testBoundaryOrdering0015, begin`);
      expect(MOCK_API_VERSION).assertEqual(BOUNDARY_BELOW_AVAILABLE);
      expect(BOUNDARY_BELOW_AVAILABLE < BOUNDARY_AT_AVAILABLE).assertTrue();
      expect(BOUNDARY_AT_AVAILABLE < BOUNDARY_ABOVE_AVAILABLE).assertTrue();
      expect(BOUNDARY_ABOVE_AVAILABLE < BOUNDARY_BELOW_FUTURE).assertTrue();
      expect(BOUNDARY_BELOW_FUTURE < BOUNDARY_AT_FUTURE).assertTrue();
      expect(BOUNDARY_AT_FUTURE < BOUNDARY_ABOVE_FUTURE).assertTrue();
      logger.info(`${BUNDLE}testBoundaryOrdering0015, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1600
     * @tc.name testMultipleBoundaryCalls0016
     * @tc.desc Verify boundary conditions remain stable across multiple calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMultipleBoundaryCalls0016', 0, () => {
      logger.info(`${BUNDLE}testMultipleBoundaryCalls0016, begin`);
      for (let i = 0; i < 3; i++) {
        const mockVersion = AnnotationService.getMockApiVersion();
        const localVersion = AnnotationService.getLocalApiVersion();
        expect(mockVersion).assertEqual(MOCK_API_VERSION);
        expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
        expect(typeof mockVersion).assertEqual('number');
        expect(typeof localVersion).assertEqual('number');
      }
      logger.info(`${BUNDLE}testMultipleBoundaryCalls0016, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1700
     * @tc.name testAvailableDemoReturnsBoolean0017
     * @tc.desc Verify runAvailableDemo returns boolean type.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableDemoReturnsBoolean0017', 0, () => {
      logger.info(`${BUNDLE}testAvailableDemoReturnsBoolean0017, begin`);
      const result = AnnotationService.runAvailableDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
      expect(result).assertEqual(deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION);
      logger.info(`${BUNDLE}testAvailableDemoReturnsBoolean0017, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1800
     * @tc.name testSuppressWarningsDemoReturnsBoolean0018
     * @tc.desc Verify runSuppressWarningsDemo returns boolean type.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressWarningsDemoReturnsBoolean0018', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsDemoReturnsBoolean0018, begin`);
      const result = AnnotationService.runSuppressWarningsDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
      expect(result).assertEqual(deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION);
      logger.info(`${BUNDLE}testSuppressWarningsDemoReturnsBoolean0018, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_1900
     * @tc.name testMockAvailableDemoReturnsBoolean0019
     * @tc.desc Verify runMockAvailableDemo returns boolean type.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockAvailableDemoReturnsBoolean0019', 0, () => {
      logger.info(`${BUNDLE}testMockAvailableDemoReturnsBoolean0019, begin`);
      const result = AnnotationService.runMockAvailableDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertFalse();
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testMockAvailableDemoReturnsBoolean0019, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_BOUNDARY_2000
     * @tc.name testMockSuppressWarningsDemoReturnsBoolean0020
     * @tc.desc Verify runMockSuppressWarningsDemo returns boolean type.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockSuppressWarningsDemoReturnsBoolean0020', 0, () => {
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoReturnsBoolean0020, begin`);
      const result = AnnotationService.runMockSuppressWarningsDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertFalse();
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoReturnsBoolean0020, end`);
    });
  });
}
