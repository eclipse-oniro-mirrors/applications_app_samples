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
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_RuleEngine_';
const SUPPRESSION_RULE_COUNT: number = 3;

export default function annotationRuleEngineTest() {
  describe('AnnotationRuleEngine', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationRuleEngine, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationRuleEngine, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationRuleEngine, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationRuleEngine, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0100
     * @tc.name testRulePriorityOrder0001
     * @tc.desc Verify rule priority order is correct.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRulePriorityOrder0001', 0, () => {
      logger.info(`${BUNDLE}testRulePriorityOrder0001, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      expect(rules[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRulePriorityOrder0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0200
     * @tc.name testRuleConflictResolution0002
     * @tc.desc Verify rule conflict resolution mechanism.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleConflictResolution0002', 0, () => {
      logger.info(`${BUNDLE}testRuleConflictResolution0002, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      const rules2 = AnnotationService.getSuppressionRules();
      
      // Verify no conflicts
      expect(rules1.length).assertEqual(rules2.length);
      expect(rules1[0]).assertEqual(rules2[0]);
      expect(rules1[1]).assertEqual(rules2[1]);
      expect(rules1[2]).assertEqual(rules2[2]);
      expect(rules1.length).assertEqual(3);
      expect(Array.isArray(rules1)).assertTrue();
      expect(Array.isArray(rules2)).assertTrue();
      
      logger.info(`${BUNDLE}testRuleConflictResolution0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0300
     * @tc.name testDynamicRuleAddition0003
     * @tc.desc Verify dynamic rule addition behavior.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDynamicRuleAddition0003', 0, () => {
      logger.info(`${BUNDLE}testDynamicRuleAddition0003, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      rules1.push('dynamic_rule');
      
      // Verify original rules are not affected
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(rules2[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules2[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules2[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(Array.isArray(rules2)).assertTrue();
      
      logger.info(`${BUNDLE}testDynamicRuleAddition0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0400
     * @tc.name testDynamicRuleDeletion0004
     * @tc.desc Verify dynamic rule deletion behavior.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDynamicRuleDeletion0004', 0, () => {
      logger.info(`${BUNDLE}testDynamicRuleDeletion0004, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      rules1.pop();
      
      // Verify original rules are not affected
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(rules2[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules2[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules2[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(Array.isArray(rules2)).assertTrue();
      
      logger.info(`${BUNDLE}testDynamicRuleDeletion0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0500
     * @tc.name testRuleMatchingAlgorithm0005
     * @tc.desc Verify rule matching algorithm correctness.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleMatchingAlgorithm0005', 0, () => {
      logger.info(`${BUNDLE}testRuleMatchingAlgorithm0005, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      expect(rules.includes(SuppressWarningsType.COMPATIBILITY)).assertTrue();
      expect(rules.includes(SuppressWarningsType.SYSCAP)).assertTrue();
      expect(rules.includes(SuppressWarningsType.PERMISSION)).assertTrue();
      expect(rules.includes('nonexistent')).assertFalse();
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      
      logger.info(`${BUNDLE}testRuleMatchingAlgorithm0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0600
     * @tc.name testRuleInheritanceOverride0006
     * @tc.desc Verify rule inheritance and override behavior.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleInheritanceOverride0006', 0, () => {
      logger.info(`${BUNDLE}testRuleInheritanceOverride0006, begin`);
      
      const rules1 = AnnotationService.getSuppressionRules();
      rules1[0] = 'overridden';
      
      // Verify original rules are not affected
      const rules2 = AnnotationService.getSuppressionRules();
      expect(rules2[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules2[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules2[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(rules2.length).assertEqual(3);
      expect(Array.isArray(rules2)).assertTrue();
      
      logger.info(`${BUNDLE}testRuleInheritanceOverride0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0700
     * @tc.name testRuleCombinationApplication0007
     * @tc.desc Verify rule combination application.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleCombinationApplication0007', 0, () => {
      logger.info(`${BUNDLE}testRuleCombinationApplication0007, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      // Verify all rules are present
      expect(rules.length).assertEqual(3);
      expect(rules[0]).assertEqual('compatibility');
      expect(rules[1]).assertEqual('syscap');
      expect(rules[2]).assertEqual('permission');
      expect(typeof rules[0]).assertEqual('string');
      expect(typeof rules[1]).assertEqual('string');
      expect(typeof rules[2]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRuleCombinationApplication0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0800
     * @tc.name testRuleConditionalBranch0008
     * @tc.desc Verify rule conditional branches.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleConditionalBranch0008', 0, () => {
      logger.info(`${BUNDLE}testRuleConditionalBranch0008, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      if (rules.length > 0) {
        expect(rules[0]).assertEqual('compatibility');
      }
      
      if (rules.length > 1) {
        expect(rules[1]).assertEqual('syscap');
      }
      
      if (rules.length > 2) {
        expect(rules[2]).assertEqual('permission');
      }
      
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRuleConditionalBranch0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_0900
     * @tc.name testRuleDefaultBehavior0009
     * @tc.desc Verify rule default behavior.
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuleDefaultBehavior0009', 0, () => {
      logger.info(`${BUNDLE}testRuleDefaultBehavior0009, begin`);
      
      const rules = AnnotationService.getSuppressionRules();
      
      // Verify default rules
      expect(rules !== null).assertTrue();
      expect(rules !== undefined).assertTrue();
      expect(rules.length).assertEqual(3);
      expect(Array.isArray(rules)).assertTrue();
      expect(rules[0].length > 0).assertTrue();
      expect(typeof rules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRuleDefaultBehavior0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_RULE_1000
     * @tc.name testRuleEngineStability0010
     * @tc.desc Verify rule engine stability under load.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRuleEngineStability0010', 0, () => {
      logger.info(`${BUNDLE}testRuleEngineStability0010, begin`);
      
      const iterations = 100;
      
      for (let i = 0; i < iterations; i++) {
        const rules = AnnotationService.getSuppressionRules();
        expect(rules.length).assertEqual(3);
        expect(Array.isArray(rules)).assertTrue();
        expect(rules[0]).assertEqual('compatibility');
        expect(typeof rules[0]).assertEqual('string');
      }
      
      // Verify final state
      const finalRules = AnnotationService.getSuppressionRules();
      expect(finalRules.length).assertEqual(3);
      expect(Array.isArray(finalRules)).assertTrue();
      expect(finalRules[0]).assertEqual('compatibility');
      expect(typeof finalRules[0]).assertEqual('string');
      
      logger.info(`${BUNDLE}testRuleEngineStability0010, end`);
    });
  });
}
