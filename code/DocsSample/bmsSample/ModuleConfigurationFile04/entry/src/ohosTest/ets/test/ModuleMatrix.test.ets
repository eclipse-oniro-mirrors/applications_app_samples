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
     * @tc.number    SUB_SYS_MODULE_CONFIG_5723
     * @tc.name      testModuleMatrixEmptyPlugin
     * @tc.desc      Checks that module name Empty with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEmptyPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixEmptyPlugin', 'case begin', 'module name empty with type plugin');
      TestLog.step('testModuleMatrixEmptyPlugin', 'module name empty with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEmptyPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleMatrixEmptyPlugin', 'has code MODULE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixEmptyPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEmptyPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEmptyPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEmptyPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEmptyPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEmptyPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEmptyPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEmptyPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEmptyPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEmptyPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEmptyPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEmptyPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEmptyPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEmptyPlugin', 'case end', 'module name empty with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5724
     * @tc.name      testModuleMatrixEmptyEmpty
     * @tc.desc      Checks that module name Empty with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixEmptyEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixEmptyEmpty', 'case begin', 'module name empty with type empty');
      TestLog.step('testModuleMatrixEmptyEmpty', 'module name empty with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixEmptyEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleMatrixEmptyEmpty', 'has code MODULE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixEmptyEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixEmptyEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixEmptyEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixEmptyEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixEmptyEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixEmptyEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixEmptyEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixEmptyEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixEmptyEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixEmptyEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixEmptyEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixEmptyEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixEmptyEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixEmptyEmpty', 'case end', 'module name empty with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5725
     * @tc.name      testModuleMatrixLeadingDigitEntry
     * @tc.desc      Checks that module name LeadingDigit with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingDigitEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixLeadingDigitEntry', 'case begin', 'module name leadingdigit with type entry');
      TestLog.step('testModuleMatrixLeadingDigitEntry', 'module name leadingdigit with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingDigitEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleMatrixLeadingDigitEntry', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingDigitEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingDigitEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingDigitEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingDigitEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingDigitEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingDigitEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingDigitEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingDigitEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingDigitEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingDigitEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingDigitEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingDigitEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingDigitEntry', 'case end', 'module name leadingdigit with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5726
     * @tc.name      testModuleMatrixLeadingDigitFeature
     * @tc.desc      Checks that module name LeadingDigit with type Feature is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingDigitFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixLeadingDigitFeature', 'case begin', 'module name leadingdigit with type feature');
      TestLog.step('testModuleMatrixLeadingDigitFeature', 'module name leadingdigit with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingDigitFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleMatrixLeadingDigitFeature', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingDigitFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingDigitFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingDigitFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingDigitFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingDigitFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingDigitFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingDigitFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingDigitFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingDigitFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingDigitFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingDigitFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingDigitFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingDigitFeature', 'case end', 'module name leadingdigit with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5727
     * @tc.name      testModuleMatrixLeadingDigitShared
     * @tc.desc      Checks that module name LeadingDigit with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingDigitShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixLeadingDigitShared', 'case begin', 'module name leadingdigit with type shared');
      TestLog.step('testModuleMatrixLeadingDigitShared', 'module name leadingdigit with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingDigitShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleMatrixLeadingDigitShared', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingDigitShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingDigitShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingDigitShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingDigitShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingDigitShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingDigitShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingDigitShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingDigitShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingDigitShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingDigitShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingDigitShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingDigitShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingDigitShared', 'case end', 'module name leadingdigit with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5728
     * @tc.name      testModuleMatrixLeadingDigitPlugin
     * @tc.desc      Checks that module name LeadingDigit with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingDigitPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixLeadingDigitPlugin', 'case begin', 'module name leadingdigit with type plugin');
      TestLog.step('testModuleMatrixLeadingDigitPlugin', 'module name leadingdigit with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingDigitPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleMatrixLeadingDigitPlugin', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixLeadingDigitPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingDigitPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingDigitPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingDigitPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingDigitPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingDigitPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingDigitPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingDigitPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingDigitPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingDigitPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingDigitPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingDigitPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingDigitPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingDigitPlugin', 'case end', 'module name leadingdigit with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5729
     * @tc.name      testModuleMatrixLeadingDigitEmpty
     * @tc.desc      Checks that module name LeadingDigit with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingDigitEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixLeadingDigitEmpty', 'case begin', 'module name leadingdigit with type empty');
      TestLog.step('testModuleMatrixLeadingDigitEmpty', 'module name leadingdigit with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingDigitEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleMatrixLeadingDigitEmpty', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixLeadingDigitEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingDigitEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingDigitEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingDigitEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingDigitEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingDigitEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingDigitEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingDigitEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingDigitEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingDigitEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingDigitEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingDigitEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingDigitEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingDigitEmpty', 'case end', 'module name leadingdigit with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5730
     * @tc.name      testModuleMatrixHyphenEntry
     * @tc.desc      Checks that module name Hyphen with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixHyphenEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixHyphenEntry', 'case begin', 'module name hyphen with type entry');
      TestLog.step('testModuleMatrixHyphenEntry', 'module name hyphen with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixHyphenEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleMatrixHyphenEntry', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixHyphenEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixHyphenEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixHyphenEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixHyphenEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixHyphenEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixHyphenEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixHyphenEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixHyphenEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixHyphenEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixHyphenEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixHyphenEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixHyphenEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixHyphenEntry', 'case end', 'module name hyphen with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5731
     * @tc.name      testModuleMatrixHyphenFeature
     * @tc.desc      Checks that module name Hyphen with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixHyphenFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixHyphenFeature', 'case begin', 'module name hyphen with type feature');
      TestLog.step('testModuleMatrixHyphenFeature', 'module name hyphen with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixHyphenFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleMatrixHyphenFeature', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixHyphenFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixHyphenFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixHyphenFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixHyphenFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixHyphenFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixHyphenFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixHyphenFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixHyphenFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixHyphenFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixHyphenFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixHyphenFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixHyphenFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixHyphenFeature', 'case end', 'module name hyphen with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5732
     * @tc.name      testModuleMatrixHyphenShared
     * @tc.desc      Checks that module name Hyphen with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixHyphenShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixHyphenShared', 'case begin', 'module name hyphen with type shared');
      TestLog.step('testModuleMatrixHyphenShared', 'module name hyphen with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixHyphenShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleMatrixHyphenShared', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixHyphenShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixHyphenShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixHyphenShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixHyphenShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixHyphenShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixHyphenShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixHyphenShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixHyphenShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixHyphenShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixHyphenShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixHyphenShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixHyphenShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixHyphenShared', 'case end', 'module name hyphen with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5733
     * @tc.name      testModuleMatrixHyphenPlugin
     * @tc.desc      Checks that module name Hyphen with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixHyphenPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixHyphenPlugin', 'case begin', 'module name hyphen with type plugin');
      TestLog.step('testModuleMatrixHyphenPlugin', 'module name hyphen with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixHyphenPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleMatrixHyphenPlugin', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixHyphenPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixHyphenPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixHyphenPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixHyphenPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixHyphenPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixHyphenPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixHyphenPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixHyphenPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixHyphenPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixHyphenPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixHyphenPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixHyphenPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixHyphenPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixHyphenPlugin', 'case end', 'module name hyphen with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5734
     * @tc.name      testModuleMatrixHyphenEmpty
     * @tc.desc      Checks that module name Hyphen with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixHyphenEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixHyphenEmpty', 'case begin', 'module name hyphen with type empty');
      TestLog.step('testModuleMatrixHyphenEmpty', 'module name hyphen with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixHyphenEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleMatrixHyphenEmpty', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixHyphenEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixHyphenEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixHyphenEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixHyphenEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixHyphenEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixHyphenEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixHyphenEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixHyphenEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixHyphenEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixHyphenEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixHyphenEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixHyphenEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixHyphenEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixHyphenEmpty', 'case end', 'module name hyphen with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5735
     * @tc.name      testModuleMatrixSpaceEntry
     * @tc.desc      Checks that module name Space with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSpaceEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixSpaceEntry', 'case begin', 'module name space with type entry');
      TestLog.step('testModuleMatrixSpaceEntry', 'module name space with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSpaceEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleMatrixSpaceEntry', 'has code MODULE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSpaceEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSpaceEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSpaceEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSpaceEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSpaceEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSpaceEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSpaceEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSpaceEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSpaceEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSpaceEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSpaceEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSpaceEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSpaceEntry', 'case end', 'module name space with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5736
     * @tc.name      testModuleMatrixSpaceFeature
     * @tc.desc      Checks that module name Space with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSpaceFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixSpaceFeature', 'case begin', 'module name space with type feature');
      TestLog.step('testModuleMatrixSpaceFeature', 'module name space with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSpaceFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleMatrixSpaceFeature', 'has code MODULE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSpaceFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSpaceFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSpaceFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSpaceFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSpaceFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSpaceFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSpaceFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSpaceFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSpaceFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSpaceFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSpaceFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSpaceFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSpaceFeature', 'case end', 'module name space with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5737
     * @tc.name      testModuleMatrixSpaceShared
     * @tc.desc      Checks that module name Space with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSpaceShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixSpaceShared', 'case begin', 'module name space with type shared');
      TestLog.step('testModuleMatrixSpaceShared', 'module name space with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSpaceShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleMatrixSpaceShared', 'has code MODULE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSpaceShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSpaceShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSpaceShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSpaceShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSpaceShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSpaceShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSpaceShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSpaceShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSpaceShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSpaceShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSpaceShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSpaceShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSpaceShared', 'case end', 'module name space with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5738
     * @tc.name      testModuleMatrixSpacePlugin
     * @tc.desc      Checks that module name Space with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSpacePlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixSpacePlugin', 'case begin', 'module name space with type plugin');
      TestLog.step('testModuleMatrixSpacePlugin', 'module name space with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSpacePlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleMatrixSpacePlugin', 'has code MODULE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixSpacePlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSpacePlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSpacePlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSpacePlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSpacePlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSpacePlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSpacePlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSpacePlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSpacePlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSpacePlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSpacePlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSpacePlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSpacePlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSpacePlugin', 'case end', 'module name space with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5739
     * @tc.name      testModuleMatrixSpaceEmpty
     * @tc.desc      Checks that module name Space with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixSpaceEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixSpaceEmpty', 'case begin', 'module name space with type empty');
      TestLog.step('testModuleMatrixSpaceEmpty', 'module name space with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixSpaceEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleMatrixSpaceEmpty', 'has code MODULE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixSpaceEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixSpaceEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixSpaceEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixSpaceEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixSpaceEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixSpaceEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixSpaceEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixSpaceEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixSpaceEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixSpaceEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixSpaceEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixSpaceEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixSpaceEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixSpaceEmpty', 'case end', 'module name space with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5740
     * @tc.name      testModuleMatrixLeadingUnderscoreEntry
     * @tc.desc      Checks that module name LeadingUnderscore with type Entry is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingUnderscoreEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 
        'case begin', 'module name leadingunderscore with type entry');
      TestLog.step('testModuleMatrixLeadingUnderscoreEntry', 'module name leadingunderscore with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingUnderscoreEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixLeadingUnderscoreEntry', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingUnderscoreEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingUnderscoreEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingUnderscoreEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingUnderscoreEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingUnderscoreEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingUnderscoreEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingUnderscoreEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingUnderscoreEntry', 
        'case end', 'module name leadingunderscore with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5741
     * @tc.name      testModuleMatrixLeadingUnderscoreFeature
     * @tc.desc      Checks that module name LeadingUnderscore with type Feature is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingUnderscoreFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 
        'case begin', 'module name leadingunderscore with type feature');
      TestLog.step('testModuleMatrixLeadingUnderscoreFeature', 'module name leadingunderscore with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingUnderscoreFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixLeadingUnderscoreFeature', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingUnderscoreFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingUnderscoreFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingUnderscoreFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingUnderscoreFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingUnderscoreFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingUnderscoreFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingUnderscoreFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingUnderscoreFeature', 
        'case end', 'module name leadingunderscore with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5742
     * @tc.name      testModuleMatrixLeadingUnderscoreShared
     * @tc.desc      Checks that module name LeadingUnderscore with type Shared is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingUnderscoreShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixLeadingUnderscoreShared', 
        'case begin', 'module name leadingunderscore with type shared');
      TestLog.step('testModuleMatrixLeadingUnderscoreShared', 'module name leadingunderscore with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingUnderscoreShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixLeadingUnderscoreShared', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingUnderscoreShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingUnderscoreShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingUnderscoreShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingUnderscoreShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingUnderscoreShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingUnderscoreShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingUnderscoreShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingUnderscoreShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingUnderscoreShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingUnderscoreShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingUnderscoreShared', 
        'case end', 'module name leadingunderscore with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5743
     * @tc.name      testModuleMatrixLeadingUnderscorePlugin
     * @tc.desc      Checks that module name LeadingUnderscore with type Plugin is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingUnderscorePlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 
        'case begin', 'module name leadingunderscore with type plugin');
      TestLog.step('testModuleMatrixLeadingUnderscorePlugin', 'module name leadingunderscore with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingUnderscorePlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixLeadingUnderscorePlugin', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixLeadingUnderscorePlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingUnderscorePlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingUnderscorePlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingUnderscorePlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingUnderscorePlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingUnderscorePlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingUnderscorePlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingUnderscorePlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingUnderscorePlugin', 
        'case end', 'module name leadingunderscore with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5744
     * @tc.name      testModuleMatrixLeadingUnderscoreEmpty
     * @tc.desc      Checks that module name LeadingUnderscore with type Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixLeadingUnderscoreEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 
        'case begin', 'module name leadingunderscore with type empty');
      TestLog.step('testModuleMatrixLeadingUnderscoreEmpty', 'module name leadingunderscore with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixLeadingUnderscoreEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixLeadingUnderscoreEmpty', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixLeadingUnderscoreEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixLeadingUnderscoreEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixLeadingUnderscoreEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixLeadingUnderscoreEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixLeadingUnderscoreEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixLeadingUnderscoreEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixLeadingUnderscoreEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixLeadingUnderscoreEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixLeadingUnderscoreEmpty', 
        'case end', 'module name leadingunderscore with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5745
     * @tc.name      testModuleMatrixTrailingUnderscoreEntry
     * @tc.desc      Checks that module name TrailingUnderscore with type Entry is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTrailingUnderscoreEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 
        'case begin', 'module name trailingunderscore with type entry');
      TestLog.step('testModuleMatrixTrailingUnderscoreEntry', 'module name trailingunderscore with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTrailingUnderscoreEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixTrailingUnderscoreEntry', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTrailingUnderscoreEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTrailingUnderscoreEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTrailingUnderscoreEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTrailingUnderscoreEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTrailingUnderscoreEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTrailingUnderscoreEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTrailingUnderscoreEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTrailingUnderscoreEntry', 
        'case end', 'module name trailingunderscore with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5746
     * @tc.name      testModuleMatrixTrailingUnderscoreFeature
     * @tc.desc      Checks that module name TrailingUnderscore with type Feature is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTrailingUnderscoreFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 
        'case begin', 'module name trailingunderscore with type feature');
      TestLog.step('testModuleMatrixTrailingUnderscoreFeature', 'module name trailingunderscore with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTrailingUnderscoreFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixTrailingUnderscoreFeature', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTrailingUnderscoreFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTrailingUnderscoreFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTrailingUnderscoreFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTrailingUnderscoreFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTrailingUnderscoreFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTrailingUnderscoreFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTrailingUnderscoreFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTrailingUnderscoreFeature', 
        'case end', 'module name trailingunderscore with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5747
     * @tc.name      testModuleMatrixTrailingUnderscoreShared
     * @tc.desc      Checks that module name TrailingUnderscore with type Shared is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTrailingUnderscoreShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixTrailingUnderscoreShared', 
        'case begin', 'module name trailingunderscore with type shared');
      TestLog.step('testModuleMatrixTrailingUnderscoreShared', 'module name trailingunderscore with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTrailingUnderscoreShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixTrailingUnderscoreShared', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTrailingUnderscoreShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTrailingUnderscoreShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTrailingUnderscoreShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTrailingUnderscoreShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTrailingUnderscoreShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTrailingUnderscoreShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTrailingUnderscoreShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTrailingUnderscoreShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTrailingUnderscoreShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTrailingUnderscoreShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTrailingUnderscoreShared', 
        'case end', 'module name trailingunderscore with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5748
     * @tc.name      testModuleMatrixTrailingUnderscorePlugin
     * @tc.desc      Checks that module name TrailingUnderscore with type Plugin is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTrailingUnderscorePlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 
        'case begin', 'module name trailingunderscore with type plugin');
      TestLog.step('testModuleMatrixTrailingUnderscorePlugin', 'module name trailingunderscore with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTrailingUnderscorePlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixTrailingUnderscorePlugin', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixTrailingUnderscorePlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTrailingUnderscorePlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTrailingUnderscorePlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTrailingUnderscorePlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTrailingUnderscorePlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTrailingUnderscorePlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTrailingUnderscorePlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTrailingUnderscorePlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTrailingUnderscorePlugin', 
        'case end', 'module name trailingunderscore with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5749
     * @tc.name      testModuleMatrixTrailingUnderscoreEmpty
     * @tc.desc      Checks that module name TrailingUnderscore with type Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTrailingUnderscoreEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 
        'case begin', 'module name trailingunderscore with type empty');
      TestLog.step('testModuleMatrixTrailingUnderscoreEmpty', 'module name trailingunderscore with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTrailingUnderscoreEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleMatrixTrailingUnderscoreEmpty', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixTrailingUnderscoreEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTrailingUnderscoreEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTrailingUnderscoreEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTrailingUnderscoreEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTrailingUnderscoreEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTrailingUnderscoreEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTrailingUnderscoreEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTrailingUnderscoreEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTrailingUnderscoreEmpty', 
        'case end', 'module name trailingunderscore with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5750
     * @tc.name      testModuleMatrixReservedEntry
     * @tc.desc      Checks that module name Reserved with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixReservedEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixReservedEntry', 'case begin', 'module name reserved with type entry');
      TestLog.step('testModuleMatrixReservedEntry', 'module name reserved with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixReservedEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleMatrixReservedEntry', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixReservedEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixReservedEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixReservedEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixReservedEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixReservedEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixReservedEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixReservedEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixReservedEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixReservedEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixReservedEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixReservedEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixReservedEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixReservedEntry', 'case end', 'module name reserved with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5751
     * @tc.name      testModuleMatrixReservedFeature
     * @tc.desc      Checks that module name Reserved with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixReservedFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixReservedFeature', 'case begin', 'module name reserved with type feature');
      TestLog.step('testModuleMatrixReservedFeature', 'module name reserved with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixReservedFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleMatrixReservedFeature', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixReservedFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixReservedFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixReservedFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixReservedFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixReservedFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixReservedFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixReservedFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixReservedFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixReservedFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixReservedFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixReservedFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixReservedFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixReservedFeature', 'case end', 'module name reserved with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5752
     * @tc.name      testModuleMatrixReservedShared
     * @tc.desc      Checks that module name Reserved with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixReservedShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixReservedShared', 'case begin', 'module name reserved with type shared');
      TestLog.step('testModuleMatrixReservedShared', 'module name reserved with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixReservedShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleMatrixReservedShared', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixReservedShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixReservedShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixReservedShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixReservedShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixReservedShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixReservedShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixReservedShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixReservedShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixReservedShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixReservedShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixReservedShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixReservedShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixReservedShared', 'case end', 'module name reserved with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5753
     * @tc.name      testModuleMatrixReservedPlugin
     * @tc.desc      Checks that module name Reserved with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixReservedPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixReservedPlugin', 'case begin', 'module name reserved with type plugin');
      TestLog.step('testModuleMatrixReservedPlugin', 'module name reserved with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixReservedPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleMatrixReservedPlugin', 'has code MODULE_NAME_RESERVED', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixReservedPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixReservedPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixReservedPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixReservedPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixReservedPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixReservedPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixReservedPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixReservedPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixReservedPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixReservedPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixReservedPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixReservedPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixReservedPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixReservedPlugin', 'case end', 'module name reserved with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5754
     * @tc.name      testModuleMatrixReservedEmpty
     * @tc.desc      Checks that module name Reserved with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixReservedEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixReservedEmpty', 'case begin', 'module name reserved with type empty');
      TestLog.step('testModuleMatrixReservedEmpty', 'module name reserved with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixReservedEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleMatrixReservedEmpty', 'has code MODULE_NAME_RESERVED', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixReservedEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixReservedEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixReservedEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixReservedEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixReservedEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixReservedEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixReservedEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixReservedEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixReservedEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixReservedEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixReservedEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixReservedEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixReservedEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixReservedEmpty', 'case end', 'module name reserved with type empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5755
     * @tc.name      testModuleMatrixTooLongEntry
     * @tc.desc      Checks that module name TooLong with type Entry is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTooLongEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = ('a'.repeat(33));
      moduleConfig.type = 'entry';
      TestLog.text('testModuleMatrixTooLongEntry', 'case begin', 'module name toolong with type entry');
      TestLog.step('testModuleMatrixTooLongEntry', 'module name toolong with type entry');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTooLongEntry', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleMatrixTooLongEntry', 'has code MODULE_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTooLongEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTooLongEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTooLongEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTooLongEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTooLongEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTooLongEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTooLongEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTooLongEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTooLongEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTooLongEntry', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTooLongEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTooLongEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTooLongEntry', 'case end', 'module name toolong with type entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5756
     * @tc.name      testModuleMatrixTooLongFeature
     * @tc.desc      Checks that module name TooLong with type Feature is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTooLongFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = ('a'.repeat(33));
      moduleConfig.type = 'feature';
      TestLog.text('testModuleMatrixTooLongFeature', 'case begin', 'module name toolong with type feature');
      TestLog.step('testModuleMatrixTooLongFeature', 'module name toolong with type feature');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTooLongFeature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleMatrixTooLongFeature', 'has code MODULE_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTooLongFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTooLongFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTooLongFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTooLongFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTooLongFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTooLongFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTooLongFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTooLongFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTooLongFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTooLongFeature', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTooLongFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTooLongFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTooLongFeature', 'case end', 'module name toolong with type feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5757
     * @tc.name      testModuleMatrixTooLongShared
     * @tc.desc      Checks that module name TooLong with type Shared is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTooLongShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = ('a'.repeat(33));
      moduleConfig.type = 'shared';
      TestLog.text('testModuleMatrixTooLongShared', 'case begin', 'module name toolong with type shared');
      TestLog.step('testModuleMatrixTooLongShared', 'module name toolong with type shared');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTooLongShared', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleMatrixTooLongShared', 'has code MODULE_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTooLongShared', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTooLongShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTooLongShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTooLongShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTooLongShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTooLongShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTooLongShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTooLongShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTooLongShared', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTooLongShared', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTooLongShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTooLongShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTooLongShared', 'case end', 'module name toolong with type shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5758
     * @tc.name      testModuleMatrixTooLongPlugin
     * @tc.desc      Checks that module name TooLong with type Plugin is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTooLongPlugin',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = ('a'.repeat(33));
      moduleConfig.type = 'plugin';
      TestLog.text('testModuleMatrixTooLongPlugin', 'case begin', 'module name toolong with type plugin');
      TestLog.step('testModuleMatrixTooLongPlugin', 'module name toolong with type plugin');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTooLongPlugin', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleMatrixTooLongPlugin', 'has code MODULE_NAME_TOO_LONG', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleMatrixTooLongPlugin', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTooLongPlugin', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTooLongPlugin', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTooLongPlugin', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTooLongPlugin', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTooLongPlugin', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTooLongPlugin', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTooLongPlugin', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTooLongPlugin', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTooLongPlugin', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTooLongPlugin', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTooLongPlugin', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTooLongPlugin', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTooLongPlugin', 'case end', 'module name toolong with type plugin');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5759
     * @tc.name      testModuleMatrixTooLongEmpty
     * @tc.desc      Checks that module name TooLong with type Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMatrixTooLongEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = ('a'.repeat(33));
      moduleConfig.type = '';
      TestLog.text('testModuleMatrixTooLongEmpty', 'case begin', 'module name toolong with type empty');
      TestLog.step('testModuleMatrixTooLongEmpty', 'module name toolong with type empty');
      const findings: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.findings('testModuleMatrixTooLongEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleMatrixTooLongEmpty', 'has code MODULE_NAME_TOO_LONG', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleMatrixTooLongEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMatrixTooLongEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMatrixTooLongEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMatrixTooLongEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMatrixTooLongEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMatrixTooLongEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMatrixTooLongEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMatrixTooLongEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMatrixTooLongEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMatrixTooLongEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMatrixTooLongEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        ModuleConfigValidator.validateName(moduleConfig).concat(ModuleConfigValidator.validateType(moduleConfig));
      TestLog.number('testModuleMatrixTooLongEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMatrixTooLongEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMatrixTooLongEmpty', 'case end', 'module name toolong with type empty');
    })

  })
}
