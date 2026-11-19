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
import type { ModuleConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function DeviceMatrixTest(): void {
  describe('DeviceMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6400
     * @tc.name      testDeviceMatrixDefaultPlain
     * @tc.desc      Checks that a Default module with mutation Plain is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixDefaultPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      TestLog.text('testDeviceMatrixDefaultPlain', 'case begin', 'device default with mutation plain');
      TestLog.step('testDeviceMatrixDefaultPlain', 'device default with mutation plain');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixDefaultPlain', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testDeviceMatrixDefaultPlain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixDefaultPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixDefaultPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixDefaultPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixDefaultPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixDefaultPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixDefaultPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixDefaultPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixDefaultPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixDefaultPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixDefaultPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixDefaultPlain', 'case end', 'device default with mutation plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6401
     * @tc.name      testDeviceMatrixDefaultBadAbilityName
     * @tc.desc      Checks that a Default module with mutation BadAbilityName is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixDefaultBadAbilityName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      moduleConfig.abilities[0].name = 'entryAbility';
      TestLog.text('testDeviceMatrixDefaultBadAbilityName', 
        'case begin', 'device default with mutation badabilityname');
      TestLog.step('testDeviceMatrixDefaultBadAbilityName', 'device default with mutation badabilityname');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixDefaultBadAbilityName', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testDeviceMatrixDefaultBadAbilityName', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixDefaultBadAbilityName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixDefaultBadAbilityName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixDefaultBadAbilityName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixDefaultBadAbilityName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixDefaultBadAbilityName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixDefaultBadAbilityName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixDefaultBadAbilityName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixDefaultBadAbilityName', 'case end', 'device default with mutation badabilityname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6402
     * @tc.name      testDeviceMatrixDefaultBadPages
     * @tc.desc      Checks that a Default module with mutation BadPages is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixDefaultBadPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      moduleConfig.pages = 'main_pages';
      TestLog.text('testDeviceMatrixDefaultBadPages', 'case begin', 'device default with mutation badpages');
      TestLog.step('testDeviceMatrixDefaultBadPages', 'device default with mutation badpages');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixDefaultBadPages', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testDeviceMatrixDefaultBadPages', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixDefaultBadPages', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixDefaultBadPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixDefaultBadPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixDefaultBadPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixDefaultBadPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixDefaultBadPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixDefaultBadPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixDefaultBadPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixDefaultBadPages', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixDefaultBadPages', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixDefaultBadPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixDefaultBadPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixDefaultBadPages', 'case end', 'device default with mutation badpages');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6403
     * @tc.name      testDeviceMatrixDefaultEmptyAbilities
     * @tc.desc      Checks that a Default module with mutation EmptyAbilities is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixDefaultEmptyAbilities',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      moduleConfig.abilities = [];
      TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 
        'case begin', 'device default with mutation emptyabilities');
      TestLog.step('testDeviceMatrixDefaultEmptyAbilities', 'device default with mutation emptyabilities');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixDefaultEmptyAbilities', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testDeviceMatrixDefaultEmptyAbilities', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixDefaultEmptyAbilities', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixDefaultEmptyAbilities', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixDefaultEmptyAbilities', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixDefaultEmptyAbilities', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixDefaultEmptyAbilities', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixDefaultEmptyAbilities', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixDefaultEmptyAbilities', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixDefaultEmptyAbilities', 'case end', 'device default with mutation emptyabilities');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6404
     * @tc.name      testDeviceMatrixDefaultEmptyAtomicPreloads
     * @tc.desc      Checks that a Default module with mutation EmptyAtomicPreloads is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixDefaultEmptyAtomicPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      moduleConfig.atomicService = block;
      TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 
        'case begin', 'device default with mutation emptyatomicpreloads');
      TestLog.step('testDeviceMatrixDefaultEmptyAtomicPreloads', 'device default with mutation emptyatomicpreloads');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixDefaultEmptyAtomicPreloads', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testDeviceMatrixDefaultEmptyAtomicPreloads', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixDefaultEmptyAtomicPreloads', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixDefaultEmptyAtomicPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixDefaultEmptyAtomicPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixDefaultEmptyAtomicPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixDefaultEmptyAtomicPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixDefaultEmptyAtomicPreloads', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixDefaultEmptyAtomicPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixDefaultEmptyAtomicPreloads', 
        'case end', 'device default with mutation emptyatomicpreloads');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6405
     * @tc.name      testDeviceMatrixPhonePlain
     * @tc.desc      Checks that a Phone module with mutation Plain is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixPhonePlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      TestLog.text('testDeviceMatrixPhonePlain', 'case begin', 'device phone with mutation plain');
      TestLog.step('testDeviceMatrixPhonePlain', 'device phone with mutation plain');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixPhonePlain', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testDeviceMatrixPhonePlain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixPhonePlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixPhonePlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixPhonePlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixPhonePlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixPhonePlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixPhonePlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixPhonePlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixPhonePlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixPhonePlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixPhonePlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixPhonePlain', 'case end', 'device phone with mutation plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6406
     * @tc.name      testDeviceMatrixPhoneBadAbilityName
     * @tc.desc      Checks that a Phone module with mutation BadAbilityName is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixPhoneBadAbilityName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      moduleConfig.abilities[0].name = 'entryAbility';
      TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'case begin', 'device phone with mutation badabilityname');
      TestLog.step('testDeviceMatrixPhoneBadAbilityName', 'device phone with mutation badabilityname');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixPhoneBadAbilityName', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testDeviceMatrixPhoneBadAbilityName', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixPhoneBadAbilityName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixPhoneBadAbilityName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixPhoneBadAbilityName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixPhoneBadAbilityName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixPhoneBadAbilityName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixPhoneBadAbilityName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixPhoneBadAbilityName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixPhoneBadAbilityName', 'case end', 'device phone with mutation badabilityname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6407
     * @tc.name      testDeviceMatrixPhoneBadPages
     * @tc.desc      Checks that a Phone module with mutation BadPages is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixPhoneBadPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      moduleConfig.pages = 'main_pages';
      TestLog.text('testDeviceMatrixPhoneBadPages', 'case begin', 'device phone with mutation badpages');
      TestLog.step('testDeviceMatrixPhoneBadPages', 'device phone with mutation badpages');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixPhoneBadPages', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testDeviceMatrixPhoneBadPages', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixPhoneBadPages', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixPhoneBadPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixPhoneBadPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixPhoneBadPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixPhoneBadPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixPhoneBadPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixPhoneBadPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixPhoneBadPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixPhoneBadPages', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixPhoneBadPages', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixPhoneBadPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixPhoneBadPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixPhoneBadPages', 'case end', 'device phone with mutation badpages');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6408
     * @tc.name      testDeviceMatrixPhoneEmptyAbilities
     * @tc.desc      Checks that a Phone module with mutation EmptyAbilities is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixPhoneEmptyAbilities',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      moduleConfig.abilities = [];
      TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'case begin', 'device phone with mutation emptyabilities');
      TestLog.step('testDeviceMatrixPhoneEmptyAbilities', 'device phone with mutation emptyabilities');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixPhoneEmptyAbilities', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testDeviceMatrixPhoneEmptyAbilities', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixPhoneEmptyAbilities', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixPhoneEmptyAbilities', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixPhoneEmptyAbilities', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixPhoneEmptyAbilities', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixPhoneEmptyAbilities', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixPhoneEmptyAbilities', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixPhoneEmptyAbilities', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixPhoneEmptyAbilities', 'case end', 'device phone with mutation emptyabilities');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6409
     * @tc.name      testDeviceMatrixPhoneEmptyAtomicPreloads
     * @tc.desc      Checks that a Phone module with mutation EmptyAtomicPreloads is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixPhoneEmptyAtomicPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      moduleConfig.atomicService = block;
      TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 
        'case begin', 'device phone with mutation emptyatomicpreloads');
      TestLog.step('testDeviceMatrixPhoneEmptyAtomicPreloads', 'device phone with mutation emptyatomicpreloads');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixPhoneEmptyAtomicPreloads', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testDeviceMatrixPhoneEmptyAtomicPreloads', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixPhoneEmptyAtomicPreloads', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixPhoneEmptyAtomicPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixPhoneEmptyAtomicPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixPhoneEmptyAtomicPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixPhoneEmptyAtomicPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixPhoneEmptyAtomicPreloads', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixPhoneEmptyAtomicPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixPhoneEmptyAtomicPreloads', 
        'case end', 'device phone with mutation emptyatomicpreloads');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6410
     * @tc.name      testDeviceMatrixTabletPlain
     * @tc.desc      Checks that a Tablet module with mutation Plain is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTabletPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      TestLog.text('testDeviceMatrixTabletPlain', 'case begin', 'device tablet with mutation plain');
      TestLog.step('testDeviceMatrixTabletPlain', 'device tablet with mutation plain');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTabletPlain', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testDeviceMatrixTabletPlain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTabletPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTabletPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTabletPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTabletPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTabletPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTabletPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTabletPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTabletPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTabletPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTabletPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTabletPlain', 'case end', 'device tablet with mutation plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6411
     * @tc.name      testDeviceMatrixTabletBadAbilityName
     * @tc.desc      Checks that a Tablet module with mutation BadAbilityName is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTabletBadAbilityName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      moduleConfig.abilities[0].name = 'entryAbility';
      TestLog.text('testDeviceMatrixTabletBadAbilityName', 'case begin', 'device tablet with mutation badabilityname');
      TestLog.step('testDeviceMatrixTabletBadAbilityName', 'device tablet with mutation badabilityname');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTabletBadAbilityName', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testDeviceMatrixTabletBadAbilityName', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTabletBadAbilityName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTabletBadAbilityName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTabletBadAbilityName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTabletBadAbilityName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTabletBadAbilityName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTabletBadAbilityName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTabletBadAbilityName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTabletBadAbilityName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTabletBadAbilityName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTabletBadAbilityName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTabletBadAbilityName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTabletBadAbilityName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTabletBadAbilityName', 'case end', 'device tablet with mutation badabilityname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6412
     * @tc.name      testDeviceMatrixTabletBadPages
     * @tc.desc      Checks that a Tablet module with mutation BadPages is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTabletBadPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      moduleConfig.pages = 'main_pages';
      TestLog.text('testDeviceMatrixTabletBadPages', 'case begin', 'device tablet with mutation badpages');
      TestLog.step('testDeviceMatrixTabletBadPages', 'device tablet with mutation badpages');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTabletBadPages', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testDeviceMatrixTabletBadPages', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTabletBadPages', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTabletBadPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTabletBadPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTabletBadPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTabletBadPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTabletBadPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTabletBadPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTabletBadPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTabletBadPages', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTabletBadPages', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTabletBadPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTabletBadPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTabletBadPages', 'case end', 'device tablet with mutation badpages');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6413
     * @tc.name      testDeviceMatrixTabletEmptyAbilities
     * @tc.desc      Checks that a Tablet module with mutation EmptyAbilities is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTabletEmptyAbilities',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      moduleConfig.abilities = [];
      TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'case begin', 'device tablet with mutation emptyabilities');
      TestLog.step('testDeviceMatrixTabletEmptyAbilities', 'device tablet with mutation emptyabilities');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTabletEmptyAbilities', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testDeviceMatrixTabletEmptyAbilities', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTabletEmptyAbilities', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTabletEmptyAbilities', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTabletEmptyAbilities', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTabletEmptyAbilities', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTabletEmptyAbilities', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTabletEmptyAbilities', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTabletEmptyAbilities', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTabletEmptyAbilities', 'case end', 'device tablet with mutation emptyabilities');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6414
     * @tc.name      testDeviceMatrixTabletEmptyAtomicPreloads
     * @tc.desc      Checks that a Tablet module with mutation EmptyAtomicPreloads is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTabletEmptyAtomicPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      moduleConfig.atomicService = block;
      TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 
        'case begin', 'device tablet with mutation emptyatomicpreloads');
      TestLog.step('testDeviceMatrixTabletEmptyAtomicPreloads', 'device tablet with mutation emptyatomicpreloads');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTabletEmptyAtomicPreloads', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testDeviceMatrixTabletEmptyAtomicPreloads', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTabletEmptyAtomicPreloads', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTabletEmptyAtomicPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTabletEmptyAtomicPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTabletEmptyAtomicPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTabletEmptyAtomicPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTabletEmptyAtomicPreloads', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTabletEmptyAtomicPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTabletEmptyAtomicPreloads', 
        'case end', 'device tablet with mutation emptyatomicpreloads');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6415
     * @tc.name      testDeviceMatrixTwoInOnePlain
     * @tc.desc      Checks that a TwoInOne module with mutation Plain is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTwoInOnePlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      TestLog.text('testDeviceMatrixTwoInOnePlain', 'case begin', 'device twoinone with mutation plain');
      TestLog.step('testDeviceMatrixTwoInOnePlain', 'device twoinone with mutation plain');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTwoInOnePlain', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testDeviceMatrixTwoInOnePlain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTwoInOnePlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTwoInOnePlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTwoInOnePlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTwoInOnePlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTwoInOnePlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTwoInOnePlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTwoInOnePlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTwoInOnePlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTwoInOnePlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTwoInOnePlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTwoInOnePlain', 'case end', 'device twoinone with mutation plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6416
     * @tc.name      testDeviceMatrixTwoInOneBadAbilityName
     * @tc.desc      Checks that a TwoInOne module with mutation BadAbilityName is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTwoInOneBadAbilityName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      moduleConfig.abilities[0].name = 'entryAbility';
      TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 
        'case begin', 'device twoinone with mutation badabilityname');
      TestLog.step('testDeviceMatrixTwoInOneBadAbilityName', 'device twoinone with mutation badabilityname');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTwoInOneBadAbilityName', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITY_NAME_NOT_PASCAL');
      TestLog.flag('testDeviceMatrixTwoInOneBadAbilityName', 'has code MODULE_ABILITY_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTwoInOneBadAbilityName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTwoInOneBadAbilityName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTwoInOneBadAbilityName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTwoInOneBadAbilityName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTwoInOneBadAbilityName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTwoInOneBadAbilityName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTwoInOneBadAbilityName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTwoInOneBadAbilityName', 
        'case end', 'device twoinone with mutation badabilityname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6417
     * @tc.name      testDeviceMatrixTwoInOneBadPages
     * @tc.desc      Checks that a TwoInOne module with mutation BadPages is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTwoInOneBadPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      moduleConfig.pages = 'main_pages';
      TestLog.text('testDeviceMatrixTwoInOneBadPages', 'case begin', 'device twoinone with mutation badpages');
      TestLog.step('testDeviceMatrixTwoInOneBadPages', 'device twoinone with mutation badpages');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTwoInOneBadPages', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testDeviceMatrixTwoInOneBadPages', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTwoInOneBadPages', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTwoInOneBadPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTwoInOneBadPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTwoInOneBadPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTwoInOneBadPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTwoInOneBadPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTwoInOneBadPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTwoInOneBadPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTwoInOneBadPages', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTwoInOneBadPages', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTwoInOneBadPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTwoInOneBadPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTwoInOneBadPages', 'case end', 'device twoinone with mutation badpages');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6418
     * @tc.name      testDeviceMatrixTwoInOneEmptyAbilities
     * @tc.desc      Checks that a TwoInOne module with mutation EmptyAbilities is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTwoInOneEmptyAbilities',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      moduleConfig.abilities = [];
      TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 
        'case begin', 'device twoinone with mutation emptyabilities');
      TestLog.step('testDeviceMatrixTwoInOneEmptyAbilities', 'device twoinone with mutation emptyabilities');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTwoInOneEmptyAbilities', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAbilities', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAbilities', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTwoInOneEmptyAbilities', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTwoInOneEmptyAbilities', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAbilities', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAbilities', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTwoInOneEmptyAbilities', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTwoInOneEmptyAbilities', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAbilities', 
        'case end', 'device twoinone with mutation emptyabilities');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6419
     * @tc.name      testDeviceMatrixTwoInOneEmptyAtomicPreloads
     * @tc.desc      Checks that a TwoInOne module with mutation EmptyAtomicPreloads is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTwoInOneEmptyAtomicPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      moduleConfig.atomicService = block;
      TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 
        'case begin', 'device twoinone with mutation emptyatomicpreloads');
      TestLog.step('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'device twoinone with mutation emptyatomicpreloads');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTwoInOneEmptyAtomicPreloads', 
        'case end', 'device twoinone with mutation emptyatomicpreloads');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6420
     * @tc.name      testDeviceMatrixTvPlain
     * @tc.desc      Checks that a Tv module with mutation Plain is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDeviceMatrixTvPlain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tv'];
      TestLog.text('testDeviceMatrixTvPlain', 'case begin', 'device tv with mutation plain');
      TestLog.step('testDeviceMatrixTvPlain', 'device tv with mutation plain');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testDeviceMatrixTvPlain', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testDeviceMatrixTvPlain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testDeviceMatrixTvPlain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testDeviceMatrixTvPlain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testDeviceMatrixTvPlain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testDeviceMatrixTvPlain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testDeviceMatrixTvPlain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testDeviceMatrixTvPlain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testDeviceMatrixTvPlain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testDeviceMatrixTvPlain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testDeviceMatrixTvPlain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testDeviceMatrixTvPlain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testDeviceMatrixTvPlain', 'case end', 'device tv with mutation plain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6421
     * @tc.name      testDeviceMatrixTvBadAbilityName
     * @tc.desc      Checks that a Tv module with mutation BadAbilityName is validated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */