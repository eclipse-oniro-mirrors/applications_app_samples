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
import { ValidationPipeline } from '../harness/ValidationPipeline';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function ValidationPipelineTest(): void {
  describe('ValidationPipelineTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4700
     * @tc.name      testPipelineSampleBundleValid
     * @tc.desc      Checks that the sample bundle passes the whole validation pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineSampleBundleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineSampleBundleValid', 'case begin', 'samplebundlevalid pipeline check');
      TestLog.step('testPipelineSampleBundleValid', 'samplebundlevalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineSampleBundleValid', 'pipeline findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPipelineSampleBundleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineSampleBundleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineSampleBundleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineSampleBundleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineSampleBundleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineSampleBundleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineSampleBundleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineSampleBundleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineSampleBundleValid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineSampleBundleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineSampleBundleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineSampleBundleValid', 'case end', 'samplebundlevalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4701
     * @tc.name      testPipelineEmptyBundle
     * @tc.desc      Checks that an empty bundle reports the app, entry and module errors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineEmptyBundle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([]);
      TestLog.text('testPipelineEmptyBundle', 'case begin', 'emptybundle pipeline check');
      TestLog.step('testPipelineEmptyBundle', 'emptybundle pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineEmptyBundle', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'BUNDLE_MODULES_EMPTY');
      TestLog.flag('testPipelineEmptyBundle', 'has code BUNDLE_MODULES_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'BUNDLE_NO_ENTRY_MODULE');
      TestLog.flag('testPipelineEmptyBundle', 'has code BUNDLE_NO_ENTRY_MODULE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineEmptyBundle', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineEmptyBundle', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineEmptyBundle', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineEmptyBundle', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineEmptyBundle', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineEmptyBundle', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineEmptyBundle', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineEmptyBundle', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineEmptyBundle', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineEmptyBundle', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineEmptyBundle', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineEmptyBundle', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineEmptyBundle', 'case end', 'emptybundle pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4702
     * @tc.name      testPipelineBadBundleName
     * @tc.desc      Checks that an invalid bundle name is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineBadBundleName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.app.bundleName = '';
      TestLog.text('testPipelineBadBundleName', 'case begin', 'badbundlename pipeline check');
      TestLog.step('testPipelineBadBundleName', 'badbundlename pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineBadBundleName', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testPipelineBadBundleName', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineBadBundleName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineBadBundleName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineBadBundleName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineBadBundleName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineBadBundleName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineBadBundleName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineBadBundleName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineBadBundleName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineBadBundleName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineBadBundleName', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineBadBundleName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineBadBundleName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineBadBundleName', 'case end', 'badbundlename pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4703
     * @tc.name      testPipelineBadModuleName
     * @tc.desc      Checks that an invalid module name is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineBadModuleName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[1].name = 'Feature';
      TestLog.text('testPipelineBadModuleName', 'case begin', 'badmodulename pipeline check');
      TestLog.step('testPipelineBadModuleName', 'badmodulename pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineBadModuleName', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testPipelineBadModuleName', 'has code MODULE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineBadModuleName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineBadModuleName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineBadModuleName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineBadModuleName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineBadModuleName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineBadModuleName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineBadModuleName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineBadModuleName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineBadModuleName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineBadModuleName', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineBadModuleName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineBadModuleName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineBadModuleName', 'case end', 'badmodulename pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4704
     * @tc.name      testPipelineBadModuleType
     * @tc.desc      Checks that an invalid module type is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineBadModuleType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[1].type = 'plugin';
      TestLog.text('testPipelineBadModuleType', 'case begin', 'badmoduletype pipeline check');
      TestLog.step('testPipelineBadModuleType', 'badmoduletype pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineBadModuleType', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testPipelineBadModuleType', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineBadModuleType', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineBadModuleType', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineBadModuleType', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineBadModuleType', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineBadModuleType', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineBadModuleType', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineBadModuleType', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineBadModuleType', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineBadModuleType', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineBadModuleType', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineBadModuleType', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineBadModuleType', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineBadModuleType', 'case end', 'badmoduletype pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4705
     * @tc.name      testPipelineAppAndModule
     * @tc.desc      Checks that app and module violations are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineAppAndModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.app.vendor = '';
      snapshot.modules[1].name = 'Feature';
      TestLog.text('testPipelineAppAndModule', 'case begin', 'appandmodule pipeline check');
      TestLog.step('testPipelineAppAndModule', 'appandmodule pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineAppAndModule', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testPipelineAppAndModule', 'has code APP_VENDOR_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testPipelineAppAndModule', 'has code MODULE_NAME_UPPERCASE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineAppAndModule', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineAppAndModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineAppAndModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineAppAndModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineAppAndModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineAppAndModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineAppAndModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineAppAndModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineAppAndModule', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineAppAndModule', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineAppAndModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineAppAndModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineAppAndModule', 'case end', 'appandmodule pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4706
     * @tc.name      testPipelineCrossViolation
     * @tc.desc      Checks that a cross module violation is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineCrossViolation',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const block = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'ghost' }];
      snapshot.modules[0].atomicService = block;
      TestLog.text('testPipelineCrossViolation', 'case begin', 'crossviolation pipeline check');
      TestLog.step('testPipelineCrossViolation', 'crossviolation pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineCrossViolation', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_PRELOAD_UNKNOWN_MODULE');
      TestLog.flag('testPipelineCrossViolation', 'has code BUNDLE_PRELOAD_UNKNOWN_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineCrossViolation', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineCrossViolation', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineCrossViolation', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineCrossViolation', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineCrossViolation', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineCrossViolation', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineCrossViolation', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineCrossViolation', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineCrossViolation', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineCrossViolation', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineCrossViolation', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineCrossViolation', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineCrossViolation', 'case end', 'crossviolation pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4707
     * @tc.name      testPipelineBadAbility
     * @tc.desc      Checks that an invalid ability is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineBadAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[0].abilities[0].launchType = 'single';
      TestLog.text('testPipelineBadAbility', 'case begin', 'badability pipeline check');
      TestLog.step('testPipelineBadAbility', 'badability pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineBadAbility', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_LAUNCH_TYPE_UNKNOWN');
      TestLog.flag('testPipelineBadAbility', 'has code MODULE_LAUNCH_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineBadAbility', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineBadAbility', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineBadAbility', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineBadAbility', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineBadAbility', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineBadAbility', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineBadAbility', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineBadAbility', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineBadAbility', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineBadAbility', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineBadAbility', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineBadAbility', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineBadAbility', 'case end', 'badability pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4708
     * @tc.name      testPipelineModulesOnly
     * @tc.desc      Checks that the module pipeline reports both module violations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineModulesOnly',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[0].name = 'Entry';
      snapshot.modules[1].type = 'plugin';
      TestLog.text('testPipelineModulesOnly', 'case begin', 'modulesonly pipeline check');
      TestLog.step('testPipelineModulesOnly', 'modulesonly pipeline check');
      const findings: Finding[] = ValidationPipeline.validateModules(snapshot);
      TestLog.findings('testPipelineModulesOnly', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testPipelineModulesOnly', 'has code MODULE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testPipelineModulesOnly', 'has code MODULE_TYPE_UNKNOWN', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineModulesOnly', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineModulesOnly', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineModulesOnly', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineModulesOnly', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineModulesOnly', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineModulesOnly', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineModulesOnly', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineModulesOnly', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineModulesOnly', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineModulesOnly', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateModules(snapshot);
      TestLog.number('testPipelineModulesOnly', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineModulesOnly', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineModulesOnly', 'case end', 'modulesonly pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4709
     * @tc.name      testPipelineModulesValid
     * @tc.desc      Checks that the module pipeline accepts the sample modules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineModulesValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineModulesValid', 'case begin', 'modulesvalid pipeline check');
      TestLog.step('testPipelineModulesValid', 'modulesvalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validateModules(snapshot);
      TestLog.findings('testPipelineModulesValid', 'pipeline findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPipelineModulesValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineModulesValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineModulesValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineModulesValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineModulesValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineModulesValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineModulesValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineModulesValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineModulesValid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateModules(snapshot);
      TestLog.number('testPipelineModulesValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineModulesValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineModulesValid', 'case end', 'modulesvalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4710
     * @tc.name      testPipelineAppOnlyValid
     * @tc.desc      Checks that the app pipeline accepts the sample app configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineAppOnlyValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineAppOnlyValid', 'case begin', 'apponlyvalid pipeline check');
      TestLog.step('testPipelineAppOnlyValid', 'apponlyvalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validateApp(snapshot);
      TestLog.findings('testPipelineAppOnlyValid', 'pipeline findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPipelineAppOnlyValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineAppOnlyValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineAppOnlyValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineAppOnlyValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineAppOnlyValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineAppOnlyValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineAppOnlyValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineAppOnlyValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineAppOnlyValid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateApp(snapshot);
      TestLog.number('testPipelineAppOnlyValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineAppOnlyValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineAppOnlyValid', 'case end', 'apponlyvalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4711
     * @tc.name      testPipelineAppOnlyInvalid
     * @tc.desc      Checks that the app pipeline reports an empty bundle name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineAppOnlyInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.app.bundleName = '';
      TestLog.text('testPipelineAppOnlyInvalid', 'case begin', 'apponlyinvalid pipeline check');
      TestLog.step('testPipelineAppOnlyInvalid', 'apponlyinvalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validateApp(snapshot);
      TestLog.findings('testPipelineAppOnlyInvalid', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testPipelineAppOnlyInvalid', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineAppOnlyInvalid', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineAppOnlyInvalid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineAppOnlyInvalid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineAppOnlyInvalid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineAppOnlyInvalid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineAppOnlyInvalid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineAppOnlyInvalid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineAppOnlyInvalid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineAppOnlyInvalid', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineAppOnlyInvalid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateApp(snapshot);
      TestLog.number('testPipelineAppOnlyInvalid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineAppOnlyInvalid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineAppOnlyInvalid', 'case end', 'apponlyinvalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4712
     * @tc.name      testPipelineCrossOnlyValid
     * @tc.desc      Checks that the cross pipeline accepts the sample bundle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineCrossOnlyValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineCrossOnlyValid', 'case begin', 'crossonlyvalid pipeline check');
      TestLog.step('testPipelineCrossOnlyValid', 'crossonlyvalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validateCross(snapshot);
      TestLog.findings('testPipelineCrossOnlyValid', 'pipeline findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPipelineCrossOnlyValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineCrossOnlyValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineCrossOnlyValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineCrossOnlyValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineCrossOnlyValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineCrossOnlyValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineCrossOnlyValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineCrossOnlyValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineCrossOnlyValid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateCross(snapshot);
      TestLog.number('testPipelineCrossOnlyValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineCrossOnlyValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineCrossOnlyValid', 'case end', 'crossonlyvalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4713
     * @tc.name      testPipelineCrossOnlyInvalid
     * @tc.desc      Checks that the cross pipeline reports a missing entry module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineCrossOnlyInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.snapshotWith([ConfigFactory.featureModule()]);
      TestLog.text('testPipelineCrossOnlyInvalid', 'case begin', 'crossonlyinvalid pipeline check');
      TestLog.step('testPipelineCrossOnlyInvalid', 'crossonlyinvalid pipeline check');
      const findings: Finding[] = ValidationPipeline.validateCross(snapshot);
      TestLog.findings('testPipelineCrossOnlyInvalid', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_NO_ENTRY_MODULE');
      TestLog.flag('testPipelineCrossOnlyInvalid', 'has code BUNDLE_NO_ENTRY_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineCrossOnlyInvalid', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineCrossOnlyInvalid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineCrossOnlyInvalid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineCrossOnlyInvalid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineCrossOnlyInvalid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineCrossOnlyInvalid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineCrossOnlyInvalid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineCrossOnlyInvalid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineCrossOnlyInvalid', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineCrossOnlyInvalid', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validateCross(snapshot);
      TestLog.number('testPipelineCrossOnlyInvalid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineCrossOnlyInvalid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineCrossOnlyInvalid', 'case end', 'crossonlyinvalid pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4714
     * @tc.name      testPipelineVersionViolations
     * @tc.desc      Checks that several app version violations are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineVersionViolations',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.app.versionCode = 0;
      snapshot.app.versionName = 'bad';
      TestLog.text('testPipelineVersionViolations', 'case begin', 'versionviolations pipeline check');
      TestLog.step('testPipelineVersionViolations', 'versionviolations pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineVersionViolations', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testPipelineVersionViolations', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testPipelineVersionViolations', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineVersionViolations', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineVersionViolations', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineVersionViolations', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineVersionViolations', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineVersionViolations', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineVersionViolations', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineVersionViolations', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineVersionViolations', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineVersionViolations', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineVersionViolations', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineVersionViolations', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineVersionViolations', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineVersionViolations', 'case end', 'versionviolations pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4715
     * @tc.name      testPipelineDuplicateFeature
     * @tc.desc      Checks that a bundled duplicate feature module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineDuplicateFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const feature: ModuleConfig = ConfigFactory.featureModule();
      snapshot.modules.push(feature);
      TestLog.text('testPipelineDuplicateFeature', 'case begin', 'duplicatefeature pipeline check');
      TestLog.step('testPipelineDuplicateFeature', 'duplicatefeature pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineDuplicateFeature', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_DUPLICATE_MODULE_NAME');
      TestLog.flag('testPipelineDuplicateFeature', 'has code BUNDLE_DUPLICATE_MODULE_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineDuplicateFeature', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineDuplicateFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineDuplicateFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineDuplicateFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineDuplicateFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineDuplicateFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineDuplicateFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineDuplicateFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineDuplicateFeature', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineDuplicateFeature', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineDuplicateFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineDuplicateFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineDuplicateFeature', 'case end', 'duplicatefeature pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4716
     * @tc.name      testPipelineFeatureNotPreloaded
     * @tc.desc      Checks that an unreferenced feature module is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineFeatureNotPreloaded',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const feature: ModuleConfig = ConfigFactory.featureModuleNamed('feature_orphan');
      feature.abilities[0].name = 'OrphanAbility';
      feature.abilities[0].srcEntry = './ets/orphanability/OrphanAbility.ets';
      feature.mainElement = 'OrphanAbility';
      snapshot.modules.push(feature);
      TestLog.text('testPipelineFeatureNotPreloaded', 'case begin', 'featurenotpreloaded pipeline check');
      TestLog.step('testPipelineFeatureNotPreloaded', 'featurenotpreloaded pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineFeatureNotPreloaded', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'BUNDLE_ORPHAN_FEATURE_MODULE');
      TestLog.flag('testPipelineFeatureNotPreloaded', 'has code BUNDLE_ORPHAN_FEATURE_MODULE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineFeatureNotPreloaded', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineFeatureNotPreloaded', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineFeatureNotPreloaded', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineFeatureNotPreloaded', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineFeatureNotPreloaded', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineFeatureNotPreloaded', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineFeatureNotPreloaded', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineFeatureNotPreloaded', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineFeatureNotPreloaded', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineFeatureNotPreloaded', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineFeatureNotPreloaded', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineFeatureNotPreloaded', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineFeatureNotPreloaded', 'case end', 'featurenotpreloaded pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4717
     * @tc.name      testPipelineEmptyAbilityList
     * @tc.desc      Checks that an empty ability list is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineEmptyAbilityList',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[0].abilities = [];
      TestLog.text('testPipelineEmptyAbilityList', 'case begin', 'emptyabilitylist pipeline check');
      TestLog.step('testPipelineEmptyAbilityList', 'emptyabilitylist pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineEmptyAbilityList', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ABILITIES_EMPTY');
      TestLog.flag('testPipelineEmptyAbilityList', 'has code MODULE_ABILITIES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineEmptyAbilityList', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineEmptyAbilityList', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineEmptyAbilityList', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineEmptyAbilityList', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineEmptyAbilityList', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineEmptyAbilityList', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineEmptyAbilityList', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineEmptyAbilityList', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineEmptyAbilityList', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineEmptyAbilityList', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineEmptyAbilityList', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineEmptyAbilityList', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineEmptyAbilityList', 'case end', 'emptyabilitylist pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4718
     * @tc.name      testPipelineBadPages
     * @tc.desc      Checks that an invalid pages reference is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineBadPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      snapshot.modules[0].pages = 'main_pages';
      TestLog.text('testPipelineBadPages', 'case begin', 'badpages pipeline check');
      TestLog.step('testPipelineBadPages', 'badpages pipeline check');
      const findings: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.findings('testPipelineBadPages', 'pipeline findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testPipelineBadPages', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPipelineBadPages', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPipelineBadPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPipelineBadPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPipelineBadPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPipelineBadPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPipelineBadPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPipelineBadPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPipelineBadPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPipelineBadPages', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPipelineBadPages', 'first signature', firstSignature);
      const repeat: Finding[] = ValidationPipeline.validate(snapshot);
      TestLog.number('testPipelineBadPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPipelineBadPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPipelineBadPages', 'case end', 'badpages pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4719
     * @tc.name      testPipelineSampleFindingCount
     * @tc.desc      Checks that the sample bundle produces no finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineSampleFindingCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineSampleFindingCount', 'case begin', 'samplefindingcount pipeline check');
      TestLog.step('testPipelineSampleFindingCount', 'samplefindingcount pipeline check');
      const actual: number = ValidationPipeline.validate(snapshot).length;
      TestLog.text('testPipelineSampleFindingCount', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testPipelineSampleFindingCount', 'case end', 'samplefindingcount pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4720
     * @tc.name      testPipelineAppFindingCount
     * @tc.desc      Checks that a broken app configuration produces the expected finding count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineAppFindingCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineAppFindingCount', 'case begin', 'appfindingcount pipeline check');
      TestLog.step('testPipelineAppFindingCount', 'appfindingcount pipeline check');
      const actual: number = 
        (() => { snapshot.app.bundleName = ''; return ValidationPipeline.validate(snapshot).length; })();
      TestLog.text('testPipelineAppFindingCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testPipelineAppFindingCount', 'case end', 'appfindingcount pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4721
     * @tc.name      testPipelineModuleNameHasCode
     * @tc.desc      Checks that a broken module name is reported by the pipeline.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineModuleNameHasCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineModuleNameHasCode', 'case begin', 'modulenamehascode pipeline check');
      TestLog.step('testPipelineModuleNameHasCode', 'modulenamehascode pipeline check');
      const actual: boolean = 
        (() => { snapshot.modules[0].name = 
          'Entry'; return FindingUtils.hasCode(ValidationPipeline.validate(snapshot), 'MODULE_NAME_UPPERCASE'); })();
      TestLog.text('testPipelineModuleNameHasCode', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testPipelineModuleNameHasCode', 'case end', 'modulenamehascode pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4722
     * @tc.name      testPipelineHasError
     * @tc.desc      Checks that a broken bundle name produces an error finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineHasError',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineHasError', 'case begin', 'haserror pipeline check');
      TestLog.step('testPipelineHasError', 'haserror pipeline check');
      const actual: boolean = 
        (() => { snapshot.app.bundleName = 
          ''; return FindingUtils.hasError(ValidationPipeline.validate(snapshot)); })();
      TestLog.text('testPipelineHasError', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testPipelineHasError', 'case end', 'haserror pipeline check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4723
     * @tc.name      testPipelineReportCount
     * @tc.desc      Checks that the pipeline report counts every finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPipelineReportCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      TestLog.text('testPipelineReportCount', 'case begin', 'reportcount pipeline check');
      TestLog.step('testPipelineReportCount', 'reportcount pipeline check');
      const actual: boolean = 
        (() => { snapshot.modules[0].name = 
          'Entry'; snapshot.modules[1].type = 
            'plugin'; const findings: Finding[] = 
              ValidationPipeline.validate(snapshot); const report: FindingReport = 
                new FindingReport(findings); return report.count() === findings.length; })();
      TestLog.text('testPipelineReportCount', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testPipelineReportCount', 'case end', 'reportcount pipeline check');
    })

  })
}
