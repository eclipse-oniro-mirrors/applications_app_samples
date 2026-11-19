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
export default function AbilityMatrixTest(): void {
  describe('AbilityMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6000
     * @tc.name      testAbilityMatrixEntrySingletonUnspecified
     * @tc.desc      Checks that ability name Entry with launch type Singleton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'case begin', 'ability entry with launch singleton');
      TestLog.step('testAbilityMatrixEntrySingletonUnspecified', 'ability entry with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySingletonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySingletonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySingletonUnspecified', 'case end', 'ability entry with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6001
     * @tc.name      testAbilityMatrixEntrySingletonPortrait
     * @tc.desc      Checks that ability name Entry with launch type Singleton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'case begin', 'ability entry with launch singleton');
      TestLog.step('testAbilityMatrixEntrySingletonPortrait', 'ability entry with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySingletonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySingletonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySingletonPortrait', 'case end', 'ability entry with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6002
     * @tc.name      testAbilityMatrixEntrySingletonLandscape
     * @tc.desc      Checks that ability name Entry with launch type Singleton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'case begin', 'ability entry with launch singleton');
      TestLog.step('testAbilityMatrixEntrySingletonLandscape', 'ability entry with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySingletonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySingletonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySingletonLandscape', 'case end', 'ability entry with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6003
     * @tc.name      testAbilityMatrixEntrySingletonUnknown
     * @tc.desc      Checks that ability name Entry with launch type Singleton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'case begin', 'ability entry with launch singleton');
      TestLog.step('testAbilityMatrixEntrySingletonUnknown', 'ability entry with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntrySingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntrySingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntrySingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySingletonUnknown', 'case end', 'ability entry with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6004
     * @tc.name      testAbilityMatrixEntryMultitonUnspecified
     * @tc.desc      Checks that ability name Entry with launch type Multiton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'case begin', 'ability entry with launch multiton');
      TestLog.step('testAbilityMatrixEntryMultitonUnspecified', 'ability entry with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntryMultitonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryMultitonUnspecified', 'case end', 'ability entry with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6005
     * @tc.name      testAbilityMatrixEntryMultitonPortrait
     * @tc.desc      Checks that ability name Entry with launch type Multiton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'case begin', 'ability entry with launch multiton');
      TestLog.step('testAbilityMatrixEntryMultitonPortrait', 'ability entry with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryMultitonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntryMultitonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryMultitonPortrait', 'case end', 'ability entry with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6006
     * @tc.name      testAbilityMatrixEntryMultitonLandscape
     * @tc.desc      Checks that ability name Entry with launch type Multiton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'case begin', 'ability entry with launch multiton');
      TestLog.step('testAbilityMatrixEntryMultitonLandscape', 'ability entry with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryMultitonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntryMultitonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryMultitonLandscape', 'case end', 'ability entry with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6007
     * @tc.name      testAbilityMatrixEntryMultitonUnknown
     * @tc.desc      Checks that ability name Entry with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'case begin', 'ability entry with launch multiton');
      TestLog.step('testAbilityMatrixEntryMultitonUnknown', 'ability entry with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryMultitonUnknown', 'case end', 'ability entry with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6008
     * @tc.name      testAbilityMatrixEntrySpecifiedUnspecified
     * @tc.desc      Checks that ability name Entry with launch type Specified and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'case begin', 'ability entry with launch specified');
      TestLog.step('testAbilityMatrixEntrySpecifiedUnspecified', 'ability entry with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySpecifiedUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnspecified', 'case end', 'ability entry with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6009
     * @tc.name      testAbilityMatrixEntrySpecifiedPortrait
     * @tc.desc      Checks that ability name Entry with launch type Specified and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'case begin', 'ability entry with launch specified');
      TestLog.step('testAbilityMatrixEntrySpecifiedPortrait', 'ability entry with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySpecifiedPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySpecifiedPortrait', 'case end', 'ability entry with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6010
     * @tc.name      testAbilityMatrixEntrySpecifiedLandscape
     * @tc.desc      Checks that ability name Entry with launch type Specified and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'case begin', 'ability entry with launch specified');
      TestLog.step('testAbilityMatrixEntrySpecifiedLandscape', 'ability entry with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixEntrySpecifiedLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySpecifiedLandscape', 'case end', 'ability entry with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6011
     * @tc.name      testAbilityMatrixEntrySpecifiedUnknown
     * @tc.desc      Checks that ability name Entry with launch type Specified and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntrySpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'case begin', 'ability entry with launch specified');
      TestLog.step('testAbilityMatrixEntrySpecifiedUnknown', 'ability entry with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntrySpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntrySpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntrySpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntrySpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntrySpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntrySpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntrySpecifiedUnknown', 'case end', 'ability entry with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6012
     * @tc.name      testAbilityMatrixEntryUnknownUnspecified
     * @tc.desc      Checks that ability name Entry with launch type Unknown and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'case begin', 'ability entry with launch unknown');
      TestLog.step('testAbilityMatrixEntryUnknownUnspecified', 'ability entry with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryUnknownUnspecified', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryUnknownUnspecified', 'case end', 'ability entry with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6013
     * @tc.name      testAbilityMatrixEntryUnknownPortrait
     * @tc.desc      Checks that ability name Entry with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'case begin', 'ability entry with launch unknown');
      TestLog.step('testAbilityMatrixEntryUnknownPortrait', 'ability entry with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryUnknownPortrait', 'case end', 'ability entry with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6014
     * @tc.name      testAbilityMatrixEntryUnknownLandscape
     * @tc.desc      Checks that ability name Entry with launch type Unknown and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'case begin', 'ability entry with launch unknown');
      TestLog.step('testAbilityMatrixEntryUnknownLandscape', 'ability entry with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryUnknownLandscape', 'case end', 'ability entry with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6015
     * @tc.name      testAbilityMatrixEntryUnknownUnknown
     * @tc.desc      Checks that ability name Entry with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'case begin', 'ability entry with launch unknown');
      TestLog.step('testAbilityMatrixEntryUnknownUnknown', 'ability entry with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryUnknownUnknown', 'case end', 'ability entry with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6016
     * @tc.name      testAbilityMatrixEntryEmptyUnspecified
     * @tc.desc      Checks that ability name Entry with launch type Empty and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'case begin', 'ability entry with launch empty');
      TestLog.step('testAbilityMatrixEntryEmptyUnspecified', 'ability entry with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEntryEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryEmptyUnspecified', 'case end', 'ability entry with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6017
     * @tc.name      testAbilityMatrixEntryEmptyPortrait
     * @tc.desc      Checks that ability name Entry with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'case begin', 'ability entry with launch empty');
      TestLog.step('testAbilityMatrixEntryEmptyPortrait', 'ability entry with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEntryEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryEmptyPortrait', 'case end', 'ability entry with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6018
     * @tc.name      testAbilityMatrixEntryEmptyLandscape
     * @tc.desc      Checks that ability name Entry with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'case begin', 'ability entry with launch empty');
      TestLog.step('testAbilityMatrixEntryEmptyLandscape', 'ability entry with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEntryEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryEmptyLandscape', 'case end', 'ability entry with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6019
     * @tc.name      testAbilityMatrixEntryEmptyUnknown
     * @tc.desc      Checks that ability name Entry with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEntryEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'EntryAbility';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'case begin', 'ability entry with launch empty');
      TestLog.step('testAbilityMatrixEntryEmptyUnknown', 'ability entry with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEntryEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEntryEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEntryEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEntryEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEntryEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEntryEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEntryEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEntryEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEntryEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEntryEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEntryEmptyUnknown', 'case end', 'ability entry with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6020
     * @tc.name      testAbilityMatrixFeatureSingletonUnspecified
     * @tc.desc      Checks that ability name Feature with launch type Singleton and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 
        'case begin', 'ability feature with launch singleton');
      TestLog.step('testAbilityMatrixFeatureSingletonUnspecified', 'ability feature with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSingletonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSingletonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSingletonUnspecified', 'case end', 'ability feature with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6021
     * @tc.name      testAbilityMatrixFeatureSingletonPortrait
     * @tc.desc      Checks that ability name Feature with launch type Singleton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'case begin', 'ability feature with launch singleton');
      TestLog.step('testAbilityMatrixFeatureSingletonPortrait', 'ability feature with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSingletonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSingletonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSingletonPortrait', 'case end', 'ability feature with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6022
     * @tc.name      testAbilityMatrixFeatureSingletonLandscape
     * @tc.desc      Checks that ability name Feature with launch type Singleton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'case begin', 'ability feature with launch singleton');
      TestLog.step('testAbilityMatrixFeatureSingletonLandscape', 'ability feature with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSingletonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSingletonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSingletonLandscape', 'case end', 'ability feature with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6023
     * @tc.name      testAbilityMatrixFeatureSingletonUnknown
     * @tc.desc      Checks that ability name Feature with launch type Singleton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'case begin', 'ability feature with launch singleton');
      TestLog.step('testAbilityMatrixFeatureSingletonUnknown', 'ability feature with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureSingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureSingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureSingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSingletonUnknown', 'case end', 'ability feature with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6024
     * @tc.name      testAbilityMatrixFeatureMultitonUnspecified
     * @tc.desc      Checks that ability name Feature with launch type Multiton and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'case begin', 'ability feature with launch multiton');
      TestLog.step('testAbilityMatrixFeatureMultitonUnspecified', 'ability feature with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureMultitonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureMultitonUnspecified', 'case end', 'ability feature with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6025
     * @tc.name      testAbilityMatrixFeatureMultitonPortrait
     * @tc.desc      Checks that ability name Feature with launch type Multiton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'case begin', 'ability feature with launch multiton');
      TestLog.step('testAbilityMatrixFeatureMultitonPortrait', 'ability feature with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureMultitonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureMultitonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureMultitonPortrait', 'case end', 'ability feature with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6026
     * @tc.name      testAbilityMatrixFeatureMultitonLandscape
     * @tc.desc      Checks that ability name Feature with launch type Multiton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'case begin', 'ability feature with launch multiton');
      TestLog.step('testAbilityMatrixFeatureMultitonLandscape', 'ability feature with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureMultitonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureMultitonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureMultitonLandscape', 'case end', 'ability feature with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6027
     * @tc.name      testAbilityMatrixFeatureMultitonUnknown
     * @tc.desc      Checks that ability name Feature with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'case begin', 'ability feature with launch multiton');
      TestLog.step('testAbilityMatrixFeatureMultitonUnknown', 'ability feature with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureMultitonUnknown', 'case end', 'ability feature with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6028
     * @tc.name      testAbilityMatrixFeatureSpecifiedUnspecified
     * @tc.desc      Checks that ability name Feature with launch type Specified and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 
        'case begin', 'ability feature with launch specified');
      TestLog.step('testAbilityMatrixFeatureSpecifiedUnspecified', 'ability feature with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnspecified', 'case end', 'ability feature with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6029
     * @tc.name      testAbilityMatrixFeatureSpecifiedPortrait
     * @tc.desc      Checks that ability name Feature with launch type Specified and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'case begin', 'ability feature with launch specified');
      TestLog.step('testAbilityMatrixFeatureSpecifiedPortrait', 'ability feature with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSpecifiedPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSpecifiedPortrait', 'case end', 'ability feature with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6030
     * @tc.name      testAbilityMatrixFeatureSpecifiedLandscape
     * @tc.desc      Checks that ability name Feature with launch type Specified and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'case begin', 'ability feature with launch specified');
      TestLog.step('testAbilityMatrixFeatureSpecifiedLandscape', 'ability feature with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixFeatureSpecifiedLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSpecifiedLandscape', 'case end', 'ability feature with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6031
     * @tc.name      testAbilityMatrixFeatureSpecifiedUnknown
     * @tc.desc      Checks that ability name Feature with launch type Specified and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureSpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'case begin', 'ability feature with launch specified');
      TestLog.step('testAbilityMatrixFeatureSpecifiedUnknown', 'ability feature with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureSpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureSpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureSpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureSpecifiedUnknown', 'case end', 'ability feature with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6032
     * @tc.name      testAbilityMatrixFeatureUnknownUnspecified
     * @tc.desc      Checks that ability name Feature with launch type Unknown and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'case begin', 'ability feature with launch unknown');
      TestLog.step('testAbilityMatrixFeatureUnknownUnspecified', 'ability feature with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureUnknownUnspecified', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureUnknownUnspecified', 'case end', 'ability feature with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6033
     * @tc.name      testAbilityMatrixFeatureUnknownPortrait
     * @tc.desc      Checks that ability name Feature with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'case begin', 'ability feature with launch unknown');
      TestLog.step('testAbilityMatrixFeatureUnknownPortrait', 'ability feature with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureUnknownPortrait', 'case end', 'ability feature with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6034
     * @tc.name      testAbilityMatrixFeatureUnknownLandscape
     * @tc.desc      Checks that ability name Feature with launch type Unknown and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'case begin', 'ability feature with launch unknown');
      TestLog.step('testAbilityMatrixFeatureUnknownLandscape', 'ability feature with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureUnknownLandscape', 'case end', 'ability feature with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6035
     * @tc.name      testAbilityMatrixFeatureUnknownUnknown
     * @tc.desc      Checks that ability name Feature with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'case begin', 'ability feature with launch unknown');
      TestLog.step('testAbilityMatrixFeatureUnknownUnknown', 'ability feature with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureUnknownUnknown', 'case end', 'ability feature with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6036
     * @tc.name      testAbilityMatrixFeatureEmptyUnspecified
     * @tc.desc      Checks that ability name Feature with launch type Empty and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'case begin', 'ability feature with launch empty');
      TestLog.step('testAbilityMatrixFeatureEmptyUnspecified', 'ability feature with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixFeatureEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureEmptyUnspecified', 'case end', 'ability feature with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6037
     * @tc.name      testAbilityMatrixFeatureEmptyPortrait
     * @tc.desc      Checks that ability name Feature with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'case begin', 'ability feature with launch empty');
      TestLog.step('testAbilityMatrixFeatureEmptyPortrait', 'ability feature with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixFeatureEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureEmptyPortrait', 'case end', 'ability feature with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6038
     * @tc.name      testAbilityMatrixFeatureEmptyLandscape
     * @tc.desc      Checks that ability name Feature with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'case begin', 'ability feature with launch empty');
      TestLog.step('testAbilityMatrixFeatureEmptyLandscape', 'ability feature with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixFeatureEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureEmptyLandscape', 'case end', 'ability feature with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6039
     * @tc.name      testAbilityMatrixFeatureEmptyUnknown
     * @tc.desc      Checks that ability name Feature with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixFeatureEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'FeatureAbility';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'case begin', 'ability feature with launch empty');
      TestLog.step('testAbilityMatrixFeatureEmptyUnknown', 'ability feature with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixFeatureEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixFeatureEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixFeatureEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixFeatureEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixFeatureEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixFeatureEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixFeatureEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixFeatureEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixFeatureEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixFeatureEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixFeatureEmptyUnknown', 'case end', 'ability feature with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6040
     * @tc.name      testAbilityMatrixShortSingletonUnspecified
     * @tc.desc      Checks that ability name Short with launch type Singleton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'case begin', 'ability short with launch singleton');
      TestLog.step('testAbilityMatrixShortSingletonUnspecified', 'ability short with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSingletonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSingletonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSingletonUnspecified', 'case end', 'ability short with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6041
     * @tc.name      testAbilityMatrixShortSingletonPortrait
     * @tc.desc      Checks that ability name Short with launch type Singleton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixShortSingletonPortrait', 'case begin', 'ability short with launch singleton');
      TestLog.step('testAbilityMatrixShortSingletonPortrait', 'ability short with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSingletonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSingletonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSingletonPortrait', 'case end', 'ability short with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6042
     * @tc.name      testAbilityMatrixShortSingletonLandscape
     * @tc.desc      Checks that ability name Short with launch type Singleton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixShortSingletonLandscape', 'case begin', 'ability short with launch singleton');
      TestLog.step('testAbilityMatrixShortSingletonLandscape', 'ability short with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSingletonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSingletonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSingletonLandscape', 'case end', 'ability short with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6043
     * @tc.name      testAbilityMatrixShortSingletonUnknown
     * @tc.desc      Checks that ability name Short with launch type Singleton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixShortSingletonUnknown', 'case begin', 'ability short with launch singleton');
      TestLog.step('testAbilityMatrixShortSingletonUnknown', 'ability short with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortSingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortSingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortSingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSingletonUnknown', 'case end', 'ability short with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6044
     * @tc.name      testAbilityMatrixShortMultitonUnspecified
     * @tc.desc      Checks that ability name Short with launch type Multiton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'case begin', 'ability short with launch multiton');
      TestLog.step('testAbilityMatrixShortMultitonUnspecified', 'ability short with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortMultitonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortMultitonUnspecified', 'case end', 'ability short with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6045
     * @tc.name      testAbilityMatrixShortMultitonPortrait
     * @tc.desc      Checks that ability name Short with launch type Multiton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixShortMultitonPortrait', 'case begin', 'ability short with launch multiton');
      TestLog.step('testAbilityMatrixShortMultitonPortrait', 'ability short with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortMultitonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortMultitonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortMultitonPortrait', 'case end', 'ability short with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6046
     * @tc.name      testAbilityMatrixShortMultitonLandscape
     * @tc.desc      Checks that ability name Short with launch type Multiton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixShortMultitonLandscape', 'case begin', 'ability short with launch multiton');
      TestLog.step('testAbilityMatrixShortMultitonLandscape', 'ability short with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortMultitonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortMultitonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortMultitonLandscape', 'case end', 'ability short with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6047
     * @tc.name      testAbilityMatrixShortMultitonUnknown
     * @tc.desc      Checks that ability name Short with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixShortMultitonUnknown', 'case begin', 'ability short with launch multiton');
      TestLog.step('testAbilityMatrixShortMultitonUnknown', 'ability short with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortMultitonUnknown', 'case end', 'ability short with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6048
     * @tc.name      testAbilityMatrixShortSpecifiedUnspecified
     * @tc.desc      Checks that ability name Short with launch type Specified and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'case begin', 'ability short with launch specified');
      TestLog.step('testAbilityMatrixShortSpecifiedUnspecified', 'ability short with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSpecifiedUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSpecifiedUnspecified', 'case end', 'ability short with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6049
     * @tc.name      testAbilityMatrixShortSpecifiedPortrait
     * @tc.desc      Checks that ability name Short with launch type Specified and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'case begin', 'ability short with launch specified');
      TestLog.step('testAbilityMatrixShortSpecifiedPortrait', 'ability short with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSpecifiedPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSpecifiedPortrait', 'case end', 'ability short with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6050
     * @tc.name      testAbilityMatrixShortSpecifiedLandscape
     * @tc.desc      Checks that ability name Short with launch type Specified and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'case begin', 'ability short with launch specified');
      TestLog.step('testAbilityMatrixShortSpecifiedLandscape', 'ability short with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixShortSpecifiedLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSpecifiedLandscape', 'case end', 'ability short with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6051
     * @tc.name      testAbilityMatrixShortSpecifiedUnknown
     * @tc.desc      Checks that ability name Short with launch type Specified and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortSpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'case begin', 'ability short with launch specified');
      TestLog.step('testAbilityMatrixShortSpecifiedUnknown', 'ability short with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortSpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortSpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortSpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortSpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortSpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortSpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortSpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortSpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortSpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortSpecifiedUnknown', 'case end', 'ability short with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6052
     * @tc.name      testAbilityMatrixShortUnknownUnspecified
     * @tc.desc      Checks that ability name Short with launch type Unknown and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'case begin', 'ability short with launch unknown');
      TestLog.step('testAbilityMatrixShortUnknownUnspecified', 'ability short with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortUnknownUnspecified', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortUnknownUnspecified', 'case end', 'ability short with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6053
     * @tc.name      testAbilityMatrixShortUnknownPortrait
     * @tc.desc      Checks that ability name Short with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixShortUnknownPortrait', 'case begin', 'ability short with launch unknown');
      TestLog.step('testAbilityMatrixShortUnknownPortrait', 'ability short with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortUnknownPortrait', 'case end', 'ability short with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6054
     * @tc.name      testAbilityMatrixShortUnknownLandscape
     * @tc.desc      Checks that ability name Short with launch type Unknown and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixShortUnknownLandscape', 'case begin', 'ability short with launch unknown');
      TestLog.step('testAbilityMatrixShortUnknownLandscape', 'ability short with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortUnknownLandscape', 'case end', 'ability short with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6055
     * @tc.name      testAbilityMatrixShortUnknownUnknown
     * @tc.desc      Checks that ability name Short with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixShortUnknownUnknown', 'case begin', 'ability short with launch unknown');
      TestLog.step('testAbilityMatrixShortUnknownUnknown', 'ability short with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortUnknownUnknown', 'case end', 'ability short with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6056
     * @tc.name      testAbilityMatrixShortEmptyUnspecified
     * @tc.desc      Checks that ability name Short with launch type Empty and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'case begin', 'ability short with launch empty');
      TestLog.step('testAbilityMatrixShortEmptyUnspecified', 'ability short with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixShortEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortEmptyUnspecified', 'case end', 'ability short with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6057
     * @tc.name      testAbilityMatrixShortEmptyPortrait
     * @tc.desc      Checks that ability name Short with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixShortEmptyPortrait', 'case begin', 'ability short with launch empty');
      TestLog.step('testAbilityMatrixShortEmptyPortrait', 'ability short with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixShortEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortEmptyPortrait', 'case end', 'ability short with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6058
     * @tc.name      testAbilityMatrixShortEmptyLandscape
     * @tc.desc      Checks that ability name Short with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixShortEmptyLandscape', 'case begin', 'ability short with launch empty');
      TestLog.step('testAbilityMatrixShortEmptyLandscape', 'ability short with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixShortEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortEmptyLandscape', 'case end', 'ability short with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6059
     * @tc.name      testAbilityMatrixShortEmptyUnknown
     * @tc.desc      Checks that ability name Short with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixShortEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'A';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixShortEmptyUnknown', 'case begin', 'ability short with launch empty');
      TestLog.step('testAbilityMatrixShortEmptyUnknown', 'ability short with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixShortEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixShortEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixShortEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixShortEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixShortEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixShortEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixShortEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixShortEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixShortEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixShortEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixShortEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixShortEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixShortEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixShortEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixShortEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixShortEmptyUnknown', 'case end', 'ability short with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6060
     * @tc.name      testAbilityMatrixDigitSuffixSingletonUnspecified
     * @tc.desc      Checks that ability name DigitSuffix with launch type Singleton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 
        'case begin', 'ability digitsuffix with launch singleton');
      TestLog.step('testAbilityMatrixDigitSuffixSingletonUnspecified', 'ability digitsuffix with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSingletonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnspecified', 
        'case end', 'ability digitsuffix with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6061
     * @tc.name      testAbilityMatrixDigitSuffixSingletonPortrait
     * @tc.desc      Checks that ability name DigitSuffix with launch type Singleton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 
        'case begin', 'ability digitsuffix with launch singleton');
      TestLog.step('testAbilityMatrixDigitSuffixSingletonPortrait', 'ability digitsuffix with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSingletonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSingletonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonPortrait', 
        'case end', 'ability digitsuffix with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6062
     * @tc.name      testAbilityMatrixDigitSuffixSingletonLandscape
     * @tc.desc      Checks that ability name DigitSuffix with launch type Singleton and orientation
     * @tc.desc      Landscape is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 
        'case begin', 'ability digitsuffix with launch singleton');
      TestLog.step('testAbilityMatrixDigitSuffixSingletonLandscape', 'ability digitsuffix with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSingletonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSingletonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonLandscape', 
        'case end', 'ability digitsuffix with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6063
     * @tc.name      testAbilityMatrixDigitSuffixSingletonUnknown
     * @tc.desc      Checks that ability name DigitSuffix with launch type Singleton and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 
        'case begin', 'ability digitsuffix with launch singleton');
      TestLog.step('testAbilityMatrixDigitSuffixSingletonUnknown', 'ability digitsuffix with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSingletonUnknown', 
        'case end', 'ability digitsuffix with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6064
     * @tc.name      testAbilityMatrixDigitSuffixMultitonUnspecified
     * @tc.desc      Checks that ability name DigitSuffix with launch type Multiton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 
        'case begin', 'ability digitsuffix with launch multiton');
      TestLog.step('testAbilityMatrixDigitSuffixMultitonUnspecified', 'ability digitsuffix with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnspecified', 
        'case end', 'ability digitsuffix with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6065
     * @tc.name      testAbilityMatrixDigitSuffixMultitonPortrait
     * @tc.desc      Checks that ability name DigitSuffix with launch type Multiton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 
        'case begin', 'ability digitsuffix with launch multiton');
      TestLog.step('testAbilityMatrixDigitSuffixMultitonPortrait', 'ability digitsuffix with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixMultitonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixMultitonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonPortrait', 
        'case end', 'ability digitsuffix with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6066
     * @tc.name      testAbilityMatrixDigitSuffixMultitonLandscape
     * @tc.desc      Checks that ability name DigitSuffix with launch type Multiton and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 
        'case begin', 'ability digitsuffix with launch multiton');
      TestLog.step('testAbilityMatrixDigitSuffixMultitonLandscape', 'ability digitsuffix with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixMultitonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixMultitonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonLandscape', 
        'case end', 'ability digitsuffix with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6067
     * @tc.name      testAbilityMatrixDigitSuffixMultitonUnknown
     * @tc.desc      Checks that ability name DigitSuffix with launch type Multiton and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 
        'case begin', 'ability digitsuffix with launch multiton');
      TestLog.step('testAbilityMatrixDigitSuffixMultitonUnknown', 'ability digitsuffix with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixMultitonUnknown', 
        'case end', 'ability digitsuffix with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6068
     * @tc.name      testAbilityMatrixDigitSuffixSpecifiedUnspecified
     * @tc.desc      Checks that ability name DigitSuffix with launch type Specified and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 
        'case begin', 'ability digitsuffix with launch specified');
      TestLog.step('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'ability digitsuffix with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnspecified', 
        'case end', 'ability digitsuffix with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6069
     * @tc.name      testAbilityMatrixDigitSuffixSpecifiedPortrait
     * @tc.desc      Checks that ability name DigitSuffix with launch type Specified and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 
        'case begin', 'ability digitsuffix with launch specified');
      TestLog.step('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'ability digitsuffix with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedPortrait', 
        'case end', 'ability digitsuffix with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6070
     * @tc.name      testAbilityMatrixDigitSuffixSpecifiedLandscape
     * @tc.desc      Checks that ability name DigitSuffix with launch type Specified and orientation
     * @tc.desc      Landscape is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 
        'case begin', 'ability digitsuffix with launch specified');
      TestLog.step('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'ability digitsuffix with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedLandscape', 
        'case end', 'ability digitsuffix with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6071
     * @tc.name      testAbilityMatrixDigitSuffixSpecifiedUnknown
     * @tc.desc      Checks that ability name DigitSuffix with launch type Specified and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixSpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 
        'case begin', 'ability digitsuffix with launch specified');
      TestLog.step('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'ability digitsuffix with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixSpecifiedUnknown', 
        'case end', 'ability digitsuffix with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6072
     * @tc.name      testAbilityMatrixDigitSuffixUnknownUnspecified
     * @tc.desc      Checks that ability name DigitSuffix with launch type Unknown and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 
        'case begin', 'ability digitsuffix with launch unknown');
      TestLog.step('testAbilityMatrixDigitSuffixUnknownUnspecified', 'ability digitsuffix with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnspecified',
        'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnspecified', 
        'case end', 'ability digitsuffix with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6073
     * @tc.name      testAbilityMatrixDigitSuffixUnknownPortrait
     * @tc.desc      Checks that ability name DigitSuffix with launch type Unknown and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 
        'case begin', 'ability digitsuffix with launch unknown');
      TestLog.step('testAbilityMatrixDigitSuffixUnknownPortrait', 'ability digitsuffix with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownPortrait', 
        'case end', 'ability digitsuffix with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6074
     * @tc.name      testAbilityMatrixDigitSuffixUnknownLandscape
     * @tc.desc      Checks that ability name DigitSuffix with launch type Unknown and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 
        'case begin', 'ability digitsuffix with launch unknown');
      TestLog.step('testAbilityMatrixDigitSuffixUnknownLandscape', 'ability digitsuffix with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownLandscape', 
        'case end', 'ability digitsuffix with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6075
     * @tc.name      testAbilityMatrixDigitSuffixUnknownUnknown
     * @tc.desc      Checks that ability name DigitSuffix with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 
        'case begin', 'ability digitsuffix with launch unknown');
      TestLog.step('testAbilityMatrixDigitSuffixUnknownUnknown', 'ability digitsuffix with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixUnknownUnknown', 'case end', 'ability digitsuffix with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6076
     * @tc.name      testAbilityMatrixDigitSuffixEmptyUnspecified
     * @tc.desc      Checks that ability name DigitSuffix with launch type Empty and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 
        'case begin', 'ability digitsuffix with launch empty');
      TestLog.step('testAbilityMatrixDigitSuffixEmptyUnspecified', 'ability digitsuffix with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnspecified', 'case end', 'ability digitsuffix with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6077
     * @tc.name      testAbilityMatrixDigitSuffixEmptyPortrait
     * @tc.desc      Checks that ability name DigitSuffix with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'case begin', 'ability digitsuffix with launch empty');
      TestLog.step('testAbilityMatrixDigitSuffixEmptyPortrait', 'ability digitsuffix with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyPortrait', 'case end', 'ability digitsuffix with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6078
     * @tc.name      testAbilityMatrixDigitSuffixEmptyLandscape
     * @tc.desc      Checks that ability name DigitSuffix with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'case begin', 'ability digitsuffix with launch empty');
      TestLog.step('testAbilityMatrixDigitSuffixEmptyLandscape', 'ability digitsuffix with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyLandscape', 'case end', 'ability digitsuffix with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6079
     * @tc.name      testAbilityMatrixDigitSuffixEmptyUnknown
     * @tc.desc      Checks that ability name DigitSuffix with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixDigitSuffixEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Ability2';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'case begin', 'ability digitsuffix with launch empty');
      TestLog.step('testAbilityMatrixDigitSuffixEmptyUnknown', 'ability digitsuffix with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixDigitSuffixEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixDigitSuffixEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixDigitSuffixEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixDigitSuffixEmptyUnknown', 'case end', 'ability digitsuffix with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6080
     * @tc.name      testAbilityMatrixMySingletonUnspecified
     * @tc.desc      Checks that ability name My with launch type Singleton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixMySingletonUnspecified', 'case begin', 'ability my with launch singleton');
      TestLog.step('testAbilityMatrixMySingletonUnspecified', 'ability my with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySingletonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySingletonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySingletonUnspecified', 'case end', 'ability my with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6081
     * @tc.name      testAbilityMatrixMySingletonPortrait
     * @tc.desc      Checks that ability name My with launch type Singleton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixMySingletonPortrait', 'case begin', 'ability my with launch singleton');
      TestLog.step('testAbilityMatrixMySingletonPortrait', 'ability my with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySingletonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySingletonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySingletonPortrait', 'case end', 'ability my with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6082
     * @tc.name      testAbilityMatrixMySingletonLandscape
     * @tc.desc      Checks that ability name My with launch type Singleton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixMySingletonLandscape', 'case begin', 'ability my with launch singleton');
      TestLog.step('testAbilityMatrixMySingletonLandscape', 'ability my with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySingletonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySingletonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySingletonLandscape', 'case end', 'ability my with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6083
     * @tc.name      testAbilityMatrixMySingletonUnknown
     * @tc.desc      Checks that ability name My with launch type Singleton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixMySingletonUnknown', 'case begin', 'ability my with launch singleton');
      TestLog.step('testAbilityMatrixMySingletonUnknown', 'ability my with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixMySingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMySingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMySingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySingletonUnknown', 'case end', 'ability my with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6084
     * @tc.name      testAbilityMatrixMyMultitonUnspecified
     * @tc.desc      Checks that ability name My with launch type Multiton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'case begin', 'ability my with launch multiton');
      TestLog.step('testAbilityMatrixMyMultitonUnspecified', 'ability my with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMyMultitonUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyMultitonUnspecified', 'case end', 'ability my with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6085
     * @tc.name      testAbilityMatrixMyMultitonPortrait
     * @tc.desc      Checks that ability name My with launch type Multiton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixMyMultitonPortrait', 'case begin', 'ability my with launch multiton');
      TestLog.step('testAbilityMatrixMyMultitonPortrait', 'ability my with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyMultitonPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMyMultitonPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyMultitonPortrait', 'case end', 'ability my with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6086
     * @tc.name      testAbilityMatrixMyMultitonLandscape
     * @tc.desc      Checks that ability name My with launch type Multiton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixMyMultitonLandscape', 'case begin', 'ability my with launch multiton');
      TestLog.step('testAbilityMatrixMyMultitonLandscape', 'ability my with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyMultitonLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMyMultitonLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyMultitonLandscape', 'case end', 'ability my with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6087
     * @tc.name      testAbilityMatrixMyMultitonUnknown
     * @tc.desc      Checks that ability name My with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixMyMultitonUnknown', 'case begin', 'ability my with launch multiton');
      TestLog.step('testAbilityMatrixMyMultitonUnknown', 'ability my with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyMultitonUnknown', 'case end', 'ability my with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6088
     * @tc.name      testAbilityMatrixMySpecifiedUnspecified
     * @tc.desc      Checks that ability name My with launch type Specified and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'case begin', 'ability my with launch specified');
      TestLog.step('testAbilityMatrixMySpecifiedUnspecified', 'ability my with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySpecifiedUnspecified', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySpecifiedUnspecified', 'case end', 'ability my with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6089
     * @tc.name      testAbilityMatrixMySpecifiedPortrait
     * @tc.desc      Checks that ability name My with launch type Specified and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'case begin', 'ability my with launch specified');
      TestLog.step('testAbilityMatrixMySpecifiedPortrait', 'ability my with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySpecifiedPortrait', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySpecifiedPortrait', 'case end', 'ability my with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6090
     * @tc.name      testAbilityMatrixMySpecifiedLandscape
     * @tc.desc      Checks that ability name My with launch type Specified and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'case begin', 'ability my with launch specified');
      TestLog.step('testAbilityMatrixMySpecifiedLandscape', 'ability my with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAbilityMatrixMySpecifiedLandscape', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySpecifiedLandscape', 'case end', 'ability my with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6091
     * @tc.name      testAbilityMatrixMySpecifiedUnknown
     * @tc.desc      Checks that ability name My with launch type Specified and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMySpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'case begin', 'ability my with launch specified');
      TestLog.step('testAbilityMatrixMySpecifiedUnknown', 'ability my with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMySpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixMySpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMySpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMySpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMySpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMySpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMySpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMySpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMySpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMySpecifiedUnknown', 'case end', 'ability my with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6092
     * @tc.name      testAbilityMatrixMyUnknownUnspecified
     * @tc.desc      Checks that ability name My with launch type Unknown and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'case begin', 'ability my with launch unknown');
      TestLog.step('testAbilityMatrixMyUnknownUnspecified', 'ability my with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyUnknownUnspecified', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyUnknownUnspecified', 'case end', 'ability my with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6093
     * @tc.name      testAbilityMatrixMyUnknownPortrait
     * @tc.desc      Checks that ability name My with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixMyUnknownPortrait', 'case begin', 'ability my with launch unknown');
      TestLog.step('testAbilityMatrixMyUnknownPortrait', 'ability my with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyUnknownPortrait', 'case end', 'ability my with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6094
     * @tc.name      testAbilityMatrixMyUnknownLandscape
     * @tc.desc      Checks that ability name My with launch type Unknown and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixMyUnknownLandscape', 'case begin', 'ability my with launch unknown');
      TestLog.step('testAbilityMatrixMyUnknownLandscape', 'ability my with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyUnknownLandscape', 'case end', 'ability my with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6095
     * @tc.name      testAbilityMatrixMyUnknownUnknown
     * @tc.desc      Checks that ability name My with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixMyUnknownUnknown', 'case begin', 'ability my with launch unknown');
      TestLog.step('testAbilityMatrixMyUnknownUnknown', 'ability my with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyUnknownUnknown', 'case end', 'ability my with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6096
     * @tc.name      testAbilityMatrixMyEmptyUnspecified
     * @tc.desc      Checks that ability name My with launch type Empty and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'case begin', 'ability my with launch empty');
      TestLog.step('testAbilityMatrixMyEmptyUnspecified', 'ability my with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixMyEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyEmptyUnspecified', 'case end', 'ability my with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6097
     * @tc.name      testAbilityMatrixMyEmptyPortrait
     * @tc.desc      Checks that ability name My with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixMyEmptyPortrait', 'case begin', 'ability my with launch empty');
      TestLog.step('testAbilityMatrixMyEmptyPortrait', 'ability my with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixMyEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyEmptyPortrait', 'case end', 'ability my with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6098
     * @tc.name      testAbilityMatrixMyEmptyLandscape
     * @tc.desc      Checks that ability name My with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixMyEmptyLandscape', 'case begin', 'ability my with launch empty');
      TestLog.step('testAbilityMatrixMyEmptyLandscape', 'ability my with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixMyEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyEmptyLandscape', 'case end', 'ability my with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6099
     * @tc.name      testAbilityMatrixMyEmptyUnknown
     * @tc.desc      Checks that ability name My with launch type Empty and orientation Unknown is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixMyEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'MyAbility';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixMyEmptyUnknown', 'case begin', 'ability my with launch empty');
      TestLog.step('testAbilityMatrixMyEmptyUnknown', 'ability my with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixMyEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixMyEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixMyEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixMyEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixMyEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixMyEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixMyEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixMyEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixMyEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixMyEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixMyEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixMyEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixMyEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixMyEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixMyEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixMyEmptyUnknown', 'case end', 'ability my with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6100
     * @tc.name      testAbilityMatrixLowerCamelSingletonUnspecified
     * @tc.desc      Checks that ability name LowerCamel with launch type Singleton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 
        'case begin', 'ability lowercamel with launch singleton');
      TestLog.step('testAbilityMatrixLowerCamelSingletonUnspecified', 'ability lowercamel with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSingletonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnspecified', 
        'case end', 'ability lowercamel with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6101
     * @tc.name      testAbilityMatrixLowerCamelSingletonPortrait
     * @tc.desc      Checks that ability name LowerCamel with launch type Singleton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 
        'case begin', 'ability lowercamel with launch singleton');
      TestLog.step('testAbilityMatrixLowerCamelSingletonPortrait', 'ability lowercamel with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSingletonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSingletonPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSingletonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSingletonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSingletonPortrait', 
        'case end', 'ability lowercamel with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6102
     * @tc.name      testAbilityMatrixLowerCamelSingletonLandscape
     * @tc.desc      Checks that ability name LowerCamel with launch type Singleton and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 
        'case begin', 'ability lowercamel with launch singleton');
      TestLog.step('testAbilityMatrixLowerCamelSingletonLandscape', 'ability lowercamel with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSingletonLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSingletonLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSingletonLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSingletonLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSingletonLandscape', 
        'case end', 'ability lowercamel with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6103
     * @tc.name      testAbilityMatrixLowerCamelSingletonUnknown
     * @tc.desc      Checks that ability name LowerCamel with launch type Singleton and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 
        'case begin', 'ability lowercamel with launch singleton');
      TestLog.step('testAbilityMatrixLowerCamelSingletonUnknown', 'ability lowercamel with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnknown',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSingletonUnknown', 
        'case end', 'ability lowercamel with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6104
     * @tc.name      testAbilityMatrixLowerCamelMultitonUnspecified
     * @tc.desc      Checks that ability name LowerCamel with launch type Multiton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 
        'case begin', 'ability lowercamel with launch multiton');
      TestLog.step('testAbilityMatrixLowerCamelMultitonUnspecified', 'ability lowercamel with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnspecified', 
        'case end', 'ability lowercamel with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6105
     * @tc.name      testAbilityMatrixLowerCamelMultitonPortrait
     * @tc.desc      Checks that ability name LowerCamel with launch type Multiton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 
        'case begin', 'ability lowercamel with launch multiton');
      TestLog.step('testAbilityMatrixLowerCamelMultitonPortrait', 'ability lowercamel with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelMultitonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelMultitonPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelMultitonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelMultitonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelMultitonPortrait', 
        'case end', 'ability lowercamel with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6106
     * @tc.name      testAbilityMatrixLowerCamelMultitonLandscape
     * @tc.desc      Checks that ability name LowerCamel with launch type Multiton and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 
        'case begin', 'ability lowercamel with launch multiton');
      TestLog.step('testAbilityMatrixLowerCamelMultitonLandscape', 'ability lowercamel with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelMultitonLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelMultitonLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelMultitonLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelMultitonLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelMultitonLandscape', 
        'case end', 'ability lowercamel with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6107
     * @tc.name      testAbilityMatrixLowerCamelMultitonUnknown
     * @tc.desc      Checks that ability name LowerCamel with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 
        'case begin', 'ability lowercamel with launch multiton');
      TestLog.step('testAbilityMatrixLowerCamelMultitonUnknown', 'ability lowercamel with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnknown',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelMultitonUnknown', 'case end', 'ability lowercamel with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6108
     * @tc.name      testAbilityMatrixLowerCamelSpecifiedUnspecified
     * @tc.desc      Checks that ability name LowerCamel with launch type Specified and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 
        'case begin', 'ability lowercamel with launch specified');
      TestLog.step('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'ability lowercamel with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnspecified', 
        'case end', 'ability lowercamel with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6109
     * @tc.name      testAbilityMatrixLowerCamelSpecifiedPortrait
     * @tc.desc      Checks that ability name LowerCamel with launch type Specified and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 
        'case begin', 'ability lowercamel with launch specified');
      TestLog.step('testAbilityMatrixLowerCamelSpecifiedPortrait', 'ability lowercamel with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedPortrait', 
        'case end', 'ability lowercamel with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6110
     * @tc.name      testAbilityMatrixLowerCamelSpecifiedLandscape
     * @tc.desc      Checks that ability name LowerCamel with launch type Specified and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 
        'case begin', 'ability lowercamel with launch specified');
      TestLog.step('testAbilityMatrixLowerCamelSpecifiedLandscape', 'ability lowercamel with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedLandscape', 
        'case end', 'ability lowercamel with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6111
     * @tc.name      testAbilityMatrixLowerCamelSpecifiedUnknown
     * @tc.desc      Checks that ability name LowerCamel with launch type Specified and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelSpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 
        'case begin', 'ability lowercamel with launch specified');
      TestLog.step('testAbilityMatrixLowerCamelSpecifiedUnknown', 'ability lowercamel with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelSpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnknown',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelSpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelSpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelSpecifiedUnknown', 
        'case end', 'ability lowercamel with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6112
     * @tc.name      testAbilityMatrixLowerCamelUnknownUnspecified
     * @tc.desc      Checks that ability name LowerCamel with launch type Unknown and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 
        'case begin', 'ability lowercamel with launch unknown');
      TestLog.step('testAbilityMatrixLowerCamelUnknownUnspecified', 'ability lowercamel with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnspecified',
        'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnspecified', 
        'case end', 'ability lowercamel with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6113
     * @tc.name      testAbilityMatrixLowerCamelUnknownPortrait
     * @tc.desc      Checks that ability name LowerCamel with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 
        'case begin', 'ability lowercamel with launch unknown');
      TestLog.step('testAbilityMatrixLowerCamelUnknownPortrait', 'ability lowercamel with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelUnknownPortrait', 'case end', 'ability lowercamel with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6114
     * @tc.name      testAbilityMatrixLowerCamelUnknownLandscape
     * @tc.desc      Checks that ability name LowerCamel with launch type Unknown and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 
        'case begin', 'ability lowercamel with launch unknown');
      TestLog.step('testAbilityMatrixLowerCamelUnknownLandscape', 'ability lowercamel with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelUnknownLandscape', 'case end', 'ability lowercamel with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6115
     * @tc.name      testAbilityMatrixLowerCamelUnknownUnknown
     * @tc.desc      Checks that ability name LowerCamel with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'case begin', 'ability lowercamel with launch unknown');
      TestLog.step('testAbilityMatrixLowerCamelUnknownUnknown', 'ability lowercamel with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected3);
      expect(hasExpected3).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelUnknownUnknown', 'case end', 'ability lowercamel with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6116
     * @tc.name      testAbilityMatrixLowerCamelEmptyUnspecified
     * @tc.desc      Checks that ability name LowerCamel with launch type Empty and orientation Unspecified
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'case begin', 'ability lowercamel with launch empty');
      TestLog.step('testAbilityMatrixLowerCamelEmptyUnspecified', 'ability lowercamel with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnspecified', 'case end', 'ability lowercamel with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6117
     * @tc.name      testAbilityMatrixLowerCamelEmptyPortrait
     * @tc.desc      Checks that ability name LowerCamel with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'case begin', 'ability lowercamel with launch empty');
      TestLog.step('testAbilityMatrixLowerCamelEmptyPortrait', 'ability lowercamel with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyPortrait', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelEmptyPortrait', 'case end', 'ability lowercamel with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6118
     * @tc.name      testAbilityMatrixLowerCamelEmptyLandscape
     * @tc.desc      Checks that ability name LowerCamel with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'case begin', 'ability lowercamel with launch empty');
      TestLog.step('testAbilityMatrixLowerCamelEmptyLandscape', 'ability lowercamel with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelEmptyLandscape', 'case end', 'ability lowercamel with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6119
     * @tc.name      testAbilityMatrixLowerCamelEmptyUnknown
     * @tc.desc      Checks that ability name LowerCamel with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixLowerCamelEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'entryAbility';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'case begin', 'ability lowercamel with launch empty');
      TestLog.step('testAbilityMatrixLowerCamelEmptyUnknown', 'ability lowercamel with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixLowerCamelEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected3);
      expect(hasExpected3).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixLowerCamelEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixLowerCamelEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixLowerCamelEmptyUnknown', 'case end', 'ability lowercamel with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6120
     * @tc.name      testAbilityMatrixEmptySingletonUnspecified
     * @tc.desc      Checks that ability name Empty with launch type Singleton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'case begin', 'ability empty with launch singleton');
      TestLog.step('testAbilityMatrixEmptySingletonUnspecified', 'ability empty with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySingletonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySingletonUnspecified', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySingletonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySingletonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySingletonUnspecified', 'case end', 'ability empty with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6121
     * @tc.name      testAbilityMatrixEmptySingletonPortrait
     * @tc.desc      Checks that ability name Empty with launch type Singleton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'case begin', 'ability empty with launch singleton');
      TestLog.step('testAbilityMatrixEmptySingletonPortrait', 'ability empty with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySingletonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySingletonPortrait', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySingletonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySingletonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySingletonPortrait', 'case end', 'ability empty with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6122
     * @tc.name      testAbilityMatrixEmptySingletonLandscape
     * @tc.desc      Checks that ability name Empty with launch type Singleton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'case begin', 'ability empty with launch singleton');
      TestLog.step('testAbilityMatrixEmptySingletonLandscape', 'ability empty with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySingletonLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySingletonLandscape', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySingletonLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySingletonLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySingletonLandscape', 'case end', 'ability empty with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6123
     * @tc.name      testAbilityMatrixEmptySingletonUnknown
     * @tc.desc      Checks that ability name Empty with launch type Singleton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'case begin', 'ability empty with launch singleton');
      TestLog.step('testAbilityMatrixEmptySingletonUnknown', 'ability empty with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySingletonUnknown', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptySingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySingletonUnknown', 'case end', 'ability empty with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6124
     * @tc.name      testAbilityMatrixEmptyMultitonUnspecified
     * @tc.desc      Checks that ability name Empty with launch type Multiton and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'case begin', 'ability empty with launch multiton');
      TestLog.step('testAbilityMatrixEmptyMultitonUnspecified', 'ability empty with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyMultitonUnspecified', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyMultitonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyMultitonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyMultitonUnspecified', 'case end', 'ability empty with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6125
     * @tc.name      testAbilityMatrixEmptyMultitonPortrait
     * @tc.desc      Checks that ability name Empty with launch type Multiton and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'case begin', 'ability empty with launch multiton');
      TestLog.step('testAbilityMatrixEmptyMultitonPortrait', 'ability empty with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyMultitonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyMultitonPortrait', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyMultitonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyMultitonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyMultitonPortrait', 'case end', 'ability empty with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6126
     * @tc.name      testAbilityMatrixEmptyMultitonLandscape
     * @tc.desc      Checks that ability name Empty with launch type Multiton and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyMultitonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'multiton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'case begin', 'ability empty with launch multiton');
      TestLog.step('testAbilityMatrixEmptyMultitonLandscape', 'ability empty with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyMultitonLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyMultitonLandscape', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyMultitonLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyMultitonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyMultitonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyMultitonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyMultitonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyMultitonLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyMultitonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyMultitonLandscape', 'case end', 'ability empty with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6127
     * @tc.name      testAbilityMatrixEmptyMultitonUnknown
     * @tc.desc      Checks that ability name Empty with launch type Multiton and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyMultitonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'multiton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'case begin', 'ability empty with launch multiton');
      TestLog.step('testAbilityMatrixEmptyMultitonUnknown', 'ability empty with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyMultitonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyMultitonUnknown', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyMultitonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyMultitonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyMultitonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyMultitonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyMultitonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyMultitonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyMultitonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyMultitonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyMultitonUnknown', 'case end', 'ability empty with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6128
     * @tc.name      testAbilityMatrixEmptySpecifiedUnspecified
     * @tc.desc      Checks that ability name Empty with launch type Specified and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySpecifiedUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'specified';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'case begin', 'ability empty with launch specified');
      TestLog.step('testAbilityMatrixEmptySpecifiedUnspecified', 'ability empty with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySpecifiedUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnspecified', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySpecifiedUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySpecifiedUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySpecifiedUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySpecifiedUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnspecified', 'case end', 'ability empty with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6129
     * @tc.name      testAbilityMatrixEmptySpecifiedPortrait
     * @tc.desc      Checks that ability name Empty with launch type Specified and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySpecifiedPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'specified';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'case begin', 'ability empty with launch specified');
      TestLog.step('testAbilityMatrixEmptySpecifiedPortrait', 'ability empty with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySpecifiedPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySpecifiedPortrait', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySpecifiedPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySpecifiedPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySpecifiedPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySpecifiedPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySpecifiedPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySpecifiedPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySpecifiedPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySpecifiedPortrait', 'case end', 'ability empty with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6130
     * @tc.name      testAbilityMatrixEmptySpecifiedLandscape
     * @tc.desc      Checks that ability name Empty with launch type Specified and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySpecifiedLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'specified';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'case begin', 'ability empty with launch specified');
      TestLog.step('testAbilityMatrixEmptySpecifiedLandscape', 'ability empty with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySpecifiedLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySpecifiedLandscape', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySpecifiedLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySpecifiedLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySpecifiedLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySpecifiedLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySpecifiedLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySpecifiedLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySpecifiedLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySpecifiedLandscape', 'case end', 'ability empty with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6131
     * @tc.name      testAbilityMatrixEmptySpecifiedUnknown
     * @tc.desc      Checks that ability name Empty with launch type Specified and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptySpecifiedUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'specified';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'case begin', 'ability empty with launch specified');
      TestLog.step('testAbilityMatrixEmptySpecifiedUnknown', 'ability empty with launch specified');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptySpecifiedUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnknown', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptySpecifiedUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptySpecifiedUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptySpecifiedUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptySpecifiedUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptySpecifiedUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptySpecifiedUnknown', 'case end', 'ability empty with launch specified');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6132
     * @tc.name      testAbilityMatrixEmptyUnknownUnspecified
     * @tc.desc      Checks that ability name Empty with launch type Unknown and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyUnknownUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'single';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'case begin', 'ability empty with launch unknown');
      TestLog.step('testAbilityMatrixEmptyUnknownUnspecified', 'ability empty with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyUnknownUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyUnknownUnspecified', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyUnknownUnspecified', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyUnknownUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyUnknownUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyUnknownUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyUnknownUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyUnknownUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyUnknownUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyUnknownUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyUnknownUnspecified', 'case end', 'ability empty with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6133
     * @tc.name      testAbilityMatrixEmptyUnknownPortrait
     * @tc.desc      Checks that ability name Empty with launch type Unknown and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyUnknownPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'single';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'case begin', 'ability empty with launch unknown');
      TestLog.step('testAbilityMatrixEmptyUnknownPortrait', 'ability empty with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyUnknownPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyUnknownPortrait', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyUnknownPortrait', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyUnknownPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyUnknownPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyUnknownPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyUnknownPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyUnknownPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyUnknownPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyUnknownPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyUnknownPortrait', 'case end', 'ability empty with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6134
     * @tc.name      testAbilityMatrixEmptyUnknownLandscape
     * @tc.desc      Checks that ability name Empty with launch type Unknown and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyUnknownLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'single';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'case begin', 'ability empty with launch unknown');
      TestLog.step('testAbilityMatrixEmptyUnknownLandscape', 'ability empty with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyUnknownLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyUnknownLandscape', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyUnknownLandscape', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyUnknownLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyUnknownLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyUnknownLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyUnknownLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyUnknownLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyUnknownLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyUnknownLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyUnknownLandscape', 'case end', 'ability empty with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6135
     * @tc.name      testAbilityMatrixEmptyUnknownUnknown
     * @tc.desc      Checks that ability name Empty with launch type Unknown and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyUnknownUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = 'single';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'case begin', 'ability empty with launch unknown');
      TestLog.step('testAbilityMatrixEmptyUnknownUnknown', 'ability empty with launch unknown');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyUnknownUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected3);
      expect(hasExpected3).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyUnknownUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyUnknownUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyUnknownUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyUnknownUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyUnknownUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyUnknownUnknown', 'case end', 'ability empty with launch unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6136
     * @tc.name      testAbilityMatrixEmptyEmptyUnspecified
     * @tc.desc      Checks that ability name Empty with launch type Empty and orientation Unspecified is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyEmptyUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = '';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'case begin', 'ability empty with launch empty');
      TestLog.step('testAbilityMatrixEmptyEmptyUnspecified', 'ability empty with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyEmptyUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyUnspecified', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyUnspecified', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyEmptyUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyEmptyUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyEmptyUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyEmptyUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyEmptyUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyEmptyUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyEmptyUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyEmptyUnspecified', 'case end', 'ability empty with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6137
     * @tc.name      testAbilityMatrixEmptyEmptyPortrait
     * @tc.desc      Checks that ability name Empty with launch type Empty and orientation Portrait is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyEmptyPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = '';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'case begin', 'ability empty with launch empty');
      TestLog.step('testAbilityMatrixEmptyEmptyPortrait', 'ability empty with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyEmptyPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyPortrait', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyPortrait', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyEmptyPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyEmptyPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyEmptyPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyEmptyPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyEmptyPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyEmptyPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyEmptyPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyEmptyPortrait', 'case end', 'ability empty with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6138
     * @tc.name      testAbilityMatrixEmptyEmptyLandscape
     * @tc.desc      Checks that ability name Empty with launch type Empty and orientation Landscape is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyEmptyLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = '';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'case begin', 'ability empty with launch empty');
      TestLog.step('testAbilityMatrixEmptyEmptyLandscape', 'ability empty with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyEmptyLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyLandscape', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyLandscape', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyEmptyLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyEmptyLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyEmptyLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyEmptyLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyEmptyLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyEmptyLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyEmptyLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyEmptyLandscape', 'case end', 'ability empty with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6139
     * @tc.name      testAbilityMatrixEmptyEmptyUnknown
     * @tc.desc      Checks that ability name Empty with launch type Empty and orientation Unknown is
     * @tc.desc      validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixEmptyEmptyUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = '';
      ability.launchType = '';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'case begin', 'ability empty with launch empty');
      TestLog.step('testAbilityMatrixEmptyEmptyUnknown', 'ability empty with launch empty');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixEmptyEmptyUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'has code MODULE_ABILITY_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_EMPTY');
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'has code MODULE_LAUNCH_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected3);
      expect(hasExpected3).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixEmptyEmptyUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixEmptyEmptyUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixEmptyEmptyUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixEmptyEmptyUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixEmptyEmptyUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixEmptyEmptyUnknown', 'case end', 'ability empty with launch empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6140
     * @tc.name      testAbilityMatrixUnderscoreSingletonUnspecified
     * @tc.desc      Checks that ability name Underscore with launch type Singleton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreSingletonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'singleton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 
        'case begin', 'ability underscore with launch singleton');
      TestLog.step('testAbilityMatrixUnderscoreSingletonUnspecified', 'ability underscore with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreSingletonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnspecified', 
        'case end', 'ability underscore with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6141
     * @tc.name      testAbilityMatrixUnderscoreSingletonPortrait
     * @tc.desc      Checks that ability name Underscore with launch type Singleton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreSingletonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'singleton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 
        'case begin', 'ability underscore with launch singleton');
      TestLog.step('testAbilityMatrixUnderscoreSingletonPortrait', 'ability underscore with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreSingletonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreSingletonPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreSingletonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreSingletonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreSingletonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreSingletonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreSingletonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreSingletonPortrait', 
        'case end', 'ability underscore with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6142
     * @tc.name      testAbilityMatrixUnderscoreSingletonLandscape
     * @tc.desc      Checks that ability name Underscore with launch type Singleton and orientation Landscape
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreSingletonLandscape',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'singleton';
      ability.orientation = 'landscape';
      TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 
        'case begin', 'ability underscore with launch singleton');
      TestLog.step('testAbilityMatrixUnderscoreSingletonLandscape', 'ability underscore with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreSingletonLandscape', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreSingletonLandscape',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreSingletonLandscape', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreSingletonLandscape', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreSingletonLandscape', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonLandscape', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonLandscape', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreSingletonLandscape', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreSingletonLandscape', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreSingletonLandscape', 
        'case end', 'ability underscore with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6143
     * @tc.name      testAbilityMatrixUnderscoreSingletonUnknown
     * @tc.desc      Checks that ability name Underscore with launch type Singleton and orientation Unknown
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreSingletonUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'singleton';
      ability.orientation = 'sideways';
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 
        'case begin', 'ability underscore with launch singleton');
      TestLog.step('testAbilityMatrixUnderscoreSingletonUnknown', 'ability underscore with launch singleton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreSingletonUnknown', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnknown',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ORIENTATION_UNKNOWN');
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnknown', 'has code MODULE_ORIENTATION_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreSingletonUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreSingletonUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreSingletonUnknown', 
        'case end', 'ability underscore with launch singleton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6144
     * @tc.name      testAbilityMatrixUnderscoreMultitonUnspecified
     * @tc.desc      Checks that ability name Underscore with launch type Multiton and orientation
     * @tc.desc      Unspecified is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreMultitonUnspecified',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'multiton';
      ability.orientation = 'unspecified';
      TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 
        'case begin', 'ability underscore with launch multiton');
      TestLog.step('testAbilityMatrixUnderscoreMultitonUnspecified', 'ability underscore with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreMultitonUnspecified', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreMultitonUnspecified',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreMultitonUnspecified', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreMultitonUnspecified', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreMultitonUnspecified', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreMultitonUnspecified', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreMultitonUnspecified', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreMultitonUnspecified', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreMultitonUnspecified', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreMultitonUnspecified', 
        'case end', 'ability underscore with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6145
     * @tc.name      testAbilityMatrixUnderscoreMultitonPortrait
     * @tc.desc      Checks that ability name Underscore with launch type Multiton and orientation Portrait
     * @tc.desc      is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityMatrixUnderscoreMultitonPortrait',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const ability: AbilityConfig = moduleConfig.abilities[0];
      ability.name = 'Entry_Ability';
      ability.launchType = 'multiton';
      ability.orientation = 'portrait';
      TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 
        'case begin', 'ability underscore with launch multiton');
      TestLog.step('testAbilityMatrixUnderscoreMultitonPortrait', 'ability underscore with launch multiton');
      const findings: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.findings('testAbilityMatrixUnderscoreMultitonPortrait', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testAbilityMatrixUnderscoreMultitonPortrait',
        'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAbilityMatrixUnderscoreMultitonPortrait', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAbilityMatrixUnderscoreMultitonPortrait', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAbilityMatrixUnderscoreMultitonPortrait', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAbilityMatrixUnderscoreMultitonPortrait', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAbilityMatrixUnderscoreMultitonPortrait', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAbilityMatrixUnderscoreMultitonPortrait', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAbility(moduleConfig, ability, 0);
      TestLog.number('testAbilityMatrixUnderscoreMultitonPortrait', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAbilityMatrixUnderscoreMultitonPortrait', 
        'case end', 'ability underscore with launch multiton');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6146
     * @tc.name      testAbilityMatrixUnderscoreMultitonLandscape