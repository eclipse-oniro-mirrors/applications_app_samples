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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import type { ModuleConfig, SkillConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function SkillValidationTest(): void {
  describe('SkillValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3000
     * @tc.name      testSkillEntitiesEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_SKILL_ENTITY_EMPTY by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = [];
      TestLog.text('testSkillEntitiesEmpty', 'case begin', 'skill.entities input empty');
      TestLog.step('testSkillEntitiesEmpty', 'skill.entities input empty');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesEmpty', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_EMPTY');
      TestLog.flag('testSkillEntitiesEmpty', 'has code MODULE_SKILL_ENTITY_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesEmpty', 'case end', 'skill.entities input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3001
     * @tc.name      testSkillEntitiesBlank
     * @tc.desc      Checks that the blank value is reported with MODULE_SKILL_ENTITY_BLANK by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = [' '];
      TestLog.text('testSkillEntitiesBlank', 'case begin', 'skill.entities input blank');
      TestLog.step('testSkillEntitiesBlank', 'skill.entities input blank');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesBlank', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_BLANK');
      TestLog.flag('testSkillEntitiesBlank', 'has code MODULE_SKILL_ENTITY_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesBlank', 'case end', 'skill.entities input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3002
     * @tc.name      testSkillEntitiesEmptyEntry
     * @tc.desc      Checks that the emptyentry value is reported with MODULE_SKILL_ENTITY_BLANK by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesEmptyEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = [''];
      TestLog.text('testSkillEntitiesEmptyEntry', 'case begin', 'skill.entities input emptyentry');
      TestLog.step('testSkillEntitiesEmptyEntry', 'skill.entities input emptyentry');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesEmptyEntry', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_BLANK');
      TestLog.flag('testSkillEntitiesEmptyEntry', 'has code MODULE_SKILL_ENTITY_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesEmptyEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesEmptyEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesEmptyEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesEmptyEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesEmptyEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesEmptyEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesEmptyEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesEmptyEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesEmptyEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesEmptyEntry', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesEmptyEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesEmptyEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesEmptyEntry', 'case end', 'skill.entities input emptyentry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3003
     * @tc.name      testSkillEntitiesHomeEntity
     * @tc.desc      Checks that the homeentity value is accepted by the skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesHomeEntity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.system.home'];
      TestLog.text('testSkillEntitiesHomeEntity', 'case begin', 'skill.entities input homeentity');
      TestLog.step('testSkillEntitiesHomeEntity', 'skill.entities input homeentity');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesHomeEntity', 'skill.entities', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillEntitiesHomeEntity', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesHomeEntity', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesHomeEntity', 'finding path', paths[pathIndex]);