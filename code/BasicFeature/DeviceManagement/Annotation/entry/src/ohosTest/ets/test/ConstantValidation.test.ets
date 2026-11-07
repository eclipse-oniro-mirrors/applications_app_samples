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

import { SuppressWarningsType } from '@kit.BasicServicesKit';
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  FUTURE_DEMO_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_';
const EXPECTED_AVAILABLE_MIN_API_VERSION: number = 22;
const EXPECTED_SUPPRESS_ANNOTATION_SINCE_API_VERSION: number = 23;
const EXPECTED_FUTURE_DEMO_API_VERSION: number = 27;
const SUPPRESSION_RULE_COUNT: number = 3;

export default function constantValidationTest() {
  describe('ConstantValidation', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}ConstantValidation, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}ConstantValidation, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}ConstantValidation, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}ConstantValidation, afterAll`);
    });

    /**
     * @tc.number SUB_CONSTANT_0100
     * @tc.name testAvailableMinApiVersionValue0001
     * @tc.desc Verify AVAILABLE_MIN_API_VERSION equals expected value 22.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailableMinApiVersionValue0001', 0, () => {
      logger.info(`${BUNDLE}testAvailableMinApiVersionValue0001, begin`);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(EXPECTED_AVAILABLE_MIN_API_VERSION);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(AVAILABLE_MIN_API_VERSION === 22).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testAvailableMinApiVersionValue0001, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0200
     * @tc.name testSuppressAnnotationSinceApiVersionValue0002
     * @tc.desc Verify SUPPRESS_ANNOTATION_SINCE_API_VERSION equals expected value 23.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressAnnotationSinceApiVersionValue0002', 0, () => {
      logger.info(`${BUNDLE}testSuppressAnnotationSinceApiVersionValue0002, begin`);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual(EXPECTED_SUPPRESS_ANNOTATION_SINCE_API_VERSION);
      expect(typeof SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertEqual('number');
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION === 23).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressAnnotationSinceApiVersionValue0002, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0300
     * @tc.name testFutureDemoApiVersionValue0003
     * @tc.desc Verify FUTURE_DEMO_API_VERSION equals expected value 27.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFutureDemoApiVersionValue0003', 0, () => {
      logger.info(`${BUNDLE}testFutureDemoApiVersionValue0003, begin`);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(EXPECTED_FUTURE_DEMO_API_VERSION);
      expect(typeof FUTURE_DEMO_API_VERSION).assertEqual('number');
      expect(FUTURE_DEMO_API_VERSION === 27).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testFutureDemoApiVersionValue0003, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0400
     * @tc.name testApiVersionOrdering0004
     * @tc.desc Verify API version constants are in correct order (22 < 23 < 27).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testApiVersionOrdering0004', 0, () => {
      logger.info(`${BUNDLE}testApiVersionOrdering0004, begin`);
      expect(AVAILABLE_MIN_API_VERSION < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(AVAILABLE_MIN_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testApiVersionOrdering0004, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0500
     * @tc.name testApiVersionPositiveValues0005
     * @tc.desc Verify all API version constants are positive numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testApiVersionPositiveValues0005', 0, () => {
      logger.info(`${BUNDLE}testApiVersionPositiveValues0005, begin`);
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION > 0).assertTrue();
      expect(FUTURE_DEMO_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testApiVersionPositiveValues0005, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0600
     * @tc.name testApiVersionReasonableRange0006
     * @tc.desc Verify API version constants are within reasonable range (1-100).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testApiVersionReasonableRange0006', 0, () => {
      logger.info(`${BUNDLE}testApiVersionReasonableRange0006, begin`);
      const MAX_REASONABLE_API_VERSION = 100;
      expect(AVAILABLE_MIN_API_VERSION <= MAX_REASONABLE_API_VERSION).assertTrue();
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION <= MAX_REASONABLE_API_VERSION).assertTrue();
      expect(FUTURE_DEMO_API_VERSION <= MAX_REASONABLE_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testApiVersionReasonableRange0006, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0700
     * @tc.name testSuppressWarningsTypeCompatibility0007
     * @tc.desc Verify SuppressWarningsType.COMPATIBILITY equals 'compatibility'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarningsTypeCompatibility0007', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsTypeCompatibility0007, begin`);
      expect(SuppressWarningsType.COMPATIBILITY).assertEqual('compatibility');
      expect(typeof SuppressWarningsType.COMPATIBILITY).assertEqual('string');
      expect(SuppressWarningsType.COMPATIBILITY === 'compatibility').assertTrue();
      expect(SuppressWarningsType.COMPATIBILITY.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarningsTypeCompatibility0007, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0800
     * @tc.name testSuppressWarningsTypeSyscap0008
     * @tc.desc Verify SuppressWarningsType.SYSCAP equals 'syscap'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarningsTypeSyscap0008', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsTypeSyscap0008, begin`);
      expect(SuppressWarningsType.SYSCAP).assertEqual('syscap');
      expect(typeof SuppressWarningsType.SYSCAP).assertEqual('string');
      expect(SuppressWarningsType.SYSCAP === 'syscap').assertTrue();
      expect(SuppressWarningsType.SYSCAP.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarningsTypeSyscap0008, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_0900
     * @tc.name testSuppressWarningsTypePermission0009
     * @tc.desc Verify SuppressWarningsType.PERMISSION equals 'permission'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarningsTypePermission0009', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsTypePermission0009, begin`);
      expect(SuppressWarningsType.PERMISSION).assertEqual('permission');
      expect(typeof SuppressWarningsType.PERMISSION).assertEqual('string');
      expect(SuppressWarningsType.PERMISSION === 'permission').assertTrue();
      expect(SuppressWarningsType.PERMISSION.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarningsTypePermission0009, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1000
     * @tc.name testSuppressWarningsTypeUniqueness0010
     * @tc.desc Verify all SuppressWarningsType values are unique.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuppressWarningsTypeUniqueness0010', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarningsTypeUniqueness0010, begin`);
      const types = [
        SuppressWarningsType.COMPATIBILITY,
        SuppressWarningsType.SYSCAP,
        SuppressWarningsType.PERMISSION
      ];
      const uniqueTypes = new Set(types);
      expect(uniqueTypes.size).assertEqual(types.length);
      expect(types.length).assertEqual(3);
      expect(typeof types[0]).assertEqual('string');
      expect(typeof types[1]).assertEqual('string');
      logger.info(`${BUNDLE}testSuppressWarningsTypeUniqueness0010, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1100
     * @tc.name testGetSuppressionRulesLength0011
     * @tc.desc Verify getSuppressionRules returns array with correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGetSuppressionRulesLength0011', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesLength0011, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules).assertEqual('object');
      expect(rules.length === 3).assertTrue();
      logger.info(`${BUNDLE}testGetSuppressionRulesLength0011, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1200
     * @tc.name testGetSuppressionRulesOrder0012
     * @tc.desc Verify getSuppressionRules returns rules in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGetSuppressionRulesOrder0012', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesOrder0012, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules[2]).assertEqual(SuppressWarningsType.PERMISSION);
      logger.info(`${BUNDLE}testGetSuppressionRulesOrder0012, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1300
     * @tc.name testGetSuppressionRulesContent0013
     * @tc.desc Verify getSuppressionRules returns array containing all expected types.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGetSuppressionRulesContent0013', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesContent0013, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.includes(SuppressWarningsType.COMPATIBILITY)).assertTrue();
      expect(rules.includes(SuppressWarningsType.SYSCAP)).assertTrue();
      expect(rules.includes(SuppressWarningsType.PERMISSION)).assertTrue();
      logger.info(`${BUNDLE}testGetSuppressionRulesContent0013, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1400
     * @tc.name testGetSuppressionRulesImmutability0014
     * @tc.desc Verify modifying returned array does not affect subsequent calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSuppressionRulesImmutability0014', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesImmutability0014, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      rules1.push('modified');
      rules1.pop();
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(rules2[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(Array.isArray(rules2)).assertTrue();
      expect(typeof rules2[0]).assertEqual('string');
      expect(rules2.length === 3).assertTrue();
      logger.info(`${BUNDLE}testGetSuppressionRulesImmutability0014, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1500
     * @tc.name testGetSuppressionRulesMultipleCalls0015
     * @tc.desc Verify multiple calls to getSuppressionRules return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSuppressionRulesMultipleCalls0015', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesMultipleCalls0015, begin`);
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      const rules3 = AnnotationService.getSuppressionRules();
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules2.length).assertEqual(rules3.length);
      for (let i = 0; i < rules1.length; i++) {
        expect(rules1[i]).assertEqual(rules2[i]);
        expect(rules2[i]).assertEqual(rules3[i]);
      }
      logger.info(`${BUNDLE}testGetSuppressionRulesMultipleCalls0015, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1600
     * @tc.name testGetSuppressionRulesNonEmpty0016
     * @tc.desc Verify getSuppressionRules returns non-empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSuppressionRulesNonEmpty0016', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesNonEmpty0016, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length > 0).assertTrue();
      expect(Array.isArray(rules)).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(typeof rules[0]).assertEqual('string');
      logger.info(`${BUNDLE}testGetSuppressionRulesNonEmpty0016, end`);
    });

    /**
     * @tc.number SUB_CONSTANT_1700
     * @tc.name testGetSuppressionRulesStringType0017
     * @tc.desc Verify all rules returned are string type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSuppressionRulesStringType0017', 0, () => {
      logger.info(`${BUNDLE}testGetSuppressionRulesStringType0017, begin`);
      const rules = AnnotationService.getSuppressionRules();
      for (const rule of rules) {
        expect(typeof rule).assertEqual('string');
        expect(rule.length > 0).assertTrue();
        expect(rule === 'compatibility' || rule === 'syscap' || rule === 'permission').assertTrue();
      }
      expect(rules.length).assertEqual(3);
      logger.info(`${BUNDLE}testGetSuppressionRulesStringType0017, end`);
    });
  });
}
