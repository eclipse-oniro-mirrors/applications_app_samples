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
      TestLog.flag('testAbilityNameUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameUpper', 'case end', 'ability.name input upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2011
     * @tc.name      testAbilityNameUnderscore
     * @tc.desc      Checks that the underscore value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      TestLog.text('testAbilityNameUnderscore', 'case begin', 'ability.name input underscore');
      TestLog.step('testAbilityNameUnderscore', 'ability.name input underscore');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameUnderscore', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameUnderscore', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameUnderscore', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameUnderscore', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameUnderscore', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameUnderscore', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameUnderscore', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameUnderscore', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameUnderscore', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameUnderscore', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameUnderscore', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameUnderscore', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameUnderscore', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameUnderscore', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameUnderscore', 'case end', 'ability.name input underscore');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2012
     * @tc.name      testAbilityNameHyphen
     * @tc.desc      Checks that the hyphen value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry-Ability';
      TestLog.text('testAbilityNameHyphen', 'case begin', 'ability.name input hyphen');
      TestLog.step('testAbilityNameHyphen', 'ability.name input hyphen');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameHyphen', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameHyphen', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameHyphen', 'case end', 'ability.name input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2013
     * @tc.name      testAbilityNameDigitFirst
     * @tc.desc      Checks that the digitfirst value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameDigitFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '2Ability';
      TestLog.text('testAbilityNameDigitFirst', 'case begin', 'ability.name input digitfirst');
      TestLog.step('testAbilityNameDigitFirst', 'ability.name input digitfirst');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameDigitFirst', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameDigitFirst', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameDigitFirst', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameDigitFirst', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameDigitFirst', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameDigitFirst', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameDigitFirst', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameDigitFirst', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameDigitFirst', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameDigitFirst', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameDigitFirst', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameDigitFirst', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameDigitFirst', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameDigitFirst', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameDigitFirst', 'case end', 'ability.name input digitfirst');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2014
     * @tc.name      testAbilityNameSpace
     * @tc.desc      Checks that the space value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry Ability';
      TestLog.text('testAbilityNameSpace', 'case begin', 'ability.name input space');
      TestLog.step('testAbilityNameSpace', 'ability.name input space');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameSpace', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameSpace', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameSpace', 'case end', 'ability.name input space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2015
     * @tc.name      testAbilityNameUnicode
     * @tc.desc      Checks that the unicode value is reported with MODULE_ABILITY_NAME_NOT_PASCAL by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameUnicode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility\u4e00';
      TestLog.text('testAbilityNameUnicode', 'case begin', 'ability.name input unicode');
      TestLog.step('testAbilityNameUnicode', 'ability.name input unicode');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameUnicode', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityNameUnicode', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameUnicode', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameUnicode', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameUnicode', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameUnicode', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameUnicode', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameUnicode', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameUnicode', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameUnicode', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameUnicode', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameUnicode', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameUnicode', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameUnicode', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameUnicode', 'case end', 'ability.name input unicode');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2016
     * @tc.name      testAbilityNameTooLong
     * @tc.desc      Checks that the toolong value is reported with MODULE_ABILITY_NAME_TOO_LONG by the
     * @tc.desc      ability.name rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityNameTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A'.repeat(129);
      TestLog.text('testAbilityNameTooLong', 'case begin', 'ability.name input toolong');
      TestLog.step('testAbilityNameTooLong', 'ability.name input toolong');
      const findings: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.findings('testAbilityNameTooLong', 'ability.name', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_TOO_LONG');
      TestLog.flag('testAbilityNameTooLong', 'has code MODULE_ABILITY_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityNameTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityNameTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityNameTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityNameTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityNameTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityNameTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityNameTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityNameTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityNameTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityNameTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilityName(ability, 'module.abilities[0]');
      TestLog.number('testAbilityNameTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityNameTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityNameTooLong', 'case end', 'ability.name input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2100
     * @tc.name      testAbilitySrcEntrySample
     * @tc.desc      Checks that the sample value is accepted by the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntrySample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/entryability/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntrySample', 'case begin', 'ability.srcEntry input sample');
      TestLog.step('testAbilitySrcEntrySample', 'ability.srcEntry input sample');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntrySample', 'ability.srcEntry', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilitySrcEntrySample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntrySample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntrySample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntrySample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntrySample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntrySample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntrySample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntrySample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntrySample', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntrySample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntrySample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntrySample', 'case end', 'ability.srcEntry input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2101
     * @tc.name      testAbilitySrcEntryOther
     * @tc.desc      Checks that the other value is accepted by the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryOther',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/entryability/Other.ets';
      TestLog.text('testAbilitySrcEntryOther', 'case begin', 'ability.srcEntry input other');
      TestLog.step('testAbilitySrcEntryOther', 'ability.srcEntry input other');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryOther', 'ability.srcEntry', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilitySrcEntryOther', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryOther', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryOther', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryOther', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryOther', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryOther', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryOther', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryOther', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryOther', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryOther', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryOther', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryOther', 'case end', 'ability.srcEntry input other');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2102
     * @tc.name      testAbilitySrcEntryFeature
     * @tc.desc      Checks that the feature value is accepted by the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/featureability/FeatureAbility.ets';
      TestLog.text('testAbilitySrcEntryFeature', 'case begin', 'ability.srcEntry input feature');
      TestLog.step('testAbilitySrcEntryFeature', 'ability.srcEntry input feature');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryFeature', 'ability.srcEntry', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilitySrcEntryFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryFeature', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryFeature', 'case end', 'ability.srcEntry input feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2103
     * @tc.name      testAbilitySrcEntryShort
     * @tc.desc      Checks that the short value is accepted by the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryShort',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/a.ets';
      TestLog.text('testAbilitySrcEntryShort', 'case begin', 'ability.srcEntry input short');
      TestLog.step('testAbilitySrcEntryShort', 'ability.srcEntry input short');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryShort', 'ability.srcEntry', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilitySrcEntryShort', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryShort', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryShort', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryShort', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryShort', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryShort', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryShort', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryShort', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryShort', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryShort', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryShort', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryShort', 'case end', 'ability.srcEntry input short');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2104
     * @tc.name      testAbilitySrcEntryEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_ABILITY_SRC_EMPTY by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = '';
      TestLog.text('testAbilitySrcEntryEmpty', 'case begin', 'ability.srcEntry input empty');
      TestLog.step('testAbilitySrcEntryEmpty', 'ability.srcEntry input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryEmpty', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_EMPTY');
      TestLog.flag('testAbilitySrcEntryEmpty', 'has code MODULE_ABILITY_SRC_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryEmpty', 'case end', 'ability.srcEntry input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2105
     * @tc.name      testAbilitySrcEntrySpaces
     * @tc.desc      Checks that the spaces value is reported with MODULE_ABILITY_SRC_EMPTY by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntrySpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = '   ';
      TestLog.text('testAbilitySrcEntrySpaces', 'case begin', 'ability.srcEntry input spaces');
      TestLog.step('testAbilitySrcEntrySpaces', 'ability.srcEntry input spaces');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntrySpaces', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_EMPTY');
      TestLog.flag('testAbilitySrcEntrySpaces', 'has code MODULE_ABILITY_SRC_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntrySpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntrySpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntrySpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntrySpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntrySpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntrySpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntrySpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntrySpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntrySpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntrySpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntrySpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntrySpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntrySpaces', 'case end', 'ability.srcEntry input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2106
     * @tc.name      testAbilitySrcEntryNoPrefix
     * @tc.desc      Checks that the noprefix value is reported with MODULE_ABILITY_SRC_PREFIX by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryNoPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = 'EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryNoPrefix', 'case begin', 'ability.srcEntry input noprefix');
      TestLog.step('testAbilitySrcEntryNoPrefix', 'ability.srcEntry input noprefix');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryNoPrefix', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_PREFIX');
      TestLog.flag('testAbilitySrcEntryNoPrefix', 'has code MODULE_ABILITY_SRC_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryNoPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryNoPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryNoPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryNoPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryNoPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryNoPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryNoPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryNoPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryNoPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryNoPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryNoPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryNoPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryNoPrefix', 'case end', 'ability.srcEntry input noprefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2107
     * @tc.name      testAbilitySrcEntryRelativeNoDot
     * @tc.desc      Checks that the relativenodot value is reported with MODULE_ABILITY_SRC_PREFIX by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryRelativeNoDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = 'ets/entryability/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryRelativeNoDot', 'case begin', 'ability.srcEntry input relativenodot');
      TestLog.step('testAbilitySrcEntryRelativeNoDot', 'ability.srcEntry input relativenodot');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryRelativeNoDot', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_PREFIX');
      TestLog.flag('testAbilitySrcEntryRelativeNoDot', 'has code MODULE_ABILITY_SRC_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryRelativeNoDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryRelativeNoDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryRelativeNoDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryRelativeNoDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryRelativeNoDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryRelativeNoDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryRelativeNoDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryRelativeNoDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryRelativeNoDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryRelativeNoDot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryRelativeNoDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryRelativeNoDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryRelativeNoDot', 'case end', 'ability.srcEntry input relativenodot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2108
     * @tc.name      testAbilitySrcEntryWrongRoot
     * @tc.desc      Checks that the wrongroot value is reported with MODULE_ABILITY_SRC_PREFIX by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryWrongRoot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './entryability/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryWrongRoot', 'case begin', 'ability.srcEntry input wrongroot');
      TestLog.step('testAbilitySrcEntryWrongRoot', 'ability.srcEntry input wrongroot');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryWrongRoot', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_PREFIX');
      TestLog.flag('testAbilitySrcEntryWrongRoot', 'has code MODULE_ABILITY_SRC_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryWrongRoot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryWrongRoot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryWrongRoot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryWrongRoot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryWrongRoot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryWrongRoot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryWrongRoot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryWrongRoot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryWrongRoot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryWrongRoot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryWrongRoot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryWrongRoot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryWrongRoot', 'case end', 'ability.srcEntry input wrongroot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2109
     * @tc.name      testAbilitySrcEntryTsSuffix
     * @tc.desc      Checks that the tssuffix value is reported with MODULE_ABILITY_SRC_EXTENSION by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryTsSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/entryability/EntryAbility.ts';
      TestLog.text('testAbilitySrcEntryTsSuffix', 'case begin', 'ability.srcEntry input tssuffix');
      TestLog.step('testAbilitySrcEntryTsSuffix', 'ability.srcEntry input tssuffix');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryTsSuffix', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_EXTENSION');
      TestLog.flag('testAbilitySrcEntryTsSuffix', 'has code MODULE_ABILITY_SRC_EXTENSION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryTsSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryTsSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryTsSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryTsSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryTsSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryTsSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryTsSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryTsSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryTsSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryTsSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryTsSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryTsSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryTsSuffix', 'case end', 'ability.srcEntry input tssuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2110
     * @tc.name      testAbilitySrcEntryNoSuffix
     * @tc.desc      Checks that the nosuffix value is reported with MODULE_ABILITY_SRC_EXTENSION by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryNoSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/entryability/EntryAbility';
      TestLog.text('testAbilitySrcEntryNoSuffix', 'case begin', 'ability.srcEntry input nosuffix');
      TestLog.step('testAbilitySrcEntryNoSuffix', 'ability.srcEntry input nosuffix');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryNoSuffix', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_EXTENSION');
      TestLog.flag('testAbilitySrcEntryNoSuffix', 'has code MODULE_ABILITY_SRC_EXTENSION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryNoSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryNoSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryNoSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryNoSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryNoSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryNoSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryNoSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryNoSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryNoSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryNoSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryNoSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryNoSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryNoSuffix', 'case end', 'ability.srcEntry input nosuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2111
     * @tc.name      testAbilitySrcEntryTraversal
     * @tc.desc      Checks that the traversal value is reported with MODULE_ABILITY_SRC_TRAVERSAL by the
     * @tc.desc      ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryTraversal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/../ets/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryTraversal', 'case begin', 'ability.srcEntry input traversal');
      TestLog.step('testAbilitySrcEntryTraversal', 'ability.srcEntry input traversal');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryTraversal', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_TRAVERSAL');
      TestLog.flag('testAbilitySrcEntryTraversal', 'has code MODULE_ABILITY_SRC_TRAVERSAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryTraversal', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryTraversal', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryTraversal', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryTraversal', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryTraversal', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryTraversal', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryTraversal', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryTraversal', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryTraversal', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryTraversal', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryTraversal', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryTraversal', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryTraversal', 'case end', 'ability.srcEntry input traversal');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2112
     * @tc.name      testAbilitySrcEntryBackslashTraversal
     * @tc.desc      Checks that the backslashtraversal value is reported with MODULE_ABILITY_SRC_TRAVERSAL
     * @tc.desc      by the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryBackslashTraversal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = '..\ets\EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryBackslashTraversal', 'case begin', 'ability.srcEntry input backslashtraversal');
      TestLog.step('testAbilitySrcEntryBackslashTraversal', 'ability.srcEntry input backslashtraversal');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryBackslashTraversal', 'ability.srcEntry', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_TRAVERSAL');
      TestLog.flag('testAbilitySrcEntryBackslashTraversal', 'has code MODULE_ABILITY_SRC_TRAVERSAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryBackslashTraversal', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryBackslashTraversal', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryBackslashTraversal', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryBackslashTraversal', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryBackslashTraversal', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryBackslashTraversal', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryBackslashTraversal', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryBackslashTraversal', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryBackslashTraversal', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryBackslashTraversal', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryBackslashTraversal', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryBackslashTraversal', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryBackslashTraversal', 'case end', 'ability.srcEntry input backslashtraversal');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2113
     * @tc.name      testAbilitySrcEntryLeadingSpace
     * @tc.desc      Checks that the a source entry normalized by trimming leading whitespace is accepted by
     * @tc.desc      the ability.srcEntry rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryLeadingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = ' ./ets/entryability/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryLeadingSpace', 'case begin', 'ability.srcEntry input leadingspace');
      TestLog.step('testAbilitySrcEntryLeadingSpace', 'ability.srcEntry input leadingspace');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryLeadingSpace', 'ability.srcEntry', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilitySrcEntryLeadingSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryLeadingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryLeadingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryLeadingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryLeadingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryLeadingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryLeadingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryLeadingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryLeadingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryLeadingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryLeadingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryLeadingSpace', 'case end', 'ability.srcEntry input leadingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2200
     * @tc.name      testAbilityDescriptionSampleRef
     * @tc.desc      Checks that the sampleref value is accepted by the ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionSampleRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = '$string:EntryAbility_desc';
      TestLog.text('testAbilityDescriptionSampleRef', 'case begin', 'ability.description input sampleref');
      TestLog.step('testAbilityDescriptionSampleRef', 'ability.description input sampleref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionSampleRef', 'ability.description', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityDescriptionSampleRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionSampleRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionSampleRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionSampleRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionSampleRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionSampleRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionSampleRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionSampleRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionSampleRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionSampleRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionSampleRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionSampleRef', 'case end', 'ability.description input sampleref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2201
     * @tc.name      testAbilityDescriptionFeatureRef
     * @tc.desc      Checks that the featureref value is accepted by the ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionFeatureRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = '$string:feature_desc';
      TestLog.text('testAbilityDescriptionFeatureRef', 'case begin', 'ability.description input featureref');
      TestLog.step('testAbilityDescriptionFeatureRef', 'ability.description input featureref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionFeatureRef', 'ability.description', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityDescriptionFeatureRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionFeatureRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionFeatureRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionFeatureRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionFeatureRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionFeatureRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionFeatureRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionFeatureRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionFeatureRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionFeatureRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionFeatureRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionFeatureRef', 'case end', 'ability.description input featureref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2202
     * @tc.name      testAbilityDescriptionEmpty
     * @tc.desc      Checks that the empty value is reported with RESOURCE_REF_EMPTY by the
     * @tc.desc      ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = '';
      TestLog.text('testAbilityDescriptionEmpty', 'case begin', 'ability.description input empty');
      TestLog.step('testAbilityDescriptionEmpty', 'ability.description input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionEmpty', 'ability.description', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityDescriptionEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDescriptionEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDescriptionEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionEmpty', 'case end', 'ability.description input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2203
     * @tc.name      testAbilityDescriptionPlain
     * @tc.desc      Checks that the plain value is reported with RESOURCE_REF_NO_DOLLAR by the
     * @tc.desc      ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = 'Plain description';
      TestLog.text('testAbilityDescriptionPlain', 'case begin', 'ability.description input plain');
      TestLog.step('testAbilityDescriptionPlain', 'ability.description input plain');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionPlain', 'ability.description', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityDescriptionPlain', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDescriptionPlain', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDescriptionPlain', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionPlain', 'case end', 'ability.description input plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2204
     * @tc.name      testAbilityDescriptionSpaceRef
     * @tc.desc      Checks that the spaceref value is reported with RESOURCE_REF_WHITESPACE by the
     * @tc.desc      ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionSpaceRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = ' $string:EntryAbility_desc';
      TestLog.text('testAbilityDescriptionSpaceRef', 'case begin', 'ability.description input spaceref');
      TestLog.step('testAbilityDescriptionSpaceRef', 'ability.description input spaceref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionSpaceRef', 'ability.description', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testAbilityDescriptionSpaceRef', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDescriptionSpaceRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionSpaceRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionSpaceRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionSpaceRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionSpaceRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionSpaceRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionSpaceRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionSpaceRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDescriptionSpaceRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionSpaceRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionSpaceRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionSpaceRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionSpaceRef', 'case end', 'ability.description input spaceref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2205
     * @tc.name      testAbilityDescriptionEmptyRef
     * @tc.desc      Checks that the emptyref value is reported with RESOURCE_REF_EMPTY_NAME by the
     * @tc.desc      ability.description rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionEmptyRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = '$string:';
      TestLog.text('testAbilityDescriptionEmptyRef', 'case begin', 'ability.description input emptyref');
      TestLog.step('testAbilityDescriptionEmptyRef', 'ability.description input emptyref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionEmptyRef', 'ability.description', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAbilityDescriptionEmptyRef', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDescriptionEmptyRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionEmptyRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionEmptyRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionEmptyRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionEmptyRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionEmptyRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionEmptyRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionEmptyRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDescriptionEmptyRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionEmptyRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionEmptyRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionEmptyRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionEmptyRef', 'case end', 'ability.description input emptyref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2300
     * @tc.name      testAbilityIconSampleRef
     * @tc.desc      Checks that the sampleref value is accepted by the ability.icon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconSampleRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '$media:layered_image';
      TestLog.text('testAbilityIconSampleRef', 'case begin', 'ability.icon input sampleref');
      TestLog.step('testAbilityIconSampleRef', 'ability.icon input sampleref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconSampleRef', 'ability.icon', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityIconSampleRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconSampleRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconSampleRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconSampleRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconSampleRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconSampleRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconSampleRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconSampleRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconSampleRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconSampleRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconSampleRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconSampleRef', 'case end', 'ability.icon input sampleref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2301
     * @tc.name      testAbilityIconIconRef
     * @tc.desc      Checks that the iconref value is accepted by the ability.icon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconIconRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '$media:icon';
      TestLog.text('testAbilityIconIconRef', 'case begin', 'ability.icon input iconref');
      TestLog.step('testAbilityIconIconRef', 'ability.icon input iconref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconIconRef', 'ability.icon', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityIconIconRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconIconRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconIconRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconIconRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconIconRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconIconRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconIconRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconIconRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconIconRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconIconRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconIconRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconIconRef', 'case end', 'ability.icon input iconref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2302
     * @tc.name      testAbilityIconEmpty
     * @tc.desc      Checks that the empty value is reported with RESOURCE_REF_EMPTY by the ability.icon
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '';
      TestLog.text('testAbilityIconEmpty', 'case begin', 'ability.icon input empty');
      TestLog.step('testAbilityIconEmpty', 'ability.icon input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconEmpty', 'ability.icon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityIconEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityIconEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityIconEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconEmpty', 'case end', 'ability.icon input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2303
     * @tc.name      testAbilityIconPlain
     * @tc.desc      Checks that the plain value is reported with RESOURCE_REF_NO_DOLLAR by the ability.icon
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = 'icon.png';
      TestLog.text('testAbilityIconPlain', 'case begin', 'ability.icon input plain');
      TestLog.step('testAbilityIconPlain', 'ability.icon input plain');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconPlain', 'ability.icon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityIconPlain', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityIconPlain', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityIconPlain', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconPlain', 'case end', 'ability.icon input plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2304
     * @tc.name      testAbilityIconEmptyRef
     * @tc.desc      Checks that the emptyref value is reported with RESOURCE_REF_EMPTY_NAME by the
     * @tc.desc      ability.icon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconEmptyRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '$media:';
      TestLog.text('testAbilityIconEmptyRef', 'case begin', 'ability.icon input emptyref');
      TestLog.step('testAbilityIconEmptyRef', 'ability.icon input emptyref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconEmptyRef', 'ability.icon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAbilityIconEmptyRef', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityIconEmptyRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconEmptyRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconEmptyRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconEmptyRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconEmptyRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconEmptyRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconEmptyRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconEmptyRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityIconEmptyRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);