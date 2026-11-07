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

export default function annotationStateTest() {
  describe('AnnotationState', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationState, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationState, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationState, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationState, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_STATE_0100
     * @tc.name testInitialStateLocalAvailable0001
     * @tc.desc Verify initial state for local Available demo based on device API version.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testInitialStateLocalAvailable0001', 0, () => {
      logger.info(`${BUNDLE}testInitialStateLocalAvailable0001, begin`);
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const result = AnnotationService.runAvailableDemo();
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testInitialStateLocalAvailable0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_STATE_0200
     * @tc.name testInitialStateLocalSuppress0002
     * @tc.desc Verify initial state for local SuppressWarnings demo based on device API version.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testInitialStateLocalSuppress0002', 0, () => {
      logger.info(`${BUNDLE}testInitialStateLocalSuppress0002, begin`);
      const expected = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      const result = AnnotationService.runSuppressWarningsDemo();
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testInitialStateLocalSuppress0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_STATE_0300
     * @tc.name testInitialStateMockAvailable0003
     * @tc.desc Verify initial state for mock Available demo always returns false.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testInitialStateMockAvailable0003', 0, () => {
      logger.info(`${BUNDLE}testInitialStateMockAvailable0003, begin`);
      const result = AnnotationService.runMockAvailableDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testInitialStateMockAvailable0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_STATE_0400
     * @tc.name testInitialStateMockSuppress0004
     * @tc.desc Verify initial state for mock SuppressWarnings demo always returns false.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testInitialStateMockSuppress0004', 0, () => {
      logger.info(`${BUNDLE}testInitialStateMockSuppress0004, begin`);
      const result = AnnotationService.runMockSuppressWarningsDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testInitialStateMockSuppress0004, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_0500
     * @tc.name testStateTransitionLocalToMock0005
     * @tc.desc Verify state transition from local to mock environment.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStateTransitionLocalToMock0005', 0, () => {
      logger.info(`${BUNDLE}testStateTransitionLocalToMock0005, begin`);
      const localResult = AnnotationService.runAvailableDemo();
      const mockResult = AnnotationService.runMockAvailableDemo();
      expect(mockResult).assertFalse();
      expect(typeof mockResult).assertEqual('boolean');
      expect(mockResult === false).assertTrue();
      if (deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION) {
        expect(localResult).assertTrue();
      }
      expect(typeof localResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testStateTransitionLocalToMock0005, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_0600
     * @tc.name testStateTransitionMockToLocal0006
     * @tc.desc Verify state transition from mock to local environment.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStateTransitionMockToLocal0006', 0, () => {
      logger.info(`${BUNDLE}testStateTransitionMockToLocal0006, begin`);
      const mockResult = AnnotationService.runMockAvailableDemo();
      const localResult = AnnotationService.runAvailableDemo();
      expect(mockResult).assertFalse();
      expect(typeof mockResult).assertEqual('boolean');
      expect(mockResult === false).assertTrue();
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      expect(localResult).assertEqual(expected);
      expect(typeof localResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testStateTransitionMockToLocal0006, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_0700
     * @tc.name testRepeatedLocalExecution0007
     * @tc.desc Verify repeated local execution returns consistent results.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedLocalExecution0007', 0, () => {
      logger.info(`${BUNDLE}testRepeatedLocalExecution0007, begin`);
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runAvailableDemo();
      const result3 = AnnotationService.runAvailableDemo();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(typeof result1).assertEqual('boolean');
      expect(typeof result2).assertEqual('boolean');
      expect(typeof result3).assertEqual('boolean');
      logger.info(`${BUNDLE}testRepeatedLocalExecution0007, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_0800
     * @tc.name testRepeatedMockExecution0008
     * @tc.desc Verify repeated mock execution returns consistent results.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedMockExecution0008', 0, () => {
      logger.info(`${BUNDLE}testRepeatedMockExecution0008, begin`);
      const result1 = AnnotationService.runMockAvailableDemo();
      const result2 = AnnotationService.runMockAvailableDemo();
      const result3 = AnnotationService.runMockAvailableDemo();
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
      logger.info(`${BUNDLE}testRepeatedMockExecution0008, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_0900
     * @tc.name testIndependentStatesAvailableSuppress0009
     * @tc.desc Verify Available and SuppressWarnings states are independent.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndependentStatesAvailableSuppress0009', 0, () => {
      logger.info(`${BUNDLE}testIndependentStatesAvailableSuppress0009, begin`);
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(availableResult === expectedAvailable).assertTrue();
      logger.info(`${BUNDLE}testIndependentStatesAvailableSuppress0009, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1000
     * @tc.name testIndependentStatesMockAvailableSuppress0010
     * @tc.desc Verify mock Available and SuppressWarnings states are independent.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndependentStatesMockAvailableSuppress0010', 0, () => {
      logger.info(`${BUNDLE}testIndependentStatesMockAvailableSuppress0010, begin`);
      const availableResult = AnnotationService.runMockAvailableDemo();
      const suppressResult = AnnotationService.runMockSuppressWarningsDemo();
      expect(availableResult).assertFalse();
      expect(suppressResult).assertFalse();
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(availableResult === false).assertTrue();
      logger.info(`${BUNDLE}testIndependentStatesMockAvailableSuppress0010, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1100
     * @tc.name testStateAfterMultipleSwitches0011
     * @tc.desc Verify state correctness after multiple environment switches.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStateAfterMultipleSwitches0011', 0, () => {
      logger.info(`${BUNDLE}testStateAfterMultipleSwitches0011, begin`);
      for (let i = 0; i < 3; i++) {
        const mockResult = AnnotationService.runMockAvailableDemo();
        const localResult = AnnotationService.runAvailableDemo();
        expect(mockResult).assertFalse();
        expect(typeof mockResult).assertEqual('boolean');
        const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
        expect(localResult).assertEqual(expected);
        expect(typeof localResult).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testStateAfterMultipleSwitches0011, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1200
     * @tc.name testSuppressStateAfterMultipleSwitches0012
     * @tc.desc Verify SuppressWarnings state correctness after multiple switches.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressStateAfterMultipleSwitches0012', 0, () => {
      logger.info(`${BUNDLE}testSuppressStateAfterMultipleSwitches0012, begin`);
      for (let i = 0; i < 3; i++) {
        const mockResult = AnnotationService.runMockSuppressWarningsDemo();
        const localResult = AnnotationService.runSuppressWarningsDemo();
        expect(mockResult).assertFalse();
        expect(typeof mockResult).assertEqual('boolean');
        const expected = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
        expect(localResult).assertEqual(expected);
        expect(typeof localResult).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testSuppressStateAfterMultipleSwitches0012, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1300
     * @tc.name testMixedExecutionOrder0013
     * @tc.desc Verify results with mixed execution order.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixedExecutionOrder0013', 0, () => {
      logger.info(`${BUNDLE}testMixedExecutionOrder0013, begin`);
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runMockAvailableDemo();
      const result3 = AnnotationService.runAvailableDemo();
      const result4 = AnnotationService.runMockAvailableDemo();
      expect(result1).assertEqual(result3);
      expect(result2).assertEqual(result4);
      expect(result2).assertFalse();
      expect(typeof result1).assertEqual('boolean');
      expect(typeof result2).assertEqual('boolean');
      expect(typeof result3).assertEqual('boolean');
      logger.info(`${BUNDLE}testMixedExecutionOrder0013, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1400
     * @tc.name testMockVersionAlwaysBelowThreshold0014
     * @tc.desc Verify mock version is always below both thresholds.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockVersionAlwaysBelowThreshold0014', 0, () => {
      logger.info(`${BUNDLE}testMockVersionAlwaysBelowThreshold0014, begin`);
      expect(MOCK_API_VERSION < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(MOCK_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(typeof MOCK_API_VERSION).assertEqual('number');
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(MOCK_API_VERSION).assertEqual(21);
      logger.info(`${BUNDLE}testMockVersionAlwaysBelowThreshold0014, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1500
     * @tc.name testStateConsistencyAcrossCalls0015
     * @tc.desc Verify state consistency across multiple API calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStateConsistencyAcrossCalls0015', 0, () => {
      logger.info(`${BUNDLE}testStateConsistencyAcrossCalls0015, begin`);
      const localVersion1 = AnnotationService.getLocalApiVersion();
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const localVersion2 = AnnotationService.getLocalApiVersion();
      const mockVersion2 = AnnotationService.getMockApiVersion();
      expect(localVersion1).assertEqual(localVersion2);
      expect(mockVersion1).assertEqual(mockVersion2);
      expect(typeof localVersion1).assertEqual('number');
      expect(typeof mockVersion1).assertEqual('number');
      expect(typeof localVersion2).assertEqual('number');
      logger.info(`${BUNDLE}testStateConsistencyAcrossCalls0015, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1600
     * @tc.name testAlternatingExecution0016
     * @tc.desc Verify results with alternating Available and SuppressWarnings execution.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAlternatingExecution0016', 0, () => {
      logger.info(`${BUNDLE}testAlternatingExecution0016, begin`);
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      for (let i = 0; i < 3; i++) {
        const actualAvailable = AnnotationService.runAvailableDemo();
        const actualSuppress = AnnotationService.runSuppressWarningsDemo();
        expect(actualAvailable).assertEqual(expectedAvailable);
        expect(actualSuppress).assertEqual(expectedSuppress);
        expect(typeof actualAvailable).assertEqual('boolean');
        expect(typeof actualSuppress).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testAlternatingExecution0016, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1700
     * @tc.name testAlternatingMockExecution0017
     * @tc.desc Verify mock results with alternating execution.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAlternatingMockExecution0017', 0, () => {
      logger.info(`${BUNDLE}testAlternatingMockExecution0017, begin`);
      for (let i = 0; i < 3; i++) {
        const mockAvailable = AnnotationService.runMockAvailableDemo();
        const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
        expect(mockAvailable).assertFalse();
        expect(mockSuppress).assertFalse();
        expect(typeof mockAvailable).assertEqual('boolean');
        expect(typeof mockSuppress).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testAlternatingMockExecution0017, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1800
     * @tc.name testEnvironmentVersionIndependence0018
     * @tc.desc Verify local and mock versions are independent.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEnvironmentVersionIndependence0018', 0, () => {
      logger.info(`${BUNDLE}testEnvironmentVersionIndependence0018, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(localVersion !== mockVersion).assertTrue();
      logger.info(`${BUNDLE}testEnvironmentVersionIndependence0018, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_1900
     * @tc.name testStateAfterRepeatedSwitches0019
     * @tc.desc Verify state remains correct after repeated environment switches.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStateAfterRepeatedSwitches0019', 0, () => {
      logger.info(`${BUNDLE}testStateAfterRepeatedSwitches0019, begin`);
      for (let i = 0; i < 5; i++) {
        const mockResult = AnnotationService.runMockAvailableDemo();
        const localResult = AnnotationService.runAvailableDemo();
        expect(mockResult).assertFalse();
        expect(typeof mockResult).assertEqual('boolean');
        const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
        expect(localResult).assertEqual(expected);
        expect(typeof localResult).assertEqual('boolean');
      }
      logger.info(`${BUNDLE}testStateAfterRepeatedSwitches0019, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_2000
     * @tc.name testBothDemosReturnConsistentResults0020
     * @tc.desc Verify both demos return consistent results across calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBothDemosReturnConsistentResults0020', 0, () => {
      logger.info(`${BUNDLE}testBothDemosReturnConsistentResults0020, begin`);
      const availableResults: boolean[] = [];
      const suppressResults: boolean[] = [];
      for (let i = 0; i < 3; i++) {
        availableResults.push(AnnotationService.runAvailableDemo());
        suppressResults.push(AnnotationService.runSuppressWarningsDemo());
      }
      expect(availableResults[0]).assertEqual(availableResults[1]);
      expect(availableResults[1]).assertEqual(availableResults[2]);
      expect(suppressResults[0]).assertEqual(suppressResults[1]);
      expect(suppressResults[1]).assertEqual(suppressResults[2]);
      logger.info(`${BUNDLE}testBothDemosReturnConsistentResults0020, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_2100
     * @tc.name testMockDemosReturnConsistentResults0021
     * @tc.desc Verify mock demos return consistent results across calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockDemosReturnConsistentResults0021', 0, () => {
      logger.info(`${BUNDLE}testMockDemosReturnConsistentResults0021, begin`);
      const availableResults: boolean[] = [];
      const suppressResults: boolean[] = [];
      for (let i = 0; i < 3; i++) {
        availableResults.push(AnnotationService.runMockAvailableDemo());
        suppressResults.push(AnnotationService.runMockSuppressWarningsDemo());
      }
      for (const result of availableResults) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      for (const result of suppressResults) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      expect(availableResults.length).assertEqual(3);
      logger.info(`${BUNDLE}testMockDemosReturnConsistentResults0021, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_STATE_2200
     * @tc.name testStateVersionCorrelation0022
     * @tc.desc Verify state results correlate correctly with API versions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStateVersionCorrelation0022', 0, () => {
      logger.info(`${BUNDLE}testStateVersionCorrelation0022, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      if (localVersion >= AVAILABLE_MIN_API_VERSION) {
        expect(availableResult).assertTrue();
      } else {
        expect(availableResult).assertFalse();
      }
      if (localVersion >= FUTURE_DEMO_API_VERSION) {
        expect(suppressResult).assertTrue();
      } else {
        expect(suppressResult).assertFalse();
      }
      logger.info(`${BUNDLE}testStateVersionCorrelation0022, end`);
    });
  });
}
