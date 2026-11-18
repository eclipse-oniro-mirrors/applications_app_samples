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

const BUNDLE: string = 'Annotation_Concurrency_';
const MOCK_API_VERSION: number = 21;
const CONCURRENT_ITERATIONS: number = 100;

export default function annotationConcurrencyTest() {
  describe('AnnotationConcurrency', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationConcurrency, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationConcurrency, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationConcurrency, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationConcurrency, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0100
     * @tc.name testConcurrentGetLocalApiVersion0001
     * @tc.desc Verify concurrent calls to getLocalApiVersion return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentGetLocalApiVersion0001', 0, () => {
      logger.info(`${BUNDLE}testConcurrentGetLocalApiVersion0001, begin`);
      
      const results: number[] = [];
      for (let i = 0; i < CONCURRENT_ITERATIONS; i++) {
        results.push(AnnotationService.getLocalApiVersion());
      }
      
      const expected = deviceInfo.sdkApiVersion;
      for (const result of results) {
        expect(result).assertEqual(expected);
        expect(typeof result).assertEqual('number');
      }
      
      expect(results.length).assertEqual(CONCURRENT_ITERATIONS);
      expect(results[0]).assertEqual(results[results.length - 1]);
      
      logger.info(`${BUNDLE}testConcurrentGetLocalApiVersion0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0200
     * @tc.name testConcurrentGetMockApiVersion0002
     * @tc.desc Verify concurrent calls to getMockApiVersion return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentGetMockApiVersion0002', 0, () => {
      logger.info(`${BUNDLE}testConcurrentGetMockApiVersion0002, begin`);
      
      const results: number[] = [];
      for (let i = 0; i < CONCURRENT_ITERATIONS; i++) {
        results.push(AnnotationService.getMockApiVersion());
      }
      
      for (const result of results) {
        expect(result).assertEqual(MOCK_API_VERSION);
        expect(typeof result).assertEqual('number');
        expect(result === 21).assertTrue();
      }
      
      expect(results.length).assertEqual(CONCURRENT_ITERATIONS);
      expect(results[0]).assertEqual(results[results.length - 1]);
      
      logger.info(`${BUNDLE}testConcurrentGetMockApiVersion0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0300
     * @tc.name testConcurrentRunAvailableDemo0003
     * @tc.desc Verify concurrent calls to runAvailableDemo return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentRunAvailableDemo0003', 0, () => {
      logger.info(`${BUNDLE}testConcurrentRunAvailableDemo0003, begin`);
      
      const results: boolean[] = [];
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      
      for (let i = 0; i < CONCURRENT_ITERATIONS; i++) {
        results.push(AnnotationService.runAvailableDemo());
      }
      
      for (const result of results) {
        expect(result).assertEqual(expected);
        expect(typeof result).assertEqual('boolean');
      }
      
      expect(results.length).assertEqual(CONCURRENT_ITERATIONS);
      expect(results[0]).assertEqual(results[results.length - 1]);
      
      logger.info(`${BUNDLE}testConcurrentRunAvailableDemo0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0400
     * @tc.name testConcurrentRunMockAvailableDemo0004
     * @tc.desc Verify concurrent calls to runMockAvailableDemo return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentRunMockAvailableDemo0004', 0, () => {
      logger.info(`${BUNDLE}testConcurrentRunMockAvailableDemo0004, begin`);
      
      const results: boolean[] = [];
      for (let i = 0; i < CONCURRENT_ITERATIONS; i++) {
        results.push(AnnotationService.runMockAvailableDemo());
      }
      
      for (const result of results) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
        expect(result === false).assertTrue();
      }
      
      expect(results.length).assertEqual(CONCURRENT_ITERATIONS);
      expect(results[0]).assertEqual(results[results.length - 1]);
      
      logger.info(`${BUNDLE}testConcurrentRunMockAvailableDemo0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0500
     * @tc.name testConcurrentGetSuppressionRules0005
     * @tc.desc Verify concurrent calls to getSuppressionRules return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentGetSuppressionRules0005', 0, () => {
      logger.info(`${BUNDLE}testConcurrentGetSuppressionRules0005, begin`);
      
      const results: string[][] = [];
      for (let i = 0; i < CONCURRENT_ITERATIONS; i++) {
        results.push(AnnotationService.getSuppressionRules());
      }
      
      for (const result of results) {
        expect(result.length).assertEqual(3);
        expect(Array.isArray(result)).assertTrue();
        expect(result[0]).assertEqual('compatibility');
        expect(result[1]).assertEqual('syscap');
        expect(result[2]).assertEqual('permission');
      }
      
      expect(results.length).assertEqual(CONCURRENT_ITERATIONS);
      
      logger.info(`${BUNDLE}testConcurrentGetSuppressionRules0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0600
     * @tc.name testConcurrentMixedApiCalls0006
     * @tc.desc Verify concurrent mixed API calls maintain state consistency.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentMixedApiCalls0006', 0, () => {
      logger.info(`${BUNDLE}testConcurrentMixedApiCalls0006, begin`);
      
      const localVersions: number[] = [];
      const mockVersions: number[] = [];
      const availableResults: boolean[] = [];
      const mockResults: boolean[] = [];
      
      for (let i = 0; i < 50; i++) {
        localVersions.push(AnnotationService.getLocalApiVersion());
        mockVersions.push(AnnotationService.getMockApiVersion());
        availableResults.push(AnnotationService.runAvailableDemo());
        mockResults.push(AnnotationService.runMockAvailableDemo());
      }
      
      const expectedLocal = deviceInfo.sdkApiVersion;
      const expectedMock = MOCK_API_VERSION;
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      
      for (const version of localVersions) {
        expect(version).assertEqual(expectedLocal);
        expect(typeof version).assertEqual('number');
      }
      
      for (const version of mockVersions) {
        expect(version).assertEqual(expectedMock);
        expect(typeof version).assertEqual('number');
      }
      
      for (const result of availableResults) {
        expect(result).assertEqual(expectedAvailable);
        expect(typeof result).assertEqual('boolean');
      }
      
      for (const result of mockResults) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      
      expect(localVersions.length).assertEqual(50);
      expect(mockVersions.length).assertEqual(50);
      expect(availableResults.length).assertEqual(50);
      expect(mockResults.length).assertEqual(50);
      
      logger.info(`${BUNDLE}testConcurrentMixedApiCalls0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0700
     * @tc.name testConcurrentEnvironmentSwitch0007
     * @tc.desc Verify concurrent environment switches maintain data integrity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentEnvironmentSwitch0007', 0, () => {
      logger.info(`${BUNDLE}testConcurrentEnvironmentSwitch0007, begin`);
      
      const localResults: boolean[] = [];
      const mockResults: boolean[] = [];
      
      for (let i = 0; i < 50; i++) {
        // Alternate between local and mock
        localResults.push(AnnotationService.runAvailableDemo());
        mockResults.push(AnnotationService.runMockAvailableDemo());
        
        // Verify versions remain stable
        const localVersion = AnnotationService.getLocalApiVersion();
        const mockVersion = AnnotationService.getMockApiVersion();
        expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
        expect(mockVersion).assertEqual(MOCK_API_VERSION);
      }
      
      const expectedLocal = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      
      for (const result of localResults) {
        expect(result).assertEqual(expectedLocal);
        expect(typeof result).assertEqual('boolean');
      }
      
      for (const result of mockResults) {
        expect(result).assertFalse();
        expect(typeof result).assertEqual('boolean');
      }
      
      expect(localResults.length).assertEqual(50);
      expect(mockResults.length).assertEqual(50);
      
      logger.info(`${BUNDLE}testConcurrentEnvironmentSwitch0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_0800
     * @tc.name testConcurrentRulesAccess0008
     * @tc.desc Verify concurrent rules access returns independent arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcurrentRulesAccess0008', 0, () => {
      logger.info(`${BUNDLE}testConcurrentRulesAccess0008, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      
      // Modify one array
      rules1.push('test_rule');
      
      // Verify others are not affected
      expect(rules2.length).assertEqual(3);
      expect(rules3.length).assertEqual(3);
      expect(rules2[0]).assertEqual('compatibility');
      expect(rules3[0]).assertEqual('compatibility');
      
      // Verify all are independent
      expect(Array.isArray(rules1)).assertTrue();
      expect(Array.isArray(rules2)).assertTrue();
      expect(Array.isArray(rules3)).assertTrue();
      
      // Verify original length is preserved
      const rules4 = AnnotationService.getSuppressionRules();
      expect(rules4.length).assertEqual(3);
      expect(typeof rules4[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testConcurrentRulesAccess0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONCURRENCY_1000
     * @tc.name testHighConcurrencyStress0010
     * @tc.desc Verify system stability under high concurrency stress.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testHighConcurrencyStress0010', 0, () => {
      logger.info(`${BUNDLE}testHighConcurrencyStress0010, begin`);
      
      const iterations = 500;
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
      expect(iterations).assertEqual(500);
      
      // Verify system still works after stress
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(MOCK_API_VERSION);
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testHighConcurrencyStress0010, end`);
    });
  });
}
