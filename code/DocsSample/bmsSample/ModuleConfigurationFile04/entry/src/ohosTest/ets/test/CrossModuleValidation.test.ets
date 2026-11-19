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
import type { BundleSnapshot, ModuleConfig } from '../harness/ConfigModels';
import { CrossModuleValidator } from '../harness/CrossModuleValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function CrossModuleValidationTest(): void {
  describe('CrossModuleValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3600
     * @tc.name      testCrossSampleBundleValid
     * @tc.desc      Checks that the sample two module bundle passes cross module validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossSampleBundleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossSampleBundleValid', 'case begin', 'crosssamplebundlevalid check');
      TestLog.step('testCrossSampleBundleValid', 'crosssamplebundlevalid check');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossSampleBundleValid', 'cross module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossSampleBundleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossSampleBundleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossSampleBundleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossSampleBundleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossSampleBundleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossSampleBundleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossSampleBundleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossSampleBundleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossSampleBundleValid', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossSampleBundleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossSampleBundleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossSampleBundleValid', 'case end', 'crosssamplebundlevalid check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3601
     * @tc.name      testCrossEmptyModuleList
     * @tc.desc      Checks that an empty module list is reported together with the missing entry module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossEmptyModuleList',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([]);
      TestLog.text('testCrossEmptyModuleList', 'case begin', 'crossemptymodulelist check');
      TestLog.step('testCrossEmptyModuleList', 'crossemptymodulelist check');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossEmptyModuleList', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'BUNDLE_MODULES_EMPTY');
      TestLog.flag('testCrossEmptyModuleList', 'has code BUNDLE_MODULES_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'BUNDLE_NO_ENTRY_MODULE');
      TestLog.flag('testCrossEmptyModuleList', 'has code BUNDLE_NO_ENTRY_MODULE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossEmptyModuleList', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossEmptyModuleList', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossEmptyModuleList', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossEmptyModuleList', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossEmptyModuleList', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossEmptyModuleList', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossEmptyModuleList', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossEmptyModuleList', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossEmptyModuleList', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossEmptyModuleList', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossEmptyModuleList', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossEmptyModuleList', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossEmptyModuleList', 'case end', 'crossemptymodulelist check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3602
     * @tc.name      testCrossFeatureOnlyBundle
     * @tc.desc      Checks that a bundle without an entry module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossFeatureOnlyBundle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.featureModule()]);
      TestLog.text('testCrossFeatureOnlyBundle', 'case begin', 'crossfeatureonlybundle check');
      TestLog.step('testCrossFeatureOnlyBundle', 'crossfeatureonlybundle check');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossFeatureOnlyBundle', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_NO_ENTRY_MODULE');
      TestLog.flag('testCrossFeatureOnlyBundle', 'has code BUNDLE_NO_ENTRY_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossFeatureOnlyBundle', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossFeatureOnlyBundle', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossFeatureOnlyBundle', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossFeatureOnlyBundle', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossFeatureOnlyBundle', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossFeatureOnlyBundle', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossFeatureOnlyBundle', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossFeatureOnlyBundle', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossFeatureOnlyBundle', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossFeatureOnlyBundle', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossFeatureOnlyBundle', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossFeatureOnlyBundle', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossFeatureOnlyBundle', 'case end', 'crossfeatureonlybundle check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3603
     * @tc.name      testCrossDuplicateModuleName
     * @tc.desc      Checks that a duplicated module name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossDuplicateModuleName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = 
        ConfigFactory.snapshotWith([ConfigFactory.entryModule(), 
          ConfigFactory.featureModule(), ConfigFactory.featureModule()]);
      TestLog.text('testCrossDuplicateModuleName', 'case begin', 'crossduplicatemodulename check');
      TestLog.step('testCrossDuplicateModuleName', 'crossduplicatemodulename check');
      const findings: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.findings('testCrossDuplicateModuleName', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_DUPLICATE_MODULE_NAME');
      TestLog.flag('testCrossDuplicateModuleName', 'has code BUNDLE_DUPLICATE_MODULE_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossDuplicateModuleName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossDuplicateModuleName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossDuplicateModuleName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossDuplicateModuleName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossDuplicateModuleName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossDuplicateModuleName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossDuplicateModuleName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossDuplicateModuleName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossDuplicateModuleName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossDuplicateModuleName', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.number('testCrossDuplicateModuleName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossDuplicateModuleName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossDuplicateModuleName', 'case end', 'crossduplicatemodulename check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3604
     * @tc.name      testCrossMultipleEntryModules
     * @tc.desc      Checks that two entry modules are reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMultipleEntryModules',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const second: ModuleConfig = ConfigFactory.entryModule();
      second.name = 'entry2';
      second.atomicService = null;
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.entryModule(), second]);
      TestLog.text('testCrossMultipleEntryModules', 'case begin', 'crossmultipleentrymodules check');
      TestLog.step('testCrossMultipleEntryModules', 'crossmultipleentrymodules check');
      const findings: Finding[] = CrossModuleValidator.validateEntryModules(snapshot);
      TestLog.findings('testCrossMultipleEntryModules', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_MULTIPLE_ENTRY_MODULES');
      TestLog.flag('testCrossMultipleEntryModules', 'has code BUNDLE_MULTIPLE_ENTRY_MODULES', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMultipleEntryModules', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMultipleEntryModules', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMultipleEntryModules', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMultipleEntryModules', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMultipleEntryModules', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMultipleEntryModules', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMultipleEntryModules', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMultipleEntryModules', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMultipleEntryModules', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMultipleEntryModules', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateEntryModules(snapshot);
      TestLog.number('testCrossMultipleEntryModules', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMultipleEntryModules', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMultipleEntryModules', 'case end', 'crossmultipleentrymodules check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3605
     * @tc.name      testCrossMissingEntryModule
     * @tc.desc      Checks that a feature only bundle reports the missing entry module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMissingEntryModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = 
        ConfigFactory.snapshotWith([ConfigFactory.featureModuleNamed('feature'), 
          ConfigFactory.featureModuleNamed('feature2')]);
      TestLog.text('testCrossMissingEntryModule', 'case begin', 'crossmissingentrymodule check');
      TestLog.step('testCrossMissingEntryModule', 'crossmissingentrymodule check');
      const findings: Finding[] = CrossModuleValidator.validateEntryModules(snapshot);
      TestLog.findings('testCrossMissingEntryModule', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_NO_ENTRY_MODULE');
      TestLog.flag('testCrossMissingEntryModule', 'has code BUNDLE_NO_ENTRY_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMissingEntryModule', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMissingEntryModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMissingEntryModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMissingEntryModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMissingEntryModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMissingEntryModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMissingEntryModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMissingEntryModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMissingEntryModule', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMissingEntryModule', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateEntryModules(snapshot);
      TestLog.number('testCrossMissingEntryModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMissingEntryModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMissingEntryModule', 'case end', 'crossmissingentrymodule check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3606
     * @tc.name      testCrossAbilityCollision
     * @tc.desc      Checks that the same ability name declared by two modules is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossAbilityCollision',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const second: ModuleConfig = ConfigFactory.featureModuleNamed('feature2');
      second.abilities[0].name = 'EntryAbility';
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.entryModule(), second]);
      TestLog.text('testCrossAbilityCollision', 'case begin', 'crossabilitycollision check');
      TestLog.step('testCrossAbilityCollision', 'crossabilitycollision check');
      const findings: Finding[] = CrossModuleValidator.validateAbilityCollisions(snapshot);
      TestLog.findings('testCrossAbilityCollision', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ABILITY_NAME_COLLISION');
      TestLog.flag('testCrossAbilityCollision', 'has code BUNDLE_ABILITY_NAME_COLLISION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossAbilityCollision', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossAbilityCollision', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossAbilityCollision', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossAbilityCollision', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossAbilityCollision', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossAbilityCollision', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossAbilityCollision', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossAbilityCollision', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossAbilityCollision', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossAbilityCollision', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateAbilityCollisions(snapshot);
      TestLog.number('testCrossAbilityCollision', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossAbilityCollision', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossAbilityCollision', 'case end', 'crossabilitycollision check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3607
     * @tc.name      testCrossNoAbilityCollision
     * @tc.desc      Checks that distinct ability names produce no collision.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossNoAbilityCollision',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const second: ModuleConfig = ConfigFactory.featureModuleNamed('feature2');
      second.abilities[0].name = 'SecondaryAbility';
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.entryModule(), second]);
      TestLog.text('testCrossNoAbilityCollision', 'case begin', 'crossnoabilitycollision check');
      TestLog.step('testCrossNoAbilityCollision', 'crossnoabilitycollision check');
      const findings: Finding[] = CrossModuleValidator.validateAbilityCollisions(snapshot);
      TestLog.findings('testCrossNoAbilityCollision', 'cross module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossNoAbilityCollision', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossNoAbilityCollision', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossNoAbilityCollision', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossNoAbilityCollision', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossNoAbilityCollision', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossNoAbilityCollision', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossNoAbilityCollision', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossNoAbilityCollision', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossNoAbilityCollision', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateAbilityCollisions(snapshot);
      TestLog.number('testCrossNoAbilityCollision', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossNoAbilityCollision', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossNoAbilityCollision', 'case end', 'crossnoabilitycollision check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3608
     * @tc.name      testCrossOrphanFeature
     * @tc.desc      Checks that a feature module that is never preloaded is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossOrphanFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = 
        ConfigFactory.snapshotWith([ConfigFactory.entryModule(), ConfigFactory.featureModuleNamed('feature2')]);
      TestLog.text('testCrossOrphanFeature', 'case begin', 'crossorphanfeature check');
      TestLog.step('testCrossOrphanFeature', 'crossorphanfeature check');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossOrphanFeature', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossOrphanFeature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossOrphanFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossOrphanFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossOrphanFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossOrphanFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossOrphanFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossOrphanFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossOrphanFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossOrphanFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossOrphanFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossOrphanFeature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossOrphanFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossOrphanFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossOrphanFeature', 'case end', 'crossorphanfeature check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3609
     * @tc.name      testCrossPreloadUnknownModule
     * @tc.desc      Checks that a preload of an undeclared module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossPreloadUnknownModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'ghost' }];
      snapshot.modules[0].atomicService = block;
      TestLog.text('testCrossPreloadUnknownModule', 'case begin', 'crosspreloadunknownmodule check');
      TestLog.step('testCrossPreloadUnknownModule', 'crosspreloadunknownmodule check');
      const findings: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.findings('testCrossPreloadUnknownModule', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_PRELOAD_UNKNOWN_MODULE');
      TestLog.flag('testCrossPreloadUnknownModule', 'has code BUNDLE_PRELOAD_UNKNOWN_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossPreloadUnknownModule', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossPreloadUnknownModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossPreloadUnknownModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossPreloadUnknownModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossPreloadUnknownModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossPreloadUnknownModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossPreloadUnknownModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossPreloadUnknownModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossPreloadUnknownModule', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossPreloadUnknownModule', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.number('testCrossPreloadUnknownModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossPreloadUnknownModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossPreloadUnknownModule', 'case end', 'crosspreloadunknownmodule check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3610
     * @tc.name      testCrossPreloadSelfReference
     * @tc.desc      Checks that a module preloading itself is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossPreloadSelfReference',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'entry' }];
      snapshot.modules[0].atomicService = block;
      TestLog.text('testCrossPreloadSelfReference', 'case begin', 'crosspreloadselfreference check');
      TestLog.step('testCrossPreloadSelfReference', 'crosspreloadselfreference check');
      const findings: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.findings('testCrossPreloadSelfReference', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_PRELOAD_SELF_REFERENCE');
      TestLog.flag('testCrossPreloadSelfReference', 'has code BUNDLE_PRELOAD_SELF_REFERENCE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossPreloadSelfReference', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossPreloadSelfReference', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossPreloadSelfReference', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossPreloadSelfReference', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossPreloadSelfReference', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossPreloadSelfReference', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossPreloadSelfReference', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossPreloadSelfReference', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossPreloadSelfReference', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossPreloadSelfReference', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.number('testCrossPreloadSelfReference', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossPreloadSelfReference', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossPreloadSelfReference', 'case end', 'crosspreloadselfreference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3611
     * @tc.name      testCrossPreloadNotFeature
     * @tc.desc      Checks that a preload of a non feature module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossPreloadNotFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const second: ModuleConfig = ConfigFactory.entryModule();
      second.name = 'entry2';
      second.atomicService = null;
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.entryModule(), second]);
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'entry2' }];
      snapshot.modules[0].atomicService = block;
      TestLog.text('testCrossPreloadNotFeature', 'case begin', 'crosspreloadnotfeature check');
      TestLog.step('testCrossPreloadNotFeature', 'crosspreloadnotfeature check');
      const findings: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.findings('testCrossPreloadNotFeature', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_PRELOAD_NOT_FEATURE');
      TestLog.flag('testCrossPreloadNotFeature', 'has code BUNDLE_PRELOAD_NOT_FEATURE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossPreloadNotFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossPreloadNotFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossPreloadNotFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossPreloadNotFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossPreloadNotFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossPreloadNotFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossPreloadNotFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossPreloadNotFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossPreloadNotFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossPreloadNotFeature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.number('testCrossPreloadNotFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossPreloadNotFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossPreloadNotFeature', 'case end', 'crosspreloadnotfeature check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3612
     * @tc.name      testCrossPreloadCycle
     * @tc.desc      Checks that a preload dependency cycle is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossPreloadCycle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'entry' }];
      snapshot.modules[1].atomicService = block;
      TestLog.text('testCrossPreloadCycle', 'case begin', 'crosspreloadcycle check');
      TestLog.step('testCrossPreloadCycle', 'crosspreloadcycle check');
      const findings: Finding[] = CrossModuleValidator.validatePreloadCycles(snapshot);
      TestLog.findings('testCrossPreloadCycle', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_PRELOAD_CYCLE');
      TestLog.flag('testCrossPreloadCycle', 'has code BUNDLE_PRELOAD_CYCLE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossPreloadCycle', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossPreloadCycle', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossPreloadCycle', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossPreloadCycle', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossPreloadCycle', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossPreloadCycle', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossPreloadCycle', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossPreloadCycle', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossPreloadCycle', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossPreloadCycle', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloadCycles(snapshot);
      TestLog.number('testCrossPreloadCycle', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossPreloadCycle', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossPreloadCycle', 'case end', 'crosspreloadcycle check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3613
     * @tc.name      testCrossNoCycle
     * @tc.desc      Checks that a linear preload chain produces no cycle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossNoCycle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossNoCycle', 'case begin', 'crossnocycle check');
      TestLog.step('testCrossNoCycle', 'crossnocycle check');
      const findings: Finding[] = CrossModuleValidator.validatePreloadCycles(snapshot);
      TestLog.findings('testCrossNoCycle', 'cross module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossNoCycle', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossNoCycle', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossNoCycle', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossNoCycle', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossNoCycle', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossNoCycle', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossNoCycle', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossNoCycle', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossNoCycle', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloadCycles(snapshot);
      TestLog.number('testCrossNoCycle', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossNoCycle', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossNoCycle', 'case end', 'crossnocycle check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3614
     * @tc.name      testCrossValidPreloads
     * @tc.desc      Checks that the sample preload target resolves without findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossValidPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossValidPreloads', 'case begin', 'crossvalidpreloads check');
      TestLog.step('testCrossValidPreloads', 'crossvalidpreloads check');
      const findings: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.findings('testCrossValidPreloads', 'cross module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossValidPreloads', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossValidPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossValidPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossValidPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossValidPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossValidPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossValidPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossValidPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossValidPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validatePreloads(snapshot);
      TestLog.number('testCrossValidPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossValidPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossValidPreloads', 'case end', 'crossvalidpreloads check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3615
     * @tc.name      testCrossCountEntryModules
     * @tc.desc      Checks that the sample bundle declares exactly one entry module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossCountEntryModules',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossCountEntryModules', 'case begin', 'crosscountentrymodules check');
      TestLog.step('testCrossCountEntryModules', 'crosscountentrymodules check');
      const actual: number = CrossModuleValidator.countEntryModules(snapshot);
      TestLog.text('testCrossCountEntryModules', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testCrossCountEntryModules', 'case end', 'crosscountentrymodules check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3616
     * @tc.name      testCrossIndexFeatureModule
     * @tc.desc      Checks that the feature module is found at the second position.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossIndexFeatureModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossIndexFeatureModule', 'case begin', 'crossindexfeaturemodule check');
      TestLog.step('testCrossIndexFeatureModule', 'crossindexfeaturemodule check');
      const actual: number = CrossModuleValidator.indexOfModule(snapshot, 'feature');
      TestLog.text('testCrossIndexFeatureModule', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testCrossIndexFeatureModule', 'case end', 'crossindexfeaturemodule check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3617
     * @tc.name      testCrossUnknownModuleIndex
     * @tc.desc      Checks that an undeclared module has no index.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossUnknownModuleIndex',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossUnknownModuleIndex', 'case begin', 'crossunknownmoduleindex check');
      TestLog.step('testCrossUnknownModuleIndex', 'crossunknownmoduleindex check');
      const actual: number = CrossModuleValidator.indexOfModule(snapshot, 'ghost');
      TestLog.text('testCrossUnknownModuleIndex', 'actual value', String(actual));
      expect(actual).assertEqual(-1);
      TestLog.text('testCrossUnknownModuleIndex', 'case end', 'crossunknownmoduleindex check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3618
     * @tc.name      testCrossFindModuleMissing
     * @tc.desc      Checks that an undeclared module cannot be found.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossFindModuleMissing',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossFindModuleMissing', 'case begin', 'crossfindmodulemissing check');
      TestLog.step('testCrossFindModuleMissing', 'crossfindmodulemissing check');
      const actual: boolean = CrossModuleValidator.findModule(snapshot, 'ghost') === null;
      TestLog.text('testCrossFindModuleMissing', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testCrossFindModuleMissing', 'case end', 'crossfindmodulemissing check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3619
     * @tc.name      testCrossPreloadTargetsContainsFeature
     * @tc.desc      Checks that the preload target list contains the feature module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossPreloadTargetsContainsFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossPreloadTargetsContainsFeature', 'case begin', 'crosspreloadtargetscontainsfeature check');
      TestLog.step('testCrossPreloadTargetsContainsFeature', 'crosspreloadtargetscontainsfeature check');
      const actual: boolean = CrossModuleValidator.preloadTargets(snapshot).indexOf('feature') >= 0;
      TestLog.text('testCrossPreloadTargetsContainsFeature', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testCrossPreloadTargetsContainsFeature', 'case end', 'crosspreloadtargetscontainsfeature check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3620
     * @tc.name      testCrossEntryModuleCount
     * @tc.desc      Checks that the entry module helper returns one module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossEntryModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossEntryModuleCount', 'case begin', 'crossentrymodulecount check');
      TestLog.step('testCrossEntryModuleCount', 'crossentrymodulecount check');
      const actual: number = CrossModuleValidator.entryModules(snapshot).length;
      TestLog.text('testCrossEntryModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testCrossEntryModuleCount', 'case end', 'crossentrymodulecount check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3621
     * @tc.name      testCrossFeatureModuleCount
     * @tc.desc      Checks that the feature module helper returns one module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossFeatureModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testCrossFeatureModuleCount', 'case begin', 'crossfeaturemodulecount check');
      TestLog.step('testCrossFeatureModuleCount', 'crossfeaturemodulecount check');
      const actual: number = CrossModuleValidator.featureModules(snapshot).length;
      TestLog.text('testCrossFeatureModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testCrossFeatureModuleCount', 'case end', 'crossfeaturemodulecount check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3622
     * @tc.name      testCrossSevenModulesValid
     * @tc.desc      Checks that a bundle with one entry and six preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossSevenModulesValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      entry.atomicService = ConfigFactory.entryAtomicService();
      entry.atomicService.preloads = [];
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 6; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        feature.atomicService = ConfigFactory.entryAtomicService();
        feature.atomicService.preloads = [];
        modules.push(feature);
        entry.atomicService.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossSevenModulesValid', 'case begin', 'crosssevenmodulesvalid check');
      TestLog.step('testCrossSevenModulesValid', 'crosssevenmodulesvalid check');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossSevenModulesValid', 'cross module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossSevenModulesValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossSevenModulesValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossSevenModulesValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossSevenModulesValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossSevenModulesValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossSevenModulesValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossSevenModulesValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossSevenModulesValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossSevenModulesValid', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossSevenModulesValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossSevenModulesValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossSevenModulesValid', 'case end', 'crosssevenmodulesvalid check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3623
     * @tc.name      testCrossSevenModulesDuplicateName
     * @tc.desc      Checks that seven modules with a repeated name are reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossSevenModulesDuplicateName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      entry.atomicService = ConfigFactory.entryAtomicService();
      entry.atomicService.preloads = [];
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 6; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        feature.atomicService = ConfigFactory.entryAtomicService();
        feature.atomicService.preloads = [];
        modules.push(feature);
        entry.atomicService.preloads.push({ moduleName: `feature_${index}` });
      }
      modules[3].name = 'feature_1';
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossSevenModulesDuplicateName', 'case begin', 'crosssevenmodulesduplicatename check');
      TestLog.step('testCrossSevenModulesDuplicateName', 'crosssevenmodulesduplicatename check');
      const findings: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.findings('testCrossSevenModulesDuplicateName', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_DUPLICATE_MODULE_NAME');
      TestLog.flag('testCrossSevenModulesDuplicateName', 'has code BUNDLE_DUPLICATE_MODULE_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossSevenModulesDuplicateName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossSevenModulesDuplicateName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossSevenModulesDuplicateName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossSevenModulesDuplicateName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossSevenModulesDuplicateName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossSevenModulesDuplicateName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossSevenModulesDuplicateName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossSevenModulesDuplicateName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossSevenModulesDuplicateName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossSevenModulesDuplicateName', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.number('testCrossSevenModulesDuplicateName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossSevenModulesDuplicateName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossSevenModulesDuplicateName', 'case end', 'crosssevenmodulesduplicatename check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3624
     * @tc.name      testCrossTooManyModules
     * @tc.desc      Checks that more than fifty modules are warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossTooManyModules',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 0; index < 50; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossTooManyModules', 'case begin', 'crosstoomanymodules check');
      TestLog.step('testCrossTooManyModules', 'crosstoomanymodules check');
      const findings: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.findings('testCrossTooManyModules', 'cross module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_TOO_MANY_MODULES');
      TestLog.flag('testCrossTooManyModules', 'has code BUNDLE_TOO_MANY_MODULES', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossTooManyModules', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossTooManyModules', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossTooManyModules', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossTooManyModules', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossTooManyModules', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossTooManyModules', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossTooManyModules', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossTooManyModules', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossTooManyModules', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossTooManyModules', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateModuleList(snapshot);
      TestLog.number('testCrossTooManyModules', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossTooManyModules', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossTooManyModules', 'case end', 'crosstoomanymodules check');
    })

  })
}
