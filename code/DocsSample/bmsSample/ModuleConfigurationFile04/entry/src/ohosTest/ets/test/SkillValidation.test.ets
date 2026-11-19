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
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesHomeEntity', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesHomeEntity', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesHomeEntity', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesHomeEntity', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesHomeEntity', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesHomeEntity', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesHomeEntity', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesHomeEntity', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesHomeEntity', 'case end', 'skill.entities input homeentity');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3004
     * @tc.name      testSkillEntitiesTwoEntities
     * @tc.desc      Checks that the twoentities value is accepted by the skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesTwoEntities',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.system.home', 'entity.system.browsable'];
      TestLog.text('testSkillEntitiesTwoEntities', 'case begin', 'skill.entities input twoentities');
      TestLog.step('testSkillEntitiesTwoEntities', 'skill.entities input twoentities');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesTwoEntities', 'skill.entities', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillEntitiesTwoEntities', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesTwoEntities', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesTwoEntities', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesTwoEntities', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesTwoEntities', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesTwoEntities', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesTwoEntities', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesTwoEntities', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesTwoEntities', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesTwoEntities', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesTwoEntities', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesTwoEntities', 'case end', 'skill.entities input twoentities');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3005
     * @tc.name      testSkillEntitiesMissingPrefix
     * @tc.desc      Checks that the missingprefix value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesMissingPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['system.home'];
      TestLog.text('testSkillEntitiesMissingPrefix', 'case begin', 'skill.entities input missingprefix');
      TestLog.step('testSkillEntitiesMissingPrefix', 'skill.entities input missingprefix');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesMissingPrefix', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesMissingPrefix', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesMissingPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesMissingPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesMissingPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesMissingPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesMissingPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesMissingPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesMissingPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesMissingPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesMissingPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesMissingPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesMissingPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesMissingPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesMissingPrefix', 'case end', 'skill.entities input missingprefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3006
     * @tc.name      testSkillEntitiesUpperSegment
     * @tc.desc      Checks that the uppersegment value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesUpperSegment',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.System.home'];
      TestLog.text('testSkillEntitiesUpperSegment', 'case begin', 'skill.entities input uppersegment');
      TestLog.step('testSkillEntitiesUpperSegment', 'skill.entities input uppersegment');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesUpperSegment', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesUpperSegment', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesUpperSegment', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesUpperSegment', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesUpperSegment', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesUpperSegment', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesUpperSegment', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesUpperSegment', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesUpperSegment', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesUpperSegment', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesUpperSegment', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesUpperSegment', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesUpperSegment', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesUpperSegment', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesUpperSegment', 'case end', 'skill.entities input uppersegment');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3007
     * @tc.name      testSkillEntitiesUpperTail
     * @tc.desc      Checks that the uppertail value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesUpperTail',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.system.Home'];
      TestLog.text('testSkillEntitiesUpperTail', 'case begin', 'skill.entities input uppertail');
      TestLog.step('testSkillEntitiesUpperTail', 'skill.entities input uppertail');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesUpperTail', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesUpperTail', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesUpperTail', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesUpperTail', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesUpperTail', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesUpperTail', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesUpperTail', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesUpperTail', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesUpperTail', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesUpperTail', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesUpperTail', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesUpperTail', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesUpperTail', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesUpperTail', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesUpperTail', 'case end', 'skill.entities input uppertail');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3008
     * @tc.name      testSkillEntitiesUpperPrefix
     * @tc.desc      Checks that the upperprefix value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesUpperPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['Entity.system.home'];
      TestLog.text('testSkillEntitiesUpperPrefix', 'case begin', 'skill.entities input upperprefix');
      TestLog.step('testSkillEntitiesUpperPrefix', 'skill.entities input upperprefix');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesUpperPrefix', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesUpperPrefix', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesUpperPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesUpperPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesUpperPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesUpperPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesUpperPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesUpperPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesUpperPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesUpperPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesUpperPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesUpperPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesUpperPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesUpperPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesUpperPrefix', 'case end', 'skill.entities input upperprefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3009
     * @tc.name      testSkillEntitiesOnlyEntity
     * @tc.desc      Checks that the onlyentity value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesOnlyEntity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity'];
      TestLog.text('testSkillEntitiesOnlyEntity', 'case begin', 'skill.entities input onlyentity');
      TestLog.step('testSkillEntitiesOnlyEntity', 'skill.entities input onlyentity');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesOnlyEntity', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesOnlyEntity', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesOnlyEntity', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesOnlyEntity', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesOnlyEntity', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesOnlyEntity', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesOnlyEntity', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesOnlyEntity', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesOnlyEntity', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesOnlyEntity', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesOnlyEntity', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesOnlyEntity', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesOnlyEntity', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesOnlyEntity', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesOnlyEntity', 'case end', 'skill.entities input onlyentity');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3010
     * @tc.name      testSkillEntitiesTrailingDot
     * @tc.desc      Checks that the trailingdot value is reported with MODULE_SKILL_ENTITY_ILLEGAL by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesTrailingDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.'];
      TestLog.text('testSkillEntitiesTrailingDot', 'case begin', 'skill.entities input trailingdot');
      TestLog.step('testSkillEntitiesTrailingDot', 'skill.entities input trailingdot');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesTrailingDot', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_ILLEGAL');
      TestLog.flag('testSkillEntitiesTrailingDot', 'has code MODULE_SKILL_ENTITY_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesTrailingDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesTrailingDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesTrailingDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesTrailingDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesTrailingDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesTrailingDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesTrailingDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesTrailingDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesTrailingDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesTrailingDot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesTrailingDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesTrailingDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesTrailingDot', 'case end', 'skill.entities input trailingdot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3011
     * @tc.name      testSkillEntitiesSecondBlank
     * @tc.desc      Checks that the secondblank value is reported with MODULE_SKILL_ENTITY_BLANK by the
     * @tc.desc      skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesSecondBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.system.home', ''];
      TestLog.text('testSkillEntitiesSecondBlank', 'case begin', 'skill.entities input secondblank');
      TestLog.step('testSkillEntitiesSecondBlank', 'skill.entities input secondblank');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesSecondBlank', 'skill.entities', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_BLANK');
      TestLog.flag('testSkillEntitiesSecondBlank', 'has code MODULE_SKILL_ENTITY_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillEntitiesSecondBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesSecondBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesSecondBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesSecondBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesSecondBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesSecondBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesSecondBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesSecondBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillEntitiesSecondBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesSecondBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesSecondBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesSecondBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesSecondBlank', 'case end', 'skill.entities input secondblank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3012
     * @tc.name      testSkillEntitiesDuplicateEntity
     * @tc.desc      Checks that the duplicateentity value is accepted by the skill.entities rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillEntitiesDuplicateEntity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = ['entity.system.home', 'entity.system.home'];
      TestLog.text('testSkillEntitiesDuplicateEntity', 'case begin', 'skill.entities input duplicateentity');
      TestLog.step('testSkillEntitiesDuplicateEntity', 'skill.entities input duplicateentity');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillEntitiesDuplicateEntity', 'skill.entities', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillEntitiesDuplicateEntity', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillEntitiesDuplicateEntity', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillEntitiesDuplicateEntity', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillEntitiesDuplicateEntity', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillEntitiesDuplicateEntity', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillEntitiesDuplicateEntity', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillEntitiesDuplicateEntity', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillEntitiesDuplicateEntity', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillEntitiesDuplicateEntity', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillEntitiesDuplicateEntity', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillEntitiesDuplicateEntity', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillEntitiesDuplicateEntity', 'case end', 'skill.entities input duplicateentity');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3050
     * @tc.name      testSkillActionsEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_SKILL_ACTION_EMPTY by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = [];
      TestLog.text('testSkillActionsEmpty', 'case begin', 'skill.actions input empty');
      TestLog.step('testSkillActionsEmpty', 'skill.actions input empty');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsEmpty', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_EMPTY');
      TestLog.flag('testSkillActionsEmpty', 'has code MODULE_SKILL_ACTION_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsEmpty', 'case end', 'skill.actions input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3051
     * @tc.name      testSkillActionsBlank
     * @tc.desc      Checks that the blank value is reported with MODULE_SKILL_ACTION_BLANK by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = [' '];
      TestLog.text('testSkillActionsBlank', 'case begin', 'skill.actions input blank');
      TestLog.step('testSkillActionsBlank', 'skill.actions input blank');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsBlank', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_BLANK');
      TestLog.flag('testSkillActionsBlank', 'has code MODULE_SKILL_ACTION_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsBlank', 'case end', 'skill.actions input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3052
     * @tc.name      testSkillActionsEmptyEntry
     * @tc.desc      Checks that the emptyentry value is reported with MODULE_SKILL_ACTION_BLANK by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsEmptyEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = [''];
      TestLog.text('testSkillActionsEmptyEntry', 'case begin', 'skill.actions input emptyentry');
      TestLog.step('testSkillActionsEmptyEntry', 'skill.actions input emptyentry');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsEmptyEntry', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_BLANK');
      TestLog.flag('testSkillActionsEmptyEntry', 'has code MODULE_SKILL_ACTION_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsEmptyEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsEmptyEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsEmptyEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsEmptyEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsEmptyEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsEmptyEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsEmptyEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsEmptyEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsEmptyEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsEmptyEntry', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsEmptyEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsEmptyEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsEmptyEntry', 'case end', 'skill.actions input emptyentry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3053
     * @tc.name      testSkillActionsHomeAction
     * @tc.desc      Checks that the homeaction value is accepted by the skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsHomeAction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.home'];
      TestLog.text('testSkillActionsHomeAction', 'case begin', 'skill.actions input homeaction');
      TestLog.step('testSkillActionsHomeAction', 'skill.actions input homeaction');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsHomeAction', 'skill.actions', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillActionsHomeAction', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsHomeAction', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsHomeAction', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsHomeAction', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsHomeAction', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsHomeAction', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsHomeAction', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsHomeAction', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsHomeAction', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsHomeAction', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsHomeAction', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsHomeAction', 'case end', 'skill.actions input homeaction');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3054
     * @tc.name      testSkillActionsTwoActions
     * @tc.desc      Checks that the twoactions value is accepted by the skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsTwoActions',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.home', 'ohos.want.action.viewdata'];
      TestLog.text('testSkillActionsTwoActions', 'case begin', 'skill.actions input twoactions');
      TestLog.step('testSkillActionsTwoActions', 'skill.actions input twoactions');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsTwoActions', 'skill.actions', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillActionsTwoActions', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsTwoActions', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsTwoActions', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsTwoActions', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsTwoActions', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsTwoActions', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsTwoActions', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsTwoActions', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsTwoActions', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsTwoActions', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsTwoActions', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsTwoActions', 'case end', 'skill.actions input twoactions');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3055
     * @tc.name      testSkillActionsUpperTail
     * @tc.desc      Checks that the uppertail value is reported with MODULE_SKILL_ACTION_ILLEGAL by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsUpperTail',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.viewData'];
      TestLog.text('testSkillActionsUpperTail', 'case begin', 'skill.actions input uppertail');
      TestLog.step('testSkillActionsUpperTail', 'skill.actions input uppertail');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsUpperTail', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_ILLEGAL');
      TestLog.flag('testSkillActionsUpperTail', 'has code MODULE_SKILL_ACTION_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsUpperTail', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsUpperTail', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsUpperTail', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsUpperTail', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsUpperTail', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsUpperTail', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsUpperTail', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsUpperTail', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsUpperTail', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsUpperTail', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsUpperTail', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsUpperTail', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsUpperTail', 'case end', 'skill.actions input uppertail');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3056
     * @tc.name      testSkillActionsMissingPrefix
     * @tc.desc      Checks that the missingprefix value is reported with MODULE_SKILL_ACTION_ILLEGAL by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsMissingPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ntent.action.home'];
      TestLog.text('testSkillActionsMissingPrefix', 'case begin', 'skill.actions input missingprefix');
      TestLog.step('testSkillActionsMissingPrefix', 'skill.actions input missingprefix');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsMissingPrefix', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_ILLEGAL');
      TestLog.flag('testSkillActionsMissingPrefix', 'has code MODULE_SKILL_ACTION_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsMissingPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsMissingPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsMissingPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsMissingPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsMissingPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsMissingPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsMissingPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsMissingPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsMissingPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsMissingPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsMissingPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsMissingPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsMissingPrefix', 'case end', 'skill.actions input missingprefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3057
     * @tc.name      testSkillActionsNoSegment
     * @tc.desc      Checks that the nosegment value is reported with MODULE_SKILL_ACTION_ILLEGAL by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsNoSegment',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action'];
      TestLog.text('testSkillActionsNoSegment', 'case begin', 'skill.actions input nosegment');
      TestLog.step('testSkillActionsNoSegment', 'skill.actions input nosegment');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsNoSegment', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_ILLEGAL');
      TestLog.flag('testSkillActionsNoSegment', 'has code MODULE_SKILL_ACTION_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsNoSegment', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsNoSegment', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsNoSegment', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsNoSegment', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsNoSegment', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsNoSegment', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsNoSegment', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsNoSegment', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsNoSegment', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsNoSegment', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsNoSegment', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsNoSegment', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsNoSegment', 'case end', 'skill.actions input nosegment');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3058
     * @tc.name      testSkillActionsTrailingDot
     * @tc.desc      Checks that the trailingdot value is reported with MODULE_SKILL_ACTION_ILLEGAL by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsTrailingDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.'];
      TestLog.text('testSkillActionsTrailingDot', 'case begin', 'skill.actions input trailingdot');
      TestLog.step('testSkillActionsTrailingDot', 'skill.actions input trailingdot');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsTrailingDot', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_ILLEGAL');
      TestLog.flag('testSkillActionsTrailingDot', 'has code MODULE_SKILL_ACTION_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsTrailingDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsTrailingDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsTrailingDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsTrailingDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsTrailingDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsTrailingDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsTrailingDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsTrailingDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsTrailingDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsTrailingDot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsTrailingDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsTrailingDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsTrailingDot', 'case end', 'skill.actions input trailingdot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3059
     * @tc.name      testSkillActionsSecondIllegal
     * @tc.desc      Checks that the secondillegal value is reported with MODULE_SKILL_ACTION_ILLEGAL by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsSecondIllegal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.home', 'nope'];
      TestLog.text('testSkillActionsSecondIllegal', 'case begin', 'skill.actions input secondillegal');
      TestLog.step('testSkillActionsSecondIllegal', 'skill.actions input secondillegal');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsSecondIllegal', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_ILLEGAL');
      TestLog.flag('testSkillActionsSecondIllegal', 'has code MODULE_SKILL_ACTION_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsSecondIllegal', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsSecondIllegal', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsSecondIllegal', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsSecondIllegal', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsSecondIllegal', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsSecondIllegal', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsSecondIllegal', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsSecondIllegal', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsSecondIllegal', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsSecondIllegal', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsSecondIllegal', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsSecondIllegal', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsSecondIllegal', 'case end', 'skill.actions input secondillegal');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3060
     * @tc.name      testSkillActionsSecondBlank
     * @tc.desc      Checks that the secondblank value is reported with MODULE_SKILL_ACTION_BLANK by the
     * @tc.desc      skill.actions rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillActionsSecondBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.actions = ['ohos.want.action.home', ''];
      TestLog.text('testSkillActionsSecondBlank', 'case begin', 'skill.actions input secondblank');
      TestLog.step('testSkillActionsSecondBlank', 'skill.actions input secondblank');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillActionsSecondBlank', 'skill.actions', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_BLANK');
      TestLog.flag('testSkillActionsSecondBlank', 'has code MODULE_SKILL_ACTION_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillActionsSecondBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillActionsSecondBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillActionsSecondBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillActionsSecondBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillActionsSecondBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillActionsSecondBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillActionsSecondBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillActionsSecondBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillActionsSecondBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillActionsSecondBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillActionsSecondBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillActionsSecondBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillActionsSecondBlank', 'case end', 'skill.actions input secondblank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3100
     * @tc.name      testSkillSampleValid
     * @tc.desc      Checks that the sample home skill passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillSampleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      TestLog.text('testSkillSampleValid', 'case begin', 'sample skill check');
      TestLog.step('testSkillSampleValid', 'sample skill check');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillSampleValid', 'skill findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillSampleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillSampleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillSampleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillSampleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillSampleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillSampleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillSampleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillSampleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillSampleValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillSampleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillSampleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillSampleValid', 'case end', 'sample skill check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3101
     * @tc.name      testSkillFeatureValid
     * @tc.desc      Checks that the feature home skill passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillFeatureValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      TestLog.text('testSkillFeatureValid', 'case begin', 'feature skill check');
      TestLog.step('testSkillFeatureValid', 'feature skill check');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillFeatureValid', 'skill findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillFeatureValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillFeatureValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillFeatureValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillFeatureValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillFeatureValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillFeatureValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillFeatureValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillFeatureValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillFeatureValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillFeatureValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillFeatureValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillFeatureValid', 'case end', 'feature skill check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3102
     * @tc.name      testSkillWithValidUri
     * @tc.desc      Checks that a skill declaring a valid uri passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillWithValidUri',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      const uri = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'www.example.com';
      uri.path = '/index';
      skill.uris = [uri];
      TestLog.text('testSkillWithValidUri', 'case begin', 'skill with uri check');
      TestLog.step('testSkillWithValidUri', 'skill with uri check');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillWithValidUri', 'skill findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillWithValidUri', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillWithValidUri', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillWithValidUri', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillWithValidUri', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillWithValidUri', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillWithValidUri', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillWithValidUri', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillWithValidUri', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillWithValidUri', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillWithValidUri', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillWithValidUri', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillWithValidUri', 'case end', 'skill with uri check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3103
     * @tc.name      testSkillWithInvalidUri
     * @tc.desc      Checks that an invalid uri inside a skill is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillWithInvalidUri',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      const uri = ConfigFactory.emptyUri();
      uri.scheme = 'HTTPS';
      skill.uris = [uri];
      TestLog.text('testSkillWithInvalidUri', 'case begin', 'skill invalid uri check');
      TestLog.step('testSkillWithInvalidUri', 'skill invalid uri check');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillWithInvalidUri', 'skill findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testSkillWithInvalidUri', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillWithInvalidUri', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillWithInvalidUri', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillWithInvalidUri', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillWithInvalidUri', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillWithInvalidUri', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillWithInvalidUri', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillWithInvalidUri', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillWithInvalidUri', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillWithInvalidUri', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillWithInvalidUri', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillWithInvalidUri', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillWithInvalidUri', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillWithInvalidUri', 'case end', 'skill invalid uri check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3104
     * @tc.name      testSkillDuplicateDeclaration
     * @tc.desc      Checks that a duplicated skill declaration on the main ability is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillDuplicateDeclaration',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = ConfigFactory.entrySkill();
      moduleConfig.abilities[0].skills.push(skill);
      TestLog.text('testSkillDuplicateDeclaration', 'case begin', 'duplicate skill check');
      TestLog.step('testSkillDuplicateDeclaration', 'duplicate skill check');
      const findings: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.findings('testSkillDuplicateDeclaration', 'skill findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_DUPLICATE');
      TestLog.flag('testSkillDuplicateDeclaration', 'has code MODULE_SKILL_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillDuplicateDeclaration', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillDuplicateDeclaration', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillDuplicateDeclaration', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillDuplicateDeclaration', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillDuplicateDeclaration', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillDuplicateDeclaration', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillDuplicateDeclaration', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillDuplicateDeclaration', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillDuplicateDeclaration', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillDuplicateDeclaration', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.number('testSkillDuplicateDeclaration', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillDuplicateDeclaration', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillDuplicateDeclaration', 'case end', 'duplicate skill check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3105
     * @tc.name      testSkillMainAbilityWithoutSkill
     * @tc.desc      Checks that the main ability without a skill is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMainAbilityWithoutSkill',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.abilities[0].skills = [];
      TestLog.text('testSkillMainAbilityWithoutSkill', 'case begin', 'main ability skill warning check');
      TestLog.step('testSkillMainAbilityWithoutSkill', 'main ability skill warning check');
      const findings: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.findings('testSkillMainAbilityWithoutSkill', 'skill findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ABILITY_SKILLS_MISSING');
      TestLog.flag('testSkillMainAbilityWithoutSkill', 'has code MODULE_MAIN_ABILITY_SKILLS_MISSING', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillMainAbilityWithoutSkill', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillMainAbilityWithoutSkill', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillMainAbilityWithoutSkill', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillMainAbilityWithoutSkill', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillMainAbilityWithoutSkill', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillMainAbilityWithoutSkill', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillMainAbilityWithoutSkill', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillMainAbilityWithoutSkill', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillMainAbilityWithoutSkill', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillMainAbilityWithoutSkill', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.number('testSkillMainAbilityWithoutSkill', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillMainAbilityWithoutSkill', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillMainAbilityWithoutSkill', 'case end', 'main ability skill warning check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3106
     * @tc.name      testSkillSecondaryAbilityWithoutSkill
     * @tc.desc      Checks that a secondary ability without a skill produces no warning.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillSecondaryAbilityWithoutSkill',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const second = ConfigFactory.entryAbility();
      second.name = 'SecondaryAbility';
      second.srcEntry = './ets/ability/SecondaryAbility.ets';
      second.skills = [];
      moduleConfig.abilities.push(second);
      TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'case begin', 'secondary ability skill check');
      TestLog.step('testSkillSecondaryAbilityWithoutSkill', 'secondary ability skill check');
      const findings: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.findings('testSkillSecondaryAbilityWithoutSkill', 'skill findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testSkillSecondaryAbilityWithoutSkill', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillSecondaryAbilityWithoutSkill', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillSecondaryAbilityWithoutSkill', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillSecondaryAbilityWithoutSkill', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillSecondaryAbilityWithoutSkill', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.number('testSkillSecondaryAbilityWithoutSkill', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillSecondaryAbilityWithoutSkill', 'case end', 'secondary ability skill check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3107
     * @tc.name      testSkillCountHelper
     * @tc.desc      Checks that the declared skill count helper counts the sample skills.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillCountHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testSkillCountHelper', 'case begin', 'skill count check');
      TestLog.step('testSkillCountHelper', 'skill count check');
      const actual: number = ModuleConfigValidator.countSkills(moduleConfig);
      TestLog.text('testSkillCountHelper', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testSkillCountHelper', 'case end', 'skill count check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3108
     * @tc.name      testSkillHasEntityHelper
     * @tc.desc      Checks that the skill entity helper finds the home entity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillHasEntityHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testSkillHasEntityHelper', 'case begin', 'skill entity helper check');
      TestLog.step('testSkillHasEntityHelper', 'skill entity helper check');
      const actual: boolean = ModuleConfigValidator.skillHasEntity(moduleConfig.abilities[0], 'entity.system.home');
      TestLog.text('testSkillHasEntityHelper', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSkillHasEntityHelper', 'case end', 'skill entity helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3109
     * @tc.name      testSkillHasActionHelperMissing
     * @tc.desc      Checks that the skill action helper rejects an undeclared action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillHasActionHelperMissing',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testSkillHasActionHelperMissing', 'case begin', 'skill action helper check');
      TestLog.step('testSkillHasActionHelperMissing', 'skill action helper check');
      const actual: boolean = 
        ModuleConfigValidator.skillHasAction(moduleConfig.abilities[0], 'ohos.want.action.viewdata');
      TestLog.text('testSkillHasActionHelperMissing', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSkillHasActionHelperMissing', 'case end', 'skill action helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3110
     * @tc.name      testSkillIssuesReportedTogether
     * @tc.desc      Checks that empty entities and empty actions are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillIssuesReportedTogether',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const skill: SkillConfig = moduleConfig.abilities[0].skills[0];
      skill.entities = [];
      skill.actions = [];
      TestLog.text('testSkillIssuesReportedTogether', 'case begin', 'skill combined empty check');
      TestLog.step('testSkillIssuesReportedTogether', 'skill combined empty check');
      const findings: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.findings('testSkillIssuesReportedTogether', 'skill findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ENTITY_EMPTY');
      TestLog.flag('testSkillIssuesReportedTogether', 'has code MODULE_SKILL_ENTITY_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_ACTION_EMPTY');
      TestLog.flag('testSkillIssuesReportedTogether', 'has code MODULE_SKILL_ACTION_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testSkillIssuesReportedTogether', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testSkillIssuesReportedTogether', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testSkillIssuesReportedTogether', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testSkillIssuesReportedTogether', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testSkillIssuesReportedTogether', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testSkillIssuesReportedTogether', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testSkillIssuesReportedTogether', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testSkillIssuesReportedTogether', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testSkillIssuesReportedTogether', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testSkillIssuesReportedTogether', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkill(skill, 'module.abilities[0].skills[0]');
      TestLog.number('testSkillIssuesReportedTogether', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testSkillIssuesReportedTogether', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testSkillIssuesReportedTogether', 'case end', 'skill combined empty check');
    })

  })
}
