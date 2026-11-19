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
export default function ModuleMatrixTest(): void {
  describe('ModuleMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5700
     * @tc.name      testModuleMatrixEntryEntry
     * @tc.desc      Checks that module name Entry with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEntryEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixEntryEntry', 'case begin', 'module name entry with type entry');
      TestLog.step('testModuleMatrixEntryEntry', 'module name entry with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEntryEntry', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixEntryEntry', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEntryEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEntryEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEntryEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEntryEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEntryEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEntryEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEntryEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEntryEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEntryEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEntryEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEntryEntry', 'case end', 'module name entry with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5701
     * @tc.name      testModuleMatrixEntryFeature
     * @tc.desc      Checks that module name Entry with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEntryFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixEntryFeature', 'case begin', 'module name entry with type feature');
      TestLog.step('testModuleMatrixEntryFeature', 'module name entry with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEntryFeature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixEntryFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEntryFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEntryFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEntryFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEntryFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEntryFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEntryFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEntryFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEntryFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEntryFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEntryFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEntryFeature', 'case end', 'module name entry with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5702
     * @tc.name      testModuleMatrixEntryShared
     * @tc.desc      Checks that module name Entry with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEntryShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixEntryShared', 'case begin', 'module name entry with type shared');
      TestLog.step('testModuleMatrixEntryShared', 'module name entry with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEntryShared', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixEntryShared', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEntryShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEntryShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEntryShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEntryShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEntryShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEntryShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEntryShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEntryShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEntryShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEntryShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEntryShared', 'case end', 'module name entry with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5703
     * @tc.name      testModuleMatrixEntryPlugin
     * @tc.desc      Checks that module name Entry with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEntryPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixEntryPlugin', 'case begin', 'module name entry with type plugin');
      TestLog.step('testModuleMatrixEntryPlugin', 'module name entry with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEntryPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixEntryPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEntryPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEntryPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEntryPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEntryPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEntryPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEntryPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEntryPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEntryPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEntryPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEntryPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEntryPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEntryPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEntryPlugin', 'case end', 'module name entry with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5704
     * @tc.name      testModuleMatrixEntryEmpty
     * @tc.desc      Checks that module name Entry with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEntryEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixEntryEmpty', 'case begin', 'module name entry with type empty');
      TestLog.step('testModuleMatrixEntryEmpty', 'module name entry with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEntryEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixEntryEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEntryEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEntryEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEntryEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEntryEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEntryEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEntryEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEntryEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEntryEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEntryEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEntryEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEntryEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEntryEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEntryEmpty', 'case end', 'module name entry with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5705
     * @tc.name      testModuleMatrixFeatureEntry
     * @tc.desc      Checks that module name Feature with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixFeatureEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixFeatureEntry', 'case begin', 'module name feature with type entry');
      TestLog.step('testModuleMatrixFeatureEntry', 'module name feature with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixFeatureEntry', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixFeatureEntry', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixFeatureEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixFeatureEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixFeatureEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixFeatureEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixFeatureEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixFeatureEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixFeatureEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixFeatureEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixFeatureEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixFeatureEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixFeatureEntry', 'case end', 'module name feature with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5706
     * @tc.name      testModuleMatrixFeatureFeature
     * @tc.desc      Checks that module name Feature with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixFeatureFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixFeatureFeature', 'case begin', 'module name feature with type feature');
      TestLog.step('testModuleMatrixFeatureFeature', 'module name feature with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixFeatureFeature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixFeatureFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixFeatureFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixFeatureFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixFeatureFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixFeatureFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixFeatureFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixFeatureFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixFeatureFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixFeatureFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixFeatureFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixFeatureFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixFeatureFeature', 'case end', 'module name feature with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5707
     * @tc.name      testModuleMatrixFeatureShared
     * @tc.desc      Checks that module name Feature with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixFeatureShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixFeatureShared', 'case begin', 'module name feature with type shared');
      TestLog.step('testModuleMatrixFeatureShared', 'module name feature with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixFeatureShared', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixFeatureShared', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixFeatureShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixFeatureShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixFeatureShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixFeatureShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixFeatureShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixFeatureShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixFeatureShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixFeatureShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixFeatureShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixFeatureShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixFeatureShared', 'case end', 'module name feature with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5708
     * @tc.name      testModuleMatrixFeaturePlugin
     * @tc.desc      Checks that module name Feature with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixFeaturePlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixFeaturePlugin', 'case begin', 'module name feature with type plugin');
      TestLog.step('testModuleMatrixFeaturePlugin', 'module name feature with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixFeaturePlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixFeaturePlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixFeaturePlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixFeaturePlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixFeaturePlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixFeaturePlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixFeaturePlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixFeaturePlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixFeaturePlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixFeaturePlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixFeaturePlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixFeaturePlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixFeaturePlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixFeaturePlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixFeaturePlugin', 'case end', 'module name feature with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5709
     * @tc.name      testModuleMatrixFeatureEmpty
     * @tc.desc      Checks that module name Feature with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixFeatureEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixFeatureEmpty', 'case begin', 'module name feature with type empty');
      TestLog.step('testModuleMatrixFeatureEmpty', 'module name feature with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixFeatureEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixFeatureEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixFeatureEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixFeatureEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixFeatureEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixFeatureEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixFeatureEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixFeatureEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixFeatureEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixFeatureEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixFeatureEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixFeatureEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixFeatureEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixFeatureEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixFeatureEmpty', 'case end', 'module name feature with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5710
     * @tc.name      testModuleMatrixSnakeEntry
     * @tc.desc      Checks that module name Snake with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSnakeEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixSnakeEntry', 'case begin', 'module name snake with type entry');
      TestLog.step('testModuleMatrixSnakeEntry', 'module name snake with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSnakeEntry', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixSnakeEntry', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSnakeEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSnakeEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSnakeEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSnakeEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSnakeEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSnakeEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSnakeEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSnakeEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSnakeEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSnakeEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSnakeEntry', 'case end', 'module name snake with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5711
     * @tc.name      testModuleMatrixSnakeFeature
     * @tc.desc      Checks that module name Snake with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSnakeFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixSnakeFeature', 'case begin', 'module name snake with type feature');
      TestLog.step('testModuleMatrixSnakeFeature', 'module name snake with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSnakeFeature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixSnakeFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSnakeFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSnakeFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSnakeFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSnakeFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSnakeFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSnakeFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSnakeFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSnakeFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSnakeFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSnakeFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSnakeFeature', 'case end', 'module name snake with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5712
     * @tc.name      testModuleMatrixSnakeShared
     * @tc.desc      Checks that module name Snake with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSnakeShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixSnakeShared', 'case begin', 'module name snake with type shared');
      TestLog.step('testModuleMatrixSnakeShared', 'module name snake with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSnakeShared', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMatrixSnakeShared', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSnakeShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSnakeShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSnakeShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSnakeShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSnakeShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSnakeShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSnakeShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSnakeShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSnakeShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSnakeShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSnakeShared', 'case end', 'module name snake with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5713
     * @tc.name      testModuleMatrixSnakePlugin
     * @tc.desc      Checks that module name Snake with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSnakePlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixSnakePlugin', 'case begin', 'module name snake with type plugin');
      TestLog.step('testModuleMatrixSnakePlugin', 'module name snake with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSnakePlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixSnakePlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSnakePlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSnakePlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSnakePlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSnakePlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSnakePlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSnakePlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSnakePlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSnakePlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSnakePlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSnakePlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSnakePlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSnakePlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSnakePlugin', 'case end', 'module name snake with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5714
     * @tc.name      testModuleMatrixSnakeEmpty
     * @tc.desc      Checks that module name Snake with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSnakeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixSnakeEmpty', 'case begin', 'module name snake with type empty');
      TestLog.step('testModuleMatrixSnakeEmpty', 'module name snake with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSnakeEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixSnakeEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSnakeEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSnakeEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSnakeEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSnakeEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSnakeEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSnakeEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSnakeEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSnakeEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSnakeEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSnakeEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSnakeEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSnakeEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSnakeEmpty', 'case end', 'module name snake with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5715
     * @tc.name      testModuleMatrixUpperEntry
     * @tc.desc      Checks that module name Upper with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixUpperEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixUpperEntry', 'case begin', 'module name upper with type entry');
      TestLog.step('testModuleMatrixUpperEntry', 'module name upper with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixUpperEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleMatrixUpperEntry', 'has code MODULE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixUpperEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixUpperEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixUpperEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixUpperEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixUpperEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixUpperEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixUpperEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixUpperEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixUpperEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixUpperEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixUpperEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixUpperEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixUpperEntry', 'case end', 'module name upper with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5716
     * @tc.name      testModuleMatrixUpperFeature
     * @tc.desc      Checks that module name Upper with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixUpperFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixUpperFeature', 'case begin', 'module name upper with type feature');
      TestLog.step('testModuleMatrixUpperFeature', 'module name upper with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixUpperFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleMatrixUpperFeature', 'has code MODULE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixUpperFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixUpperFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixUpperFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixUpperFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixUpperFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixUpperFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixUpperFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixUpperFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixUpperFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixUpperFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixUpperFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixUpperFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixUpperFeature', 'case end', 'module name upper with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5717
     * @tc.name      testModuleMatrixUpperShared
     * @tc.desc      Checks that module name Upper with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixUpperShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixUpperShared', 'case begin', 'module name upper with type shared');
      TestLog.step('testModuleMatrixUpperShared', 'module name upper with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixUpperShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleMatrixUpperShared', 'has code MODULE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixUpperShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixUpperShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixUpperShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixUpperShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixUpperShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixUpperShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixUpperShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixUpperShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixUpperShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixUpperShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixUpperShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixUpperShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixUpperShared', 'case end', 'module name upper with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5718
     * @tc.name      testModuleMatrixUpperPlugin
     * @tc.desc      Checks that module name Upper with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixUpperPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixUpperPlugin', 'case begin', 'module name upper with type plugin');
      TestLog.step('testModuleMatrixUpperPlugin', 'module name upper with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixUpperPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleMatrixUpperPlugin', 'has code MODULE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixUpperPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixUpperPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixUpperPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixUpperPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixUpperPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixUpperPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixUpperPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixUpperPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixUpperPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixUpperPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixUpperPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixUpperPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixUpperPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixUpperPlugin', 'case end', 'module name upper with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5719
     * @tc.name      testModuleMatrixUpperEmpty
     * @tc.desc      Checks that module name Upper with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixUpperEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixUpperEmpty', 'case begin', 'module name upper with type empty');
      TestLog.step('testModuleMatrixUpperEmpty', 'module name upper with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixUpperEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleMatrixUpperEmpty', 'has code MODULE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixUpperEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixUpperEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixUpperEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixUpperEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixUpperEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixUpperEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixUpperEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixUpperEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixUpperEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixUpperEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixUpperEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixUpperEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixUpperEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixUpperEmpty', 'case end', 'module name upper with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5720
     * @tc.name      testModuleMatrixEmptyEntry
     * @tc.desc      Checks that module name Empty with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEmptyEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixEmptyEntry', 'case begin', 'module name empty with type entry');
      TestLog.step('testModuleMatrixEmptyEntry', 'module name empty with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEmptyEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleMatrixEmptyEntry', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEmptyEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEmptyEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEmptyEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEmptyEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEmptyEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEmptyEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEmptyEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEmptyEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEmptyEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEmptyEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEmptyEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEmptyEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEmptyEntry', 'case end', 'module name empty with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5721
     * @tc.name      testModuleMatrixEmptyFeature
     * @tc.desc      Checks that module name Empty with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEmptyFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixEmptyFeature', 'case begin', 'module name empty with type feature');
      TestLog.step('testModuleMatrixEmptyFeature', 'module name empty with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEmptyFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleMatrixEmptyFeature', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEmptyFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEmptyFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEmptyFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEmptyFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEmptyFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEmptyFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEmptyFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEmptyFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEmptyFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEmptyFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEmptyFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEmptyFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEmptyFeature', 'case end', 'module name empty with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5722
     * @tc.name      testModuleMatrixEmptyShared
     * @tc.desc      Checks that module name Empty with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEmptyShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixEmptyShared', 'case begin', 'module name empty with type shared');
      TestLog.step('testModuleMatrixEmptyShared', 'module name empty with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEmptyShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleMatrixEmptyShared', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEmptyShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEmptyShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEmptyShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEmptyShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEmptyShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEmptyShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEmptyShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEmptyShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEmptyShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEmptyShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEmptyShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEmptyShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEmptyShared', 'case end', 'module name empty with type shared');
    })

    /**