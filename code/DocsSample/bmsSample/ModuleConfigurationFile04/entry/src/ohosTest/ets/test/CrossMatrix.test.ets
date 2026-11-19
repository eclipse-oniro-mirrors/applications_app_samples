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
export default function CrossMatrixTest(): void {
  describe('CrossMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6700
     * @tc.name      testCrossMatrix1Feature
     * @tc.desc      Checks that a bundle with one entry and 1 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix1Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 1; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix1Feature', 'case begin', '1 preloaded feature validation');
      TestLog.step('testCrossMatrix1Feature', '1 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix1Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix1Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix1Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix1Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix1Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix1Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix1Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix1Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix1Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix1Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix1Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix1Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix1Feature', 'case end', '1 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6701
     * @tc.name      testCrossMatrix2Feature
     * @tc.desc      Checks that a bundle with one entry and 2 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix2Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 2; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix2Feature', 'case begin', '2 preloaded feature validation');
      TestLog.step('testCrossMatrix2Feature', '2 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix2Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix2Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix2Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix2Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix2Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix2Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix2Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix2Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix2Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix2Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix2Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix2Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix2Feature', 'case end', '2 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6702
     * @tc.name      testCrossMatrix3Feature
     * @tc.desc      Checks that a bundle with one entry and 3 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix3Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 3; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix3Feature', 'case begin', '3 preloaded feature validation');
      TestLog.step('testCrossMatrix3Feature', '3 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix3Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix3Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix3Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix3Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix3Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix3Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix3Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix3Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix3Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix3Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix3Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix3Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix3Feature', 'case end', '3 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6703
     * @tc.name      testCrossMatrix4Feature
     * @tc.desc      Checks that a bundle with one entry and 4 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix4Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 4; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix4Feature', 'case begin', '4 preloaded feature validation');
      TestLog.step('testCrossMatrix4Feature', '4 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix4Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix4Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix4Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix4Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix4Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix4Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix4Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix4Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix4Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix4Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix4Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix4Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix4Feature', 'case end', '4 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6704
     * @tc.name      testCrossMatrix5Feature
     * @tc.desc      Checks that a bundle with one entry and 5 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix5Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 5; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix5Feature', 'case begin', '5 preloaded feature validation');
      TestLog.step('testCrossMatrix5Feature', '5 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix5Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix5Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix5Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix5Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix5Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix5Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix5Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix5Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix5Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix5Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix5Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix5Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix5Feature', 'case end', '5 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6705
     * @tc.name      testCrossMatrix6Feature
     * @tc.desc      Checks that a bundle with one entry and 6 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix6Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 6; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix6Feature', 'case begin', '6 preloaded feature validation');
      TestLog.step('testCrossMatrix6Feature', '6 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix6Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix6Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix6Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix6Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix6Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix6Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix6Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix6Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix6Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix6Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix6Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix6Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix6Feature', 'case end', '6 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6706
     * @tc.name      testCrossMatrix7Feature
     * @tc.desc      Checks that a bundle with one entry and 7 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix7Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 7; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix7Feature', 'case begin', '7 preloaded feature validation');
      TestLog.step('testCrossMatrix7Feature', '7 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix7Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix7Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix7Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix7Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix7Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix7Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix7Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix7Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix7Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix7Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix7Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix7Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix7Feature', 'case end', '7 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6707
     * @tc.name      testCrossMatrix8Feature
     * @tc.desc      Checks that a bundle with one entry and 8 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix8Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 8; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix8Feature', 'case begin', '8 preloaded feature validation');
      TestLog.step('testCrossMatrix8Feature', '8 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix8Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix8Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix8Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix8Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix8Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix8Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix8Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix8Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix8Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix8Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix8Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix8Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix8Feature', 'case end', '8 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6708
     * @tc.name      testCrossMatrix9Feature
     * @tc.desc      Checks that a bundle with one entry and 9 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix9Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 9; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix9Feature', 'case begin', '9 preloaded feature validation');
      TestLog.step('testCrossMatrix9Feature', '9 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix9Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix9Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix9Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix9Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix9Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix9Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix9Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix9Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix9Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix9Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix9Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix9Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix9Feature', 'case end', '9 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6709
     * @tc.name      testCrossMatrix10Feature
     * @tc.desc      Checks that a bundle with one entry and 10 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix10Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 10; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix10Feature', 'case begin', '10 preloaded feature validation');
      TestLog.step('testCrossMatrix10Feature', '10 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix10Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix10Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix10Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix10Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix10Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix10Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix10Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix10Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix10Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix10Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix10Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix10Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix10Feature', 'case end', '10 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6710
     * @tc.name      testCrossMatrix11Feature
     * @tc.desc      Checks that a bundle with one entry and 11 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix11Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 11; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix11Feature', 'case begin', '11 preloaded feature validation');
      TestLog.step('testCrossMatrix11Feature', '11 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix11Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix11Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix11Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix11Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix11Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix11Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix11Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix11Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix11Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix11Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix11Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix11Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix11Feature', 'case end', '11 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6711
     * @tc.name      testCrossMatrix12Feature
     * @tc.desc      Checks that a bundle with one entry and 12 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix12Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 12; index++) {
        const feature: ModuleConfig = ConfigFactory.featureModuleNamed(`feature_${index}`);
        feature.abilities[0].name = `FeatureAbility${index}`;
        feature.mainElement = `FeatureAbility${index}`;
        const featureBlock = ConfigFactory.entryAtomicService();
        featureBlock.preloads = [];
        feature.atomicService = featureBlock;
        modules.push(feature);
        block.preloads.push({ moduleName: `feature_${index}` });
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrix12Feature', 'case begin', '12 preloaded feature validation');
      TestLog.step('testCrossMatrix12Feature', '12 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix12Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix12Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix12Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix12Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix12Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix12Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();