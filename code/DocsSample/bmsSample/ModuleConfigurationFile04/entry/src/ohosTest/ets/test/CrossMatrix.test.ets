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
      TestLog.number('testCrossMatrix12Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix12Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix12Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix12Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix12Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix12Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix12Feature', 'case end', '12 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6712
     * @tc.name      testCrossMatrix13Feature
     * @tc.desc      Checks that a bundle with one entry and 13 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix13Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 13; index++) {
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
      TestLog.text('testCrossMatrix13Feature', 'case begin', '13 preloaded feature validation');
      TestLog.step('testCrossMatrix13Feature', '13 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix13Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix13Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix13Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix13Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix13Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix13Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix13Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix13Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix13Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix13Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix13Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix13Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix13Feature', 'case end', '13 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6713
     * @tc.name      testCrossMatrix14Feature
     * @tc.desc      Checks that a bundle with one entry and 14 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix14Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 14; index++) {
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
      TestLog.text('testCrossMatrix14Feature', 'case begin', '14 preloaded feature validation');
      TestLog.step('testCrossMatrix14Feature', '14 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix14Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix14Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix14Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix14Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix14Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix14Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix14Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix14Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix14Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix14Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix14Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix14Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix14Feature', 'case end', '14 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6714
     * @tc.name      testCrossMatrix15Feature
     * @tc.desc      Checks that a bundle with one entry and 15 preloaded features passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrix15Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const entry: ModuleConfig = ConfigFactory.entryModule();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [];
      entry.atomicService = block;
      const modules: ModuleConfig[] = [entry];
      for (let index: number = 1; index <= 15; index++) {
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
      TestLog.text('testCrossMatrix15Feature', 'case begin', '15 preloaded feature validation');
      TestLog.step('testCrossMatrix15Feature', '15 preloaded feature validation');
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testCrossMatrix15Feature', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testCrossMatrix15Feature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrix15Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrix15Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrix15Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrix15Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrix15Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrix15Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrix15Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrix15Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.number('testCrossMatrix15Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrix15Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrix15Feature', 'case end', '15 preloaded feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6715
     * @tc.name      testCrossMatrixOrphan1Feature
     * @tc.desc      Checks that a bundle with one entry and 1 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan1Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 1; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan1Feature', 'case begin', '1 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan1Feature', '1 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan1Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan1Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan1Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan1Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan1Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan1Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan1Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan1Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan1Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan1Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan1Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan1Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan1Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan1Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan1Feature', 'case end', '1 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6716
     * @tc.name      testCrossMatrixOrphan2Feature
     * @tc.desc      Checks that a bundle with one entry and 2 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan2Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 2; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan2Feature', 'case begin', '2 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan2Feature', '2 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan2Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan2Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan2Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan2Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan2Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan2Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan2Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan2Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan2Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan2Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan2Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan2Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan2Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan2Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan2Feature', 'case end', '2 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6717
     * @tc.name      testCrossMatrixOrphan3Feature
     * @tc.desc      Checks that a bundle with one entry and 3 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan3Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 3; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan3Feature', 'case begin', '3 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan3Feature', '3 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan3Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan3Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan3Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan3Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan3Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan3Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan3Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan3Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan3Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan3Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan3Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan3Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan3Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan3Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan3Feature', 'case end', '3 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6718
     * @tc.name      testCrossMatrixOrphan4Feature
     * @tc.desc      Checks that a bundle with one entry and 4 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan4Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 4; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan4Feature', 'case begin', '4 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan4Feature', '4 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan4Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan4Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan4Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan4Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan4Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan4Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan4Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan4Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan4Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan4Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan4Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan4Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan4Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan4Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan4Feature', 'case end', '4 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6719
     * @tc.name      testCrossMatrixOrphan5Feature
     * @tc.desc      Checks that a bundle with one entry and 5 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan5Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 5; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan5Feature', 'case begin', '5 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan5Feature', '5 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan5Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan5Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan5Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan5Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan5Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan5Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan5Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan5Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan5Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan5Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan5Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan5Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan5Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan5Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan5Feature', 'case end', '5 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6720
     * @tc.name      testCrossMatrixOrphan6Feature
     * @tc.desc      Checks that a bundle with one entry and 6 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan6Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 6; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan6Feature', 'case begin', '6 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan6Feature', '6 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan6Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan6Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan6Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan6Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan6Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan6Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan6Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan6Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan6Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan6Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan6Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan6Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan6Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan6Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan6Feature', 'case end', '6 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6721
     * @tc.name      testCrossMatrixOrphan7Feature
     * @tc.desc      Checks that a bundle with one entry and 7 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan7Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 7; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan7Feature', 'case begin', '7 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan7Feature', '7 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan7Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan7Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan7Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan7Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan7Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan7Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan7Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan7Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan7Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan7Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan7Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan7Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan7Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan7Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan7Feature', 'case end', '7 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6722
     * @tc.name      testCrossMatrixOrphan8Feature
     * @tc.desc      Checks that a bundle with one entry and 8 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan8Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 8; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan8Feature', 'case begin', '8 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan8Feature', '8 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan8Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan8Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan8Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan8Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan8Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan8Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan8Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan8Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan8Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan8Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan8Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan8Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan8Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan8Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan8Feature', 'case end', '8 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6723
     * @tc.name      testCrossMatrixOrphan9Feature
     * @tc.desc      Checks that a bundle with one entry and 9 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan9Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 9; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan9Feature', 'case begin', '9 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan9Feature', '9 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan9Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan9Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan9Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan9Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan9Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan9Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan9Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan9Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan9Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan9Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan9Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan9Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan9Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan9Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan9Feature', 'case end', '9 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6724
     * @tc.name      testCrossMatrixOrphan10Feature
     * @tc.desc      Checks that a bundle with one entry and 10 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan10Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 10; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan10Feature', 'case begin', '10 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan10Feature', '10 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan10Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan10Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan10Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan10Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan10Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan10Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan10Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan10Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan10Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan10Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan10Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan10Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan10Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan10Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan10Feature', 'case end', '10 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6725
     * @tc.name      testCrossMatrixOrphan11Feature
     * @tc.desc      Checks that a bundle with one entry and 11 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan11Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 11; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan11Feature', 'case begin', '11 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan11Feature', '11 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan11Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan11Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan11Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan11Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan11Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan11Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan11Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan11Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan11Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan11Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan11Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan11Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan11Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan11Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan11Feature', 'case end', '11 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6726
     * @tc.name      testCrossMatrixOrphan12Feature
     * @tc.desc      Checks that a bundle with one entry and 12 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan12Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 12; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan12Feature', 'case begin', '12 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan12Feature', '12 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan12Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan12Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan12Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan12Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan12Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan12Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan12Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan12Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan12Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan12Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan12Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan12Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan12Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan12Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan12Feature', 'case end', '12 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6727
     * @tc.name      testCrossMatrixOrphan13Feature
     * @tc.desc      Checks that a bundle with one entry and 13 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan13Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 13; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan13Feature', 'case begin', '13 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan13Feature', '13 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan13Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan13Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan13Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan13Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan13Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan13Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan13Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan13Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan13Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan13Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan13Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan13Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan13Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan13Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan13Feature', 'case end', '13 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6728
     * @tc.name      testCrossMatrixOrphan14Feature
     * @tc.desc      Checks that a bundle with one entry and 14 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan14Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 14; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan14Feature', 'case begin', '14 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan14Feature', '14 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan14Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan14Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan14Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan14Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan14Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan14Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan14Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan14Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan14Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan14Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan14Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan14Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan14Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan14Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan14Feature', 'case end', '14 orphan feature validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6729
     * @tc.name      testCrossMatrixOrphan15Feature
     * @tc.desc      Checks that a bundle with one entry and 15 unreferenced features is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCrossMatrixOrphan15Feature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const modules: ModuleConfig[] = [ConfigFactory.entryModule()];
      for (let index: number = 1; index <= 15; index++) {
        modules.push(ConfigFactory.featureModuleNamed(`feature_${index}`));
      }
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith(modules);
      TestLog.text('testCrossMatrixOrphan15Feature', 'case begin', '15 orphan feature validation');
      TestLog.step('testCrossMatrixOrphan15Feature', '15 orphan feature validation');
      const findings: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.findings('testCrossMatrixOrphan15Feature', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testCrossMatrixOrphan15Feature', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testCrossMatrixOrphan15Feature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testCrossMatrixOrphan15Feature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testCrossMatrixOrphan15Feature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testCrossMatrixOrphan15Feature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testCrossMatrixOrphan15Feature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testCrossMatrixOrphan15Feature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testCrossMatrixOrphan15Feature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testCrossMatrixOrphan15Feature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testCrossMatrixOrphan15Feature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testCrossMatrixOrphan15Feature', 'first signature', firstSignature);
      const repeat: Finding[] = CrossModuleValidator.validateOrphanFeatures(snapshot);
      TestLog.number('testCrossMatrixOrphan15Feature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testCrossMatrixOrphan15Feature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testCrossMatrixOrphan15Feature', 'case end', '15 orphan feature validation');
    })

  })
}
