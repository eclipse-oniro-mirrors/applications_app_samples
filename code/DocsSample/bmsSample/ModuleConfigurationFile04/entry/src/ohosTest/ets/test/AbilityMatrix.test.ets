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