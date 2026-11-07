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
const SUPPRESSION_RULE_COUNT: number = 3;
const RAPID_CALL_COUNT: number = 10;

export default function robustnessTest() {
  describe('Robustness', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}Robustness, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}Robustness, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}Robustness, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}Robustness, afterAll`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0100
     * @tc.name testSuppressionRulesArrayModification0001
     * @tc.desc Verify modifying returned rules array does not affect service state.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesArrayModification0001', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesArrayModification0001, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const originalLength = rules1.length;
      rules1.push('test_rule');
      rules1.unshift('another_rule');
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(originalLength);
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(Array.isArray(rules2)).assertTrue();
      expect(typeof rules2[0]).assertEqual('string');
      expect(originalLength === SUPPRESSION_RULE_COUNT).assertTrue();
      logger.info(`${BUNDLE}testSuppressionRulesArrayModification0001, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0200
     * @tc.name testSuppressionRulesArrayElementModification0002
     * @tc.desc Verify modifying array elements does not affect service state.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesArrayElementModification0002', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesArrayElementModification0002, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      rules1[0] = 'modified';
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2[0]).assertEqual('compatibility');
      expect(Array.isArray(rules2)).assertTrue();
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(typeof rules2[0]).assertEqual('string');
      logger.info(`${BUNDLE}testSuppressionRulesArrayElementModification0002, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0300
     * @tc.name testSuppressionRulesArrayClear0003
     * @tc.desc Verify clearing returned array does not affect subsequent calls.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressionRulesArrayClear0003', 0, () => {
      logger.info(`${BUNDLE}testSuppressionRulesArrayClear0003, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      rules1.length = 0;
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(Array.isArray(rules2)).assertTrue();
      expect(rules2[0]).assertEqual('compatibility');
      expect(rules2.length === 3).assertTrue();
      logger.info(`${BUNDLE}testSuppressionRulesArrayClear0003, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0400
     * @tc.name testRapidAvailableDemoCalls0004
     * @tc.desc Verify rapid consecutive calls to runAvailableDemo are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidAvailableDemoCalls0004', 0, () => {
      logger.info(`${BUNDLE}testRapidAvailableDemoCalls0004, begin`);
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const results: boolean[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.runAvailableDemo());
      }
      for (const result of results) {
        expect(result).assertEqual(expected);
        expect(typeof result).assertEqual('boolean');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidAvailableDemoCalls0004, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0500
     * @tc.name testRapidSuppressWarningsDemoCalls0005
     * @tc.desc Verify rapid consecutive calls to runSuppressWarningsDemo are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidSuppressWarningsDemoCalls0005', 0, () => {
      logger.info(`${BUNDLE}testRapidSuppressWarningsDemoCalls0005, begin`);
      const expected = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      const results: boolean[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.runSuppressWarningsDemo());
      }
      for (const result of results) {
        expect(result).assertEqual(expected);
        expect(typeof result).assertEqual('boolean');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidSuppressWarningsDemoCalls0005, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0600
     * @tc.name testRapidMockAvailableDemoCalls0006
     * @tc.desc Verify rapid consecutive calls to runMockAvailableDemo are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidMockAvailableDemoCalls0006', 0, () => {
      logger.info(`${BUNDLE}testRapidMockAvailableDemoCalls0006, begin`);
      const results: boolean[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.runMockAvailableDemo());
      }
      for (const result of results) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidMockAvailableDemoCalls0006, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0700
     * @tc.name testRapidMockSuppressWarningsDemoCalls0007
     * @tc.desc Verify rapid consecutive calls to runMockSuppressWarningsDemo are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidMockSuppressWarningsDemoCalls0007', 0, () => {
      logger.info(`${BUNDLE}testRapidMockSuppressWarningsDemoCalls0007, begin`);
      const results: boolean[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.runMockSuppressWarningsDemo());
      }
      for (const result of results) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidMockSuppressWarningsDemoCalls0007, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0800
     * @tc.name testRapidGetLocalApiVersionCalls0008
     * @tc.desc Verify rapid consecutive calls to getLocalApiVersion are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidGetLocalApiVersionCalls0008', 0, () => {
      logger.info(`${BUNDLE}testRapidGetLocalApiVersionCalls0008, begin`);
      const results: number[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.getLocalApiVersion());
      }
      for (const result of results) {
        expect(result).assertEqual(deviceInfo.sdkApiVersion);
        expect(typeof result).assertEqual('number');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidGetLocalApiVersionCalls0008, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_0900
     * @tc.name testRapidGetMockApiVersionCalls0009
     * @tc.desc Verify rapid consecutive calls to getMockApiVersion are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidGetMockApiVersionCalls0009', 0, () => {
      logger.info(`${BUNDLE}testRapidGetMockApiVersionCalls0009, begin`);
      const results: number[] = [];
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        results.push(AnnotationService.getMockApiVersion());
      }
      for (const result of results) {
        expect(result).assertEqual(21);
        expect(typeof result).assertEqual('number');
      }
      expect(results.length).assertEqual(RAPID_CALL_COUNT);
      logger.info(`${BUNDLE}testRapidGetMockApiVersionCalls0009, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1000
     * @tc.name testRapidGetSuppressionRulesCalls0010
     * @tc.desc Verify rapid consecutive calls to getSuppressionRules are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRapidGetSuppressionRulesCalls0010', 0, () => {
      logger.info(`${BUNDLE}testRapidGetSuppressionRulesCalls0010, begin`);
      for (let i = 0; i < RAPID_CALL_COUNT; i++) {
        const rules = AnnotationService.getSuppressionRules();
        expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
        expect(rules[0]).assertEqual('compatibility');
        expect(rules[1]).assertEqual('syscap');
        expect(rules[2]).assertEqual('permission');
      }
      logger.info(`${BUNDLE}testRapidGetSuppressionRulesCalls0010, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1100
     * @tc.name testCrossDemoInterleavedCalls0011
     * @tc.desc Verify interleaved calls to different demos are stable.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCrossDemoInterleavedCalls0011', 0, () => {
      logger.info(`${BUNDLE}testCrossDemoInterleavedCalls0011, begin`);
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      for (let i = 0; i < 5; i++) {
        expect(AnnotationService.runAvailableDemo()).assertEqual(expectedAvailable);
        expect(AnnotationService.runSuppressWarningsDemo()).assertEqual(expectedSuppress);
        expect(AnnotationService.runMockAvailableDemo()).assertFalse();
        expect(AnnotationService.runMockSuppressWarningsDemo()).assertFalse();
      }
      logger.info(`${BUNDLE}testCrossDemoInterleavedCalls0011, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1200
     * @tc.name testCrossEnvironmentInterleavedCalls0012
     * @tc.desc Verify interleaved calls between local and mock environments.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCrossEnvironmentInterleavedCalls0012', 0, () => {
      logger.info(`${BUNDLE}testCrossEnvironmentInterleavedCalls0012, begin`);
      const expectedLocal = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      for (let i = 0; i < 5; i++) {
        expect(AnnotationService.runAvailableDemo()).assertEqual(expectedLocal);
        expect(AnnotationService.runMockAvailableDemo()).assertFalse();
        expect(AnnotationService.getLocalApiVersion()).assertEqual(deviceInfo.sdkApiVersion);
        expect(AnnotationService.getMockApiVersion()).assertEqual(21);
      }
      logger.info(`${BUNDLE}testCrossEnvironmentInterleavedCalls0012, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1300
     * @tc.name testVersionCallsInterleavedWithDemos0013
     * @tc.desc Verify version queries remain stable when interleaved with demo calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionCallsInterleavedWithDemos0013', 0, () => {
      logger.info(`${BUNDLE}testVersionCallsInterleavedWithDemos0013, begin`);
      for (let i = 0; i < 5; i++) {
        const localVersion = AnnotationService.getLocalApiVersion();
        AnnotationService.runAvailableDemo();
        const mockVersion = AnnotationService.getMockApiVersion();
        AnnotationService.runMockAvailableDemo();
        expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
        expect(mockVersion).assertEqual(21);
        expect(typeof localVersion).assertEqual('number');
        expect(typeof mockVersion).assertEqual('number');
      }
      logger.info(`${BUNDLE}testVersionCallsInterleavedWithDemos0013, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1400
     * @tc.name testRulesCallsInterleavedWithDemos0014
     * @tc.desc Verify rules queries remain stable when interleaved with demo calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesCallsInterleavedWithDemos0014', 0, () => {
      logger.info(`${BUNDLE}testRulesCallsInterleavedWithDemos0014, begin`);
      for (let i = 0; i < 5; i++) {
        const rules = AnnotationService.getSuppressionRules();
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
        expect(Array.isArray(rules)).assertTrue();
        expect(typeof rules[0]).assertEqual('string');
      }
      logger.info(`${BUNDLE}testRulesCallsInterleavedWithDemos0014, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1500
     * @tc.name testMultipleArrayReferences0015
     * @tc.desc Verify multiple array references are independent.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMultipleArrayReferences0015', 0, () => {
      logger.info(`${BUNDLE}testMultipleArrayReferences0015, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      rules1.reverse();
      rules2.sort();
      expect(rules3[0]).assertEqual('compatibility');
      expect(rules3[1]).assertEqual('syscap');
      expect(rules3[2]).assertEqual('permission');
      logger.info(`${BUNDLE}testMultipleArrayReferences0015, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1600
     * @tc.name testHighFrequencyCallStability0016
     * @tc.desc Verify service stability under high frequency calls.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testHighFrequencyCallStability0016', 0, () => {
      logger.info(`${BUNDLE}testHighFrequencyCallStability0016, begin`);
      const iterations = 20;
      let errorCount = 0;
      for (let i = 0; i < iterations; i++) {
        try {
          AnnotationService.getLocalApiVersion();
          AnnotationService.getMockApiVersion();
          AnnotationService.runAvailableDemo();
          AnnotationService.runMockAvailableDemo();
          AnnotationService.runSuppressWarningsDemo();
          AnnotationService.runMockSuppressWarningsDemo();
          AnnotationService.getSuppressionRules();
        } catch (e) {
          errorCount++;
        }
      }
      expect(errorCount).assertEqual(0);
      expect(typeof errorCount).assertEqual('number');
      expect(iterations).assertEqual(20);
      logger.info(`${BUNDLE}testHighFrequencyCallStability0016, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1700
     * @tc.name testStatePreservationAfterModification0017
     * @tc.desc Verify service state is preserved after array modification attempts.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStatePreservationAfterModification0017', 0, () => {
      logger.info(`${BUNDLE}testStatePreservationAfterModification0017, begin`);
      const rules = AnnotationService.getSuppressionRules();
      try {
        (rules as string[]).splice(0, 1);
      } catch (e) {
        logger.info(`${BUNDLE}State preservation test: splice operation handled`);
      }
      const newRules = AnnotationService.getSuppressionRules();
      expect(newRules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(Array.isArray(newRules)).assertTrue();
      expect(newRules[0]).assertEqual('compatibility');
      expect(typeof newRules[0]).assertEqual('string');
      logger.info(`${BUNDLE}testStatePreservationAfterModification0017, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1800
     * @tc.name testDemoResultsNotAffectedByRules0018
     * @tc.desc Verify demo results are not affected by rules array operations.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDemoResultsNotAffectedByRules0018', 0, () => {
      logger.info(`${BUNDLE}testDemoResultsNotAffectedByRules0018, begin`);
      const resultBefore = AnnotationService.runAvailableDemo();
      const rules = AnnotationService.getSuppressionRules();
      rules.length = 0;
      const resultAfter = AnnotationService.runAvailableDemo();
      expect(resultBefore).assertEqual(resultAfter);
      expect(typeof resultBefore).assertEqual('boolean');
      expect(typeof resultAfter).assertEqual('boolean');
      expect(resultBefore === resultAfter).assertTrue();
      logger.info(`${BUNDLE}testDemoResultsNotAffectedByRules0018, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_1900
     * @tc.name testVersionConsistencyAfterDemos0019
     * @tc.desc Verify version values remain consistent after demo executions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionConsistencyAfterDemos0019', 0, () => {
      logger.info(`${BUNDLE}testVersionConsistencyAfterDemos0019, begin`);
      const localBefore = AnnotationService.getLocalApiVersion();
      const mockBefore = AnnotationService.getMockApiVersion();
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      const localAfter = AnnotationService.getLocalApiVersion();
      const mockAfter = AnnotationService.getMockApiVersion();
      expect(localBefore).assertEqual(localAfter);
      expect(mockBefore).assertEqual(mockAfter);
      expect(typeof localBefore).assertEqual('number');
      expect(typeof mockBefore).assertEqual('number');
      expect(localBefore === localAfter).assertTrue();
      logger.info(`${BUNDLE}testVersionConsistencyAfterDemos0019, end`);
    });

    /**
     * @tc.number SUB_BASIC_SERVICES_ANNOTATION_ROBUST_2000
     * @tc.name testRepeatedRulesRetrieval0020
     * @tc.desc Verify repeated rules retrieval returns consistent results.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedRulesRetrieval0020', 0, () => {
      logger.info(`${BUNDLE}testRepeatedRulesRetrieval0020, begin`);
      const allResults: string[][] = [];
      for (let i = 0; i < 10; i++) {
        allResults.push(AnnotationService.getSuppressionRules());
      }
      for (let i = 1; i < allResults.length; i++) {
        expect(allResults[i].length).assertEqual(allResults[0].length);
        for (let j = 0; j < allResults[i].length; j++) {
          expect(allResults[i][j]).assertEqual(allResults[0][j]);
          expect(typeof allResults[i][j]).assertEqual('string');
        }
        expect(Array.isArray(allResults[i])).assertTrue();
      }
      expect(allResults.length).assertEqual(10);
      logger.info(`${BUNDLE}testRepeatedRulesRetrieval0020, end`);
    });
  });
}
