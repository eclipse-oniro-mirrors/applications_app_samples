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

import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_';
const MOCK_API_VERSION: number = 21;

export default function mockEnvironmentTest() {
  describe('MockEnvironment', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}MockEnvironment, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}MockEnvironment, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}MockEnvironment, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}MockEnvironment, afterAll`);
    });

    /**
     * @tc.number SUB_MOCK_0100
     * @tc.name testMockApiVersionValue0001
     * @tc.desc Verify getMockApiVersion returns fixed value 21.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockApiVersionValue0001', 0, () => {
      logger.info(`${BUNDLE}testMockApiVersionValue0001, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      expect(mockVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testMockApiVersionValue0001, end`);
    });

    /**
     * @tc.number SUB_MOCK_0200
     * @tc.name testMockAvailableDemoReturnsFalse0002
     * @tc.desc Verify runMockAvailableDemo always returns false (21 < 22).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockAvailableDemoReturnsFalse0002', 0, () => {
      logger.info(`${BUNDLE}testMockAvailableDemoReturnsFalse0002, begin`);
      const result = AnnotationService.runMockAvailableDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testMockAvailableDemoReturnsFalse0002, end`);
    });

    /**
     * @tc.number SUB_MOCK_0300
     * @tc.name testMockSuppressWarningsDemoReturnsFalse0003
     * @tc.desc Verify runMockSuppressWarningsDemo always returns false (21 < 27).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockSuppressWarningsDemoReturnsFalse0003', 0, () => {
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoReturnsFalse0003, begin`);
      const result = AnnotationService.runMockSuppressWarningsDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoReturnsFalse0003, end`);
    });

    /**
     * @tc.number SUB_MOCK_0400
     * @tc.name testMockVersionBelowAvailableThreshold0004
     * @tc.desc Verify mock version is below Available threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockVersionBelowAvailableThreshold0004', 0, () => {
      logger.info(`${BUNDLE}testMockVersionBelowAvailableThreshold0004, begin`);
      expect(MOCK_API_VERSION < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(typeof MOCK_API_VERSION).assertEqual('number');
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(MOCK_API_VERSION === 21).assertTrue();
      logger.info(`${BUNDLE}testMockVersionBelowAvailableThreshold0004, end`);
    });

    /**
     * @tc.number SUB_MOCK_0500
     * @tc.name testMockVersionBelowFutureThreshold0005
     * @tc.desc Verify mock version is below SuppressWarnings threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockVersionBelowFutureThreshold0005', 0, () => {
      logger.info(`${BUNDLE}testMockVersionBelowFutureThreshold0005, begin`);
      expect(MOCK_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(typeof MOCK_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      expect(MOCK_API_VERSION === 21).assertTrue();
      logger.info(`${BUNDLE}testMockVersionBelowFutureThreshold0005, end`);
    });

    /**
     * @tc.number SUB_MOCK_0600
     * @tc.name testMockVersionConsistency0006
     * @tc.desc Verify mock version remains consistent across multiple calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockVersionConsistency0006', 0, () => {
      logger.info(`${BUNDLE}testMockVersionConsistency0006, begin`);
      const version1 = AnnotationService.getMockApiVersion();
      const version2 = AnnotationService.getMockApiVersion();
      const version3 = AnnotationService.getMockApiVersion();
      expect(version1).assertEqual(MOCK_API_VERSION);
      expect(version2).assertEqual(MOCK_API_VERSION);
      expect(version3).assertEqual(MOCK_API_VERSION);
      logger.info(`${BUNDLE}testMockVersionConsistency0006, end`);
    });

    /**
     * @tc.number SUB_MOCK_0700
     * @tc.name testMockAvailableDemoConsistency0007
     * @tc.desc Verify runMockAvailableDemo returns consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockAvailableDemoConsistency0007', 0, () => {
      logger.info(`${BUNDLE}testMockAvailableDemoConsistency0007, begin`);
      const result1 = AnnotationService.runMockAvailableDemo();
      const result2 = AnnotationService.runMockAvailableDemo();
      const result3 = AnnotationService.runMockAvailableDemo();
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
      logger.info(`${BUNDLE}testMockAvailableDemoConsistency0007, end`);
    });

    /**
     * @tc.number SUB_MOCK_0800
     * @tc.name testMockSuppressWarningsDemoConsistency0008
     * @tc.desc Verify runMockSuppressWarningsDemo returns consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockSuppressWarningsDemoConsistency0008', 0, () => {
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoConsistency0008, begin`);
      const result1 = AnnotationService.runMockSuppressWarningsDemo();
      const result2 = AnnotationService.runMockSuppressWarningsDemo();
      const result3 = AnnotationService.runMockSuppressWarningsDemo();
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
      logger.info(`${BUNDLE}testMockSuppressWarningsDemoConsistency0008, end`);
    });

    /**
     * @tc.number SUB_MOCK_0900
     * @tc.name testMockVsLocalVersionDifference0009
     * @tc.desc Verify mock and local versions are different.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockVsLocalVersionDifference0009', 0, () => {
      logger.info(`${BUNDLE}testMockVsLocalVersionDifference0009, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(localVersion >= 0).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      expect(typeof localVersion).assertEqual('number');
      expect(mockVersion !== localVersion).assertTrue();
      logger.info(`${BUNDLE}testMockVsLocalVersionDifference0009, end`);
    });

    /**
     * @tc.number SUB_MOCK_1000
     * @tc.name testMockResultBooleanType0010
     * @tc.desc Verify mock demo results are boolean type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockResultBooleanType0010', 0, () => {
      logger.info(`${BUNDLE}testMockResultBooleanType0010, begin`);
      const availableResult = AnnotationService.runMockAvailableDemo();
      const suppressResult = AnnotationService.runMockSuppressWarningsDemo();
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(availableResult === false).assertTrue();
      expect(suppressResult === false).assertTrue();
      logger.info(`${BUNDLE}testMockResultBooleanType0010, end`);
    });

    /**
     * @tc.number SUB_MOCK_1100
     * @tc.name testMockVersionIsNumber0011
     * @tc.desc Verify mock API version is number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockVersionIsNumber0011', 0, () => {
      logger.info(`${BUNDLE}testMockVersionIsNumber0011, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      expect(Number.isFinite(mockVersion)).assertTrue();
      logger.info(`${BUNDLE}testMockVersionIsNumber0011, end`);
    });

    /**
     * @tc.number SUB_MOCK_1200
     * @tc.name testMockVersionIsPositive0012
     * @tc.desc Verify mock API version is positive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMockVersionIsPositive0012', 0, () => {
      logger.info(`${BUNDLE}testMockVersionIsPositive0012, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion > 0).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      logger.info(`${BUNDLE}testMockVersionIsPositive0012, end`);
    });

    /**
     * @tc.number SUB_MOCK_1300
     * @tc.name testMockVersionIsInteger0013
     * @tc.desc Verify mock API version is an integer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMockVersionIsInteger0013', 0, () => {
      logger.info(`${BUNDLE}testMockVersionIsInteger0013, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(Number.isInteger(mockVersion)).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      logger.info(`${BUNDLE}testMockVersionIsInteger0013, end`);
    });

    /**
     * @tc.number SUB_MOCK_1400
     * @tc.name testMockBothDemosReturnFalse0014
     * @tc.desc Verify both mock demos return false in the same call sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockBothDemosReturnFalse0014', 0, () => {
      logger.info(`${BUNDLE}testMockBothDemosReturnFalse0014, begin`);
      const availableResult = AnnotationService.runMockAvailableDemo();
      const suppressResult = AnnotationService.runMockSuppressWarningsDemo();
      expect(availableResult).assertFalse();
      expect(suppressResult).assertFalse();
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testMockBothDemosReturnFalse0014, end`);
    });

    /**
     * @tc.number SUB_MOCK_1500
     * @tc.name testMockDemosIndependentExecution0015
     * @tc.desc Verify mock demos can be executed independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockDemosIndependentExecution0015', 0, () => {
      logger.info(`${BUNDLE}testMockDemosIndependentExecution0015, begin`);
      const availableOnly = AnnotationService.runMockAvailableDemo();
      expect(availableOnly).assertFalse();
      const suppressOnly = AnnotationService.runMockSuppressWarningsDemo();
      expect(suppressOnly).assertFalse();
      expect(typeof availableOnly).assertEqual('boolean');
      expect(typeof suppressOnly).assertEqual('boolean');
      expect(availableOnly === suppressOnly).assertTrue();
      logger.info(`${BUNDLE}testMockDemosIndependentExecution0015, end`);
    });

    /**
     * @tc.number SUB_MOCK_1600
     * @tc.name testMockVersionStableAfterDemos0016
     * @tc.desc Verify mock version remains stable after running demos.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockVersionStableAfterDemos0016', 0, () => {
      logger.info(`${BUNDLE}testMockVersionStableAfterDemos0016, begin`);
      const versionBefore = AnnotationService.getMockApiVersion();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      const versionAfter = AnnotationService.getMockApiVersion();
      expect(versionBefore).assertEqual(MOCK_API_VERSION);
      expect(versionAfter).assertEqual(MOCK_API_VERSION);
      expect(typeof versionBefore).assertEqual('number');
      expect(typeof versionAfter).assertEqual('number');
      expect(versionBefore === versionAfter).assertTrue();
      logger.info(`${BUNDLE}testMockVersionStableAfterDemos0016, end`);
    });

    /**
     * @tc.number SUB_MOCK_1700
     * @tc.name testMockResultsStableAfterMultipleCalls0017
     * @tc.desc Verify mock results remain stable after multiple calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockResultsStableAfterMultipleCalls0017', 0, () => {
      logger.info(`${BUNDLE}testMockResultsStableAfterMultipleCalls0017, begin`);
      for (let i = 0; i < 5; i++) {
        const availableResult = AnnotationService.runMockAvailableDemo();
        const suppressResult = AnnotationService.runMockSuppressWarningsDemo();
        expect(availableResult).assertFalse();
        expect(suppressResult).assertFalse();
        expect(typeof availableResult).assertEqual('boolean');
        expect(typeof suppressResult).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testMockResultsStableAfterMultipleCalls0017, end`);
    });

    /**
     * @tc.number SUB_MOCK_1800
     * @tc.name testMockVersionNotAffectedByLocalCalls0018
     * @tc.desc Verify mock version is not affected by local API calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMockVersionNotAffectedByLocalCalls0018', 0, () => {
      logger.info(`${BUNDLE}testMockVersionNotAffectedByLocalCalls0018, begin`);
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      logger.info(`${BUNDLE}testMockVersionNotAffectedByLocalCalls0018, end`);
    });

    /**
     * @tc.number SUB_MOCK_1900
     * @tc.name testLocalVersionNotAffectedByMockCalls0019
     * @tc.desc Verify local version is not affected by mock API calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLocalVersionNotAffectedByMockCalls0019', 0, () => {
      logger.info(`${BUNDLE}testLocalVersionNotAffectedByMockCalls0019, begin`);
      const localVersionBefore = AnnotationService.getLocalApiVersion();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      const localVersionAfter = AnnotationService.getLocalApiVersion();
      expect(localVersionBefore).assertEqual(localVersionAfter);
      expect(typeof localVersionBefore).assertEqual('number');
      expect(typeof localVersionAfter).assertEqual('number');
      expect(localVersionBefore === localVersionAfter).assertTrue();
      logger.info(`${BUNDLE}testLocalVersionNotAffectedByMockCalls0019, end`);
    });

    /**
     * @tc.number SUB_MOCK_2000
     * @tc.name testMockVersionMatchesExpected0020
     * @tc.desc Verify mock version matches expected constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockVersionMatchesExpected0020', 0, () => {
      logger.info(`${BUNDLE}testMockVersionMatchesExpected0020, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      const expectedMockVersion = 21;
      expect(mockVersion).assertEqual(expectedMockVersion);
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion === 21).assertTrue();
      expect(Number.isInteger(mockVersion)).assertTrue();
      logger.info(`${BUNDLE}testMockVersionMatchesExpected0020, end`);
    });

    /**
     * @tc.number SUB_MOCK_2100
     * @tc.name testMockAvailableResultMatchesCalculation0021
     * @tc.desc Verify mock Available result matches expected calculation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockAvailableResultMatchesCalculation0021', 0, () => {
      logger.info(`${BUNDLE}testMockAvailableResultMatchesCalculation0021, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      const expected = mockVersion >= AVAILABLE_MIN_API_VERSION;
      const actual = AnnotationService.runMockAvailableDemo();
      expect(actual).assertEqual(expected);
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(typeof expected).assertEqual('boolean');
      expect(actual === expected).assertTrue();
      logger.info(`${BUNDLE}testMockAvailableResultMatchesCalculation0021, end`);
    });

    /**
     * @tc.number SUB_MOCK_2200
     * @tc.name testMockSuppressWarningsResultMatchesCalculation0022
     * @tc.desc Verify mock SuppressWarnings result matches expected calculation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockSuppressWarningsResultMatchesCalculation0022', 0, () => {
      logger.info(`${BUNDLE}testMockSuppressWarningsResultMatchesCalculation0022, begin`);
      const mockVersion = AnnotationService.getMockApiVersion();
      const expected = mockVersion >= FUTURE_DEMO_API_VERSION;
      const actual = AnnotationService.runMockSuppressWarningsDemo();
      expect(actual).assertEqual(expected);
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(typeof expected).assertEqual('boolean');
      expect(actual === expected).assertTrue();
      logger.info(`${BUNDLE}testMockSuppressWarningsResultMatchesCalculation0022, end`);
    });
  });
}
