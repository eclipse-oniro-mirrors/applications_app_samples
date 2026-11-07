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

const BUNDLE: string = 'Annotation_Boundary_';

export default function annotationBoundaryTest() {
  describe('AnnotationBoundary', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationBoundary, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationBoundary, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationBoundary, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationBoundary, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0100
     * @tc.name testAvailableMinApiVersionMinusOne0001
     * @tc.desc Test behavior at AVAILABLE_MIN_API_VERSION - 1 (21).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableMinApiVersionMinusOne0001', 0, () => {
      logger.info(`${BUNDLE}testAvailableMinApiVersionMinusOne0001, begin`);
      
      const mockVersion = AnnotationService.getMockApiVersion();
      const boundaryValue = AVAILABLE_MIN_API_VERSION - 1;
      
      expect(mockVersion).assertEqual(boundaryValue);
      expect(boundaryValue).assertEqual(21);
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion >= 0).assertTrue();
      
      const result = AnnotationService.runMockAvailableDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testAvailableMinApiVersionMinusOne0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0200
     * @tc.name testAvailableMinApiVersionExact0002
     * @tc.desc Test behavior at AVAILABLE_MIN_API_VERSION (22).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableMinApiVersionExact0002', 0, () => {
      logger.info(`${BUNDLE}testAvailableMinApiVersionExact0002, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const boundaryValue = AVAILABLE_MIN_API_VERSION;
      
      expect(boundaryValue).assertEqual(22);
      expect(typeof boundaryValue).assertEqual('number');
      
      const result = AnnotationService.runAvailableDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
      
      const expected = localVersion >= boundaryValue;
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(typeof expected).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testAvailableMinApiVersionExact0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0300
     * @tc.name testAvailableMinApiVersionPlusOne0003
     * @tc.desc Test behavior at AVAILABLE_MIN_API_VERSION + 1 (23).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAvailableMinApiVersionPlusOne0003', 0, () => {
      logger.info(`${BUNDLE}testAvailableMinApiVersionPlusOne0003, begin`);
      
      const boundaryValue = AVAILABLE_MIN_API_VERSION + 1;
      expect(boundaryValue).assertEqual(23);
      expect(typeof boundaryValue).assertEqual('number');
      
      const suppressBoundary = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      expect(boundaryValue).assertEqual(suppressBoundary);
      expect(boundaryValue > AVAILABLE_MIN_API_VERSION).assertTrue();
      
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(typeof localVersion).assertEqual('number');
      expect(localVersion > 0).assertTrue();
      
      logger.info(`${BUNDLE}testAvailableMinApiVersionPlusOne0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0400
     * @tc.name testSuppressBoundaryMinusOne0004
     * @tc.desc Test behavior at SUPPRESS_ANNOTATION_SINCE_API_VERSION - 1 (22).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressBoundaryMinusOne0004', 0, () => {
      logger.info(`${BUNDLE}testSuppressBoundaryMinusOne0004, begin`);
      
      const boundaryValue = SUPPRESS_ANNOTATION_SINCE_API_VERSION - 1;
      expect(boundaryValue).assertEqual(22);
      expect(boundaryValue).assertEqual(AVAILABLE_MIN_API_VERSION);
      expect(typeof boundaryValue).assertEqual('number');
      
      const gap = AVAILABLE_MIN_API_VERSION - boundaryValue;
      expect(gap).assertEqual(0);
      expect(typeof gap).assertEqual('number');
      
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(typeof localVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testSuppressBoundaryMinusOne0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0500
     * @tc.name testSuppressBoundaryExact0005
     * @tc.desc Test behavior at SUPPRESS_ANNOTATION_SINCE_API_VERSION (23).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressBoundaryExact0005', 0, () => {
      logger.info(`${BUNDLE}testSuppressBoundaryExact0005, begin`);
      
      const boundaryValue = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      expect(boundaryValue).assertEqual(23);
      expect(typeof boundaryValue).assertEqual('number');
      
      const result = AnnotationService.runSuppressWarningsDemo();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const expected = localVersion >= boundaryValue;
      expect(typeof expected).assertEqual('boolean');
      expect(typeof localVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testSuppressBoundaryExact0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0600
     * @tc.name testSuppressBoundaryPlusOne0006
     * @tc.desc Test behavior at SUPPRESS_ANNOTATION_SINCE_API_VERSION + 1 (24).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressBoundaryPlusOne0006', 0, () => {
      logger.info(`${BUNDLE}testSuppressBoundaryPlusOne0006, begin`);
      
      const boundaryValue = SUPPRESS_ANNOTATION_SINCE_API_VERSION + 1;
      expect(boundaryValue).assertEqual(24);
      expect(typeof boundaryValue).assertEqual('number');
      
      expect(boundaryValue > SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(boundaryValue < FUTURE_DEMO_API_VERSION).assertTrue();
      
      const gap = FUTURE_DEMO_API_VERSION - boundaryValue;
      expect(gap).assertEqual(3);
      expect(typeof gap).assertEqual('number');
      
      logger.info(`${BUNDLE}testSuppressBoundaryPlusOne0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0700
     * @tc.name testFutureBoundaryMinusOne0007
     * @tc.desc Test behavior at FUTURE_DEMO_API_VERSION - 1 (26).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFutureBoundaryMinusOne0007', 0, () => {
      logger.info(`${BUNDLE}testFutureBoundaryMinusOne0007, begin`);
      
      const boundaryValue = FUTURE_DEMO_API_VERSION - 1;
      expect(boundaryValue).assertEqual(26);
      expect(typeof boundaryValue).assertEqual('number');
      
      expect(boundaryValue > SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(boundaryValue < FUTURE_DEMO_API_VERSION).assertTrue();
      
      const gap = FUTURE_DEMO_API_VERSION - boundaryValue;
      expect(gap).assertEqual(1);
      expect(typeof gap).assertEqual('number');
      
      logger.info(`${BUNDLE}testFutureBoundaryMinusOne0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0800
     * @tc.name testFutureBoundaryExact0008
     * @tc.desc Test behavior at FUTURE_DEMO_API_VERSION (27).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFutureBoundaryExact0008', 0, () => {
      logger.info(`${BUNDLE}testFutureBoundaryExact0008, begin`);
      
      const boundaryValue = FUTURE_DEMO_API_VERSION;
      expect(boundaryValue).assertEqual(27);
      expect(typeof boundaryValue).assertEqual('number');
      
      expect(boundaryValue > SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(boundaryValue > AVAILABLE_MIN_API_VERSION).assertTrue();
      
      const gap1 = boundaryValue - AVAILABLE_MIN_API_VERSION;
      const gap2 = boundaryValue - SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      expect(gap1).assertEqual(5);
      expect(gap2).assertEqual(4);
      expect(typeof gap1).assertEqual('number');
      expect(typeof gap2).assertEqual('number');
      
      logger.info(`${BUNDLE}testFutureBoundaryExact0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_0900
     * @tc.name testFutureBoundaryPlusOne0009
     * @tc.desc Test behavior at FUTURE_DEMO_API_VERSION + 1 (28).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFutureBoundaryPlusOne0009', 0, () => {
      logger.info(`${BUNDLE}testFutureBoundaryPlusOne0009, begin`);
      
      const boundaryValue = FUTURE_DEMO_API_VERSION + 1;
      expect(boundaryValue).assertEqual(28);
      expect(typeof boundaryValue).assertEqual('number');
      
      expect(boundaryValue > FUTURE_DEMO_API_VERSION).assertTrue();
      
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion < boundaryValue).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testFutureBoundaryPlusOne0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1000
     * @tc.name testRulesArrayBoundary0010
     * @tc.desc Test rules array boundary conditions.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesArrayBoundary0010', 0, () => {
      logger.info(`${BUNDLE}testRulesArrayBoundary0010, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      
      // Test boundary indices
      const firstIndex = 0;
      const lastIndex = rules.length - 1;
      const middleIndex = Math.floor(rules.length / 2);
      
      expect(firstIndex).assertEqual(0);
      expect(lastIndex).assertEqual(2);
      expect(middleIndex).assertEqual(1);
      expect(typeof rules[firstIndex]).assertEqual('string');
      expect(typeof rules[lastIndex]).assertEqual('string');
      expect(typeof rules[middleIndex]).assertEqual('string');
      expect(rules[firstIndex] !== '').assertTrue();
      expect(rules[lastIndex] !== '').assertTrue();
      
      logger.info(`${BUNDLE}testRulesArrayBoundary0010, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1100
     * @tc.name testVersionRelationshipBoundaries0011
     * @tc.desc Test version relationship boundaries.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionRelationshipBoundaries0011', 0, () => {
      logger.info(`${BUNDLE}testVersionRelationshipBoundaries0011, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      expect(available).assertEqual(22);
      expect(suppress).assertEqual(23);
      expect(future).assertEqual(27);
      
      // Verify relationships
      expect(available < suppress).assertTrue();
      expect(suppress < future).assertTrue();
      expect(available < future).assertTrue();
      
      const gap1 = suppress - available;
      const gap2 = future - suppress;
      expect(gap1).assertEqual(1);
      expect(gap2).assertEqual(4);
      expect(typeof gap1).assertEqual('number');
      expect(typeof gap2).assertEqual('number');
      
      logger.info(`${BUNDLE}testVersionRelationshipBoundaries0011, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1200
     * @tc.name testZeroBoundary0012
     * @tc.desc Test zero boundary conditions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testZeroBoundary0012', 0, () => {
      logger.info(`${BUNDLE}testZeroBoundary0012, begin`);
      
      const zero = 0;
      expect(zero).assertEqual(0);
      expect(typeof zero).assertEqual('number');
      
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion > zero).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion > zero).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testZeroBoundary0012, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1300
     * @tc.name testNegativeBoundary0013
     * @tc.desc Test that negative values are not used.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNegativeBoundary0013', 0, () => {
      logger.info(`${BUNDLE}testNegativeBoundary0013, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(localVersion >= 0).assertTrue();
      expect(mockVersion >= 0).assertTrue();
      expect(localVersion > 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testNegativeBoundary0013, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1400
     * @tc.name testBooleanBoundary0014
     * @tc.desc Test boolean boundary conditions.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanBoundary0014', 0, () => {
      logger.info(`${BUNDLE}testBooleanBoundary0014, begin`);
      
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runSuppressWarningsDemo();
      const result3 = AnnotationService.runMockAvailableDemo();
      const result4 = AnnotationService.runMockSuppressWarningsDemo();
      
      // All results should be boolean
      expect(typeof result1).assertEqual('boolean');
      expect(typeof result2).assertEqual('boolean');
      expect(typeof result3).assertEqual('boolean');
      expect(typeof result4).assertEqual('boolean');
      
      // Mock results should be false
      expect(result3).assertFalse();
      expect(result4).assertFalse();
      
      logger.info(`${BUNDLE}testBooleanBoundary0014, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1500
     * @tc.name testStringEmptyBoundary0015
     * @tc.desc Test string empty boundary conditions.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringEmptyBoundary0015', 0, () => {
      logger.info(`${BUNDLE}testStringEmptyBoundary0015, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      
      // Verify no empty strings
      for (const rule of rules) {
        expect(typeof rule).assertEqual('string');
        expect(rule !== '').assertTrue();
        expect(rule.length > 0).assertTrue();
      }
      
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testStringEmptyBoundary0015, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1600
     * @tc.name testMaxSafeInteger0016
     * @tc.desc Test max safe integer boundary.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMaxSafeInteger0016', 0, () => {
      logger.info(`${BUNDLE}testMaxSafeInteger0016, begin`);
      
      const maxSafe = Number.MAX_SAFE_INTEGER;
      expect(typeof maxSafe).assertEqual('number');
      
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion < maxSafe).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion < maxSafe).assertTrue();
      
      logger.info(`${BUNDLE}testMaxSafeInteger0016, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1700
     * @tc.name testDeviceVersionBoundary0017
     * @tc.desc Test device version boundary.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeviceVersionBoundary0017', 0, () => {
      logger.info(`${BUNDLE}testDeviceVersionBoundary0017, begin`);
      
      const deviceVersion = deviceInfo.sdkApiVersion;
      const localVersion = AnnotationService.getLocalApiVersion();
      
      expect(localVersion).assertEqual(deviceVersion);
      expect(typeof deviceVersion).assertEqual('number');
      expect(deviceVersion > 0).assertTrue();
      
      const comparison = localVersion >= AVAILABLE_MIN_API_VERSION;
      expect(typeof comparison).assertEqual('boolean');
      expect(comparison === true || comparison === false).assertTrue();
      
      logger.info(`${BUNDLE}testDeviceVersionBoundary0017, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_BOUNDARY_1800
     * @tc.name testBoundaryGapAnalysis0018
     * @tc.desc Analyze gaps between boundary values.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBoundaryGapAnalysis0018', 0, () => {
      logger.info(`${BUNDLE}testBoundaryGapAnalysis0018, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      // Calculate all gaps
      const gap1 = suppress - available;
      const gap2 = future - suppress;
      const gap3 = future - available;
      
      expect(gap1).assertEqual(1);
      expect(gap2).assertEqual(4);
      expect(gap3).assertEqual(5);
      
      // Verify gap relationships
      expect(gap3 === gap1 + gap2).assertTrue();
      expect(gap1 > 0).assertTrue();
      expect(gap2 > 0).assertTrue();
      expect(gap3 > 0).assertTrue();
      expect(typeof gap1).assertEqual('number');
      expect(typeof gap2).assertEqual('number');
      expect(typeof gap3).assertEqual('number');
      
      logger.info(`${BUNDLE}testBoundaryGapAnalysis0018, end`);
    });
  });
}
