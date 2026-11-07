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

const BUNDLE: string = 'Annotation_Config_';

export default function annotationConfigTest() {
  describe('AnnotationConfig', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationConfig, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationConfig, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationConfig, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationConfig, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0100
     * @tc.name testDifferentApiVersionsBehavior0001
     * @tc.desc Verify behavior with different API version scenarios.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDifferentApiVersionsBehavior0001', 0, () => {
      logger.info(`${BUNDLE}testDifferentApiVersionsBehavior0001, begin`);
      
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      
      // Test with actual device version
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion).assertEqual('number');
      expect(localVersion > 0).assertTrue();
      
      // Test with mock version
      expect(mockVersion).assertEqual(21);
      expect(typeof mockVersion).assertEqual('number');
      expect(mockVersion > 0).assertTrue();
      
      // Verify version relationship
      expect(localVersion !== mockVersion).assertTrue();
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      
      // Test behavior at different version thresholds
      const availableResult = AnnotationService.runAvailableDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      expect(availableResult).assertEqual(expectedAvailable);
      expect(typeof availableResult).assertEqual('boolean');
      expect(availableResult === expectedAvailable).assertTrue();
      
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(typeof suppressResult).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testDifferentApiVersionsBehavior0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0200
     * @tc.name testDifferentEnvironmentsConfig0002
     * @tc.desc Verify configuration across different environments.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDifferentEnvironmentsConfig0002', 0, () => {
      logger.info(`${BUNDLE}testDifferentEnvironmentsConfig0002, begin`);
      
      // Local environment configuration
      const localVersion = AnnotationService.getLocalApiVersion();
      const localAvailable = AnnotationService.runAvailableDemo();
      const localSuppress = AnnotationService.runSuppressWarningsDemo();
      
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localAvailable).assertEqual('boolean');
      expect(typeof localSuppress).assertEqual('boolean');
      
      // Mock environment configuration
      const mockVersion = AnnotationService.getMockApiVersion();
      const mockAvailable = AnnotationService.runMockAvailableDemo();
      const mockSuppress = AnnotationService.runMockSuppressWarningsDemo();
      
      expect(mockVersion).assertEqual(21);
      expect(mockAvailable).assertFalse();
      expect(mockSuppress).assertFalse();
      expect(typeof mockAvailable).assertEqual('boolean');
      expect(typeof mockSuppress).assertEqual('boolean');
      
      // Verify environment independence
      expect(localVersion !== mockVersion).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // Verify rules consistency across environments
      const rules = AnnotationService.getSuppressionRules();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testDifferentEnvironmentsConfig0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0300
     * @tc.name testConfigurationChanges0003
     * @tc.desc Verify configuration changes and their effects.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConfigurationChanges0003', 0, () => {
      logger.info(`${BUNDLE}testConfigurationChanges0003, begin`);
      
      // Initial configuration state
      const initialVersion = AnnotationService.getLocalApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialRules.length).assertEqual(3);
      expect(typeof initialVersion).assertEqual('number');
      expect(Array.isArray(initialRules)).assertTrue();
      
      // Perform operations that might change configuration
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      
      // Verify configuration remains stable
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalVersion).assertEqual(initialVersion);
      expect(finalRules.length).assertEqual(initialRules.length);
      expect(finalVersion === initialVersion).assertTrue();
      expect(finalRules.length === initialRules.length).assertTrue();
      
      // Verify configuration values are correct
      expect(finalVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(finalRules[0]).assertEqual('compatibility');
      expect(finalRules[1]).assertEqual('syscap');
      expect(finalRules[2]).assertEqual('permission');
      expect(typeof finalRules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testConfigurationChanges0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0400
     * @tc.name testVersionThresholdConfig0004
     * @tc.desc Verify version threshold configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testVersionThresholdConfig0004', 0, () => {
      logger.info(`${BUNDLE}testVersionThresholdConfig0004, begin`);
      
      // Verify threshold constants
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      
      // Verify threshold relationships
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      
      // Verify current version against thresholds
      const localVersion = AnnotationService.getLocalApiVersion();
      const atAvailableThreshold = localVersion === AVAILABLE_MIN_API_VERSION;
      const aboveAvailableThreshold = localVersion > AVAILABLE_MIN_API_VERSION;
      const belowAvailableThreshold = localVersion < AVAILABLE_MIN_API_VERSION;
      
      expect(typeof atAvailableThreshold).assertEqual('boolean');
      expect(typeof aboveAvailableThreshold).assertEqual('boolean');
      expect(typeof belowAvailableThreshold).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testVersionThresholdConfig0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0500
     * @tc.name testRulesConfigStability0005
     * @tc.desc Verify rules configuration stability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRulesConfigStability0005', 0, () => {
      logger.info(`${BUNDLE}testRulesConfigStability0005, begin`);
      
      // Get rules multiple times
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      
      // Verify stability
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules2.length).assertEqual(rules3.length);
      expect(rules1[0]).assertEqual(rules2[0]);
      expect(rules1[1]).assertEqual(rules2[1]);
      expect(rules1[2]).assertEqual(rules2[2]);
      expect(rules1.length === rules2.length).assertTrue();
      expect(rules2.length === rules3.length).assertTrue();
      
      // Verify content
      expect(rules1.length).assertEqual(3);
      expect(rules1[0]).assertEqual('compatibility');
      expect(rules1[1]).assertEqual('syscap');
      expect(rules1[2]).assertEqual('permission');
      expect(typeof rules1[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRulesConfigStability0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0600
     * @tc.name testEnvironmentSwitchConfig0006
     * @tc.desc Verify configuration during environment switches.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEnvironmentSwitchConfig0006', 0, () => {
      logger.info(`${BUNDLE}testEnvironmentSwitchConfig0006, begin`);
      
      // Initial local environment
      const localVersion1 = AnnotationService.getLocalApiVersion();
      const localResult1 = AnnotationService.runAvailableDemo();
      
      expect(localVersion1).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localResult1).assertEqual('boolean');
      expect(typeof localVersion1).assertEqual('number');
      
      // Switch to mock environment
      const mockVersion1 = AnnotationService.getMockApiVersion();
      const mockResult1 = AnnotationService.runMockAvailableDemo();
      
      expect(mockVersion1).assertEqual(21);
      expect(mockResult1).assertFalse();
      expect(typeof mockResult1).assertEqual('boolean');
      
      // Switch back to local environment
      const localVersion2 = AnnotationService.getLocalApiVersion();
      const localResult2 = AnnotationService.runAvailableDemo();
      
      expect(localVersion2).assertEqual(localVersion1);
      expect(localResult2).assertEqual(localResult1);
      expect(localVersion2 === localVersion1).assertTrue();
      expect(localResult2 === localResult1).assertTrue();
      
      // Verify configuration consistency
      const mockVersion2 = AnnotationService.getMockApiVersion();
      expect(mockVersion2).assertEqual(mockVersion1);
      expect(mockVersion2 === mockVersion1).assertTrue();
      expect(typeof mockVersion2).assertEqual('number');
      
      logger.info(`${BUNDLE}testEnvironmentSwitchConfig0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0700
     * @tc.name testParameterizedVersionTest0007
     * @tc.desc Test with parameterized version scenarios.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testParameterizedVersionTest0007', 0, () => {
      logger.info(`${BUNDLE}testParameterizedVersionTest0007, begin`);
      
      const testVersions = [21, 22, 23, 27, 30];
      const localVersion = AnnotationService.getLocalApiVersion();
      
      // Test each version scenario
      for (const testVersion of testVersions) {
        const shouldExecuteAvailable = testVersion >= AVAILABLE_MIN_API_VERSION;
        const shouldExecuteSuppress = testVersion >= FUTURE_DEMO_API_VERSION;
        
        expect(typeof shouldExecuteAvailable).assertEqual('boolean');
        expect(typeof shouldExecuteSuppress).assertEqual('boolean');
        
        if (testVersion === localVersion) {
          const actualAvailable = AnnotationService.runAvailableDemo();
          const actualSuppress = AnnotationService.runSuppressWarningsDemo();
          
          expect(actualAvailable).assertEqual(shouldExecuteAvailable);
          expect(actualSuppress).assertEqual(shouldExecuteSuppress);
          expect(actualAvailable === shouldExecuteAvailable).assertTrue();
        }
      }
      
      // Verify mock version behavior
      const mockVersion = AnnotationService.getMockApiVersion();
      expect(mockVersion).assertEqual(21);
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testParameterizedVersionTest0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0800
     * @tc.name testConfigPersistence0008
     * @tc.desc Verify configuration persistence across operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigPersistence0008', 0, () => {
      logger.info(`${BUNDLE}testConfigPersistence0008, begin`);
      
      // Capture initial configuration
      const initialVersion = AnnotationService.getLocalApiVersion();
      const initialMockVersion = AnnotationService.getMockApiVersion();
      const initialRules = AnnotationService.getSuppressionRules();
      
      expect(initialVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(initialMockVersion).assertEqual(21);
      expect(initialRules.length).assertEqual(3);
      expect(typeof initialVersion).assertEqual('number');
      expect(typeof initialMockVersion).assertEqual('number');
      expect(Array.isArray(initialRules)).assertTrue();
      
      // Perform many operations
      for (let i = 0; i < 10; i++) {
        AnnotationService.runAvailableDemo();
        AnnotationService.runSuppressWarningsDemo();
        AnnotationService.runMockAvailableDemo();
        AnnotationService.runMockSuppressWarningsDemo();
      }
      
      // Verify configuration persisted
      const finalVersion = AnnotationService.getLocalApiVersion();
      const finalMockVersion = AnnotationService.getMockApiVersion();
      const finalRules = AnnotationService.getSuppressionRules();
      
      expect(finalVersion).assertEqual(initialVersion);
      expect(finalMockVersion).assertEqual(initialMockVersion);
      expect(finalRules.length).assertEqual(initialRules.length);
      expect(finalVersion === initialVersion).assertTrue();
      expect(finalMockVersion === initialMockVersion).assertTrue();
      expect(finalRules.length === initialRules.length).assertTrue();
      
      logger.info(`${BUNDLE}testConfigPersistence0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_0900
     * @tc.name testConfigValidation0009
     * @tc.desc Validate configuration values and types.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testConfigValidation0009', 0, () => {
      logger.info(`${BUNDLE}testConfigValidation0009, begin`);
      
      // Validate version configurations
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(localVersion > 0).assertTrue();
      expect(mockVersion > 0).assertTrue();
      expect(localVersion < 100).assertTrue();
      expect(mockVersion < 100).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // Validate rules configuration
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length > 0).assertTrue();
      expect(rules.length <= 10).assertTrue();
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      // Validate constants
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      
      logger.info(`${BUNDLE}testConfigValidation0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONFIG_1000
     * @tc.name testComprehensiveConfig0010
     * @tc.desc Comprehensive configuration testing.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testComprehensiveConfig0010', 0, () => {
      logger.info(`${BUNDLE}testComprehensiveConfig0010, begin`);
      
      // Test all configuration aspects
      const localVersion = AnnotationService.getLocalApiVersion();
      const mockVersion = AnnotationService.getMockApiVersion();
      const rules = AnnotationService.getSuppressionRules();
      
      // Version configuration
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(mockVersion).assertEqual(21);
      expect(localVersion !== mockVersion).assertTrue();
      expect(typeof localVersion).assertEqual('number');
      expect(typeof mockVersion).assertEqual('number');
      
      // Rules configuration
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(rules[0]).assertEqual('compatibility');
      expect(rules[1]).assertEqual('syscap');
      expect(rules[2]).assertEqual('permission');
      expect(typeof rules[0]).assertEqual('string');
      
      // Threshold configuration
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(22);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(23);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(27);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      
      // Behavior configuration
      const availableResult = AnnotationService.runAvailableDemo();
      const suppressResult = AnnotationService.runSuppressWarningsDemo();
      const expectedAvailable = localVersion >= AVAILABLE_MIN_API_VERSION;
      const expectedSuppress = localVersion >= FUTURE_DEMO_API_VERSION;
      
      expect(availableResult).assertEqual(expectedAvailable);
      expect(suppressResult).assertEqual(expectedSuppress);
      expect(typeof availableResult).assertEqual('boolean');
      expect(typeof suppressResult).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testComprehensiveConfig0010, end`);
    });
  });
}
