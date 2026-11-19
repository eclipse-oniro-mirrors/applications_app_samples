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
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconEmptyRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconEmptyRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconEmptyRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconEmptyRef', 'case end', 'ability.icon input emptyref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2305
     * @tc.name      testAbilityIconStringRef
     * @tc.desc      Checks that the stringref value is reported with RESOURCE_REF_KIND_MISMATCH by the
     * @tc.desc      ability.icon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconStringRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '$string:layered_image';
      TestLog.text('testAbilityIconStringRef', 'case begin', 'ability.icon input stringref');
      TestLog.step('testAbilityIconStringRef', 'ability.icon input stringref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconStringRef', 'ability.icon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAbilityIconStringRef', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityIconStringRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconStringRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconStringRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconStringRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconStringRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconStringRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconStringRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconStringRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityIconStringRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconStringRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconStringRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconStringRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconStringRef', 'case end', 'ability.icon input stringref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2306
     * @tc.name      testAbilityIconColorRef
     * @tc.desc      Checks that the colorref value is reported with RESOURCE_REF_KIND_MISMATCH by the
     * @tc.desc      ability.icon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityIconColorRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.icon = '$color:start';
      TestLog.text('testAbilityIconColorRef', 'case begin', 'ability.icon input colorref');
      TestLog.step('testAbilityIconColorRef', 'ability.icon input colorref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityIconColorRef', 'ability.icon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAbilityIconColorRef', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityIconColorRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityIconColorRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityIconColorRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityIconColorRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityIconColorRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityIconColorRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityIconColorRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityIconColorRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityIconColorRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityIconColorRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityIconColorRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityIconColorRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityIconColorRef', 'case end', 'ability.icon input colorref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2320
     * @tc.name      testAbilityLabelSampleRef
     * @tc.desc      Checks that the sampleref value is accepted by the ability.label rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelSampleRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = '$string:EntryAbility_label';
      TestLog.text('testAbilityLabelSampleRef', 'case begin', 'ability.label input sampleref');
      TestLog.step('testAbilityLabelSampleRef', 'ability.label input sampleref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelSampleRef', 'ability.label', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityLabelSampleRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelSampleRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelSampleRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelSampleRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelSampleRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelSampleRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelSampleRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelSampleRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelSampleRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelSampleRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelSampleRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelSampleRef', 'case end', 'ability.label input sampleref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2321
     * @tc.name      testAbilityLabelFeatureRef
     * @tc.desc      Checks that the featureref value is accepted by the ability.label rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelFeatureRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = '$string:feature_label';
      TestLog.text('testAbilityLabelFeatureRef', 'case begin', 'ability.label input featureref');
      TestLog.step('testAbilityLabelFeatureRef', 'ability.label input featureref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelFeatureRef', 'ability.label', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityLabelFeatureRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelFeatureRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelFeatureRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelFeatureRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelFeatureRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelFeatureRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelFeatureRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelFeatureRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelFeatureRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelFeatureRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelFeatureRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelFeatureRef', 'case end', 'ability.label input featureref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2322
     * @tc.name      testAbilityLabelEmpty
     * @tc.desc      Checks that the empty value is reported with RESOURCE_REF_EMPTY by the ability.label
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = '';
      TestLog.text('testAbilityLabelEmpty', 'case begin', 'ability.label input empty');
      TestLog.step('testAbilityLabelEmpty', 'ability.label input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelEmpty', 'ability.label', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityLabelEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLabelEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLabelEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelEmpty', 'case end', 'ability.label input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2323
     * @tc.name      testAbilityLabelPlain
     * @tc.desc      Checks that the plain value is reported with RESOURCE_REF_NO_DOLLAR by the ability.label
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = 'EntryAbility';
      TestLog.text('testAbilityLabelPlain', 'case begin', 'ability.label input plain');
      TestLog.step('testAbilityLabelPlain', 'ability.label input plain');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelPlain', 'ability.label', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityLabelPlain', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLabelPlain', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLabelPlain', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelPlain', 'case end', 'ability.label input plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2324
     * @tc.name      testAbilityLabelEmptyRef
     * @tc.desc      Checks that the emptyref value is reported with RESOURCE_REF_EMPTY_NAME by the
     * @tc.desc      ability.label rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelEmptyRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = '$string:';
      TestLog.text('testAbilityLabelEmptyRef', 'case begin', 'ability.label input emptyref');
      TestLog.step('testAbilityLabelEmptyRef', 'ability.label input emptyref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelEmptyRef', 'ability.label', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAbilityLabelEmptyRef', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLabelEmptyRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelEmptyRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelEmptyRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelEmptyRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelEmptyRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelEmptyRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelEmptyRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelEmptyRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLabelEmptyRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelEmptyRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelEmptyRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelEmptyRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelEmptyRef', 'case end', 'ability.label input emptyref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2325
     * @tc.name      testAbilityLabelSpaceRef
     * @tc.desc      Checks that the spaceref value is reported with RESOURCE_REF_WHITESPACE by the
     * @tc.desc      ability.label rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLabelSpaceRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.label = ' $string:EntryAbility_label';
      TestLog.text('testAbilityLabelSpaceRef', 'case begin', 'ability.label input spaceref');
      TestLog.step('testAbilityLabelSpaceRef', 'ability.label input spaceref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLabelSpaceRef', 'ability.label', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testAbilityLabelSpaceRef', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLabelSpaceRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLabelSpaceRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLabelSpaceRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLabelSpaceRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLabelSpaceRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLabelSpaceRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLabelSpaceRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLabelSpaceRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLabelSpaceRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLabelSpaceRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLabelSpaceRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLabelSpaceRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLabelSpaceRef', 'case end', 'ability.label input spaceref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2340
     * @tc.name      testAbilityStartWindowIconSampleRef
     * @tc.desc      Checks that the sampleref value is accepted by the ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconSampleRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = '$media:startIcon';
      TestLog.text('testAbilityStartWindowIconSampleRef', 'case begin', 'ability.startWindowIcon input sampleref');
      TestLog.step('testAbilityStartWindowIconSampleRef', 'ability.startWindowIcon input sampleref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconSampleRef', 'ability.startWindowIcon', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityStartWindowIconSampleRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconSampleRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconSampleRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconSampleRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconSampleRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconSampleRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconSampleRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconSampleRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconSampleRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconSampleRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconSampleRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconSampleRef', 'case end', 'ability.startWindowIcon input sampleref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2341
     * @tc.name      testAbilityStartWindowIconIconRef
     * @tc.desc      Checks that the iconref value is accepted by the ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconIconRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = '$media:icon';
      TestLog.text('testAbilityStartWindowIconIconRef', 'case begin', 'ability.startWindowIcon input iconref');
      TestLog.step('testAbilityStartWindowIconIconRef', 'ability.startWindowIcon input iconref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconIconRef', 'ability.startWindowIcon', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityStartWindowIconIconRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconIconRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconIconRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconIconRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconIconRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconIconRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconIconRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconIconRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconIconRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconIconRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconIconRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconIconRef', 'case end', 'ability.startWindowIcon input iconref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2342
     * @tc.name      testAbilityStartWindowIconEmpty
     * @tc.desc      Checks that the empty value is reported with RESOURCE_REF_EMPTY by the
     * @tc.desc      ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = '';
      TestLog.text('testAbilityStartWindowIconEmpty', 'case begin', 'ability.startWindowIcon input empty');
      TestLog.step('testAbilityStartWindowIconEmpty', 'ability.startWindowIcon input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconEmpty', 'ability.startWindowIcon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityStartWindowIconEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowIconEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowIconEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconEmpty', 'case end', 'ability.startWindowIcon input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2343
     * @tc.name      testAbilityStartWindowIconPlain
     * @tc.desc      Checks that the plain value is reported with RESOURCE_REF_NO_DOLLAR by the
     * @tc.desc      ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = 'startIcon.png';
      TestLog.text('testAbilityStartWindowIconPlain', 'case begin', 'ability.startWindowIcon input plain');
      TestLog.step('testAbilityStartWindowIconPlain', 'ability.startWindowIcon input plain');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconPlain', 'ability.startWindowIcon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityStartWindowIconPlain', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowIconPlain', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowIconPlain', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconPlain', 'case end', 'ability.startWindowIcon input plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2344
     * @tc.name      testAbilityStartWindowIconEmptyRef
     * @tc.desc      Checks that the emptyref value is reported with RESOURCE_REF_EMPTY_NAME by the
     * @tc.desc      ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconEmptyRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = '$media:';
      TestLog.text('testAbilityStartWindowIconEmptyRef', 'case begin', 'ability.startWindowIcon input emptyref');
      TestLog.step('testAbilityStartWindowIconEmptyRef', 'ability.startWindowIcon input emptyref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconEmptyRef', 'ability.startWindowIcon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAbilityStartWindowIconEmptyRef', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowIconEmptyRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconEmptyRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconEmptyRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconEmptyRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconEmptyRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconEmptyRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconEmptyRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconEmptyRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowIconEmptyRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconEmptyRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconEmptyRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconEmptyRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconEmptyRef', 'case end', 'ability.startWindowIcon input emptyref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2345
     * @tc.name      testAbilityStartWindowIconColorRef
     * @tc.desc      Checks that the colorref value is reported with RESOURCE_REF_KIND_MISMATCH by the
     * @tc.desc      ability.startWindowIcon rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowIconColorRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowIcon = '$color:start';
      TestLog.text('testAbilityStartWindowIconColorRef', 'case begin', 'ability.startWindowIcon input colorref');
      TestLog.step('testAbilityStartWindowIconColorRef', 'ability.startWindowIcon input colorref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowIconColorRef', 'ability.startWindowIcon', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAbilityStartWindowIconColorRef', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowIconColorRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowIconColorRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowIconColorRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowIconColorRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowIconColorRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowIconColorRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowIconColorRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowIconColorRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowIconColorRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowIconColorRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowIconColorRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowIconColorRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowIconColorRef', 'case end', 'ability.startWindowIcon input colorref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2360
     * @tc.name      testAbilityStartWindowBackgroundSampleRef
     * @tc.desc      Checks that the sampleref value is accepted by the ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundSampleRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = '$color:start_window_background';
      TestLog.text('testAbilityStartWindowBackgroundSampleRef', 
        'case begin', 'ability.startWindowBackground input sampleref');
      TestLog.step('testAbilityStartWindowBackgroundSampleRef', 'ability.startWindowBackground input sampleref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundSampleRef', 'ability.startWindowBackground', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityStartWindowBackgroundSampleRef', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundSampleRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundSampleRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundSampleRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundSampleRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundSampleRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundSampleRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundSampleRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundSampleRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundSampleRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundSampleRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundSampleRef', 
        'case end', 'ability.startWindowBackground input sampleref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2361
     * @tc.name      testAbilityStartWindowBackgroundWhite
     * @tc.desc      Checks that the white value is accepted by the ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundWhite',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = '$color:white';
      TestLog.text('testAbilityStartWindowBackgroundWhite', 'case begin', 'ability.startWindowBackground input white');
      TestLog.step('testAbilityStartWindowBackgroundWhite', 'ability.startWindowBackground input white');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundWhite', 'ability.startWindowBackground', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityStartWindowBackgroundWhite', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundWhite', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundWhite', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundWhite', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundWhite', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundWhite', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundWhite', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundWhite', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundWhite', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundWhite', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundWhite', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundWhite', 'case end', 'ability.startWindowBackground input white');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2362
     * @tc.name      testAbilityStartWindowBackgroundEmpty
     * @tc.desc      Checks that the empty value is reported with RESOURCE_REF_EMPTY by the
     * @tc.desc      ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = '';
      TestLog.text('testAbilityStartWindowBackgroundEmpty', 'case begin', 'ability.startWindowBackground input empty');
      TestLog.step('testAbilityStartWindowBackgroundEmpty', 'ability.startWindowBackground input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundEmpty', 'ability.startWindowBackground', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityStartWindowBackgroundEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowBackgroundEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowBackgroundEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundEmpty', 'case end', 'ability.startWindowBackground input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2363
     * @tc.name      testAbilityStartWindowBackgroundPlain
     * @tc.desc      Checks that the plain value is reported with RESOURCE_REF_NO_DOLLAR by the
     * @tc.desc      ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = 'white';
      TestLog.text('testAbilityStartWindowBackgroundPlain', 'case begin', 'ability.startWindowBackground input plain');
      TestLog.step('testAbilityStartWindowBackgroundPlain', 'ability.startWindowBackground input plain');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundPlain', 'ability.startWindowBackground', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityStartWindowBackgroundPlain', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowBackgroundPlain', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowBackgroundPlain', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundPlain', 'case end', 'ability.startWindowBackground input plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2364
     * @tc.name      testAbilityStartWindowBackgroundEmptyRef
     * @tc.desc      Checks that the emptyref value is reported with RESOURCE_REF_EMPTY_NAME by the
     * @tc.desc      ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundEmptyRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = '$color:';
      TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 
        'case begin', 'ability.startWindowBackground input emptyref');
      TestLog.step('testAbilityStartWindowBackgroundEmptyRef', 'ability.startWindowBackground input emptyref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundEmptyRef', 'ability.startWindowBackground', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAbilityStartWindowBackgroundEmptyRef', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowBackgroundEmptyRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundEmptyRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundEmptyRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundEmptyRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundEmptyRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowBackgroundEmptyRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundEmptyRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundEmptyRef', 
        'case end', 'ability.startWindowBackground input emptyref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2365
     * @tc.name      testAbilityStartWindowBackgroundMediaRef
     * @tc.desc      Checks that the mediaref value is reported with RESOURCE_REF_KIND_MISMATCH by the
     * @tc.desc      ability.startWindowBackground rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityStartWindowBackgroundMediaRef',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.startWindowBackground = '$media:startIcon';
      TestLog.text('testAbilityStartWindowBackgroundMediaRef', 
        'case begin', 'ability.startWindowBackground input mediaref');
      TestLog.step('testAbilityStartWindowBackgroundMediaRef', 'ability.startWindowBackground input mediaref');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityStartWindowBackgroundMediaRef', 'ability.startWindowBackground', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAbilityStartWindowBackgroundMediaRef', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityStartWindowBackgroundMediaRef', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityStartWindowBackgroundMediaRef', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityStartWindowBackgroundMediaRef', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityStartWindowBackgroundMediaRef', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityStartWindowBackgroundMediaRef', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityStartWindowBackgroundMediaRef', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityStartWindowBackgroundMediaRef', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityStartWindowBackgroundMediaRef', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityStartWindowBackgroundMediaRef', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityStartWindowBackgroundMediaRef', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityStartWindowBackgroundMediaRef', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityStartWindowBackgroundMediaRef', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityStartWindowBackgroundMediaRef', 
        'case end', 'ability.startWindowBackground input mediaref');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2380
     * @tc.name      testAbilityLaunchTypeSingleton
     * @tc.desc      Checks that the singleton value is accepted by the ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeSingleton',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'singleton';
      TestLog.text('testAbilityLaunchTypeSingleton', 'case begin', 'ability.launchType input singleton');
      TestLog.step('testAbilityLaunchTypeSingleton', 'ability.launchType input singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeSingleton', 'ability.launchType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityLaunchTypeSingleton', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeSingleton', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeSingleton', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeSingleton', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeSingleton', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeSingleton', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeSingleton', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeSingleton', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeSingleton', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeSingleton', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeSingleton', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeSingleton', 'case end', 'ability.launchType input singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2381
     * @tc.name      testAbilityLaunchTypeMultiton
     * @tc.desc      Checks that the multiton value is accepted by the ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeMultiton',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'multiton';
      TestLog.text('testAbilityLaunchTypeMultiton', 'case begin', 'ability.launchType input multiton');
      TestLog.step('testAbilityLaunchTypeMultiton', 'ability.launchType input multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeMultiton', 'ability.launchType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityLaunchTypeMultiton', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeMultiton', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeMultiton', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeMultiton', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeMultiton', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeMultiton', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeMultiton', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeMultiton', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeMultiton', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeMultiton', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeMultiton', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeMultiton', 'case end', 'ability.launchType input multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2382
     * @tc.name      testAbilityLaunchTypeSpecified
     * @tc.desc      Checks that the specified value is accepted by the ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeSpecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'specified';
      TestLog.text('testAbilityLaunchTypeSpecified', 'case begin', 'ability.launchType input specified');
      TestLog.step('testAbilityLaunchTypeSpecified', 'ability.launchType input specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeSpecified', 'ability.launchType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityLaunchTypeSpecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeSpecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeSpecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeSpecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeSpecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeSpecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeSpecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeSpecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeSpecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeSpecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeSpecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeSpecified', 'case end', 'ability.launchType input specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2383
     * @tc.name      testAbilityLaunchTypeEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_LAUNCH_TYPE_EMPTY by the
     * @tc.desc      ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = '';
      TestLog.text('testAbilityLaunchTypeEmpty', 'case begin', 'ability.launchType input empty');
      TestLog.step('testAbilityLaunchTypeEmpty', 'ability.launchType input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeEmpty', 'ability.launchType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityLaunchTypeEmpty', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLaunchTypeEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLaunchTypeEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeEmpty', 'case end', 'ability.launchType input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2384
     * @tc.name      testAbilityLaunchTypeSpaces
     * @tc.desc      Checks that the spaces value is reported with MODULE_LAUNCH_TYPE_EMPTY by the
     * @tc.desc      ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = '  ';
      TestLog.text('testAbilityLaunchTypeSpaces', 'case begin', 'ability.launchType input spaces');
      TestLog.step('testAbilityLaunchTypeSpaces', 'ability.launchType input spaces');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeSpaces', 'ability.launchType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityLaunchTypeSpaces', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLaunchTypeSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLaunchTypeSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeSpaces', 'case end', 'ability.launchType input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2385
     * @tc.name      testAbilityLaunchTypeSingle
     * @tc.desc      Checks that the single value is reported with MODULE_LAUNCH_TYPE_UNKNOWN by the
     * @tc.desc      ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeSingle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'single';
      TestLog.text('testAbilityLaunchTypeSingle', 'case begin', 'ability.launchType input single');
      TestLog.step('testAbilityLaunchTypeSingle', 'ability.launchType input single');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeSingle', 'ability.launchType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityLaunchTypeSingle', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLaunchTypeSingle', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeSingle', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeSingle', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeSingle', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeSingle', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeSingle', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeSingle', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeSingle', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLaunchTypeSingle', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeSingle', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeSingle', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeSingle', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeSingle', 'case end', 'ability.launchType input single');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2386
     * @tc.name      testAbilityLaunchTypeUpperFirst
     * @tc.desc      Checks that the upperfirst value is reported with MODULE_LAUNCH_TYPE_UNKNOWN by the
     * @tc.desc      ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeUpperFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'Singleton';
      TestLog.text('testAbilityLaunchTypeUpperFirst', 'case begin', 'ability.launchType input upperfirst');
      TestLog.step('testAbilityLaunchTypeUpperFirst', 'ability.launchType input upperfirst');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeUpperFirst', 'ability.launchType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityLaunchTypeUpperFirst', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLaunchTypeUpperFirst', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeUpperFirst', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeUpperFirst', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeUpperFirst', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeUpperFirst', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeUpperFirst', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeUpperFirst', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeUpperFirst', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLaunchTypeUpperFirst', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeUpperFirst', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeUpperFirst', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeUpperFirst', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeUpperFirst', 'case end', 'ability.launchType input upperfirst');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2387
     * @tc.name      testAbilityLaunchTypeStandard
     * @tc.desc      Checks that the standard value is reported with MODULE_LAUNCH_TYPE_UNKNOWN by the
     * @tc.desc      ability.launchType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLaunchTypeStandard',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.launchType = 'standard';
      TestLog.text('testAbilityLaunchTypeStandard', 'case begin', 'ability.launchType input standard');
      TestLog.step('testAbilityLaunchTypeStandard', 'ability.launchType input standard');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityLaunchTypeStandard', 'ability.launchType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityLaunchTypeStandard', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityLaunchTypeStandard', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityLaunchTypeStandard', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityLaunchTypeStandard', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityLaunchTypeStandard', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityLaunchTypeStandard', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityLaunchTypeStandard', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityLaunchTypeStandard', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityLaunchTypeStandard', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityLaunchTypeStandard', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityLaunchTypeStandard', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityLaunchTypeStandard', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityLaunchTypeStandard', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityLaunchTypeStandard', 'case end', 'ability.launchType input standard');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2420
     * @tc.name      testAbilityOrientationUnspecified
     * @tc.desc      Checks that the unspecified value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityOrientationUnspecified', 'case begin', 'ability.orientation input unspecified');
      TestLog.step('testAbilityOrientationUnspecified', 'ability.orientation input unspecified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationUnspecified', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationUnspecified', 'case end', 'ability.orientation input unspecified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2421
     * @tc.name      testAbilityOrientationPortrait
     * @tc.desc      Checks that the portrait value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'portrait';
      TestLog.text('testAbilityOrientationPortrait', 'case begin', 'ability.orientation input portrait');
      TestLog.step('testAbilityOrientationPortrait', 'ability.orientation input portrait');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationPortrait', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationPortrait', 'case end', 'ability.orientation input portrait');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2422
     * @tc.name      testAbilityOrientationLandscape
     * @tc.desc      Checks that the landscape value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'landscape';
      TestLog.text('testAbilityOrientationLandscape', 'case begin', 'ability.orientation input landscape');
      TestLog.step('testAbilityOrientationLandscape', 'ability.orientation input landscape');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationLandscape', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationLandscape', 'case end', 'ability.orientation input landscape');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2423
     * @tc.name      testAbilityOrientationAutoRotation
     * @tc.desc      Checks that the autorotation value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationAutoRotation',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'auto_rotation';
      TestLog.text('testAbilityOrientationAutoRotation', 'case begin', 'ability.orientation input autorotation');
      TestLog.step('testAbilityOrientationAutoRotation', 'ability.orientation input autorotation');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationAutoRotation', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationAutoRotation', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationAutoRotation', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationAutoRotation', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationAutoRotation', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationAutoRotation', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationAutoRotation', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationAutoRotation', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationAutoRotation', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationAutoRotation', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationAutoRotation', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationAutoRotation', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationAutoRotation', 'case end', 'ability.orientation input autorotation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2424
     * @tc.name      testAbilityOrientationAutoRotationRestricted
     * @tc.desc      Checks that the autorotationrestricted value is accepted by the ability.orientation
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationAutoRotationRestricted',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'auto_rotation_restricted';
      TestLog.text('testAbilityOrientationAutoRotationRestricted', 
        'case begin', 'ability.orientation input autorotationrestricted');
      TestLog.step('testAbilityOrientationAutoRotationRestricted', 'ability.orientation input autorotationrestricted');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationAutoRotationRestricted', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationAutoRotationRestricted', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationAutoRotationRestricted', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationAutoRotationRestricted', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationAutoRotationRestricted', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationAutoRotationRestricted', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationAutoRotationRestricted', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationAutoRotationRestricted', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationAutoRotationRestricted', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationAutoRotationRestricted', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationAutoRotationRestricted', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationAutoRotationRestricted', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationAutoRotationRestricted', 
        'case end', 'ability.orientation input autorotationrestricted');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2425
     * @tc.name      testAbilityOrientationAutoRotationLandscape
     * @tc.desc      Checks that the autorotationlandscape value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationAutoRotationLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'auto_rotation_landscape';
      TestLog.text('testAbilityOrientationAutoRotationLandscape', 
        'case begin', 'ability.orientation input autorotationlandscape');
      TestLog.step('testAbilityOrientationAutoRotationLandscape', 'ability.orientation input autorotationlandscape');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationAutoRotationLandscape', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationAutoRotationLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationAutoRotationLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationAutoRotationLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationAutoRotationLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationAutoRotationLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationAutoRotationLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationAutoRotationLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationAutoRotationLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationAutoRotationLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationAutoRotationLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationAutoRotationLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationAutoRotationLandscape', 
        'case end', 'ability.orientation input autorotationlandscape');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2426
     * @tc.name      testAbilityOrientationAutoRotationPortrait
     * @tc.desc      Checks that the autorotationportrait value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationAutoRotationPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'auto_rotation_portrait';
      TestLog.text('testAbilityOrientationAutoRotationPortrait', 
        'case begin', 'ability.orientation input autorotationportrait');
      TestLog.step('testAbilityOrientationAutoRotationPortrait', 'ability.orientation input autorotationportrait');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationAutoRotationPortrait', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationAutoRotationPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationAutoRotationPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationAutoRotationPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationAutoRotationPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationAutoRotationPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationAutoRotationPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationAutoRotationPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationAutoRotationPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationAutoRotationPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationAutoRotationPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationAutoRotationPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationAutoRotationPortrait', 
        'case end', 'ability.orientation input autorotationportrait');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2427
     * @tc.name      testAbilityOrientationPortraitInverted
     * @tc.desc      Checks that the portraitinverted value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationPortraitInverted',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'portrait_inverted';
      TestLog.text('testAbilityOrientationPortraitInverted', 
        'case begin', 'ability.orientation input portraitinverted');
      TestLog.step('testAbilityOrientationPortraitInverted', 'ability.orientation input portraitinverted');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationPortraitInverted', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationPortraitInverted', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationPortraitInverted', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationPortraitInverted', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationPortraitInverted', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationPortraitInverted', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationPortraitInverted', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationPortraitInverted', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationPortraitInverted', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationPortraitInverted', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationPortraitInverted', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationPortraitInverted', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationPortraitInverted', 'case end', 'ability.orientation input portraitinverted');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2428
     * @tc.name      testAbilityOrientationLandscapeInverted
     * @tc.desc      Checks that the landscapeinverted value is accepted by the ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationLandscapeInverted',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'landscape_inverted';
      TestLog.text('testAbilityOrientationLandscapeInverted', 
        'case begin', 'ability.orientation input landscapeinverted');
      TestLog.step('testAbilityOrientationLandscapeInverted', 'ability.orientation input landscapeinverted');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationLandscapeInverted', 'ability.orientation', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityOrientationLandscapeInverted', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationLandscapeInverted', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationLandscapeInverted', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationLandscapeInverted', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationLandscapeInverted', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationLandscapeInverted', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationLandscapeInverted', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationLandscapeInverted', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationLandscapeInverted', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationLandscapeInverted', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationLandscapeInverted', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationLandscapeInverted', 
        'case end', 'ability.orientation input landscapeinverted');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2429
     * @tc.name      testAbilityOrientationEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_ORIENTATION_EMPTY by the
     * @tc.desc      ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = '';
      TestLog.text('testAbilityOrientationEmpty', 'case begin', 'ability.orientation input empty');
      TestLog.step('testAbilityOrientationEmpty', 'ability.orientation input empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationEmpty', 'ability.orientation', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_EMPTY');
      TestLog.flag('testAbilityOrientationEmpty', 'has code MODULE_ORIENTATION_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityOrientationEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityOrientationEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationEmpty', 'case end', 'ability.orientation input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2430
     * @tc.name      testAbilityOrientationUnknown
     * @tc.desc      Checks that the unknown value is reported with MODULE_ORIENTATION_UNKNOWN by the
     * @tc.desc      ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'horizontal';
      TestLog.text('testAbilityOrientationUnknown', 'case begin', 'ability.orientation input unknown');
      TestLog.step('testAbilityOrientationUnknown', 'ability.orientation input unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationUnknown', 'ability.orientation', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityOrientationUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityOrientationUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityOrientationUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationUnknown', 'case end', 'ability.orientation input unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2431
     * @tc.name      testAbilityOrientationUpperFirst
     * @tc.desc      Checks that the upperfirst value is reported with MODULE_ORIENTATION_UNKNOWN by the
     * @tc.desc      ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationUpperFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'Portrait';
      TestLog.text('testAbilityOrientationUpperFirst', 'case begin', 'ability.orientation input upperfirst');
      TestLog.step('testAbilityOrientationUpperFirst', 'ability.orientation input upperfirst');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationUpperFirst', 'ability.orientation', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityOrientationUpperFirst', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityOrientationUpperFirst', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationUpperFirst', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationUpperFirst', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationUpperFirst', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationUpperFirst', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationUpperFirst', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationUpperFirst', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationUpperFirst', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityOrientationUpperFirst', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationUpperFirst', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationUpperFirst', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationUpperFirst', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationUpperFirst', 'case end', 'ability.orientation input upperfirst');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2432
     * @tc.name      testAbilityOrientationSpace
     * @tc.desc      Checks that the space value is reported with MODULE_ORIENTATION_UNKNOWN by the
     * @tc.desc      ability.orientation rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityOrientationSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.orientation = 'auto rotation';
      TestLog.text('testAbilityOrientationSpace', 'case begin', 'ability.orientation input space');
      TestLog.step('testAbilityOrientationSpace', 'ability.orientation input space');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityOrientationSpace', 'ability.orientation', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityOrientationSpace', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityOrientationSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityOrientationSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityOrientationSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityOrientationSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityOrientationSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityOrientationSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityOrientationSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityOrientationSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityOrientationSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityOrientationSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityOrientationSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityOrientationSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityOrientationSpace', 'case end', 'ability.orientation input space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2400
     * @tc.name      testAbilityMainExportedFalse
     * @tc.desc      Checks that the entry main ability must be exported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMainExportedFalse',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.exported = false;
      TestLog.text('testAbilityMainExportedFalse', 'case begin', 'main ability exported check');
      TestLog.step('testAbilityMainExportedFalse', 'main ability exported check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMainExportedFalse', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ABILITY_NOT_EXPORTED');
      TestLog.flag('testAbilityMainExportedFalse', 'has code MODULE_MAIN_ABILITY_NOT_EXPORTED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMainExportedFalse', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMainExportedFalse', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMainExportedFalse', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMainExportedFalse', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMainExportedFalse', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMainExportedFalse', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMainExportedFalse', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMainExportedFalse', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMainExportedFalse', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMainExportedFalse', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMainExportedFalse', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMainExportedFalse', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMainExportedFalse', 'case end', 'main ability exported check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2401
     * @tc.name      testAbilityMainSkillsHomeMissing
     * @tc.desc      Checks that the entry main ability is warned when it declares no skill.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMainSkillsHomeMissing',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.skills = [];
      TestLog.text('testAbilityMainSkillsHomeMissing', 'case begin', 'main ability home skill check');
      TestLog.step('testAbilityMainSkillsHomeMissing', 'main ability home skill check');
      const findings: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.findings('testAbilityMainSkillsHomeMissing', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ABILITY_SKILLS_MISSING');
      TestLog.flag('testAbilityMainSkillsHomeMissing', 'has code MODULE_MAIN_ABILITY_SKILLS_MISSING', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMainSkillsHomeMissing', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMainSkillsHomeMissing', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMainSkillsHomeMissing', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMainSkillsHomeMissing', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMainSkillsHomeMissing', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMainSkillsHomeMissing', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMainSkillsHomeMissing', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMainSkillsHomeMissing', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMainSkillsHomeMissing', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMainSkillsHomeMissing', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateSkills(moduleConfig);
      TestLog.number('testAbilityMainSkillsHomeMissing', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMainSkillsHomeMissing', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMainSkillsHomeMissing', 'case end', 'main ability home skill check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2402
     * @tc.name      testAbilityFeatureExportedFalse
     * @tc.desc      Checks that a non main feature ability may stay unexported without findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityFeatureExportedFalse',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      TestLog.text('testAbilityFeatureExportedFalse', 'case begin', 'feature ability exported check');
      TestLog.step('testAbilityFeatureExportedFalse', 'feature ability exported check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityFeatureExportedFalse', 'ability findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityFeatureExportedFalse', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityFeatureExportedFalse', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityFeatureExportedFalse', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityFeatureExportedFalse', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityFeatureExportedFalse', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityFeatureExportedFalse', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityFeatureExportedFalse', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityFeatureExportedFalse', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityFeatureExportedFalse', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityFeatureExportedFalse', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityFeatureExportedFalse', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityFeatureExportedFalse', 'case end', 'feature ability exported check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2403
     * @tc.name      testAbilityFeatureAbilityValid
     * @tc.desc      Checks that the feature ability passes the ability validator without findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityFeatureAbilityValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      TestLog.text('testAbilityFeatureAbilityValid', 'case begin', 'feature ability validation check');
      TestLog.step('testAbilityFeatureAbilityValid', 'feature ability validation check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityFeatureAbilityValid', 'ability findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityFeatureAbilityValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityFeatureAbilityValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityFeatureAbilityValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityFeatureAbilityValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityFeatureAbilityValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityFeatureAbilityValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityFeatureAbilityValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityFeatureAbilityValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityFeatureAbilityValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityFeatureAbilityValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityFeatureAbilityValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityFeatureAbilityValid', 'case end', 'feature ability validation check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2404
     * @tc.name      testAbilityDuplicateNames
     * @tc.desc      Checks that two abilities with the same name are reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDuplicateNames',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      moduleConfig.abilities.push(ConfigFactory.entryAbility());
      TestLog.text('testAbilityDuplicateNames', 'case begin', 'duplicate ability name check');
      TestLog.step('testAbilityDuplicateNames', 'duplicate ability name check');
      const findings: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.findings('testAbilityDuplicateNames', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_DUPLICATE');
      TestLog.flag('testAbilityDuplicateNames', 'has code MODULE_ABILITY_NAME_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDuplicateNames', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDuplicateNames', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDuplicateNames', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDuplicateNames', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDuplicateNames', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDuplicateNames', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDuplicateNames', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDuplicateNames', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDuplicateNames', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDuplicateNames', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.number('testAbilityDuplicateNames', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDuplicateNames', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDuplicateNames', 'case end', 'duplicate ability name check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2405
     * @tc.name      testAbilityListEmpty
     * @tc.desc      Checks that a module without abilities is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityListEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      moduleConfig.abilities = [];
      TestLog.text('testAbilityListEmpty', 'case begin', 'empty ability list check');
      TestLog.step('testAbilityListEmpty', 'empty ability list check');
      const findings: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.findings('testAbilityListEmpty', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testAbilityListEmpty', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityListEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityListEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityListEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityListEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityListEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityListEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityListEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityListEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityListEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityListEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.number('testAbilityListEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityListEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityListEmpty', 'case end', 'empty ability list check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2406
     * @tc.name      testAbilityListTooMany
     * @tc.desc      Checks that a module with more than one hundred abilities is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityListTooMany',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      moduleConfig.abilities = [];
      for (let index: number = 0; index < 101; index++) {
        const item: AbilityConfig = ConfigFactory.entryAbility();
        item.name = `Ability${index}`;
        item.srcEntry = `./ets/ability/Ability${index}.ets`;
        moduleConfig.abilities.push(item);
      }
      TestLog.text('testAbilityListTooMany', 'case begin', 'ability list size check');
      TestLog.step('testAbilityListTooMany', 'ability list size check');
      const findings: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.findings('testAbilityListTooMany', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_TOO_MANY');
      TestLog.flag('testAbilityListTooMany', 'has code MODULE_ABILITIES_TOO_MANY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityListTooMany', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityListTooMany', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityListTooMany', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityListTooMany', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityListTooMany', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityListTooMany', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityListTooMany', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityListTooMany', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityListTooMany', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityListTooMany', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.number('testAbilityListTooMany', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityListTooMany', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityListTooMany', 'case end', 'ability list size check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2407
     * @tc.name      testAbilityTwoDistinctValid
     * @tc.desc      Checks that two distinct well formed abilities produce no findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityTwoDistinctValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      const second: AbilityConfig = ConfigFactory.entryAbility();
      second.name = 'SecondaryAbility';
      second.srcEntry = './ets/ability/SecondaryAbility.ets';
      second.skills = [];
      moduleConfig.abilities.push(second);
      TestLog.text('testAbilityTwoDistinctValid', 'case begin', 'two ability validation check');
      TestLog.step('testAbilityTwoDistinctValid', 'two ability validation check');
      const findings: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.findings('testAbilityTwoDistinctValid', 'ability findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityTwoDistinctValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityTwoDistinctValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityTwoDistinctValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityTwoDistinctValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityTwoDistinctValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityTwoDistinctValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityTwoDistinctValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityTwoDistinctValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityTwoDistinctValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.number('testAbilityTwoDistinctValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityTwoDistinctValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityTwoDistinctValid', 'case end', 'two ability validation check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2408
     * @tc.name      testAbilitySecondNotPascal
     * @tc.desc      Checks that a second ability with a lower case name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySecondNotPascal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      const second: AbilityConfig = ConfigFactory.entryAbility();
      second.name = 'secondaryAbility';
      second.srcEntry = './ets/ability/secondaryAbility.ets';
      second.skills = [];
      moduleConfig.abilities.push(second);
      TestLog.text('testAbilitySecondNotPascal', 'case begin', 'second ability name check');
      TestLog.step('testAbilitySecondNotPascal', 'second ability name check');
      const findings: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.findings('testAbilitySecondNotPascal', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilitySecondNotPascal', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySecondNotPascal', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySecondNotPascal', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySecondNotPascal', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySecondNotPascal', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySecondNotPascal', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySecondNotPascal', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySecondNotPascal', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySecondNotPascal', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySecondNotPascal', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySecondNotPascal', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbilities(moduleConfig);
      TestLog.number('testAbilitySecondNotPascal', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySecondNotPascal', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySecondNotPascal', 'case end', 'second ability name check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2409
     * @tc.name      testAbilityAllFieldsInvalid
     * @tc.desc      Checks that several invalid ability fields are reported at once.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityAllFieldsInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entry_ability';
      ability.description = '';
      ability.icon = 'icon.png';
      ability.label = 'Entry';
      ability.startWindowIcon = '';
      ability.startWindowBackground = 'white';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityAllFieldsInvalid', 'case begin', 'ability combined field check');
      TestLog.step('testAbilityAllFieldsInvalid', 'ability combined field check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityAllFieldsInvalid', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityAllFieldsInvalid', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityAllFieldsInvalid', 'has code RESOURCE_REF_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAbilityAllFieldsInvalid', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected3);
      expect(hasExpected3).assertTrue();
      const hasExpected4: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityAllFieldsInvalid', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected4);
      expect(hasExpected4).assertTrue();
      const hasExpected5: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityAllFieldsInvalid', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected5);
      expect(hasExpected5).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityAllFieldsInvalid', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityAllFieldsInvalid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityAllFieldsInvalid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityAllFieldsInvalid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityAllFieldsInvalid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityAllFieldsInvalid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityAllFieldsInvalid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityAllFieldsInvalid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityAllFieldsInvalid', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityAllFieldsInvalid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityAllFieldsInvalid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityAllFieldsInvalid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityAllFieldsInvalid', 'case end', 'ability combined field check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2410
     * @tc.name      testAbilityAllFieldsRepaired
     * @tc.desc      Checks that repairing most invalid ability fields leaves only the name finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityAllFieldsRepaired',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entry_ability';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityAllFieldsRepaired', 'case begin', 'ability repair check');
      TestLog.step('testAbilityAllFieldsRepaired', 'ability repair check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityAllFieldsRepaired', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityAllFieldsRepaired', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityAllFieldsRepaired', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityAllFieldsRepaired', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityAllFieldsRepaired', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityAllFieldsRepaired', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityAllFieldsRepaired', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityAllFieldsRepaired', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityAllFieldsRepaired', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityAllFieldsRepaired', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityAllFieldsRepaired', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityAllFieldsRepaired', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityAllFieldsRepaired', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityAllFieldsRepaired', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityAllFieldsRepaired', 'case end', 'ability repair check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2411
     * @tc.name      testAbilityMainAndFeatureBothValid
     * @tc.desc      Checks that the entry and feature abilities validate independently.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMainAndFeatureBothValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entryConfig: ModuleConfig = ConfigFactory.entryModule();
      const featureConfig: ModuleConfig = ConfigFactory.featureModule();
      TestLog.text('testAbilityMainAndFeatureBothValid', 'case begin', 'entry and feature ability check');
      TestLog.step('testAbilityMainAndFeatureBothValid', 'entry and feature ability check');
      const findings: Finding[] = 
        ModuleConfigValidator.validateAbilities(entryConfig).
          concat(ModuleConfigValidator.validateAbilities(featureConfig));
      TestLog.findings('testAbilityMainAndFeatureBothValid', 'ability findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMainAndFeatureBothValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMainAndFeatureBothValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMainAndFeatureBothValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMainAndFeatureBothValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMainAndFeatureBothValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMainAndFeatureBothValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMainAndFeatureBothValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMainAndFeatureBothValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMainAndFeatureBothValid', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateAbilities(entryConfig).
          concat(ModuleConfigValidator.validateAbilities(featureConfig));
      TestLog.number('testAbilityMainAndFeatureBothValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMainAndFeatureBothValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMainAndFeatureBothValid', 'case end', 'entry and feature ability check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2412
     * @tc.name      testAbilityDescriptionOnlyMissing
     * @tc.desc      Checks that a missing description is reported alone.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityDescriptionOnlyMissing',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.description = '';
      TestLog.text('testAbilityDescriptionOnlyMissing', 'case begin', 'ability description check');
      TestLog.step('testAbilityDescriptionOnlyMissing', 'ability description check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityDescriptionOnlyMissing', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAbilityDescriptionOnlyMissing', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityDescriptionOnlyMissing', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityDescriptionOnlyMissing', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityDescriptionOnlyMissing', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityDescriptionOnlyMissing', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityDescriptionOnlyMissing', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityDescriptionOnlyMissing', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityDescriptionOnlyMissing', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityDescriptionOnlyMissing', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityDescriptionOnlyMissing', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityDescriptionOnlyMissing', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityDescriptionOnlyMissing', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityDescriptionOnlyMissing', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityDescriptionOnlyMissing', 'case end', 'ability description check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_2413
     * @tc.name      testAbilitySrcEntryInternalWhitespace
     * @tc.desc      Checks that internal whitespace in an ability source entry is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySrcEntryInternalWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.srcEntry = './ets/entry ability/EntryAbility.ets';
      TestLog.text('testAbilitySrcEntryInternalWhitespace', 'case begin', 'source entry internal whitespace check');
      TestLog.step('testAbilitySrcEntryInternalWhitespace', 'source entry internal whitespace check');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilitySrcEntryInternalWhitespace', 'ability findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_SRC_WHITESPACE');
      TestLog.flag('testAbilitySrcEntryInternalWhitespace', 'has code MODULE_ABILITY_SRC_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilitySrcEntryInternalWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilitySrcEntryInternalWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilitySrcEntryInternalWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilitySrcEntryInternalWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilitySrcEntryInternalWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilitySrcEntryInternalWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilitySrcEntryInternalWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilitySrcEntryInternalWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilitySrcEntryInternalWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilitySrcEntryInternalWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilitySrcEntryInternalWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilitySrcEntryInternalWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilitySrcEntryInternalWhitespace', 'case end', 'source entry internal whitespace check');
    })

  })
}
