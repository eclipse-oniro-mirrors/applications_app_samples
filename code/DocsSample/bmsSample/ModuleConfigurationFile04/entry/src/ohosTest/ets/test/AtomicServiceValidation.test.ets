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
import type { AtomicServiceConfig, ModuleConfig, PreloadConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function AtomicServiceValidationTest(): void {
  describe('AtomicServiceValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3400
     * @tc.name      testAtomicBlockNull
     * @tc.desc      Checks that the null value is accepted by the atomicService block rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      moduleConfig.atomicService = null;
      TestLog.text('testAtomicBlockNull', 'case begin', 'atomicService block input null');
      TestLog.step('testAtomicBlockNull', 'atomicService block input null');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicBlockNull', 'atomicService block', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicBlockNull', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicBlockNull', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicBlockNull', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicBlockNull', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicBlockNull', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicBlockNull', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicBlockNull', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicBlockNull', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicBlockNull', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicBlockNull', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicBlockNull', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicBlockNull', 'case end', 'atomicService block input null');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3401
     * @tc.name      testAtomicBlockSampleBlock
     * @tc.desc      Checks that the sampleblock value is accepted by the atomicService block rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockSampleBlock',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      moduleConfig.atomicService = ConfigFactory.entryAtomicService();
      TestLog.text('testAtomicBlockSampleBlock', 'case begin', 'atomicService block input sampleblock');
      TestLog.step('testAtomicBlockSampleBlock', 'atomicService block input sampleblock');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicBlockSampleBlock', 'atomicService block', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicBlockSampleBlock', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicBlockSampleBlock', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicBlockSampleBlock', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicBlockSampleBlock', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicBlockSampleBlock', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicBlockSampleBlock', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicBlockSampleBlock', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicBlockSampleBlock', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicBlockSampleBlock', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicBlockSampleBlock', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicBlockSampleBlock', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicBlockSampleBlock', 'case end', 'atomicService block input sampleblock');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3402
     * @tc.name      testAtomicBlockEmptyPreloads
     * @tc.desc      Checks that the emptypreloads value is reported with MODULE_ATOMIC_PRELOADS_EMPTY by the
     * @tc.desc      atomicService block rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockEmptyPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const empty = ConfigFactory.entryAtomicService();
      empty.preloads = [];
      moduleConfig.atomicService = empty;
      TestLog.text('testAtomicBlockEmptyPreloads', 'case begin', 'atomicService block input emptypreloads');
      TestLog.step('testAtomicBlockEmptyPreloads', 'atomicService block input emptypreloads');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicBlockEmptyPreloads', 'atomicService block', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testAtomicBlockEmptyPreloads', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicBlockEmptyPreloads', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicBlockEmptyPreloads', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicBlockEmptyPreloads', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicBlockEmptyPreloads', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicBlockEmptyPreloads', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicBlockEmptyPreloads', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicBlockEmptyPreloads', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicBlockEmptyPreloads', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicBlockEmptyPreloads', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicBlockEmptyPreloads', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicBlockEmptyPreloads', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicBlockEmptyPreloads', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicBlockEmptyPreloads', 'case end', 'atomicService block input emptypreloads');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3403
     * @tc.name      testAtomicBlockOnFeatureModule
     * @tc.desc      Checks that the onfeaturemodule value is reported with MODULE_ATOMIC_ON_NON_ENTRY by the
     * @tc.desc      atomicService block rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockOnFeatureModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      moduleConfig.type = 'feature';
      moduleConfig.atomicService = ConfigFactory.entryAtomicService();
      TestLog.text('testAtomicBlockOnFeatureModule', 'case begin', 'atomicService block input onfeaturemodule');
      TestLog.step('testAtomicBlockOnFeatureModule', 'atomicService block input onfeaturemodule');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicBlockOnFeatureModule', 'atomicService block', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_ON_NON_ENTRY');
      TestLog.flag('testAtomicBlockOnFeatureModule', 'has code MODULE_ATOMIC_ON_NON_ENTRY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicBlockOnFeatureModule', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicBlockOnFeatureModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicBlockOnFeatureModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicBlockOnFeatureModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicBlockOnFeatureModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicBlockOnFeatureModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicBlockOnFeatureModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicBlockOnFeatureModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicBlockOnFeatureModule', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicBlockOnFeatureModule', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicBlockOnFeatureModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicBlockOnFeatureModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicBlockOnFeatureModule', 'case end', 'atomicService block input onfeaturemodule');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3404
     * @tc.name      testAtomicBlockOnSharedModule
     * @tc.desc      Checks that the onsharedmodule value is reported with MODULE_ATOMIC_ON_NON_ENTRY by the
     * @tc.desc      atomicService block rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockOnSharedModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      moduleConfig.type = 'shared';
      moduleConfig.atomicService = ConfigFactory.entryAtomicService();
      TestLog.text('testAtomicBlockOnSharedModule', 'case begin', 'atomicService block input onsharedmodule');
      TestLog.step('testAtomicBlockOnSharedModule', 'atomicService block input onsharedmodule');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicBlockOnSharedModule', 'atomicService block', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_ON_NON_ENTRY');
      TestLog.flag('testAtomicBlockOnSharedModule', 'has code MODULE_ATOMIC_ON_NON_ENTRY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicBlockOnSharedModule', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicBlockOnSharedModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicBlockOnSharedModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicBlockOnSharedModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicBlockOnSharedModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicBlockOnSharedModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicBlockOnSharedModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicBlockOnSharedModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicBlockOnSharedModule', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicBlockOnSharedModule', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicBlockOnSharedModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicBlockOnSharedModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicBlockOnSharedModule', 'case end', 'atomicService block input onsharedmodule');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3420
     * @tc.name      testAtomicSamplePreloadValid
     * @tc.desc      Checks that the sample preload passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicSamplePreloadValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'feature' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicSamplePreloadValid', 'case begin', 'atomic preload samplepreloadvalid check');
      TestLog.step('testAtomicSamplePreloadValid', 'atomic preload samplepreloadvalid check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicSamplePreloadValid', 'atomic service findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicSamplePreloadValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicSamplePreloadValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicSamplePreloadValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicSamplePreloadValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicSamplePreloadValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicSamplePreloadValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicSamplePreloadValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicSamplePreloadValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicSamplePreloadValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicSamplePreloadValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicSamplePreloadValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicSamplePreloadValid', 'case end', 'atomic preload samplepreloadvalid check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3421
     * @tc.name      testAtomicPreloadEmptyList
     * @tc.desc      Checks that an empty preload list is warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadEmptyList',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadEmptyList', 'case begin', 'atomic preload preloademptylist check');
      TestLog.step('testAtomicPreloadEmptyList', 'atomic preload preloademptylist check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadEmptyList', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_EMPTY');
      TestLog.flag('testAtomicPreloadEmptyList', 'has code MODULE_ATOMIC_PRELOADS_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadEmptyList', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadEmptyList', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadEmptyList', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadEmptyList', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadEmptyList', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadEmptyList', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadEmptyList', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadEmptyList', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadEmptyList', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadEmptyList', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadEmptyList', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadEmptyList', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadEmptyList', 'case end', 'atomic preload preloademptylist check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3422
     * @tc.name      testAtomicPreloadNameEmpty
     * @tc.desc      Checks that an empty preload module name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadNameEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: '' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadNameEmpty', 'case begin', 'atomic preload preloadnameempty check');
      TestLog.step('testAtomicPreloadNameEmpty', 'atomic preload preloadnameempty check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadNameEmpty', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_NAME_EMPTY');
      TestLog.flag('testAtomicPreloadNameEmpty', 'has code MODULE_ATOMIC_PRELOAD_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadNameEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadNameEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadNameEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadNameEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadNameEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadNameEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadNameEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadNameEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadNameEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadNameEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadNameEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadNameEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadNameEmpty', 'case end', 'atomic preload preloadnameempty check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3423
     * @tc.name      testAtomicPreloadNameSpaces
     * @tc.desc      Checks that a blank preload module name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadNameSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: '   ' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadNameSpaces', 'case begin', 'atomic preload preloadnamespaces check');
      TestLog.step('testAtomicPreloadNameSpaces', 'atomic preload preloadnamespaces check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadNameSpaces', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_NAME_EMPTY');
      TestLog.flag('testAtomicPreloadNameSpaces', 'has code MODULE_ATOMIC_PRELOAD_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadNameSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadNameSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadNameSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadNameSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadNameSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadNameSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadNameSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadNameSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadNameSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadNameSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadNameSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadNameSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadNameSpaces', 'case end', 'atomic preload preloadnamespaces check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3424
     * @tc.name      testAtomicPreloadNameUpper
     * @tc.desc      Checks that an upper case preload module name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadNameUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'Feature' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadNameUpper', 'case begin', 'atomic preload preloadnameupper check');
      TestLog.step('testAtomicPreloadNameUpper', 'atomic preload preloadnameupper check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadNameUpper', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL');
      TestLog.flag('testAtomicPreloadNameUpper', 'has code MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadNameUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadNameUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadNameUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadNameUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadNameUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadNameUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadNameUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadNameUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadNameUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadNameUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadNameUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadNameUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadNameUpper', 'case end', 'atomic preload preloadnameupper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3425
     * @tc.name      testAtomicPreloadNameHyphen
     * @tc.desc      Checks that a hyphenated preload module name is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadNameHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'my-feature' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadNameHyphen', 'case begin', 'atomic preload preloadnamehyphen check');
      TestLog.step('testAtomicPreloadNameHyphen', 'atomic preload preloadnamehyphen check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadNameHyphen', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL');
      TestLog.flag('testAtomicPreloadNameHyphen', 'has code MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadNameHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadNameHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadNameHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadNameHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadNameHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadNameHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadNameHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadNameHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadNameHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadNameHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadNameHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadNameHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadNameHyphen', 'case end', 'atomic preload preloadnamehyphen check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3426
     * @tc.name      testAtomicPreloadNameDigitFirst
     * @tc.desc      Checks that a preload module name starting with a digit is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadNameDigitFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: '1feature' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadNameDigitFirst', 'case begin', 'atomic preload preloadnamedigitfirst check');
      TestLog.step('testAtomicPreloadNameDigitFirst', 'atomic preload preloadnamedigitfirst check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadNameDigitFirst', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL');
      TestLog.flag('testAtomicPreloadNameDigitFirst', 'has code MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadNameDigitFirst', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadNameDigitFirst', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadNameDigitFirst', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadNameDigitFirst', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadNameDigitFirst', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadNameDigitFirst', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadNameDigitFirst', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadNameDigitFirst', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadNameDigitFirst', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadNameDigitFirst', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadNameDigitFirst', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadNameDigitFirst', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadNameDigitFirst', 'case end', 'atomic preload preloadnamedigitfirst check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3427
     * @tc.name      testAtomicPreloadSelf
     * @tc.desc      Checks that a module preloading itself is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadSelf',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'entry' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadSelf', 'case begin', 'atomic preload preloadself check');
      TestLog.step('testAtomicPreloadSelf', 'atomic preload preloadself check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadSelf', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_SELF');
      TestLog.flag('testAtomicPreloadSelf', 'has code MODULE_ATOMIC_PRELOAD_SELF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadSelf', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadSelf', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadSelf', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadSelf', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadSelf', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadSelf', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadSelf', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadSelf', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadSelf', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadSelf', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadSelf', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadSelf', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadSelf', 'case end', 'atomic preload preloadself check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3428
     * @tc.name      testAtomicPreloadDuplicate
     * @tc.desc      Checks that a duplicated preload module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'feature' }, { moduleName: 'feature' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadDuplicate', 'case begin', 'atomic preload preloadduplicate check');
      TestLog.step('testAtomicPreloadDuplicate', 'atomic preload preloadduplicate check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadDuplicate', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOAD_DUPLICATE');
      TestLog.flag('testAtomicPreloadDuplicate', 'has code MODULE_ATOMIC_PRELOAD_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadDuplicate', 'case end', 'atomic preload preloadduplicate check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3429
     * @tc.name      testAtomicPreloadTwoValid
     * @tc.desc      Checks that two distinct preload modules pass validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadTwoValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: 'feature' }, { moduleName: 'feature_two' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadTwoValid', 'case begin', 'atomic preload preloadtwovalid check');
      TestLog.step('testAtomicPreloadTwoValid', 'atomic preload preloadtwovalid check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadTwoValid', 'atomic service findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicPreloadTwoValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadTwoValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadTwoValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadTwoValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadTwoValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadTwoValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadTwoValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadTwoValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadTwoValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadTwoValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadTwoValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadTwoValid', 'case end', 'atomic preload preloadtwovalid check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3430
     * @tc.name      testAtomicPreloadTrimmed
     * @tc.desc      Checks that a trimmed preload module name passes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadTrimmed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = [{ moduleName: ' feature ' }];
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadTrimmed', 'case begin', 'atomic preload preloadtrimmed check');
      TestLog.step('testAtomicPreloadTrimmed', 'atomic preload preloadtrimmed check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadTrimmed', 'atomic service findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicPreloadTrimmed', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadTrimmed', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadTrimmed', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadTrimmed', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadTrimmed', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadTrimmed', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadTrimmed', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadTrimmed', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadTrimmed', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadTrimmed', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadTrimmed', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadTrimmed', 'case end', 'atomic preload preloadtrimmed check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3431
     * @tc.name      testAtomicPreloadTooMany
     * @tc.desc      Checks that more than twenty preload modules are reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadTooMany',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const many: PreloadConfig[] = [];
      for (let index: number = 0; index < 21; index++) {
        const preload: PreloadConfig = { moduleName: `feature_${index}` };
        many.push(preload);
      }
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = many;
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadTooMany', 'case begin', 'atomic preload size check');
      TestLog.step('testAtomicPreloadTooMany', 'atomic preload size check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadTooMany', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_PRELOADS_TOO_MANY');
      TestLog.flag('testAtomicPreloadTooMany', 'has code MODULE_ATOMIC_PRELOADS_TOO_MANY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicPreloadTooMany', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadTooMany', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadTooMany', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadTooMany', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadTooMany', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadTooMany', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadTooMany', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadTooMany', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicPreloadTooMany', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadTooMany', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadTooMany', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadTooMany', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadTooMany', 'case end', 'atomic preload size check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3432
     * @tc.name      testAtomicPreloadMaximumValid
     * @tc.desc      Checks that exactly twenty preload modules pass validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadMaximumValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const many: PreloadConfig[] = [];
      for (let index: number = 0; index < 20; index++) {
        const preload: PreloadConfig = { moduleName: `feature_${index}` };
        many.push(preload);
      }
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.preloads = many;
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicPreloadMaximumValid', 'case begin', 'atomic preload boundary check');
      TestLog.step('testAtomicPreloadMaximumValid', 'atomic preload boundary check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicPreloadMaximumValid', 'atomic service findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicPreloadMaximumValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicPreloadMaximumValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicPreloadMaximumValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicPreloadMaximumValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicPreloadMaximumValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicPreloadMaximumValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicPreloadMaximumValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicPreloadMaximumValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicPreloadMaximumValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicPreloadMaximumValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicPreloadMaximumValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicPreloadMaximumValid', 'case end', 'atomic preload boundary check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3433
     * @tc.name      testAtomicFeatureModuleBlock
     * @tc.desc      Checks that an atomicService block on a feature module is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicFeatureModuleBlock',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModuleWithAtomicService('feature');
      TestLog.text('testAtomicFeatureModuleBlock', 'case begin', 'atomic block on feature module check');
      TestLog.step('testAtomicFeatureModuleBlock', 'atomic block on feature module check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicFeatureModuleBlock', 'atomic service findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ATOMIC_ON_NON_ENTRY');
      TestLog.flag('testAtomicFeatureModuleBlock', 'has code MODULE_ATOMIC_ON_NON_ENTRY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAtomicFeatureModuleBlock', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicFeatureModuleBlock', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicFeatureModuleBlock', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicFeatureModuleBlock', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicFeatureModuleBlock', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicFeatureModuleBlock', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicFeatureModuleBlock', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicFeatureModuleBlock', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAtomicFeatureModuleBlock', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicFeatureModuleBlock', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicFeatureModuleBlock', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicFeatureModuleBlock', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicFeatureModuleBlock', 'case end', 'atomic block on feature module check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3434
     * @tc.name      testAtomicResizeableKept
     * @tc.desc      Checks that the resizeable flag survives validation without findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicResizeableKept',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      const block: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      block.resizeable = false;
      moduleConfig.atomicService = block;
      TestLog.text('testAtomicResizeableKept', 'case begin', 'atomic resizeable check');
      TestLog.step('testAtomicResizeableKept', 'atomic resizeable check');
      const findings: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.findings('testAtomicResizeableKept', 'atomic service findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAtomicResizeableKept', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAtomicResizeableKept', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAtomicResizeableKept', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAtomicResizeableKept', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAtomicResizeableKept', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAtomicResizeableKept', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAtomicResizeableKept', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAtomicResizeableKept', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAtomicResizeableKept', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateAtomicService(moduleConfig);
      TestLog.number('testAtomicResizeableKept', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAtomicResizeableKept', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAtomicResizeableKept', 'case end', 'atomic resizeable check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3435
     * @tc.name      testAtomicPreloadCountHelper
     * @tc.desc      Checks that the sample atomicService declares a single preload.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicPreloadCountHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const atomicService: AtomicServiceConfig = ConfigFactory.entryAtomicService();
      TestLog.text('testAtomicPreloadCountHelper', 'case begin', 'atomic preload count check');
      TestLog.step('testAtomicPreloadCountHelper', 'atomic preload count check');
      const actual: number = ConfigFactory.entryAtomicService().preloads.length;
      TestLog.text('testAtomicPreloadCountHelper', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testAtomicPreloadCountHelper', 'case end', 'atomic preload count check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3436
     * @tc.name      testAtomicBlockPresence
     * @tc.desc      Checks that the sample entry module declares an atomicService block.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAtomicBlockPresence',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testAtomicBlockPresence', 'case begin', 'atomic block presence check');
      TestLog.step('testAtomicBlockPresence', 'atomic block presence check');
      const actual: boolean = moduleConfig.atomicService !== null;
      TestLog.text('testAtomicBlockPresence', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testAtomicBlockPresence', 'case end', 'atomic block presence check');
    })

  })
}
