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
import type { AbilityConfig, ModuleConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function AbilityValidationTest(): void {
  describe('AbilityValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2000
     * @tc.name      testAbilityNameEntryAbility
     * @tc.desc      Checks that the entryability value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameEntryAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      TestLog.text('testAbilityNameEntryAbility', 'case begin', 'ability.name input entryability');
      TestLog.step('testAbilityNameEntryAbility', 'ability.name input entryability');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameEntryAbility', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameEntryAbility', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameEntryAbility', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameEntryAbility', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameEntryAbility', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameEntryAbility', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameEntryAbility', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameEntryAbility', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameEntryAbility', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameEntryAbility', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameEntryAbility', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameEntryAbility', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameEntryAbility', 'case end', 'ability.name input entryability');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2001
     * @tc.name      testAbilityNameFeatureAbility
     * @tc.desc      Checks that the featureability value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameFeatureAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      TestLog.text('testAbilityNameFeatureAbility', 'case begin', 'ability.name input featureability');
      TestLog.step('testAbilityNameFeatureAbility', 'ability.name input featureability');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameFeatureAbility', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameFeatureAbility', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameFeatureAbility', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameFeatureAbility', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameFeatureAbility', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameFeatureAbility', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameFeatureAbility', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameFeatureAbility', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameFeatureAbility', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameFeatureAbility', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameFeatureAbility', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameFeatureAbility', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameFeatureAbility', 'case end', 'ability.name input featureability');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2002
     * @tc.name      testAbilityNameSingleLetter
     * @tc.desc      Checks that the singleletter value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameSingleLetter',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      TestLog.text('testAbilityNameSingleLetter', 'case begin', 'ability.name input singleletter');
      TestLog.step('testAbilityNameSingleLetter', 'ability.name input singleletter');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameSingleLetter', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameSingleLetter', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameSingleLetter', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameSingleLetter', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameSingleLetter', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameSingleLetter', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameSingleLetter', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameSingleLetter', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameSingleLetter', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameSingleLetter', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameSingleLetter', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameSingleLetter', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameSingleLetter', 'case end', 'ability.name input singleletter');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2003
     * @tc.name      testAbilityNameDigitSuffix
     * @tc.desc      Checks that the digitsuffix value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      TestLog.text('testAbilityNameDigitSuffix', 'case begin', 'ability.name input digitsuffix');
      TestLog.step('testAbilityNameDigitSuffix', 'ability.name input digitsuffix');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameDigitSuffix', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameDigitSuffix', 'case end', 'ability.name input digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2004
     * @tc.name      testAbilityNameMyAbility
     * @tc.desc      Checks that the myability value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameMyAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      TestLog.text('testAbilityNameMyAbility', 'case begin', 'ability.name input myability');
      TestLog.step('testAbilityNameMyAbility', 'ability.name input myability');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameMyAbility', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameMyAbility', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameMyAbility', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameMyAbility', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameMyAbility', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameMyAbility', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameMyAbility', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameMyAbility', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameMyAbility', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameMyAbility', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameMyAbility', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameMyAbility', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameMyAbility', 'case end', 'ability.name input myability');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2005
     * @tc.name      testAbilityNameEntryAbilityX
     * @tc.desc      Checks that the entryabilityx value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameEntryAbilityX',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbilityX';
      TestLog.text('testAbilityNameEntryAbilityX', 'case begin', 'ability.name input entryabilityx');
      TestLog.step('testAbilityNameEntryAbilityX', 'ability.name input entryabilityx');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameEntryAbilityX', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameEntryAbilityX', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameEntryAbilityX', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameEntryAbilityX', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameEntryAbilityX', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameEntryAbilityX', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameEntryAbilityX', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameEntryAbilityX', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameEntryAbilityX', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameEntryAbilityX', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameEntryAbilityX', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameEntryAbilityX', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameEntryAbilityX', 'case end', 'ability.name input entryabilityx');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2006
     * @tc.name      testAbilityNameAbilityOnly
     * @tc.desc      Checks that the abilityonly value is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameAbilityOnly',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability';
      TestLog.text('testAbilityNameAbilityOnly', 'case begin', 'ability.name input abilityonly');
      TestLog.step('testAbilityNameAbilityOnly', 'ability.name input abilityonly');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameAbilityOnly', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameAbilityOnly', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameAbilityOnly', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameAbilityOnly', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameAbilityOnly', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameAbilityOnly', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameAbilityOnly', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameAbilityOnly', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameAbilityOnly', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameAbilityOnly', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameAbilityOnly', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameAbilityOnly', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameAbilityOnly', 'case end', 'ability.name input abilityonly');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2007
     * @tc.name      testAbilityNameEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_ABILITY_NAME_EMPTY by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      TestLog.text('testAbilityNameEmpty', 'case begin', 'ability.name input empty');
      TestLog.step('testAbilityNameEmpty', 'ability.name input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameEmpty', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityNameEmpty', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameEmpty', 'case end', 'ability.name input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2008
     * @tc.name      testAbilityNameSpaces
     * @tc.desc      Checks that the spaces value is reported with MODULE_ABILITY_NAME_EMPTY by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '   ';
      TestLog.text('testAbilityNameSpaces', 'case begin', 'ability.name input spaces');
      TestLog.step('testAbilityNameSpaces', 'ability.name input spaces');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameSpaces', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityNameSpaces', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameSpaces', 'case end', 'ability.name input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2009
     * @tc.name      testAbilityNameLowerCamel
     * @tc.desc      Checks that the lowercamel value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameLowerCamel',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      TestLog.text('testAbilityNameLowerCamel', 'case begin', 'ability.name input lowercamel');
      TestLog.step('testAbilityNameLowerCamel', 'ability.name input lowercamel');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameLowerCamel', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameLowerCamel', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameLowerCamel', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameLowerCamel', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameLowerCamel', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameLowerCamel', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameLowerCamel', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameLowerCamel', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameLowerCamel', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameLowerCamel', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameLowerCamel', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameLowerCamel', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameLowerCamel', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameLowerCamel', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameLowerCamel', 'case end', 'ability.name input lowercamel');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2010
     * @tc.name      testAbilityNameUpper
     * @tc.desc      Checks that the an uppercase ability identifier is accepted by the ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'ENTRYABILITY';
      TestLog.text('testAbilityNameUpper', 'case begin', 'ability.name input upper');
      TestLog.step('testAbilityNameUpper', 'ability.name input upper');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameUpper', 'ability.name', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityNameUpper', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();