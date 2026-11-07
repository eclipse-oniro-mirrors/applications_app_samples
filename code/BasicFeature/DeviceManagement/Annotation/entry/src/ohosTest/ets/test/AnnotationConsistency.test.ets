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

const BUNDLE: string = 'Annotation_Consistency_';

export default function annotationConsistencyTest() {
  describe('AnnotationConsistency', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationConsistency, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationConsistency, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationConsistency, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationConsistency, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0100
     * @tc.name testVersionCalculationConsistency0001
     * @tc.desc Verify version calculation logic is consistent across calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionCalculationConsistency0001', 0, () => {
      logger.info(`${BUNDLE}testVersionCalculationConsistency0001, begin`);
      const versions: number[] = [];
      for (let i = 0; i < 10; i++) {
        versions.push(AnnotationService.getLocalApiVersion());
      }
      const firstVersion = versions[0];
      let allSame = true;
      for (const version of versions) {
        if (version !== firstVersion) {
          allSame = false;
          break;
        }
      }
      expect(allSame).assertTrue();
      expect(firstVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(versions.length).assertEqual(10);
      expect(typeof firstVersion).assertEqual('number');
      expect(firstVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testVersionCalculationConsistency0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0200
     * @tc.name testRulesArrayContentStability0002
     * @tc.desc Verify rules array content remains stable across multiple calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesArrayContentStability0002', 0, () => {
      logger.info(`${BUNDLE}testRulesArrayContentStability0002, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules2.length).assertEqual(rules3.length);
      expect(rules1[0]).assertEqual(rules2[0]);
      expect(rules1[1]).assertEqual(rules2[1]);
      expect(rules1[2]).assertEqual(rules2[2]);
      expect(rules1.length).assertEqual(3);
      expect(rules1[0]).assertEqual('compatibility');
      expect(rules1[1]).assertEqual('syscap');
      logger.info(`${BUNDLE}testRulesArrayContentStability0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0300
     * @tc.name testDemoResultDeterminism0003
     * @tc.desc Verify demo results are deterministic for same input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDemoResultDeterminism0003', 0, () => {
      logger.info(`${BUNDLE}testDemoResultDeterminism0003, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      for (let i = 0; i < 5; i++) {
        const resultAvailable = AnnotationService.runAvailableDemo();
        const resultSuppress = AnnotationService.runSuppressWarningsDemo();
        expect(resultAvailable).assertEqual(expectedAvailable);
        expect(resultSuppress).assertEqual(expectedSuppress);
        expect(resultAvailable === expectedAvailable).assertTrue();
        expect(resultSuppress === expectedSuppress).assertTrue();
      }
      logger.info(`${BUNDLE}testDemoResultDeterminism0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0400
     * @tc.name testMockVersionConsistency0004
     * @tc.desc Verify mock version is always consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMockVersionConsistency0004', 0, () => {
      logger.info(`${BUNDLE}testMockVersionConsistency0004, begin`);
      const mockVersions: number[] = [];
      for (let i = 0; i < 10; i++) {
        mockVersions.push(AnnotationService.getMockApiVersion());
      }
      const firstVersion = mockVersions[0];
      let allSame = true;
      for (const version of mockVersions) {
        if (version !== firstVersion) {
          allSame = false;
          break;
        }
      }
      expect(allSame).assertTrue();
      expect(firstVersion).assertEqual(21);
      expect(mockVersions.length).assertEqual(10);
      expect(typeof firstVersion).assertEqual('number');
      expect(firstVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testMockVersionConsistency0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0500
     * @tc.name testEnvironmentIndependence0005
     * @tc.desc Verify local and mock environments are completely independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEnvironmentIndependence0005', 0, () => {
      logger.info(`${BUNDLE}testEnvironmentIndependence0005, begin`);
      const localVersion1 = AnnotationService.getLocalApiVersion();
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const localVersion2 = AnnotationService.getLocalApiVersion();
      const mockVersion2 = AnnotationService.getMockApiVersion();
      expect(localVersion1).assertEqual(localVersion2);
      expect(mockVersion1).assertEqual(mockVersion2);
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion1).assertEqual(21);
      expect(localVersion1 !== mockVersion1).assertTrue();
      expect(localVersion2 !== mockVersion2).assertTrue();
      logger.info(`${BUNDLE}testEnvironmentIndependence0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0600
     * @tc.name testConstantValuesStability0006
     * @tc.desc Verify constant values remain stable throughout execution.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testConstantValuesStability0006', 0, () => {
      logger.info(`${BUNDLE}testConstantValuesStability0006, begin`);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testConstantValuesStability0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0700
     * @tc.name testResultTypeConsistency0007
     * @tc.desc Verify result types are consistent across different calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testResultTypeConsistency0007', 0, () => {
      logger.info(`${BUNDLE}testResultTypeConsistency0007, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const rules = AnnotationService.getSuppressionRules();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      logger.info(`${BUNDLE}testResultTypeConsistency0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0800
     * @tc.name testCrossCallConsistency0008
     * @tc.desc Verify consistency across different API calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCrossCallConsistency0008', 0, () => {
      logger.info(`${BUNDLE}testCrossCallConsistency0008, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const availableResult = AnnotationService.runAvailableDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(availableResult === expectedAvailable).assertTrue();
      expect(localVersion > mockVersion).assertTrue();
      expect(typeof availableResult).assertEqual('boolean');
      logger.info(`${BUNDLE}testCrossCallConsistency0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_0900
     * @tc.name testRepeatedExecutionConsistency0009
     * @tc.desc Verify repeated execution produces consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeatedExecutionConsistency0009', 0, () => {
      logger.info(`${BUNDLE}testRepeatedExecutionConsistency0009, begin`);
      const results: boolean[] = [];
      for (let i = 0; i < 20; i++) {
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
      expect(results.length).assertEqual(20);
      expect(typeof firstResult).assertEqual('boolean');
      expect(firstResult === true || firstResult === false).assertTrue();
      expect(results[0] === results[19]).assertTrue();
      logger.info(`${BUNDLE}testRepeatedExecutionConsistency0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONSIST_1000
     * @tc.name testDataIntegrity0010
     * @tc.desc Verify data integrity across multiple operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testDataIntegrity0010', 0, () => {
      logger.info(`${BUNDLE}testDataIntegrity0010, begin`);
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
      logger.info(`${BUNDLE}testDataIntegrity0010, end`);
    });
  });
}
